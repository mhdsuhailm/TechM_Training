import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:docapp/screens/profile_screen.dart';
import 'package:docapp/screens/appointments_screen.dart';
import 'package:docapp/screens/doctor_list_screen.dart';
import 'package:docapp/widgets/bottom_nav_bar.dart';
import 'package:docapp/providers/auth_provider.dart';
import 'package:docapp/screens/user_home_screen.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    UserHomeScreen(),
    DoctorList(),
    AppointmentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Medease'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage:
                  authProvider.user?.profileImageUrl != null
                      ? authProvider.user!.profileImageUrl!.startsWith('http')
                          ? NetworkImage(authProvider.user!.profileImageUrl!)
                              as ImageProvider
                          : AssetImage(authProvider.user!.profileImageUrl!)
                              as ImageProvider
                      : AssetImage('assets/images/user1.jpg') as ImageProvider,
              radius: 30,
              child:
                  authProvider.user?.profileImageUrl == null
                      ? Icon(Icons.person, size: 30, color: Colors.white)
                      : null,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
