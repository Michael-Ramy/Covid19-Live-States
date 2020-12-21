import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19tracker/services/countryStats.dart';


class DetailedCountry extends StatelessWidget {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    CountryStats country = data['Country'];

    return Scaffold(
        backgroundColor: Colors.cyan[400],
        body: SafeArea(
          child: Container(
            color: Colors.cyan[400],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    tooltip: 'Back',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
                //SizedBox(height: MediaQuery.of(context).size.height/5-150),
                Center(
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/png250px/${country.code.toLowerCase()}.png'),
                    ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(country.name,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Corbel',
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(country.code,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Corbel',
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width/3+20,
                              child: Card(
                                //margin: EdgeInsets.symmetric(vertical: 35),
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(15,30,15,25),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Text('New Cases',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(country.newConfirmed.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                shadowColor: Colors.cyan[400],
                                elevation: 10,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/3+20,
                              child: Card(
                                //margin: EdgeInsets.symmetric(vertical: 35),
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(15,30,15,25),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Text('Total Cases',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(country.totalConfirmed.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                shadowColor: Colors.cyan[400],
                                elevation: 10,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width/3+20,
                              child: Card(
                                //margin: EdgeInsets.symmetric(vertical: 35),
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(15,30,15,25),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Text('New Deaths',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(country.newDeaths.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                shadowColor: Colors.cyan[400],
                                elevation: 10,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/3+20,
                              child: Card(
                                //margin: EdgeInsets.symmetric(vertical: 35),
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(15,30,15,25),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Text('Total Deaths',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(country.totalDeaths.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                shadowColor: Colors.cyan[400],
                                elevation: 10,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width/3+20,
                              child: Card(
                                //margin: EdgeInsets.symmetric(vertical: 35),
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(15,30,15,25),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('New',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text('Recovered',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(country.newRecovered.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                shadowColor: Colors.cyan[400],
                                elevation: 10,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/3+20,
                              child: Card(
                                //margin: EdgeInsets.symmetric(vertical: 35),
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(15,30,15,25),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('Total',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text('Recovered',
                                          style: TextStyle(
                                              fontFamily: 'Corbel',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(country.totalRecovered.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                shadowColor: Colors.cyan[400],
                                elevation: 10,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

