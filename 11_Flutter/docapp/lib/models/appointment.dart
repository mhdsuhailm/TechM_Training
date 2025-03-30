class Appointment {
  String? id; 
  final String doctorId;
  final String doctorName;
  final String userId;
  final String date;
  final String time;

  Appointment({
    this.id, 
    required this.doctorId,
    required this.doctorName, 
    required this.userId,
    required this.date,
    required this.time,
  });

  factory Appointment.fromMap(Map<String, dynamic> data, String docId) {
    return Appointment(
      id: docId, 
      doctorId: data['doctorId'],
      doctorName: data['doctorName'], 
      userId: data['userId'],
      date: data['date'],
      time: data['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'doctorName': doctorName,
      'userId': userId,
      'date': date,
      'time': time,
    };
  }
}
