import 'dart:async';
import 'dart:math' as math;
import 'package:covid_app/Pages/Options_page.dart';
import 'package:covid_app/Pages/home_page.dart';
import 'package:covid_app/Pages/info_covid.dart';
import 'package:covid_app/Pages/search_page.dart';
import 'package:covid_app/Utils/Colors.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();

    Timer(Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => myOptions(),
          ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var W = MediaQuery.of(context).size.width;
    var H = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: splash_screen_color,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                child: Image.asset(
                  'assets/images/Covid.png',
                  height: H * 0.6,
                  width: W * 0.6,
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
              ),
              const Align(
                alignment: Alignment.center,
                child: Text('   Covid-19\n Tracker App',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: AutofillHints.countryCode,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5.0,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
