import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<OnboardingData> onboardingData = [
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_01.png',
    image: 'assets/images/shopping_bag.png',
    title: 'E-Pharma, Made Intuitively Easy.',
    description:
        'Your intuitive solution for convenient medication management.',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_02.png',
    image: 'assets/images/medical_toolsets.png',
    title: 'Intelligent Health & Medical Metrics',
    description:
        'Unlock the power of intelligent health metrics tailored just for you only',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_03.png',
    image: 'assets/images/3d_bot.png',
    title: 'Doctor AI Companion, Only For You',
    description:
        'Meet your personal Medical AI Companion, delivering personalized care',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_04.png',
    image: 'assets/images/3d_medical_bottle.png',
    title: 'Medication Reminder & Management',
    description:
        'Never miss a dose with our medication reminder and management system.',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_05.png',
    image: 'assets/images/3d_stethoscope.png',
    title: 'Hassle-Free Virtual Doctor Consultation',
    description:
        'Connect hassle-free with virtual doctor consultations for personalized advice.',
  ),
  OnboardingData(
    backgroundImage: 'assets/images/onboarding_bg_06.png',
    image: 'assets/images/3d_virus.png',
    title: 'AI-Powered Symptom Checker',
    description:
        'Quickly assess your health with our AI-powered symptom checker.',
  ),
];

@RoutePage(name: 'OnboardingPageRoute')
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingData.length,
        itemBuilder: (BuildContext context, int index) {
          return OnboardingScreen(
            data: onboardingData[index],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
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
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final OnboardingData data;

  const OnboardingScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          data.backgroundImage,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(data.image),
            SizedBox(height: 20),
            Text(
              data.title,
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
                data.description,
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
