import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docapp/models/appointment.dart';
import 'package:docapp/providers/appointment_providers.dart';
import 'package:docapp/widgets/appointment_card.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Appointments')),
        body: Center(child: Text('Please log in to view appointments')),
      );
    }

    print('Current user ID: $userId'); 

    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('appointments')
                .where('userId', isEqualTo: userId)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Firestore Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No appointments found'));
          }

          final appointments =
              snapshot.data!.docs.map((doc) {
                return Appointment.fromMap(
                  doc.data() as Map<String, dynamic>,
                  doc.id,
                );
              }).toList();

          print('Fetched appointments: ${snapshot.data!.docs}'); 

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return AppointmentCard(
                appointment: appointment,
                onCancel: () async {
                  try {
                    final appointmentProvider =
                        Provider.of<AppointmentProvider>(
                          context,
                          listen: false,
                        );
                    await appointmentProvider.cancelAppointment(
                      appointment.id!,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Appointment canceled successfully!'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to cancel appointment: $e'),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
