import 'package:covid19tracker/services/countryStats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void loadData() async {
    Response response;
    while(true) {
      response = await get('https://api.covid19api.com/summary');
      if (response.statusCode == 200) {
        break;
      }
    }
    Map data = jsonDecode(response.body);

    String lastDate = data['Date'];
    String lastTime = lastDate.substring(11,16);
    int hour = int.parse(lastTime.substring(0,2));
    hour+=2;
    String lastUpdated = lastDate.substring(0,10)+ " | " + hour.toString() + lastTime.substring(2);


    Map globalData = data['Global'];
    CountryStats global = new CountryStats(name: globalData['Country'],
        code: globalData['CountryCode'],newConfirmed: globalData['NewConfirmed'],
        totalConfirmed: globalData['TotalConfirmed'],newDeaths: globalData['NewDeaths'],
        totalDeaths: globalData['TotalDeaths'],newRecovered: globalData['NewRecovered'],
        totalRecovered: globalData['TotalRecovered']);
    print(global.totalConfirmed);

    List countriesList = data['Countries'];
    List<CountryStats> countriesStatsList=[];
    for(int i = 0; i < countriesList.length; i++ ){
      countriesStatsList.add(new CountryStats(name: countriesList[i]['Country'],
          code: countriesList[i]['CountryCode'],newConfirmed: countriesList[i]['NewConfirmed'],
          totalConfirmed: countriesList[i]['TotalConfirmed'],newDeaths: countriesList[i]['NewDeaths'],
          totalDeaths: countriesList[i]['TotalDeaths'],newRecovered: countriesList[i]['NewRecovered'],
          totalRecovered: countriesList[i]['TotalRecovered']));
    }
    print("Done Loading!");
    Navigator.of(context).pushReplacementNamed('/global',
        arguments:{'GlobalStats': global, 'CountriesList': countriesStatsList, 'LastUpdated': lastUpdated });
  }


  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height/5,
            child: Column(
              children: <Widget>[
                SpinKitWave(
                  color: Colors.white,
                  size: 90,
                ),
                SizedBox(height: 50,),
                Text('#STAY_SAFE',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'octinSports',
                    fontSize: 25,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
