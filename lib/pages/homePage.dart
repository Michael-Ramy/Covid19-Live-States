import 'package:covid19tracker/services/countryStats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data = {};
  List<CountryStats> countries = [];
  bool tile = true;
  String lastUpdated;

  TextEditingController controller;


  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    countries = data['CountriesList'];
    lastUpdated = data['LastUpdated'];



    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.cyan[400],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: Colors.cyan[600],
            title: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop()
                    ),
                    IconButton(icon: Icon(Icons.refresh),
                        onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false)
                    ),
                  ],
                ),
                Text('COVID-19 Live Stats',
                  style: TextStyle(
                    letterSpacing: 0.7,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.view_module),
                      onPressed: (){
                        setState(() {
                          tile = !tile;
                        });
                      },
                      color: Colors.white,
                      tooltip: 'View Cards',
                    ),
                    IconButton(
                      icon: Icon(Icons.sort),
                      color: Colors.white,
                      onPressed: reverseOrder,
                      tooltip: 'Sort',
                    ),
                  ],
                )
              ],
            ),
            centerTitle: true,
          ),
          body: buildHome(tile)
      ),
    );
  }

  void reverseOrder(){
    setState(() {
      List<CountryStats> countriesReversed = [];
      for(int i=countries.length-1; i >= 0; i--){
        countriesReversed.add(countries[i]);
      }
      for(int i=0;i<countries.length;i++){
        countries[i] = countriesReversed[i];
      }

    });
  }
  Widget buildHome(tile){
    if(tile) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,10,15,10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25.0),
                  //border: Border.all(color: Colors.blue[900],width: 2)
              ),
              //color: Colors.indigo[100],
              child: TextField(
                controller: controller,
                autofocus: false,
                maxLines: 1,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () => FocusScope.of(context).unfocus(),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    onPressed: (){
                      setState(() {
                        FocusScope.of(context).unfocus();
                        controller.clear();
                        searchCountries("");
                      });
                    },
                  ),
                    border: InputBorder.none,
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: Colors.black),
//                    ),
//                    focusedBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: Colors.black),
//                    ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                  ),
                ),
                onChanged: searchCountries,
                cursorWidth: 1,
              ),
            ),
          ),
//          Divider(
//            color: Colors.black,
//            thickness: 2,
//          ),
          Expanded(
            //height: MediaQuery.of(context).size.height-88,
            child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  if(!countries[index].filtered){
                    return Padding(padding: EdgeInsets.all(0),);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/png250px/${countries[index].code.toLowerCase()}.png'),
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pushNamed('/details', arguments: {
                            'Country': countries[index]
                          });
                        },
                        title: Center(
                          child: Text(
                              countries[index].name,
                            style: TextStyle(
                              fontFamily: 'Corbel',
                              fontSize: 16
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                              countries[index].code,
                            style: TextStyle(
                                fontFamily: 'Corbel'
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
//          Divider(
//            color: Colors.black,
//            thickness: 2,
//          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Text('Last Updated: $lastUpdated',
              ),
            ),
          )
        ],
      );
    }
    else {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,10,15,10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(25.0),
                //border: Border.all(color: Colors.blue[900],width: 2)
              ),
              //color: Colors.indigo[100],
              child: TextField(
                controller: controller,
                autofocus: false,
                maxLines: 1,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () => FocusScope.of(context).unfocus(),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    onPressed: (){
                      setState(() {
                        FocusScope.of(context).unfocus();
                        controller.clear();
                        searchCountries("");
                      });
                    },
                  ),
                  border: InputBorder.none,
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: Colors.black),
//                    ),
//                    focusedBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: Colors.black),
//                    ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                  ),
                ),
                onChanged: searchCountries,
                cursorWidth: 1,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  if(!countries[index].filtered){
                    return Padding(padding: EdgeInsets.all(0),);
                  }
                  return MyCard(country: countries[index]);
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Text('Last Updated: $lastUpdated',
              ),
            ),
          )
        ],
      );
    }
  }

  void searchCountries(String keyword){
      //List<CountryStats> filteredCountries = new List<CountryStats>.from(countries);
      print(keyword);
      for(int i=0;i<countries.length;i++){
        if(!countries[i].name.toLowerCase().contains(keyword)){
          countries[i].filtered = false;
        }
        else{
          countries[i].filtered = true;
        }
      }
      setState(() {

      });
  }

}

class MyCard extends StatelessWidget {
  final CountryStats country;

  MyCard({this.country});

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: {
          'Country': country
        });
      },
      // The custom button
      child: Padding(
        padding: EdgeInsets.fromLTRB(20,60,20,140),
        child: Container(
            width: MediaQuery.of(context).size.width*2/3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.blue[900],width: 2)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/png250px/${country.code.toLowerCase()}.png'),
                ),
                Column(
                  children: <Widget>[
                    Text(country.name,
                      style: TextStyle(
                          fontFamily: 'Corbel',
                          fontSize: 16
                      ),
                    ),
                    Text(country.code,
                      style: TextStyle(
                          fontFamily: 'Corbel',
                        color: Colors.grey[600]
                      ),
                    ),
                  ],
                ),
                Text('Total Cases : ${country.totalConfirmed}'
                ),
              ],
            )
        ),
      ),
    );
  }
}


