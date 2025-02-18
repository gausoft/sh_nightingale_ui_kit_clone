import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<OnboardingData> onboardingData = [
  OnboardingData(
    image: 'assets/images/shopping_bag.png',
    lightBackgroundImage: 'assets/images/onboarding_bglight_01.png',
    darkBackgroundImage: 'assets/images/onboarding_bgdark_01.png',
    title: 'E-Pharma, Made \nIntuitively Easy.',
    description:
        'Your intuitive solution for convenient medication management.',
  ),
  OnboardingData(
    image: 'assets/images/medical_toolsets.png',
    lightBackgroundImage: 'assets/images/onboarding_bglight_02.png',
    darkBackgroundImage: 'assets/images/onboarding_bgdark_02.png',
    title: 'Intelligent Health & \nMedical Metrics',
    description:
        'Unlock the power of intelligent health metrics tailored just for you only',
  ),
  OnboardingData(
    image: 'assets/images/3d_bot.png',
    lightBackgroundImage: 'assets/images/onboarding_bglight_03.png',
    darkBackgroundImage: 'assets/images/onboarding_bgdark_03.png',
    title: 'Doctor AI Companion, \n Only For You',
    description:
        'Meet your personal Medical AI Companion, delivering personalized care',
  ),
  OnboardingData(
    image: 'assets/images/3d_medical_bottle.png',
    lightBackgroundImage: 'assets/images/onboarding_bglight_04.png',
    darkBackgroundImage: 'assets/images/onboarding_bgdark_04.png',
    title: 'Medication Reminder & \n Management',
    description:
        'Never miss a dose with our medication reminder and management system.',
  ),
  OnboardingData(
    image: 'assets/images/3d_stethoscope.png',
    lightBackgroundImage: 'assets/images/onboarding_bglight_05.png',
    darkBackgroundImage: 'assets/images/onboarding_bgdark_05.png',
    title: 'Hassle-Free Virtual \n Doctor Consultation',
    description:
        'Connect hassle-free with virtual doctor consultations for personalized advice.',
  ),
  OnboardingData(
    image: 'assets/images/3d_virus.png',
    lightBackgroundImage: 'assets/images/onboarding_bglight_06.png',
    darkBackgroundImage: 'assets/images/onboarding_bgdark_06.png',
    title: 'AI-Powered Symptom \n Checker',
    description:
        'Quickly assess your health with our AI-powered symptom checker.',
  ),
];

@RoutePage(name: 'OnboardingPageRoute')
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (controller.page!.toInt() < onboardingData.length - 1) {
        controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        controller.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: onboardingData.length,
            itemBuilder: (BuildContext context, int index) {
              return OnboardingScreen(
                data: onboardingData[index],
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: onboardingData.length,
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.black,
                    dotColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black,
                    ),
                    onPressed: () {
                      // Navigate to the next page
                    },
                    child: Text(
                      'Get started',
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  final OnboardingData data;

  const OnboardingScreen({super.key, required this.data});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          isDarkMode
              ? widget.data.darkBackgroundImage
              : widget.data.lightBackgroundImage,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.data.image),
            SizedBox(height: 20),
            Text(
              widget.data.title,
              style: GoogleFonts.manrope(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.data.description,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OnboardingData {
  final String lightBackgroundImage;
  final String darkBackgroundImage;
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.lightBackgroundImage,
    required this.darkBackgroundImage,
    required this.image,
    required this.title,
    required this.description,
  });
}
