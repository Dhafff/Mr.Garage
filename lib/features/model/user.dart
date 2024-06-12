import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Vehicle {
  final String name;
  final String photoUrl;
  final String type;

  Vehicle({
    required this.name,
    required this.photoUrl,
    required this.type,
  });

  factory Vehicle.fromFirestore(Map<String, dynamic> data) {
    return Vehicle(
      name: data['name'] as String,
      photoUrl: data['photoUrl'] as String,
      type: data['type'] as String,
    );
  }
}

class UserModel {
  final String email;
  final String username;
  final String photoUrl;
  final Timestamp createAt;
  final Timestamp updateAt;
  final String role;
  final bool active;
  final List<Vehicle> vehicles;

  UserModel({
    required this.email,
    required this.username,
    required this.photoUrl,
    required this.createAt,
    required this.updateAt,
    required this.role,
    required this.active,
    required this.vehicles,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    var vehicleList = data['vehicles'] as List<dynamic>;
    List<Vehicle> vehicles = vehicleList.map((vehicle) {
      return Vehicle.fromFirestore(vehicle);
    }).toList();

    return UserModel(
      email: data['email'] as String,
      username: data['username'] as String,
      photoUrl: data['photoUrl'] as String,
      createAt: data['createAt'] as Timestamp,
      updateAt: data['updateAt'] as Timestamp,
      role: data['role'] as String,
      active: data['active'] as bool,
      vehicles: vehicles,
    );
  }
}

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection('Users').doc(user.uid).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      }
    }
    return null;
  }

  Future<void> updateUserProfile({
    required String userId,
    String? username,
    String? email,
    String? photoUrl,
  }) async {
    final updates = <String, dynamic>{};

    if (username != null) {
      updates['username'] = username;
    }

    if (photoUrl != null) {
      updates['photoUrl'] = photoUrl;
    }

    if (updates.isNotEmpty) {
      await _firestore.collection('Users').doc(userId).update(updates);
    }

    if (email != null) {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateEmail(email);
        await _firestore.collection('Users').doc(user.uid).update({
          'email': email,
        });
      }
    }
  }
}
