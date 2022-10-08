// ignore_for_file: prefer_const_constructors

import 'package:find_house/pages/home.dart';
import 'package:find_house/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/bottom.png')),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo-9.png'))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Find Cozy House\nto Stay and Happy',
                      style: blackTextStyle.copyWith(fontSize: 24)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    width: 210,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          primary: purpleColor),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: ((context) => Home())),
                      ),
                      child: Text('Explore Now'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
