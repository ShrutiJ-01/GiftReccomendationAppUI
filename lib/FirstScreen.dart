import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/TestForm.dart';
import 'package:hexcolor/hexcolor.dart';
class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Hexcolor('#bae8e8'),
    body:Container(

      height:MediaQuery.of(context).size.height*0.95,
        decoration: BoxDecoration(
           color: Hexcolor('#ffffff'),
          borderRadius: BorderRadius.circular(20.0),

        ),
      child:Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.43,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0)),
                image: DecorationImage(
                    image: AssetImage('Images/gift1.webp',),
                    fit: BoxFit.fitHeight
                )
            ),
          ),
          SizedBox(height:10.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Explore Gifts',
                    style: TextStyle(
                      fontFamily: 'Opensans',
                      fontSize: 27.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 55.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          image : DecorationImage(
                            alignment: Alignment.topRight,
                            image: AssetImage('Images/gift-1.png',),
                            fit: BoxFit.fitHeight,
                          )
                      )
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:10.0),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Find the perfect gift for all ages and ocassions',
                  style:
                  TextStyle(color: Color(0xFF6A6A6A),
                      fontFamily: 'Opensans',
                      fontSize : 20,
                      fontWeight: FontWeight.w500)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'We suggest Gifts that suit your purpose.\nAnswer a short quiz about your requirements to get started',
                style:
                TextStyle(color: Color(0xFF6A6A6A),
                    fontFamily: 'Opensans',
                    fontSize : 20,
                    fontWeight: FontWeight.w300)
            ),
          ),
          SizedBox(height:5.0),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width:140.0,
              height:45.0,
              child: RaisedButton(
               onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   debugPrint("navigating to test page");
                   return TestForm();
                 }));
               },
                child:Center(child: Text('Start Quiz',style: TextStyle(fontSize: 17.0),)),
                color:  Hexcolor("#ff8ba7"),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0)
                  ),
                ),

              ),
            ),
          )
        ],
      )
    )

  );
  }
  }