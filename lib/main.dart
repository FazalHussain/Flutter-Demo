import 'package:flutter/material.dart';

/// [main] Entry point of a Flutter App
/// [runApp] inflate the widget and attached it to screen
/// [Center] and [Text] are the widgets
/// remember when you use the [Text] specify the [TextDirection]
/// new keyword is optional in Flutter
void main() => runApp(HelloWorldApp());

///Stateless widget is a widget which is never changed
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false, //disapear debug tag
      title: "Trip Cost Calender",
      home: FuelForm(),
    );
  }
}

/*
  Statefull widget is used when the state of the widget change dynamically
 */
class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  final double formDistance = 5.0; //For Text Field Padding
  TextEditingController distanceController = new TextEditingController();
  TextEditingController avgController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  String result = ''; //property that will be changed
  final _currencies = ['Dollars', 'Euros', 'Pounds'];
  String currency = 'Dollars';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            //Handle event as the properties of the widget
            Padding(
              padding: EdgeInsets.only(top: formDistance,
                  bottom: formDistance),
              child: TextField(
                controller: distanceController,
                decoration: InputDecoration(
                    labelText: 'Distance',
                    hintText: 'e.g 123',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                keyboardType: TextInputType.number,
              ),
            ),


            Padding(
              padding: EdgeInsets.only(top: formDistance,
                  bottom: formDistance),
              child: TextField(
                controller: avgController,
                decoration: InputDecoration(
                    labelText: 'Distance per Unit',
                    hintText: 'e.g 16',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                keyboardType: TextInputType.number,
              ),
            ),




            Padding(
              padding: EdgeInsets.only(top: formDistance,
                  bottom: formDistance),
              child: Row(children: <Widget>[
              Expanded(child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: 'e.g 12.23',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
                keyboardType: TextInputType.number,
              ),),
            //For space between price & dropdown use container
            Container(width: 5 * formDistance,),
            Expanded(child: DropdownButton<String>(
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: currency,
              onChanged: (String val) {
                _onDropDownChanged(val);
              },
            ),)],)
            ),

            Row(children: <Widget>[
              //Submit button
              //expanded is used to adjust width according to the device like weights in android native
              Expanded(child: RaisedButton(
                color: Theme
                    .of(context)
                    .primaryColorDark,
                textColor: Theme
                    .of(context)
                    .primaryColorLight,
                child: Text(
                  'Submit',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  setState(() {
                    result = _calculate();
                  });
                },
              ),),

              Container(width: formDistance,),

              //Reset button
              Expanded(child: RaisedButton(
                color: Theme
                    .of(context)
                    .buttonColor,
                textColor: Theme
                    .of(context)
                    .primaryColorDark,
                child: Text(
                  'Reset',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  setState(() {
                    _reset();
                  });
                },
              ),
              )



            ],
            ),
            Text(result)
          ],
        ),
      ),
    );
  }

  void _onDropDownChanged(String val) {
    setState(() {
      this.currency = val;
    });
  }

  void _reset() {
    distanceController.text = '';
    priceController.text = '';
    avgController.text = '';
    result = '';
  }

  String _calculate() {
    double distance = double.parse(distanceController.text);
    double fuelPrice = double.parse(priceController.text);
    double consumption = double.parse(avgController.text);

    double total = distance / consumption * fuelPrice;
    //toStringAsFixed show the double with 2 digit decimal
    return 'The total price of the trip is ' + total.toStringAsFixed(2) +
        ' ' + currency;
  }
}
