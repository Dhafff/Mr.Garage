import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Catatan Servis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedService = 0;
  int _selectedTuneUp = 0;
  int _selectedOil = 0;
  int _selectedComplaint = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Center(child: Text(widget.title)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.settings_suggest),
                  SizedBox(width: 8),
                  Text(
                    'Servis kendaraan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Jenis servis',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Pilih jenis servis untuk kendaraan kamu',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                'Servis ringan',
                'Rp100.000',
              ),
              _buildServiceItem(
                'Servis berat',
                'Rp230.000',
              ),
              SizedBox(height: 16),
              Text(
                'Tune up',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Pilih jenis tune up untuk kendaraan kamu',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                'Tune up rutin',
                'Rp75.000',
              ),
              _buildServiceItem(
                'Tune up lanjutan',
                'Rp100.000',
              ),
              SizedBox(height: 16),
              Text(
                'Ganti oli',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Pilih oli yang ingin dipakai',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                'Oli standar',
                'Rp30.000',
              ),
              _buildServiceItem(
                'Oli spesial',
                'Rp50.000',
              ),
              SizedBox(height: 16),
              Text(
                'Keluhan kendaraan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Pilih keluhan yang ada di kendaraan kamu',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                'Keluhan 1',
                'Rp100.000',
              ),
              _buildServiceItem(
                'Keluhan 2',
                'Rp200.000',
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.money),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Rp 205.000',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Tambah pesanan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(
    String title,
    String price,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(price),
      ],
    );
  }
}
