import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:docapp/providers/doctor_provider.dart';
import 'package:docapp/models/doctor.dart';

class EditDoctorScreen extends StatefulWidget {
  final Doctor doctor;

  const EditDoctorScreen({super.key, required this.doctor});

  @override
  _EditDoctorScreenState createState() => _EditDoctorScreenState();
}

class _EditDoctorScreenState extends State<EditDoctorScreen> {
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
  void initState() {
    super.initState();
    _nameController.text = widget.doctor.name;
    _imageUrlController.text = widget.doctor.imageUrl;
    _descriptionController.text = widget.doctor.description;
    _selectedSpeciality = widget.doctor.specialty;
    _ratingController.text =
        widget.doctor.rating.toString(); 
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Doctor')),
      body: Padding(
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
                final name = _nameController.text;
                final imageUrl = _imageUrlController.text;
                final description = _descriptionController.text;
                final ratingText = _ratingController.text;

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
                  if (rating < 1 || rating > 5) {
                    throw FormatException('Rating must be between 1 and 5');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Invalid rating. Please enter a number between 1 and 5',
                      ),
                    ),
                  );
                  return;
                }

                // Update doctor object
                final updatedDoctor = Doctor(
                  id: widget.doctor.id,
                  name: name,
                  specialty: _selectedSpeciality!,
                  rating: rating,
                  imageUrl:
                      imageUrl.isNotEmpty
                          ? imageUrl
                          : 'assets/images/default_doctor.png', 
                  description: description,
                );

                // Update doctor in Firestore
                try {
                  await doctorProvider.updateDoctor(updatedDoctor);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Doctor updated successfully!')),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update doctor: $e')),
                  );
                }
              },
              child: Text('Update Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
