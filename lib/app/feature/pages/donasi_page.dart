import 'package:flutter/material.dart';
import 'package:starting_slicing/app/constants/app_color.dart';
import 'package:starting_slicing/app/constants/app_spacing.dart';
import 'package:starting_slicing/app/constants/app_style.dart';
import 'package:starting_slicing/app/feature/model/donasi_model.dart';
import 'package:starting_slicing/app/service/donasi_service.dart';

class DonasiPage extends StatefulWidget {
  const DonasiPage({super.key});

  @override
  State<DonasiPage> createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {
  final TextEditingController searchDonasi = TextEditingController();
  String selectedFilter = 'Pending';

  void _updateStatus(String id, String newStatus) async {
    await DonasiService().updateStatus(id, newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App bar section
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 24.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=1',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Donasi',
                      style: AppTextStyle.bold(fontSize: AppFontSize.h4),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              // Search bar + Filter Icon
              Padding(
                padding: AppSpacing.p12,
                child: Row(
                  children: [
                    // Search TextField
                    Expanded(
                      child: TextField(
                        controller: searchDonasi,
                        decoration: InputDecoration(
                          hintText: 'Search for clothes...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.mic),
                            onPressed: () {
                              // aksi mic
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Filter icon
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // aksi filter
                        },
                      ),
                    ),
                  ],
                ),
              ),

             // Filter buttons
Padding(
  padding: const EdgeInsets.all(8.0),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        // Tombol Berhasil
        ElevatedButton(
          onPressed: () {
            setState(() => selectedFilter = 'Berhasil');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedFilter == 'Berhasil'
                ? AppColor.Screen
                : Colors.white,
          ),
          child: Text(
            'Berhasil',
            style: TextStyle(
              color: selectedFilter == 'Berhasil'
                  ? Colors.white // teks kontras jika aktif
                  : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Tombol Pending
        ElevatedButton(
          onPressed: () {
            setState(() => selectedFilter = 'Pending');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedFilter == 'Pending'
                ? AppColor.Screen
                : Colors.white,
          ),
          child: Text(
            'Pending',
            style: TextStyle(
              color: selectedFilter == 'Pending'
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Tombol Dibatalkan
        ElevatedButton(
          onPressed: () {
            setState(() => selectedFilter = 'Dibatalkan');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedFilter == 'Dibatalkan'
                ? AppColor.Screen
                : Colors.white,
          ),
          child: Text(
            'Dibatalkan',
            style: TextStyle(
              color: selectedFilter == 'Dibatalkan'
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ],
    ),
  ),
),


              // Donasi list view pakai Firestore Stream
              StreamBuilder<List<DonasiModel>>(
                stream: DonasiService().getDonasiUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Belum ada donasi'),
                    );
                  }

                  final filteredList = snapshot.data!
                      .where((e) => e.status == selectedFilter)
                      .toList();

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final donasi = filteredList[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama dan Status
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    donasi.nama,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    donasi.status,
                                    style: TextStyle(
                                      color: donasi.status == 'Berhasil'
                                          ? Colors.green
                                          : donasi.status == 'Dibatalkan'
                                          ? Colors.red
                                          : Colors.orange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),

                              // Tanggal
                              Text(
                                'Tanggal: ${donasi.tanggal != null ? donasi.tanggal!.toLocal().toString().split(' ')[0] : '-'}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 6),

                              // Jumlah
                              Text(
                                'Rp ${donasi.jumlah}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              // Tombol aksi Pending
                              if (selectedFilter == 'Pending') ...[
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                      onPressed: () =>
                                          _updateStatus(donasi.id, 'Berhasil'),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _updateStatus(
                                        donasi.id,
                                        'Dibatalkan',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
