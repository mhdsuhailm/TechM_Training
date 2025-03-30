import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:docapp/models/doctor.dart';
import 'package:docapp/providers/appointment_providers.dart';
import 'package:docapp/models/appointment.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _bookAppointment(BuildContext context) async {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a date and time')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User not logged in')));
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final appointment = Appointment(
      doctorId: widget.doctor.id,
      doctorName: widget.doctor.name,
      userId: userId,
      date: DateFormat('yyyy-MM-dd').format(_selectedDate!),
      time: _selectedTime!.format(context),
    );

    final appointmentProvider = Provider.of<AppointmentProvider>(
      context,
      listen: false,
    );
    try {
      await appointmentProvider.bookAppointment(appointment);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appointment booked successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to book appointment: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.doctor.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.doctor.imageUrl),
                radius: 60,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.doctor.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.doctor.specialty,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 5),
                Text(
                  widget.doctor.rating.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.doctor.description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen'
                        : 'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Choose Date'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTime == null
                        ? 'No time chosen'
                        : 'Selected Time: ${_selectedTime!.format(context)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Choose Time'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child:
                  _isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        onPressed: () => _bookAppointment(context),
                        child: Text('Set Appointment'),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
