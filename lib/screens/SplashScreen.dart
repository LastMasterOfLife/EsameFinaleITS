import 'package:esame_mad_flutter_23_25/colors.dart';
import 'package:esame_mad_flutter_23_25/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bianco,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Seconda Prova d\'esame',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primary),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bianco,
              foregroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),

            ),
            onPressed: () {
              // Navigate to the home screen
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homescreen(),
              ));
            },
            child: const Text('Tap to Start',),
          ),
          // text on the bottom of the screen
          const SizedBox(height: 5),
          Text("by Andrea Conrado", style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w300,
            color: quaternario
          ),)
        ],
      ),
    );
  }
}
