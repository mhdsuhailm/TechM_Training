import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:docapp/providers/auth_provider.dart';
import 'package:docapp/providers/doctor_provider.dart';
import 'package:docapp/providers/appointment_providers.dart';
import 'package:docapp/providers/locale_provider.dart';
import 'package:docapp/screens/login_screen.dart';
import 'package:docapp/screens/register_screen.dart';
import 'package:docapp/screens/profile_screen.dart';
import 'package:docapp/screens/appointments_screen.dart';
import 'package:docapp/screens/admin_dashboard.dart';
import 'package:docapp/screens/user_dashboard.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(
          create: (_) => LocaleProvider(),
        ), 
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'Doctor Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: localeProvider.locale, 
      supportedLocales: [
        Locale('en', ''), 
        Locale('es', ''), 
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/user-dashboard': (context) => UserDashboard(),
        '/profile': (context) => ProfileScreen(),
        '/appointments': (context) => AppointmentsScreen(),
        '/admin-dashboard': (context) => AdminDashboard(),
      },
    );
  }
}
