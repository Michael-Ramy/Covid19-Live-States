
class CountryStats {

  String name;
  String code;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  bool filtered = true;

  CountryStats({this.name,this.code,this.newConfirmed,this.totalConfirmed,
    this.newDeaths,this.totalDeaths,this.newRecovered,this.totalRecovered});

}