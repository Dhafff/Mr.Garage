import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/common/widgets/tab_item/tab_item.dart';
import 'package:mr_garage/view/pelanggan/history/servis/history_pelanggan_servis.dart';

import '../../../utils/global.colors.dart';

class HistoryPelangganTab extends StatelessWidget {
  const HistoryPelangganTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Text(
              'Riwayat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: GlobalColors.textColor,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: GlobalColors.garis,
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                          color: GlobalColors.mainColor, borderRadius: BorderRadius.circular(15)),
                      labelStyle: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                      unselectedLabelStyle: GoogleFonts.openSans(fontWeight: FontWeight.normal),
                      labelColor: Colors.white,
                      unselectedLabelColor: GlobalColors.thirdColor,
                      tabs: const [
                        TabItem(title: 'Servis'),
                        TabItem(title: 'Derek'),
                        TabItem(title: 'Belanja'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
        ),
        body: const TabBarView(
          children: [
            HistoryPelangganServis(),
            Center(
              child: Text('Derek'),
            ),
            Center(
              child: Text('Belanja'),
            ),
          ],
        ),
      ),
    );
  }
}
