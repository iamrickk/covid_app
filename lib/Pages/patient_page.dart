import 'package:covid_app/Services/MapUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/current_location.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

String currLoc = "";
var details = [];
String date_time = "", address = "";
var loc = [];

class _PatientPageState extends State<PatientPage> {
  @override
  void initState() {
    super.initState();
    currentLoc();
  }

  @override
  Widget build(BuildContext context) {
    currentLoc();

    try {
      loc[0];
    } catch (e) {
      currentLoc();
    }
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
                          tag: 'background_hosp',
                          child: Image.asset(
                            "assets/images/rr.webp",
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
                              'Nearby',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigo,
                              ),
                            ),
                            Text(
                              'Hospitals',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigo,
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
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                // margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.3,
                // width: MediaQuery.of(context).size.height * 0.5,
                // decoration: BoxDecoration(
                //     color: Colors.orange,
                //     borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  child: Text("See nearby hospitals in GMap"),
                  onPressed: () async {
                    currentLoc();

                    date_time = currLoc.split("{}")[0];
                    address = currLoc.split("{}")[2];
                    loc = currLoc.split("{}")[1].split(" , ");
                    setState(() {
                      currLoc;
                      date_time;
                      address;
                      loc;
                    });

                    MapUtils.openMap(
                        double.parse(loc[0]!), double.parse(loc[1]!));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void currentLoc() async {
    currLoc = await getLoc();
    date_time = currLoc.split("{}")[0];
    address = currLoc.split("{}")[2];
    loc = currLoc.split("{}")[1].split(" , ");
  }
}
