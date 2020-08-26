import 'package:flutter/material.dart';
import 'ResultScreen.dart';
import 'Weather.dart';

TextEditingController editedtext = new TextEditingController();
var _city = "Delhi";
var _Weathers = "not come";

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bgm.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text("Weather App"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: editedtext,
                    maxLines: 1,
                    maxLength: 20,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () {
                          if (editedtext.text != "") {
                            _city = editedtext.text;
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Result(
                                    city: _city,
                                  ),
                                ));*/
                          }
                        },
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintMaxLines: 1,
                      hintText: "City Name",
                      helperText: "Enter your City Name",
                      helperStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      getWeathers();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Result(city: _city, weather: _Weathers),
                        ),
                      );
                    },
                    child: Text(
                      "Use Current Location",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void getWeathers() async {
  Weather(_city);
  _city = getCityName();
  _Weathers = getWeather();
}
