import 'package:flutter/material.dart';
import 'package:starting_slicing/app/constants/app_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // tinggi gambar relatif terhadap layar
    final double imageHeight = MediaQuery.of(context).size.height * 0.35;
    // seberapa banyak konten menimpa gambar (atur sesuai selera)
    final double overlap = 60.0;

final String content = '''
1. Sejarah Yayasan Cahaya Langit Peduli

Yayasan Cahaya Langit Peduli didirikan dengan tujuan sosial, keagamaan, dan kemanusiaan yang sangat mendalam. Yayasan ini berawal dari inisiatif beberapa individu yang memiliki kepedulian tinggi terhadap kondisi sosial di Indonesia, khususnya dalam menangani permasalahan kemiskinan, pemerataan pendidikan, serta bencana alam yang kerap terjadi.

Masyarakat yang paling terdampak adalah mereka yang berada di lapisan bawah, seperti anak yatim piatu, janda, korban bencana alam, dan tunawisma.

Yayasan berkomitmen untuk memberikan bantuan dalam berbagai bentuk, mulai dari pendidikan, pemberdayaan ekonomi, hingga bantuan langsung berupa dana sosial yang disalurkan kepada masyarakat yang membutuhkan. Salah satu nilai utama yayasan ini adalah keberlanjutan program, dengan harapan dapat memberikan dampak jangka panjang yang positif kepada masyarakat sasaran.

Sejak awal berdiri, Yayasan Cahaya Langit Peduli berfokus pada pengumpulan dana sosial dari berbagai sumber, baik dari masyarakat umum, lembaga sosial, maupun perusahaan yang memiliki program Corporate Social Responsibility (CSR). Yayasan juga telah mendirikan beberapa program untuk anak yatim, rumah singgah bagi tunawisma, serta mengadakan berbagai kegiatan keagamaan untuk menyebarkan nilai-nilai kebaikan.

2. Struktur Organisasi Yayasan Cahaya Langit Peduli

Struktur organisasi yayasan ini terdiri atas beberapa jabatan penting, di antaranya:

• Dewan Pembina
  Terdiri dari tokoh-tokoh berintegritas tinggi dan berkomitmen pada misi yayasan. Bertugas memberikan arahan strategis dan kebijakan.

• Dewan Pengawas
  Mengawasi jalannya operasional yayasan, memastikan seluruh kegiatan sesuai hukum dan anggaran dasar yayasan.

• Pengurus Yayasan
  Mengelola kegiatan operasional sehari-hari serta memastikan program berjalan lancar.

• Ketua Yayasan
  Nama ketua tercatat dalam dokumen resmi, namun data spesifik tidak ditemukan pada berkas yang tersedia.

• Sekretaris dan Bendahara
  Mengelola administrasi dan keuangan yayasan.

Jika diperlukan, informasi lebih rinci mengenai nama-nama pejabat yayasan dapat ditelusuri lebih lanjut.

3. Legalitas Yayasan Cahaya Langit Peduli

Akta Pendirian
Yayasan Cahaya Langit Peduli resmi terdaftar melalui Akta Pendirian yang dikeluarkan oleh notaris, dengan tujuan sosial, keagamaan, dan kemanusiaan. Akta ini mencakup nama yayasan, alamat, serta tujuan dan aktivitas yayasan.
- Nomor Akta: 04
- Tanggal: 26 Juni 2024
- Tempat: Jakarta
- Alamat: Jalan Galur Selatan No. 17, Kelurahan Galur, Kecamatan Johar Baru, Kota Jakarta Pusat, DKI Jakarta

Akta Perubahan
Tidak ditemukan informasi terkait perubahan akta yayasan pada berkas yang tersedia.

Surat Keputusan Menteri Hukum dan HAM
Yayasan ini telah memperoleh pengesahan dari Kementerian Hukum dan HAM Republik Indonesia dengan:
- Nomor: AHU-00643.AH.02.01.Tahun 2023
- Tanggal: 6 Oktober 2023

Pengesahan ini menandakan yayasan sah secara hukum dan berhak menjalankan kegiatan sesuai peraturan yang berlaku di Indonesia.

Legalitas dan Kekayaan Yayasan
Kekayaan awal yayasan berasal dari dana yang dipisahkan dari kekayaan pribadi pendiri, senilai Rp 10.000.000,- (sepuluh juta rupiah). Yayasan juga berhak memperoleh dana dari sumbangan, zakat, infak, sedekah, dan dana sosial keagamaan lainnya yang dikelola sesuai tujuan yayasan.

Dengan adanya akta pendirian dan pengesahan dari Kemenkumham, Yayasan Cahaya Langit Peduli beroperasi secara sah dan sesuai peraturan perundang-undangan yang berlaku.
''';


    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // --- APP BAR (tetap di atas) ---------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=1',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Profil Yayasan',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bold(fontSize: AppFontSize.h4),
                    ),
                  ),
                  // agar teks tetap centered, tambahkan SizedBox dengan lebar avatar di kanan
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // --- BAGIAN ISI (gambar + card yang menimpa dan bisa discroll) ---
            Expanded(
              child: Stack(
                children: [
                  // gambar (di bawah appbar)
                  SizedBox(
                    height: imageHeight,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/images2.jpg', // ganti sesuai assetmu
                      fit: BoxFit.cover,
                    ),
                  ),

                  // card putih yang menimpa bagian bawah gambar dan berisi ScrollView
                  Positioned(
                    top: imageHeight - overlap,
                    left: 30,
                    right: 30,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      // scrollable content
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Halaman Akun',
                            //   style: AppTextStyle.bold(fontSize: AppFontSize.h5),
                            // ),
                            const SizedBox(height: 12),
                            Text(
                              content,
                              style: AppTextStyle.regular(fontSize: AppFontSize.body),
                            ),
                            const SizedBox(height: 24),
                            // contoh tambahan: tombol atau detail singkat
                            // ElevatedButton(onPressed: () {}, child: Text('Hubungi')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
