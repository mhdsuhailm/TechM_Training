import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docapp/models/doctor.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;
  Future<void> fetchDoctors() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('doctors').get();
      _doctors =
          snapshot.docs.map((doc) {
            return Doctor.fromMap(
              doc.data(),
              doc.id,
            ); 
          }).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching doctors: $e');
      rethrow;
    }
  }

  Future<void> addDoctor(Doctor doctor) async {
    try {
      final docRef = await FirebaseFirestore.instance
          .collection('doctors')
          .add({
            'name': doctor.name,
            'specialty': doctor.specialty,
            'rating': doctor.rating,
            'imageUrl': doctor.imageUrl,
            'description': doctor.description,
          });

      final newDoctor = Doctor(
        id: docRef.id,
        name: doctor.name,
        specialty: doctor.specialty,
        rating: doctor.rating,
        imageUrl: doctor.imageUrl,
        description: doctor.description,
      );

      _doctors.add(newDoctor);
      notifyListeners();
    } catch (e) {
      print('Error adding doctor: $e');
      rethrow;
    }
  }

  Future<void> updateDoctor(Doctor doctor) async {
    try {
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(doctor.id)
          .update({
            'name': doctor.name,
            'specialty': doctor.specialty,
            'rating': doctor.rating,
            'imageUrl': doctor.imageUrl,
            'description': doctor.description,
          });

      final index = _doctors.indexWhere((d) => d.id == doctor.id);
      if (index != -1) {
        _doctors[index] = doctor;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating doctor: $e');
      rethrow;
    }
  }

  Future<void> deleteDoctor(String doctorId) async {
    try {
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(doctorId)
          .delete();
      _doctors.removeWhere((doctor) => doctor.id == doctorId);
      notifyListeners();
    } catch (e) {
      print('Error deleting doctor: $e');
      rethrow;
    }
  }

  void clearDoctors() {
    _doctors.clear();
    notifyListeners();
  }
}
