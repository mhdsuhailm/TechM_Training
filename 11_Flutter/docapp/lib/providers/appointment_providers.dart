import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:docapp/models/appointment.dart';

class AppointmentProvider with ChangeNotifier {
  List<Appointment> _appointments = [];
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; 

  List<Appointment> get appointments => _appointments;

  Future<void> fetchAppointments(String userId) async {
    try {
      final snapshot =
          await _firestore
              .collection('appointments')
              .where('userId', isEqualTo: userId)
              .get();
      _appointments =
          snapshot.docs.map((doc) {
            return Appointment.fromMap(
              doc.data(),
              doc.id,
            ); 
          }).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching appointments: $e');
      throw Exception('Failed to fetch appointments: $e');
    }
  }

  Future<void> bookAppointment(Appointment appointment) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User not logged in');
      }

      final docRef = await _firestore.collection('appointments').add({
        'doctorId': appointment.doctorId,
        'doctorName': appointment.doctorName,
        'userId': userId, 
        'date': appointment.date,
        'time': appointment.time,
      });

      final newAppointment = Appointment(
        id: docRef.id,
        doctorId: appointment.doctorId,
        doctorName: appointment.doctorName,
        userId: userId, 
        date: appointment.date,
        time: appointment.time,
      );

      _appointments.add(newAppointment);
      notifyListeners();
    } catch (e) {
      print('Error booking appointment: $e');
      throw Exception('Failed to book appointment: $e');
    }
  }

  Future<void> cancelAppointment(String appointmentId) async {
    try {
      await _firestore 
          .collection('appointments')
          .doc(appointmentId)
          .delete();
      _appointments.removeWhere(
        (appointment) => appointment.id == appointmentId,
      );
      notifyListeners();
    } catch (e) {
      print('Error canceling appointment: $e');
      throw Exception('Failed to cancel appointment: $e');
    }
  }

  void clearAppointments() {
    _appointments.clear();
    notifyListeners();
  }
}
