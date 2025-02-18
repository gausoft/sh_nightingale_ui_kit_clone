import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<OnboardingData> onboardingData = [
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_01.png',
    image: 'assets/images/shopping_bag.png',
    title: 'E-Pharma, Made \nIntuitively Easy.',
    description:
        'Your intuitive solution for convenient medication management.',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_02.png',
    image: 'assets/images/medical_toolsets.png',
    title: 'Intelligent Health & \nMedical Metrics',
    description:
        'Unlock the power of intelligent health metrics tailored just for you only',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_03.png',
    image: 'assets/images/3d_bot.png',
    title: 'Doctor AI Companion, \n Only For You',
    description:
        'Meet your personal Medical AI Companion, delivering personalized care',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_04.png',
    image: 'assets/images/3d_medical_bottle.png',
    title: 'Medication Reminder & \n Management',
    description:
        'Never miss a dose with our medication reminder and management system.',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_05.png',
    image: 'assets/images/3d_stethoscope.png',
    title: 'Hassle-Free Virtual \n Doctor Consultation',
    description:
        'Connect hassle-free with virtual doctor consultations for personalized advice.',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_06.png',
    image: 'assets/images/3d_virus.png',
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
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: onboardingData.length,
        itemBuilder: (BuildContext context, int index) {
          return OnboardingScreen(
            data: onboardingData[index],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: onboardingData.length,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          widget.data.backgroundImage,
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
                style: GoogleFonts.manrope(fontSize: 16),
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
  final String backgroundImage;
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.description,
  });
}
