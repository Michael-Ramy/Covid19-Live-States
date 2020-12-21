import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19tracker/services/countryStats.dart';
import 'package:counter_animation/counter_animation.dart';

Map data = {};
List<CountryStats> countries = [];
CountryStats globalData;
String lastUpdated;

class GlobalStats extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    globalData = data['GlobalStats'];
    countries = data['CountriesList'];
    lastUpdated = data['LastUpdated'];

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/back.jpg"),
          fit: BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-150,
                child: Card(
                  color: Colors.lightBlue[300],
                  shadowColor: Colors.blueGrey[400],
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text('Globally',
                        style: TextStyle(
                          fontFamily: 'octinSports',
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-100,
                child: Card(
                  color: Colors.lightBlue[100],
                  shadowColor: Colors.blueGrey,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: <Widget>[
                        Text('Total Cases',
                          style: TextStyle(
                            fontFamily: 'octinSports',
                            fontSize: 35,
                          ),
                        ),
                        CounterAnimation(
                            begin: 0,
                            end: globalData.totalConfirmed,
                            duration: 1,
                            curve: Curves.easeOut,
                            textStyle: TextStyle(
                              fontFamily: 'Carre',
                              color: Colors.red,
                              fontSize: 35,
                              letterSpacing: 3,
                              height: 1.5
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-100,
                child: Card(
                  color: Colors.lightBlue[100],
                  shadowColor: Colors.blueGrey,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: <Widget>[
                        Text('Total Recovered',
                          style: TextStyle(
                            fontFamily: 'octinSports',
                            fontSize: 35,
                          ),
                        ),
                        CounterAnimation(
                            begin: 0,
                            end: globalData.totalRecovered,
                            duration: 1,
                            curve: Curves.easeOut,
                            textStyle: TextStyle(
                              fontFamily: 'Carre',
                              color: Colors.red,
                              fontSize: 35,
                              letterSpacing: 3,
                              height: 1.5
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-100,
                child: Card(
                  color: Colors.lightBlue[100],
                  shadowColor: Colors.blueGrey,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: <Widget>[
                        Text('Total Deaths',
                          style: TextStyle(
                            fontFamily: 'octinSports',
                            fontSize: 35,
                          ),
                        ),
                        CounterAnimation(
                            begin: 0,
                            end: globalData.totalDeaths,
                            duration: 1,
                            curve: Curves.easeOut,
                            textStyle: TextStyle(
                              fontFamily: 'Carre',
                              color: Colors.red,
                              fontSize: 35,
                              letterSpacing: 3,
                              height: 1.5
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                highlightColor: Colors.indigo[200],
                onTap: (){
                  Navigator.of(context).pushNamed('/home',
                      arguments:{'CountriesList': countries, 'LastUpdated': lastUpdated });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width-100,
                  child: Card(
                    color: Colors.indigo[200],
                    shadowColor: Colors.blueGrey,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Countries",
                          style: TextStyle(
                            fontFamily: 'octinSports',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2
                          ),),
                          Icon(Icons.forward),
                        ],
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white.withOpacity(0.3),
                  child: Text('Last Updated: $lastUpdated',
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

class searchBarDelegate extends SearchDelegate<CountryStats>{
  List<CountryStats> searchedCountries;

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      tooltip: "Back",
      onPressed: () => this.close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }


}