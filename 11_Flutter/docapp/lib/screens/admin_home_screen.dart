import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:docapp/providers/doctor_provider.dart';
import 'package:docapp/models/doctor.dart';
import 'package:docapp/screens/edit_doctor_screen.dart';
import 'package:docapp/screens/add_doctor_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Doctor? _selectedDoctor; 

  Future<int> _getPatientCount() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('role', isEqualTo: 'user')
              .get();
      return snapshot.docs.length;
    } catch (e) {
      print('Error fetching patient count: $e');
      throw e; 
    }
  }

  Future<int> _getCollectionCount(String collectionName) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();
      return snapshot.docs.length;
    } catch (e) {
      print('Error fetching $collectionName count: $e');
      throw e; 
    }
  }

  Future<int> _getAppointmentsCount() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('appointments').get();
      return snapshot.docs.length;
    } catch (e) {
      print('Error fetching appointments count: $e');
      throw e; 
    }
  }

  Future<List<Doctor>> _getDoctors() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('doctors').get();
      return snapshot.docs.map((doc) {
        return Doctor.fromMap(doc.data(), doc.id); 
      }).toList();
    } catch (e) {
      print('Error fetching doctors: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDoctorScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
      
            FutureBuilder<int>(
              future: _getCollectionCount('users'),
              builder: (context, snapshot) {
                return _buildCard(
                  icon: Icons.people,
                  color: Colors.blue,
                  title: 'Patients',
                  snapshot: snapshot,
                );
              },
            ),
            SizedBox(height: 20),
            FutureBuilder<int>(
              future: _getCollectionCount('doctors'),
              builder: (context, snapshot) {
                return _buildCard(
                  icon: Icons.medical_services,
                  color: Colors.green,
                  title: 'Doctors',
                  snapshot: snapshot,
                );
              },
            ),
            SizedBox(height: 20),
            FutureBuilder<int>(
              future: _getAppointmentsCount(),
              builder: (context, snapshot) {
                return _buildCard(
                  icon: Icons.calendar_today,
                  color: Colors.orange,
                  title: 'Appointments',
                  snapshot: snapshot,
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Doctor Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<Doctor>>(
              future: _getDoctors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No doctors found',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                final doctors = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              doctor.imageUrl.isNotEmpty
                                  ? CachedNetworkImageProvider(doctor.imageUrl)
                                  : AssetImage('assets/images/doctor.png')
                                      as ImageProvider,
                        ),
                        title: Text(doctor.name),
                        subtitle: Text(doctor.specialty),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            EditDoctorScreen(doctor: doctor),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                if (doctor.id.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Invalid doctor ID'),
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  await doctorProvider.deleteDoctor(doctor.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Doctor deleted successfully!',
                                      ),
                                    ),
                                  );
                                  setState(() {}); 
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Failed to delete doctor: $e',
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            _selectedDoctor = doctor; 
                          });
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            if (_selectedDoctor != null) _buildDoctorDetails(_selectedDoctor!),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color color,
    required String title,
    required AsyncSnapshot<int> snapshot,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(
        child: Text(
          'Error: ${snapshot.error}',
          style: TextStyle(color: Colors.red),
        ),
      );
    } else if (!snapshot.hasData || snapshot.data == 0) {
      return Center(
        child: Text('No $title found', style: TextStyle(color: Colors.grey)),
      );
    } else {
      return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildDoctorDetails(Doctor doctor) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CircleAvatar(
              backgroundImage:
                  doctor.imageUrl.isNotEmpty
                      ? CachedNetworkImageProvider(doctor.imageUrl)
                      : AssetImage('assets/images/doctor.png') as ImageProvider,
              radius: 50,
            ),
            SizedBox(height: 10),
            Text('Name: ${doctor.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              'Specialty: ${doctor.specialty}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text('Rating: ${doctor.rating}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              'Description: ${doctor.description}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
