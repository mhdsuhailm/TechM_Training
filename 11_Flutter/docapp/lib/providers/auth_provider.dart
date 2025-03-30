import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; 
import 'package:image_picker/image_picker.dart'; 
import 'dart:io'; 
import 'package:docapp/models/user.dart';

class AuthProvider with ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  Future<void> login(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fetchUser(result.user!.uid);
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  Future<void> register(
    String email,
    String password,
    String name,
    String phone, {
    String? profileImageUrl,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
    required String role, 
  }) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user!.uid)
          .set({
            'email': email,
            'name': name,
            'phone': phone,
            'profileImageUrl': profileImageUrl,
            'dateOfBirth': dateOfBirth?.toIso8601String(),
            'gender': gender,
            'address': address,
            'role': role,
          });
      await _fetchUser(result.user!.uid);
    } catch (e) {
      print('Registration error: $e');
      rethrow;
    }
  }

  Future<void> _fetchUser(String userId) async {
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (doc.exists) {
      _user = AppUser(
        id: doc.id,
        email: doc['email'],
        name: doc['name'],
        phone: doc['phone'],
        profileImageUrl: doc['profileImageUrl'],
        dateOfBirth:
            doc['dateOfBirth'] != null
                ? DateTime.parse(doc['dateOfBirth'])
                : null,
        gender: doc['gender'],
        address: doc['address'],
        role: doc['role'], 
      );
      notifyListeners();
    }
  }

  Future<void> updateProfile(
    String name,
    String phone,
    XFile? image, {
    DateTime? dateOfBirth,
    String? gender,
    String? address,
  }) async {
    try {
      final userId = _user!.id;
      String? profileImageUrl;

      if (image != null) {
        profileImageUrl = await uploadImage(image);
      }

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'name': name,
        'phone': phone,
        'profileImageUrl': profileImageUrl ?? _user!.profileImageUrl,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'gender': gender,
        'address': address,
      });

      _user = AppUser(
        id: userId,
        email: _user!.email,
        name: name,
        phone: phone,
        profileImageUrl: profileImageUrl ?? _user!.profileImageUrl,
        dateOfBirth: dateOfBirth,
        gender: gender,
        address: address,
        role: _user!.role, 
      );

      notifyListeners();
    } catch (e) {
      print('Error updating profile: $e');
      rethrow;
    }
  }

  Future<String?> uploadImage(XFile image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(
        'profile_images/${DateTime.now().toString()}',
      );
      await storageRef.putFile(File(image.path));
      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
  }
  Future<void> deleteProfile() async {
    try {
      final userId = _user!.id;

      await FirebaseFirestore.instance.collection('users').doc(userId).delete();

      await FirebaseAuth.instance.currentUser!.delete();

      _user = null;
      notifyListeners();
    } catch (e) {
      print('Error deleting profile: $e');
      rethrow;
    }
  }
}
