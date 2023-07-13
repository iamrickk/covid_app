import 'package:covid_app/Pages/home_page.dart';
import 'package:covid_app/Pages/info_covid.dart';
import 'package:covid_app/Pages/myths.dart';
import 'package:covid_app/Pages/patient_page.dart';
import 'package:covid_app/Pages/precautions.dart';
import 'package:covid_app/Pages/search_page.dart';
import 'package:covid_app/Pages/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class myOptions extends StatefulWidget {
  const myOptions({super.key});

  @override
  State<myOptions> createState() => _myOptionsState();
}

class _myOptionsState extends State<myOptions> {
  @override
  Widget build(BuildContext context) {
    var W = MediaQuery.of(context).size.width;
    var H = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              'Covid-19 Tracker',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        body: Container(
          width: W,
          height: H,
          color: Color.fromARGB(255, 215, 237, 235),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: H * 0.01,
                ),
                home(
                  Title: 'Statistics',
                  SubTitle: 'See how it is affecting the world',
                ),
                SizedBox(
                  height: H * 0.01,
                ),
                search(
                  Title: 'Search',
                  SubTitle: 'See the stats of the country',
                ),
                SizedBox(
                  height: H * 0.01,
                ),
                pre(
                  Title: 'Precautions',
                  SubTitle: 'How to prevent being a victim',
                ),
                SizedBox(
                  height: H * 0.01,
                ),
                symp(
                  Title: "symptoms",
                  SubTitle: "Top Covid-19 symptoms",
                ),
                SizedBox(
                  height: H * 0.01,
                ),
                Hosp(
                  Title: 'Nearby Hospitals',
                  SubTitle: 'Find nearby hospitals to get vaccinated.',
                ),
                SizedBox(
                  height: H * 0.01,
                ),
                myth(
                  Title: 'Myths',
                  SubTitle: 'Get rid of false assumptions',
                ),
                SizedBox(
                  height: H * 0.01,
                ),
                Virus(
                  Title: 'Virus',
                  SubTitle: 'About the Covid-19 virus',
                ),
              ],
            ),
          ),
        ));
  }
}

class home extends StatelessWidget {
  String? Title;
  String? SubTitle;
  home({
    required this.Title,
    required this.SubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => home_page(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/stats.png",
                    opacity: const AlwaysStoppedAnimation(.5),
                    fit: BoxFit.contain,
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
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.orange,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Colors.orange,
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
      ),
    );
  }
}

class search extends StatelessWidget {
  String? Title;
  String? SubTitle;
  search({
    required this.Title,
    required this.SubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => search_page(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/search_country.png",
                    fit: BoxFit.contain,
                    opacity: const AlwaysStoppedAnimation(.5),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 20,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

class pre extends StatelessWidget {
  String? Title;
  String? SubTitle;
  pre({
    required this.Title,
    required this.SubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => precaution(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'background_pre',
                    child: Image.asset(
                      "assets/images/pre.png",
                      fit: BoxFit.contain,
                      opacity: const AlwaysStoppedAnimation(.5),
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
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.blue,
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
      ),
    );
  }
}

class Hosp extends StatelessWidget {
  String? Title;
  String? SubTitle;
  Hosp({
    required this.Title,
    required this.SubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PatientPage(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'background_hosp',
                    child: Image.asset(
                      "assets/images/rr.webp",
                      fit: BoxFit.contain,
                      opacity: const AlwaysStoppedAnimation(.5),
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
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.indigo,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Colors.indigo,
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
      ),
    );
  }
}

class myth extends StatelessWidget {
  String? Title;
  String? SubTitle;
  myth({
    required this.Title,
    required this.SubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => myths(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'background_myths',
                    child: Image.asset(
                      "assets/images/DC.webp",
                      fit: BoxFit.contain,
                      opacity: const AlwaysStoppedAnimation(.5),
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
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.orange,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.orange,
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
      ),
    );
  }
}

class Virus extends StatelessWidget {
  String? Title;
  String? SubTitle;
  Virus({
    required this.Title,
    required this.SubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => info_covid(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'background_virus',
                    child: Image.asset(
                      "assets/images/virus.jpg",
                      fit: BoxFit.contain,
                      opacity: const AlwaysStoppedAnimation(.5),
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
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

class symp extends StatelessWidget {
  String? Title;
  String? SubTitle;
  symp({required this.Title, required this.SubTitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            15.0), // Set the border radius to create rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => symptoms(),
              ));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: 'background_symp',
                    child: Image.asset(
                      "assets/images/ss.jpg",
                      fit: BoxFit.contain,
                      opacity: const AlwaysStoppedAnimation(.5),
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
                        Title!,
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          SubTitle!,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.red,
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
      ),
    );
  }
}
