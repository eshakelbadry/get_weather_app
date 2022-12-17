import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/search_page.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import 'home_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 4, 88, 39),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) {
          //           return SearchPage(
          //             updateUi: updateUi,
          //           );
          //         }));
          //       },
          //       icon: Icon(Icons.search))
          // ],
          // title: Text('Weather Status'),
        ),
        body: weatherData == null
            ? Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 4, 88, 39),
                  Color.fromARGB(255, 31, 131, 73),
                  Color.fromARGB(255, 111, 169, 135),
                  Color.fromARGB(255, 142, 186, 160),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            'Weather Status',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'There is no weather 😔',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Start searching now',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SearchPage(
                                    updateUi: updateUi,
                                  );
                                }));
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 35,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    Container(
                      child: Text(
                        Provider.of<WeatherProvider>(context).cityName!,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          '${weatherData!.temp.toInt()}',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                            Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      child: Text(
                        weatherData?.weatherStatusName ?? '',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(flex: 5),
                  ],
                ),
              ),
      ),
    );
  }
}

WeatherModel? weatherData;
