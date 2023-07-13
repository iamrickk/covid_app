import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class precaution extends StatefulWidget {
  const precaution({super.key});

  @override
  State<precaution> createState() => _precautionState();
}

class _precautionState extends State<precaution> {
  @override
  Widget build(BuildContext context) {
    var W = MediaQuery.of(context).size.width;
    var H = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Hero(
                          tag: 'background_pre',
                          child: Image.asset(
                            "assets/images/pre.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.2,
                      top: MediaQuery.of(context).size.height * 0.1,
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Precautions',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              container_des(
                index: 0,
                img: "assets/images/wash_hand.jpg",
                title: "Wash Hands",
                subtitle:
                    "Wash your hands often with soap and water and for 20 seconds atleast.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/mask.jpg",
                title: "Protective Mask",
                subtitle:
                    "Always remember to wear a protective mask when stepping out.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/cover_cough.webp",
                title: "Cover Cough",
                subtitle:
                    "Cough or sneeze into your elbow or cover your mouth with a disposable napkin.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/sanitize.png",
                title: "Sanitize Often",
                subtitle:
                    "Use alchohol based sanitizer if water and soap are unavailable.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/no_face.jpg",
                title: "No Face Touching",
                subtitle:
                    "Don't touch your eyes, nose or mouth often and with unwashed hands.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/dist.jpg",
                title: "Social Distancing",
                subtitle:
                    "Keep 2m distance from other people. Stay at home and avoid gatherings.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class container_des extends StatelessWidget {
  int index;
  String img;
  String title;
  String subtitle;

  container_des({
    required this.index,
    required this.img,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                // color: Colors.black,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.03),
                            child: Image.asset(
                              img,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 20,
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Colors.blue,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                subtitle,
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 15,
                                  // fontWeight: FontWeight.w600,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
