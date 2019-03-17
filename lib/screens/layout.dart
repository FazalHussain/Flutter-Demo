import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrangeAccent,
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            //margin: EdgeInsets.all(30.0), //all side margin
            // Row is used to place widget horizontally
            // Row is not scrollable. if the content is large and unable to fit
            // in the view flutter indicate the error on the right
            child: Column(
              children: <Widget>[
                //1st row
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Margherita",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            //color: Colors.red,
                            fontSize: 30.0,
                            decoration: TextDecoration.none,
                            // remove decoration i.e underline, etc
                            fontFamily: "Roboto",
                            //check pubspec.yml
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Tomato, Mozzarella, Basil",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            //color: Colors.red,
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                            // remove decoration i.e underline, etc
                            fontFamily: "Roboto",
                            //check pubspec.yml
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),

                //2nd row
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Marinara",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            //color: Colors.red,
                            fontSize: 30.0,
                            decoration: TextDecoration.none,
                            // remove decoration i.e underline, etc
                            fontFamily: "Roboto",
                            //check pubspec.yml
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Tomato, Garlic",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            //color: Colors.red,
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                            // remove decoration i.e underline, etc
                            fontFamily: "Roboto",
                            //check pubspec.yml
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),

                PizzaImageWidget(),
                OrderButton()
              ],
            )));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/pizza1.png');
    Image image = Image(
      image: assetImage,
      width: 300.0,
      height: 300.0,
    );
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: image,
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        color: Colors.greenAccent,
        child: Text("Order your Pizza!"),
        onPressed: () {
          order(context);
        },
      ),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
