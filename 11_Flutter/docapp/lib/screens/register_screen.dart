
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:docapp/providers/auth_provider.dart';
import 'package:intl/intl.dart'; 
import 'dart:io'; 

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();
  final _roleController = TextEditingController(); 
  DateTime? _selectedDate;
  XFile? _pickedImage; 

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
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
                          : AssetImage('assets/images/user1.jpg')
                              as ImageProvider,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Role'),
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
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final name = _nameController.text;
                  final phone = _phoneController.text;
                  final gender = _genderController.text;
                  final address = _addressController.text;
                  final role = _roleController.text; 

                  if (email.isEmpty ||
                      password.isEmpty ||
                      name.isEmpty ||
                      phone.isEmpty ||
                      gender.isEmpty ||
                      address.isEmpty ||
                      role.isEmpty ||
                      _selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields')),
                    );
                    return;
                  }

                  try {
                    await authProvider.register(
                      email,
                      password,
                      name,
                      phone,
                      profileImageUrl:
                          _pickedImage != null
                              ? await authProvider.uploadImage(_pickedImage!)
                              : 'assets/images/user1.jpg', 
                      dateOfBirth: _selectedDate,
                      gender: gender,
                      address: address,
                      role: role, 
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration successful!')),
                    );
                    Navigator.pushReplacementNamed(context, '/login');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration failed: $e')),
                    );
                  }
                },
                child: Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
