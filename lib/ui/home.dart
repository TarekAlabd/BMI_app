import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double _result = 0.0;
  String _formattedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
          style: TextStyle(
              color: Colors.white, fontSize: 20.4, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/logo.png",
                width: 220,
                height: 110,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.black12,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "Enter Your Age!",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Height in metre",
                        hintText: "Enter Your Height!",
                        icon: Icon(Icons.assessment),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Weight in Kg",
                        hintText: "Enter Your weight!",
                        icon: Icon(Icons.calendar_view_day),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _result = CalculateBMI(_weightController.text,
                              _heightController.text, _ageController.text);
                          if (_result < 18.5)
                            _formattedText = "Underweight!";
                          else if (_result >= 18.5 && _result <= 24.9)
                            _formattedText = "Normal weight!";
                          else if (_result >= 25 && _result <= 29.9)
                            _formattedText = "Overweight!";
                          else
                            _formattedText = "Obesity!";
                        });
                      },
                      color: Colors.pinkAccent,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                "Your BMI: ${_result.toStringAsFixed(1)}",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Text(
                "$_formattedText",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double CalculateBMI(String weight, String height, String age) {
    if (double.parse(weight).toString().isNotEmpty &&
        double.parse(weight) > 0 &&
        double.parse(height).toString().isNotEmpty &&
        double.parse(height) > 0 &&
        double.parse(age).toString().isNotEmpty &&
        double.parse(age) > 0)
      return double.parse(weight) /
          (double.parse(height) * double.parse(height));
    else
      print("wrong!");
  }
}
