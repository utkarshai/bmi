import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "BMI",
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();// var _weight= new Tex...... wont work
  double inches = 0.0;
  double result = 0.0;
  String _check = "";// doesnt matter here it is public or private;
  //var weight = new TextEditingController();
  void _calculate(){
    setState((){// here set state is a key word remember
      int age = int.parse(_age.text);
      double height = double.parse(_height.text);
      inches = height*12;
      double weight = double.parse(_weight.text);
      if((_age.text.isNotEmpty || age > 0)&& (_height.text.isNotEmpty || height >0)&& (_weight.text.isNotEmpty||weight>0))
        {
          result = weight/(inches*inches)*703;
        }
        else
          {
            result= 0.0;
          }
          if(result<=18.5){_check= "underweight";}
          if(result>=25.0){ _check= "overweight";}
          else{_check = "normal";}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.greenAccent,
      body: new Container(
        child: new ListView(
          children: <Widget>[

            new Image.asset('images/bmilogo.png', width: 90.0, height: 90.0,),
            new Container(
              color: Colors.amber,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline),
                      fillColor: Colors.yellowAccent,
                      labelText: "age",
                    ),
                  ),
                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.access_alarm),
                        fillColor: Colors.yellowAccent,
                        labelText: "height in feet",
                    ),
                  ),
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.subject),
                        fillColor: Colors.yellowAccent,
                        labelText: "weight in lbs",
                    ),
                  ),
                 // new Padding (padding: EdgeInsets.all(19.0),),//EdgeInsets.all(19.0),
                  new Container(
                    padding: EdgeInsets.all(19.0),
                    child: new RaisedButton(
                      elevation: 4.0,
                      onPressed: _calculate,//()=>debugPrint("hello!"),
                      color: Colors.redAccent,
                      child: new Text("calculate"),
                      textColor: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.9)),
            new Column(
              children: <Widget>[
                new Text("BMI: $result",style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
                ),
                new Text("  ${_check}", style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),)
              ],

            )
          ],

        ),

      ),

    );
  }
}

