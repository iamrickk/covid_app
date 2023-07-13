import 'package:covid_app/Pages/info_covid.dart';
import 'package:covid_app/Pages/info_screen.dart';
import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Model/World_stats.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var W = MediaQuery.of(context).size.width;
    var H = MediaQuery.of(context).size.height;
    StatesServices statesServices = StatesServices();
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
                          tag: 'background',
                          child: Image.asset(
                            "assets/images/stats.png",
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
                              'Global',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              'Statistics',
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
              Column(
                children: [
                  SizedBox(
                    height: H * 0.01,
                  ),
                  FutureBuilder(
                    future: statesServices.fetchWorldstateRecords(),
                    builder: (context, AsyncSnapshot<WorldStats> snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50.0,
                            controller: _controller,
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            Card(
                              elevation: 3.0,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                height: H * 0.24,
                                child: PieChart(
                                  dataMap: {
                                    "Total": double.parse(
                                        snapshot.data!.cases!.toString()),
                                    "Recovered": double.parse(
                                        snapshot.data!.recovered.toString()),
                                    "Death": double.parse(
                                        snapshot.data!.deaths.toString()),
                                  },
                                  chartLegendSpacing: 30,
                                  animationDuration: Duration(seconds: 3),
                                  chartType: ChartType.ring,
                                  chartRadius: W / 3,
                                  ringStrokeWidth: 25,
                                  legendOptions: const LegendOptions(
                                    showLegendsInRow: false,
                                    legendPosition: LegendPosition.left,
                                    showLegends: true,
                                    legendTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  chartValuesOptions: ChartValuesOptions(
                                    showChartValueBackground: true,
                                    showChartValues: true,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: true,
                                    decimalPlaces: 1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * .06),
                              child: Card(
                                elevation: 3.0,
                                child: Column(
                                  children: [
                                    DesignRow(
                                        title: 'Total Cases',
                                        value: snapshot.data!.cases.toString()),
                                    DesignRow(
                                        title: 'Deaths',
                                        value:
                                            snapshot.data!.deaths.toString()),
                                    DesignRow(
                                        title: 'Recovered',
                                        value: snapshot.data!.recovered
                                            .toString()),
                                    DesignRow(
                                        title: 'Active',
                                        value:
                                            snapshot.data!.active.toString()),
                                    DesignRow(
                                        title: 'Critical',
                                        value:
                                            snapshot.data!.critical.toString()),
                                    DesignRow(
                                        title: 'Today Deaths',
                                        value: snapshot.data!.todayDeaths
                                            .toString()),
                                    DesignRow(
                                        title: 'Today Recovered',
                                        value: snapshot.data!.todayRecovered
                                            .toString()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DesignRow extends StatelessWidget {
  String title, value;
  DesignRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Color.fromARGB(255, 24, 15, 15),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Color.fromARGB(255, 46, 7, 7),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1.0,
          )
        ],
      ),
    );
  }
}
