import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docapp/models/doctor.dart';
import 'package:docapp/widgets/doctor_card.dart';

class DoctorList extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<Doctor> staticDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. John Doe',
      specialty: 'Cardiologist',
      rating: 4.5,
      description: 'Experienced cardiologist with over 10 years of practice.',
      imageUrl: 'assets/images/doctor1.jpg',
    ),
    Doctor(
      id: '2',
      name: 'Dr. Jane Smith',
      specialty: 'Dermatologist',
      rating: 4.8,
      description: 'Specializes in skin care and cosmetic treatments.',
      imageUrl: 'assets/images/doctor2.jpg',
    ),
    Doctor(
      id: '3',
      name: 'Dr. Emily Johnson',
      specialty: 'Pediatrician',
      rating: 4.7,
      description: 'Caring for children and providing family health advice.',
      imageUrl: 'assets/images/doctor3.jpg',
    ),
  ];

   DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctors'), centerTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('doctors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: staticDoctors.length,
              itemBuilder: (context, index) {
                final doctor = staticDoctors[index];
                return DoctorCard(doctor: doctor);
              },
            );
          }

          final doctors =
              snapshot.data!.docs.map((doc) {
                return Doctor.fromMap(
                  doc.data() as Map<String, dynamic>,
                  doc.id,
                ); 
              }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return DoctorCard(doctor: doctor);
            },
          );
        },
      ),
    );
  }
}