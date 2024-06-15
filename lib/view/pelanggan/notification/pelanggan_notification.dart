import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mr_garage/common/widgets/notification/notification_card.dart';

import '../../../features/model/service.dart';
import '../../../utils/global.colors.dart';
import '../navbar/pelanggan_navbar.dart';

class PelangganNotification extends StatefulWidget {
  const PelangganNotification({super.key});

  @override
  State<PelangganNotification> createState() => _PelangganNotificationState();


}

class _PelangganNotificationState extends State<PelangganNotification> {
  late Future<List<ServiceRecord>> _futureServiceRecords;

  @override
  void initState() {
    super.initState();
    _futureServiceRecords = ServiceRepository().getServiceRecords();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PelangganNavBar(),
                    ),
                  );
                },
                child: const Icon(
                  FeatherIcons.arrowLeft,
                  size: 20,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Notifikasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GlobalColors.textColor,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: GlobalColors.garis,
            height: 1,
          ),
        ),
      ), 
      body: FutureBuilder<List<ServiceRecord>>(
        future: _futureServiceRecords,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/illustrator/vector_x.png',
              width: 240,
              height: 180,
            ),
            const SizedBox(height: 20),
            Text(
              'Belum ada notifikasi',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: GlobalColors.textColor,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Kalau udah servis atau belanja, notifikasinya\nbakal ditaruh di sini.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 13,
                color: GlobalColors.thirdColor,
                height: 1.7,
              ),
            ),
          ],
        ),
      );
          } else {
            List<ServiceRecord> records = snapshot.data!;
            return ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                ServiceRecord record = records[index];
                return ListTile(
                  title: Text(record.vehicle),
                  subtitle: Text('${record.location} - ${record.date}'),
                  trailing: Icon(record.onTime ? Icons.check : Icons.close),
                );
              },
            );
          }
        },
      ),
    );
  }
}
