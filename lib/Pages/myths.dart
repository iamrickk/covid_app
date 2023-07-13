import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class myths extends StatefulWidget {
  const myths({super.key});

  @override
  State<myths> createState() => _mythsState();
}

class _mythsState extends State<myths> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            flex: 1,
            child: Card(
              elevation: 10.0,
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
                        tag: 'background_myths',
                        child: Image.asset(
                          "assets/images/DC.webp",
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
                            'Myths',
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.orange,
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
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      design_the_box(
                        myth:
                            "SARS-CoV-2 disease CANNOT be transmitted through mosquito bites",
                        desc:
                            "It's a respiratory virus which spreads primarily through droplets of an infected person's coughs or sneezes,saliva or discharge from the nose.",
                        img: "assets/images/mos.jpg",
                        clr: Colors.white,
                      ),
                      design_the_box(
                        myth:
                            "COVID-19 virus can be transmitted in areas with hot and humid climates",
                        desc:
                            "COVID-19 virus can be transmitted in areas with hot and humid climates or other diseases. It can be transmitted in any climate.",
                        img: "assets/images/hot_humid.jpg",
                        clr: Colors.orange,
                      ),
                      design_the_box(
                        myth:
                            "Garlic DOES NOT protect against infection from the coronavirus",
                        desc:
                            "Garlic may have some anti microbial properties. However, no evidence suggests that garlic can protect people against COVID-19 virus",
                        img: "assets/images/garlic.jpg",
                        clr: Colors.blueGrey,
                      ),
                      design_the_box(
                        myth:
                            "Antibiotics DO NOT work against viruses, only bacteria",
                        desc:
                            "The new coronavirus (2019-nCoV) is a virus and, therefore, antibiotics should not be used as a means of prevention or treatment.",
                        img: "assets/images/anti.jpg",
                        clr: Color.fromARGB(97, 62, 73, 225),
                      ),
                      design_the_box(
                        myth: "Parcels from China CANNOT spread coronavirus",
                        desc:
                            "Scientists believe that the virus can't survive on letters or packages  for an extended period of time. There is very low risk of spread from shipped products or packages",
                        img: "assets/images/parcels.webp",
                        clr: Color.fromARGB(255, 228, 90, 90),
                      ),
                      design_the_box(
                        myth: "Cats and dogs DON'T spread coronavirus",
                        desc:
                            "Currently, there is little evidence to suggest that SARS-CoV-2 can infect cats and dogs. Scientists are still debating the importance of this case to the outbreak.",
                        img: "assets/images/cd.png",
                        clr: Color.fromARGB(255, 219, 220, 235),
                      ),
                      design_the_box(
                        myth: "All age groups CAN contact SARS-CoV-2.",
                        desc:
                            "It can infect people of any age, including children.It can infect people of any age, including children. are more likely to become severely ill.",
                        img: "assets/images/all.jpg",
                        clr: Colors.white,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 7; i++) {
      indicators.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 13,
          height: 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _currentPage == i ? Colors.blue : Colors.green,
          ),
        ),
      );
    }
    return indicators;
  }
}

class design_the_box extends StatelessWidget {
  String myth;
  String desc;
  String img;
  Color clr;

  design_the_box(
      {required this.myth,
      required this.desc,
      required this.img,
      required this.clr});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width *
                          0.4), // Rounded corners with a radius of 8.0
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      50), // Adjust the border radius to control the circular shape
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Image.asset(img),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Center(
              child: Container(
                // margin: EdgeInsets.all(40),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.15,
                    0.0,
                    MediaQuery.of(context).size.width * 0.15,
                    0),
                child: Text(
                  myth,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: Container(
                // margin: EdgeInsets.all(40),
                // margin: EdgeInsets.all(40),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.1,
                    0.0,
                    MediaQuery.of(context).size.width * 0.1,
                    0),
                child: Text(desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    )),
              ),
            ),
          ],
        ));
  }
}
