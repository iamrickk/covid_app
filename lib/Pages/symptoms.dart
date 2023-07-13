import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class symptoms extends StatefulWidget {
  const symptoms({super.key});

  @override
  State<symptoms> createState() => _symptomsState();
}

class _symptomsState extends State<symptoms> {
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
                height: H * 0.04,
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
                          tag: 'background_symp',
                          child: Image.asset(
                            "assets/images/ss.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.08,
                      top: MediaQuery.of(context).size.height * 0.1,
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Symptoms',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.red,
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
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              container_des(
                index: 0,
                img: "assets/images/fever.jpg",
                title: "Fever",
                subtitle:
                    "A temperature that's higher than normal.\nTypically around 98.6°F (37°C)",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/sore_threat.jpg",
                title: "Sore Throat",
                subtitle:
                    "A sore throat is a painful, dry, or scratchy feeling in the throat.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/dry_cough.jpg",
                title: "Dry Cough",
                subtitle: "A cough that doesn't bring up mucus.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/fatigue.jpg",
                title: "Fatigue",
                subtitle:
                    "You have no energy, no motivation and overall feeling of tiredeness.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/runny_nose.jpg",
                title: "Runny Nose",
                subtitle: "Mucus draining or dripping from the nostril.",
              ),
              SizedBox(
                height: H * 0.01,
              ),
              container_des(
                index: 0,
                img: "assets/images/tough.webp",
                title: "Tough Breathing",
                subtitle:
                    "You feel shortness of breath and a tight sensation in your chest.",
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
                                color: Colors.red,
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
                                  color: Colors.redAccent,
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
