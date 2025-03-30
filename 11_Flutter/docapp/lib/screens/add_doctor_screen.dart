import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:docapp/providers/doctor_provider.dart';
import 'package:docapp/models/doctor.dart';

class AddDoctorScreen extends StatefulWidget {
  @override
  _AddDoctorScreenState createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ratingController = TextEditingController();
  String? _selectedSpeciality;

  final List<String> _specialities = [
    'Cardiology',
    'Dermatology',
    'Pediatrics',
    'Orthopedics',
  ];

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Add Doctor')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedSpeciality,
              hint: Text('Select Speciality'),
              items:
                  _specialities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSpeciality = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating (1-5)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text.trim();
                final imageUrl = _imageUrlController.text.trim();
                final description = _descriptionController.text.trim();
                final ratingText = _ratingController.text.trim();

                if (name.isEmpty ||
                    _selectedSpeciality == null ||
                    ratingText.isEmpty ||
                    description.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                double rating;
                try {
                  rating = double.parse(ratingText);
                  if (rating < 1 || rating > 5) throw FormatException();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Rating must be between 1 and 5')),
                  );
                  return;
                }

                final doctor = Doctor(
                  id: DateTime.now().toString(),
                  name: name,
                  specialty: _selectedSpeciality!,
                  rating: rating,
                  imageUrl:
                      imageUrl.isNotEmpty
                          ? imageUrl
                          : 'assets/images/default_doctor.png',
                  description: description,
                );

                try {
                  await doctorProvider.addDoctor(doctor);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Doctor added successfully!')),
                  );

                  _nameController.clear();
                  _imageUrlController.clear();
                  _descriptionController.clear();
                  _ratingController.clear();
                  setState(() {
                    _selectedSpeciality = null;
                  });

                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushReplacementNamed(context, '/adminHomeScreen');
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add doctor: $e')),
                  );
                }
              },
              child: Text('Add Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
