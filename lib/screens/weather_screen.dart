import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key, this.parseWeatherData}) : super(key: key);

  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String? cityName;
  int? temp;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData){

    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }

  String getSystemTime(){
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_searching
              )
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset('image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Text(
                        'Seoul',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Row(
                        children: [
                          TimerBuilder.periodic(
                              (Duration(minutes: 1)),
                              builder: (context){
                                print('${getSystemTime()}');
                                return Text(
                                  '${getSystemTime()}',
                                  style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white
                                  ),
                                );
                              },
                          ),
                          Text(
                            DateFormat(' - EEEE, ').format(date),
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white
                              )
                          ),
                          Text(
                            DateFormat('d MMM, yyy').format(date),
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.white
                              )
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Seoul',
                        style: GoogleFonts.lato(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}