// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class GetUserdata extends StatelessWidget {
//   const GetUserdata({
//     super.key,
//     required this.documentId,
//   });

//   final String documentId;

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('Users');

//     return FutureBuilder<DocumentSnapshot>(builder: ((context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.done) {
//         Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//       }
//     }));
//   }
// }
