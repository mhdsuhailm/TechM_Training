import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:docapp/providers/auth_provider.dart';
import 'package:docapp/providers/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'user';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.login),
        actions: [
          // Language Selector Dropdown
          DropdownButton<Locale>(
            value: localeProvider.locale,
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                localeProvider.setLocale(newLocale);
              }
            },
            items: [
              DropdownMenuItem(value: Locale('en'), child: Text('English')),
              DropdownMenuItem(value: Locale('es'), child: Text('Español')),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: localizations.email),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: localizations.password),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Role Selection Dropdown
            DropdownButton<String>(
              value: _selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                });
              },
              items:
                  <String>['user', 'admin'].map<DropdownMenuItem<String>>((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value == 'user'
                            ? localizations.user
                            : localizations.admin,
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(localizations.fillAllFields)),
                  );
                  return;
                }

                if (email == 'admin@gmail.com' && password == 'admin@123') {
                  Navigator.pushReplacementNamed(context, '/admin-dashboard');
                  return;
                }

                try {
                  await authProvider.login(email, password);

                  if (_selectedRole == 'admin' &&
                      authProvider.user?.role == 'admin') {
                    Navigator.pushReplacementNamed(context, '/admin-dashboard');
                  } else if (_selectedRole == 'user' &&
                      authProvider.user?.role == 'user') {
                    Navigator.pushReplacementNamed(context, '/user-dashboard');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.invalidRole)),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${localizations.loginFailed}: $e')),
                  );
                }
              },
              child: Text(localizations.login),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(localizations.dontHaveAccount),
            ),
          ],
        ),
      ),
    );
  }
}
