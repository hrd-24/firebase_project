import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starting_slicing/app/constants/app_spacing.dart';
import 'package:starting_slicing/app/constants/app_style.dart';
import 'package:starting_slicing/app/feature/model/donasi_model.dart';
import 'package:starting_slicing/app/service/donasi_service.dart';
import 'package:starting_slicing/app/widgets/icon_card.dart';
import 'package:starting_slicing/app/widgets/input_decoration.dart';
import 'package:starting_slicing/app/widgets/pageview.dart';
import 'package:starting_slicing/app/widgets/prayer_card.dart';

class HomePage extends StatelessWidget {
  final Function(DonasiModel) onAddDonasi;
  const HomePage({super.key, required this.onAddDonasi});
  @override
  Widget build(BuildContext context) {
    // final String uid = FirebaseAuth.instance.currentUser!.uid;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=1',
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=2',
                      ),
                    ),
                  ],
                ),
              ),
              ImageCarousel(
                images: [
                  'https://i.pravatar.cc/300?img=1',
                  'https://i.pravatar.cc/300?img=2',
                  'https://i.pravatar.cc/300?img=3',
                ],
                height: 150,
                autoPlay: true,
              ),
              Padding(
                padding: AppSpacing.p12,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // warna saat normal
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ), // warna saat aktif
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'WAKTU SHOLAT HARI INI',
                  style: TextStyle(
                    fontSize: AppFontSize.h5,
                    fontWeight: AppTextStyle.bold().fontWeight,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: const [
                    PrayerCard('Subuh', '04:30', Icons.alarm),
                    PrayerCard('Dzuhur', '12:00', Icons.access_time),
                    PrayerCard('Ashar', '15:30', Icons.access_time),
                    PrayerCard('Maghrib', '18:00', Icons.access_time),
                    PrayerCard('Isya', '19:30', Icons.access_time),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Rekomendasi Buku',
                      style: TextStyle(
                        fontSize: AppFontSize.h5,
                        fontWeight: AppTextStyle.bold().fontWeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: AppFontSize.body,
                        fontWeight: AppTextStyle.regular().fontWeight,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    IconCard(
                      'assets/images/icon.jpg',
                      onTap: () {
                        print('Buku 1 diklik!');
                        _showSedekahDialog(context);
                      },
                    ),
                    IconCard(
                      'assets/images/icon.jpg',
                      onTap: () {
                        print('Buku 2 diklik!');
                      },
                    ),
                    IconCard(
                      'assets/images/icon.jpg',
                      onTap: () {
                        print('Buku 3 diklik!');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSedekahDialog(BuildContext context) {
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Simulasi Sedekah"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: customInputDecoration('Nama Lengkap'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: customInputDecoration('Jumlah Sedekah'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final amount = amountController.text.trim();

              if (name.isEmpty || amount.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Harap isi semua data.')),
                );
                return;
              }

              try {
                // ✅ Gunakan FirestoreService yang sudah kita buat
                await DonasiService().tambahDonasi(name, amount);

                Navigator.pop(context); // Tutup dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Donasi berhasil dikirim (Pending).'),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gagal mengirim donasi: $e')),
                );
              }
            },
            child: const Text('Kirim'),
          ),
        ],
      );
    },
  );
}

}
