import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  double a = 0.0, b = 0.0;
  String boer,james,hume,peters,brBF,jBF,hBF,pBF;
  int selectedRadio, selectedRadio2;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadio2(int val) {
    setState(() {
      selectedRadio2 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[300], 
            title: Text('LBM Calculator')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Gender',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Radio(
                    value:1,
                    groupValue: selectedRadio,
                    activeColor: Colors.green[300],
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text('Male',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Radio(
                    value:2,
                    groupValue: selectedRadio,
                    activeColor: Colors.green[300],
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text('Female',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Age 14 or younger?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Radio(
                    value:1,
                    groupValue: selectedRadio2,
                    activeColor: Colors.green[300],
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio2(val);
                    },
                  ),
                  Text('Yes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Radio(
                    value:2,
                    groupValue: selectedRadio2,
                    activeColor: Colors.green[300],
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio2(val);
                    },
                  ),
                  Text('No',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintText: "Height(cm)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _acontroller,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintText: "Weight(kg)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _bcontroller,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      child: Text("Calculate",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      onPressed: _onPress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      child: Text("Clear",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      onPressed: _clearTextInput,
                    ),
                  ),
                ],
              ),
              Container(
                child: Text('Result',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                alignment: Alignment.topCenter,
              ),
              Container(
                child: Text('The lean body mass based on different formulas:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                alignment: Alignment.topCenter,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
                child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [       
                      TableRow(children: [
                        Text('Formula',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('LBM',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('Body Fat',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text('Peter (for children)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$peters'+' kg',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$pBF'+' %',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ]), 
                      TableRow(children: [
                        Text('Boer',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$boer'+' kg',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$brBF'+' %',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text('James',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$james'+' kg',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$jBF'+' %',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text('Hume',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$hume'+' kg',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('$hBF'+' %',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ]),
                    ]), 
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);

    if (selectedRadio == 1 && selectedRadio2 == 1) {
        double boer_1 = (0.252 * b) + (0.473 * a) - 48.3;
        double james_1 = (1.07 * b) - (148 * (pow(b/ a, 2)));
        double hume_1 = (0.29569 * b) + (0.41813 * a) - 43.2933;
        double peter_1 = 3.8 * (0.0215 * (pow(b, 0.6469)) * (pow(a, 0.7236)));
        
        double b1Bodyfat = 100 - (boer_1 / b) * 100;
        double j1Bodyfat = 100 - (james_1 / b) * 100;
        double h1Bodyfat = 100 - (hume_1 / b) * 100;
        double p1Bodyfat = 100 - (peter_1 / b) * 100;

        boer=format(boer_1);
        james=format(james_1);
        hume=format(hume_1);
        peters=format(peter_1);

        brBF=format(b1Bodyfat);
        jBF =format(j1Bodyfat);
        hBF =format(h1Bodyfat);
        pBF =format(p1Bodyfat);
      } else if (selectedRadio == 1 && selectedRadio2 == 2) {
        double boer_1 = (0.252 * b) + (0.473 * a) - 48.3;
        double james_1 = (1.07 * b) - (148 * (pow(b/ a, 2)));
        double hume_1 = (0.29569 * b) + (0.41813 * a) - 43.2933;
        
        double b1Bodyfat = 100 - (boer_1 / b) * 100;
        double j1Bodyfat = 100 - (james_1 / b) * 100;
        double h1Bodyfat = 100 - (hume_1 / b) * 100;

        boer=format(boer_1);
        james=format(james_1);
        hume=format(hume_1);
        peters='-';

        brBF=format(b1Bodyfat);
        jBF =format(j1Bodyfat);
        hBF =format(h1Bodyfat);
        pBF ='-';
      } else if (selectedRadio == 2 && selectedRadio2 == 1) {
        double boer_1 = (0.252 * b) + (0.473 * a) - 48.3;
        double james_1 = (1.07 * b) - (148 * (pow(b/ a, 2)));
        double hume_1 = (0.29569 * b) + (0.41813 * a) - 43.2933;
        double peter_1 = 3.8 * (0.0215 * (pow(b, 0.6469)) * (pow(a, 0.7236)));

        double b1Bodyfat = 100 - (boer_1 / b) * 100;
        double j1Bodyfat = 100 - (james_1 / b) * 100;
        double h1Bodyfat = 100 - (hume_1 / b) * 100;
        double p1Bodyfat = 100 - (peter_1 / b) * 100;

        boer=format(boer_1);
        james=format(james_1);
        hume=format(hume_1);
        peters=format(peter_1);

        brBF=format(b1Bodyfat);
        jBF =format(j1Bodyfat);
        hBF =format(h1Bodyfat);
        pBF =format(p1Bodyfat);
      } else if (selectedRadio==2 && selectedRadio2==2) {
        double boer_1 = (0.252 * b) + (0.473 * a) - 48.3;
        double james_1 = (1.07 * b) - (148 * (pow(b / a, 2)));
        double hume_1 = (0.29569 * b) + (0.41813 * a) - 43.2933;
        
        double b1Bodyfat = 100 - (boer_1 / b) * 100;
        double j1Bodyfat = 100 - (james_1 / b) * 100;
        double h1Bodyfat = 100 - (hume_1 / b) * 100;

        boer=format(boer_1);
        james=format(james_1);
        hume=format(hume_1);
        peters='-';

        brBF=format(b1Bodyfat);
        jBF =format(j1Bodyfat);
        hBF =format(h1Bodyfat);
        pBF ='-';
      }
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  void _clearTextInput() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
      _acontroller.clear();
      _bcontroller.clear();
    });
  }
}
