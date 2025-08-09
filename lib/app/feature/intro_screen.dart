import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starting_slicing/app/constants/app_color.dart';
import 'package:starting_slicing/app/constants/app_style.dart';
import 'package:starting_slicing/app/feature/authentication/view/login_screen.dart';
import 'package:starting_slicing/app/widgets/button_intro.dart';

class ScreenSimple extends StatefulWidget {
  const ScreenSimple({super.key});

  @override
  State<ScreenSimple> createState() => _ScreenSimpleState();
}

class _ScreenSimpleState extends State<ScreenSimple> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void goToLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro_seen', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  final List<Widget> introPages = [
    //SLIDE 1
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        const Center(
          child: Image(
            image: AssetImage('assets/images/icon.jpg'),
            height: 250,
          ),
        ),
        Spacer(),
        Center(
          child: Text(
            'HI PARA DERMAWAN',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold(
              fontSize: AppFontSize.h3,
              color: AppColor.Screen,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ), // Agar tidak mentok layar
            child: Text(
              'Selamat datang di aplikasi \n'
              'YCALP (Yayasan Cahaya Langit Peduli)',
              textAlign: TextAlign.center,
              style: AppTextStyle.bold(fontSize: AppFontSize.body),
            ),
          ),
        ),
      ],
    ),

    //SLIDE 2
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        const Center(
          child: Image(
            image: AssetImage('assets/images/icon.jpg'),
            height: 250,
          ),
        ),
        Spacer(),
        Center(
          child: Text(
            'BERSEDEKAH MENJADI MUDAH',
            textAlign: TextAlign.left,
            style: AppTextStyle.bold(
              fontSize: AppFontSize.h3,
              color: AppColor.Screen,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ), // Agar tidak mentok layar
            child: Text(
              'Bersedekah di Yayasan Cahaya Langit Peduli kini semakin mudah',
              textAlign: TextAlign.center, // Ini yang membuat teks rata tengah
              style: AppTextStyle.bold(fontSize: AppFontSize.body),
            ),
          ),
        ),
      ],
    ),

    //SLIDE 3
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        const Center(
          child: Image(
            image: AssetImage('assets/images/icon.jpg'),
            height: 250,
          ),
        ),
        Spacer(),
        Center(
          child: Text(
            'AMAN dan AMANAH',
            textAlign: TextAlign.left,
            style: AppTextStyle.bold(
              fontSize: AppFontSize.h3,
              color: AppColor.Screen,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ), // Agar tidak mentok layar
            child: Text(
              'Kini melalui Aplikasi YCALP,\n'
              'Berdonasi dan Sedekah aman dan penuh Transparansi',
              textAlign: TextAlign.center, // Ini yang membuat teks rata tengah
              style: AppTextStyle.bold(fontSize: AppFontSize.body),
            ),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: introPages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                      child: introPages[index],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    introPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      width: _currentPage == index ? 22 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _currentPage > 0
                            ? IntroButton(
                                text: "Back",
                                isPrimary: false,
                                onPressed: () {
                                  _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              )
                            : AbsorbPointer(
                                absorbing: true,
                                child: Opacity(
                                  opacity: 0,
                                  child: IntroButton(
                                    text: "Back",
                                    isPrimary: false,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: IntroButton(
                          text: _currentPage == introPages.length - 1
                              ? "Get Started"
                              : "Next",
                          onPressed: _currentPage == introPages.length - 1
                              ? goToLogin
                              : () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // SKIP BUTTON
            Positioned(
              top: 16,
              right: 16,
              child: Visibility(
                visible: _currentPage != introPages.length - 1,
                child: TextButton(
                  onPressed: goToLogin,
                  child: Text(
                    "Skip",
                    style: AppTextStyle.bold(fontSize: AppFontSize.body),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
