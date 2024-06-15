import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceRecord {
  final String vehicle;
  final String location;
  final String date;
  final bool onTime;

  ServiceRecord({
    required this.vehicle,
    required this.location,
    required this.date,
    required this.onTime,
  });

  factory ServiceRecord.fromJson(Map<String, dynamic> json) {
    return ServiceRecord(
      vehicle: json['vehicle'],
      location: json['location'],
      date: json['date'],
      onTime: json['onTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicle': vehicle,
      'location': location,
      'date': date,
      'onTime': onTime,
    };
  }
}

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceRecord>> getServiceRecords() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('serviceRecords').get();
      List<ServiceRecord> serviceRecords = querySnapshot.docs.map((doc) {
        return ServiceRecord.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return serviceRecords;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}