import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:docapp/providers/doctor_provider.dart';
import 'package:docapp/screens/doctor_list_screen.dart';
import 'package:docapp/widgets/doctor_card.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final List<Map<String, String>> carouselData = [
    {
      'image': 'assets/images/carousel1.jpeg',
      'title': 'Your Health, Our Priority',
      'subtitle': 'Experience world-class healthcare with our expert doctors.',
    },
    {
      'image': 'assets/images/carousel2.jpeg',
      'title': 'Compassionate Care',
      'subtitle': 'We are here to support you every step of the way.',
    },
    {
      'image': 'assets/images/carousel3.jpeg',
      'title': 'Advanced Medical Solutions',
      'subtitle': 'Cutting-edge technology for better health .',
    },
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    doctorProvider.fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 5),
            ),
            items:
                carouselData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(data['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['title']!,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    data['subtitle']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          // Featured Doctors Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Featured Doctors',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(height: 10),
          Consumer<DoctorProvider>(
            builder: (context, doctorProvider, child) {
              if (doctorProvider.doctors.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              final featuredDoctors = doctorProvider.doctors.take(3).toList();

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: featuredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = featuredDoctors[index];
                  return DoctorCard(doctor: doctor);
                },
              );
            },
          ),
          SizedBox(height: 20),
          // Browse More Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorList()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Browse More Doctors',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
