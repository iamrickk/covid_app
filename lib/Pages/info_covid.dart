import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class info_covid extends StatefulWidget {
  const info_covid({super.key});

  @override
  State<info_covid> createState() => _info_covidState();
}

class _info_covidState extends State<info_covid> {
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
                        tag: 'background_virus',
                        child: Image.asset(
                          "assets/images/virus.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.orange,
                            ),
                          ),
                          Text(
                            'Virus',
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
                    color: Colors.black,
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
                        detail: "Introduction",
                        desc:
                            "Coronavirus is an enveloped, positive single-strand RNA virus.It belongs to the Coronavirus subfamily, as the name, with the characteristic “crown-like” spikes on their surfaces.",
                        img: "assets/images/corona.webp",
                        clr: Colors.orange,
                      ),
                      design_the_box(
                        detail: "Origin",
                        desc:
                            "The virus is believed to have originated late last year in a food market in the Chinese city of Wuhan that was illegally selling wildlife. Health experts think it may have originated in bats and then passed to humans, possibly via another animal species.\n\nThere are also reports that the intermediate host could be pangolins.",
                        img: "assets/images/origin.jpg",
                        clr: Colors.blueGrey,
                      ),
                      design_the_box(
                        detail: "How dangerous is it?",
                        desc:
                            "Coronavirus infections have a several of symptoms, including fever, cough, shortness of breath, and breathing difficulties.\n\nIt is unclear how deadly the new virus is. Although severe cases can cause pneumonia and death, there may be many cases of milder disease going undetected. Many of those who have died had prior medical conditions or were elderly with weakened immune systems.",
                        img: "assets/images/danger.webp",
                        clr: Color.fromARGB(97, 62, 73, 225),
                      ),
                      design_the_box(
                        detail: "How is it transmitted?",
                        desc:
                            "The new coronavirus can be transmitted from person to person, although it is not clear how easily that happens.\n\nTransmission happens most likely through close contact with an infected person via particles in the air from coughing or sneezing, or by someone touching an infected person or object with the virus on it and then touching their mouth, nose or eyes.",
                        img: "assets/images/tra.webp",
                        clr: Color.fromARGB(255, 228, 90, 90),
                      ),
                      design_the_box(
                        detail: "Are there any vaccines for the coronavirus?",
                        desc: "Yes There are.",
                        img: "assets/images/vaccine.png",
                        clr: Color.fromARGB(255, 219, 220, 235),
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
    for (int i = 0; i < 5; i++) {
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
  String detail;
  String desc;
  String img;
  Color clr;

  design_the_box(
      {required this.detail,
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
                  detail,
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
