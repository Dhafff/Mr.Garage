import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../utils/global.colors.dart';

class ModalAddVehicle extends StatefulWidget {
  const ModalAddVehicle({Key? key}) : super(key: key);

  @override
  _ModalAddVehicleState createState() => _ModalAddVehicleState();
}

class _ModalAddVehicleState extends State<ModalAddVehicle> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tambah kendaraan',
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Tambah kendaraan kamu.',
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: GlobalColors.thirdColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(15),
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: GlobalColors.mainColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Pilih jenis kendaraan',
                        style: TextStyle(fontSize: 12),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Car',
                          child: Text('Mobil'),
                        ),
                        DropdownMenuItem(
                          value: 'Motorbike',
                          child: Text('Motor'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a vehicle type.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),

                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Pilih nama kendaraan',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: [
                        if (dropdownValue == 'Motorbike')
                          const DropdownMenuItem(
                            value: 'Yamaha X-ride 125',
                            child: Text('Yamaha X-ride 125'),
                          ),
                        if (dropdownValue == 'Car')
                          const DropdownMenuItem(
                            value: 'Toyota Kijang Innova',
                            child: Text('Toyota Kijang Innova'),
                          ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a vehicle name.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Handle the selected vehicle name
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}