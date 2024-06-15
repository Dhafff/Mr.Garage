import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import '../../../common/widgets/button/primary_button.dart';
import '../navbar/pelanggan_navbar.dart';

class ServiceGarage extends StatefulWidget {
  const ServiceGarage({super.key});

  @override
  _ServiceGarageState createState() => _ServiceGarageState();
}

class _ServiceGarageState extends State<ServiceGarage> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _onTime = false;

  Future<void> storeToFirestore() async {
    await FirebaseFirestore.instance.collection('servis').add({
      'vehicle': 'X-ride 125',
      'location': _locationController.text,
      'date': _dateController.text,
      'onTime': _onTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F0F0), // Set the background color to F0F0F0
        appBar: AppBar(
          backgroundColor: const Color(0xFFF0F0F0), // Set the app bar color to F0F0F0
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PelangganNavBar()),
                );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF007EA7), // Set the color to 007EA7
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Selamat pagi, Bozo!',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Ingin servis di bengkel?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 150),
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Add functionality on tap
                              },
                              child: Column(
                                children: <Widget>[
                                  const Text('MOTOR'),
                                  const Text('X-ride 125'),
                                  Image.asset(
                                    'assets/img/vehicle/yamaha-xride.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Add functionality on tap
                              },
                              child: Column(
                                children: <Widget>[
                                  const Text('MOBIL'),
                                  const Text('Kijang Innova'),
                                  Image.asset(
                                    'assets/img/vehicle/toyota-kijang_innova.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            labelText: 'Lokasi kamu',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            labelText: 'Tanggal Servis',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _onTime,
                              onChanged: (bool? value) {
                                setState(() {
                                  _onTime = value ?? false;
                                });
                              },
                            ),
                            const Flexible(
                              child: Text(
                                'Saya bersedia datang tepat waktu sesuai dengan jadwal yang ditentukan',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      PrimaryButton("Servis", onPressed: storeToFirestore),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}