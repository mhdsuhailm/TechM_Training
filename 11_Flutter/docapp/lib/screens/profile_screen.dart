import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:docapp/providers/auth_provider.dart';
import 'package:intl/intl.dart'; 
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();
  DateTime? _selectedDate;
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _pickedImage = pickedImage;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.user != null) {
      _nameController.text = authProvider.user!.name;
      _phoneController.text = authProvider.user!.phone;
      _genderController.text = authProvider.user!.gender ?? '';
      _addressController.text = authProvider.user!.address ?? '';
      _selectedDate = authProvider.user!.dateOfBirth;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final name = _nameController.text;
              final phone = _phoneController.text;
              final gender = _genderController.text;
              final address = _addressController.text;

              if (name.isEmpty ||
                  phone.isEmpty ||
                  gender.isEmpty ||
                  address.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all fields')),
                );
                return;
              }

              try {
                await authProvider.updateProfile(
                  name,
                  phone,
                  _pickedImage,
                  dateOfBirth: _selectedDate,
                  gender: gender,
                  address: address,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully!')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to update profile: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _pickedImage != null
                          ? FileImage(File(_pickedImage!.path)) 
                          : authProvider.user?.profileImageUrl != null
                          ? authProvider.user!.profileImageUrl!.startsWith(
                                'http',
                              )
                              ? NetworkImage(
                                    authProvider.user!.profileImageUrl!,
                                  )
                                  as ImageProvider 
                              : AssetImage(authProvider.user!.profileImageUrl!)
                                  as ImageProvider 
                          : AssetImage('assets/images/user1.jpg')
                              as ImageProvider, 
                  child:
                      _pickedImage == null &&
                              authProvider.user?.profileImageUrl == null
                          ? Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.white,
                          ) 
                          : null,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Date of Birth: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Choose Date'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final name = _nameController.text;
                  final phone = _phoneController.text;
                  final gender = _genderController.text;
                  final address = _addressController.text;

                  if (name.isEmpty ||
                      phone.isEmpty ||
                      gender.isEmpty ||
                      address.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields')),
                    );
                    return;
                  }

                  try {
                    await authProvider.updateProfile(
                      name,
                      phone,
                      _pickedImage,
                      dateOfBirth: _selectedDate,
                      gender: gender,
                      address: address,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile updated successfully!')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update profile: $e')),
                    );
                  }
                },
                child: Text('Update Profile'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final confirmed = await showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('Delete Profile'),
                          content: Text(
                            'Are you sure you want to delete your profile? This action cannot be undone.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                  );

                  if (confirmed == true) {
                    try {
                      await authProvider.deleteProfile();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Profile deleted successfully!'),
                        ),
                      );
                      Navigator.pushReplacementNamed(context, '/login');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to delete profile: $e')),
                      );
                    }
                  }
                },
                child: Text('Delete Profile'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await authProvider.logout();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
