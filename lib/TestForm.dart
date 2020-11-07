import 'package:flutter/material.dart';
import 'package:flutter_app/result.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'GiftResults.dart';
class TestForm extends StatefulWidget {
  @override
  _TestForm createState() => _TestForm();
}
// ignore: non_constant_identifier_names
List<String> Gender=['Female','Male','Other'];
Future<Results>sendChoice(String gender,String age,String oc,String rel,String interests) async{
  final String url='https://7c74b464e371.ngrok.io';
//  appendInterest(interests);
//  debugPrint("$interests");
//   ignore: equal_keys_in_map
  final response=await http.post(url,body:{"gender":gender,"age":age,"occasion":oc,"relation":rel,"interests":interests});
  int statusCode = response.statusCode;
  if(statusCode==200){
    debugPrint('response came');
    final String resString=response.body;
    return resultsFromJson(resString);
  }
  else{
    debugPrint('response was not successful from API');
    return null;
  }
}
class _TestForm extends State<TestForm> {
  //group variables for radio buttons
  // ignore: unused_field
  String _gender = "";
  String  _age = "";
  String _oc = "";
//  String _persona="";
  String _relation="";
  String _interests;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor('#e3f6f5'),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Container(
            padding:EdgeInsets.only(left:10.0,right:10.0,top:30.0,bottom:15.0),
          child: Column(
//          padding:EdgeInsets.only(left:10.0,right:10.0,top:30.0,bottom:15.0),
            children: <Widget>[
              SizedBox(height:20.0),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Quiz',
                    style: TextStyle(
                        fontFamily: 'Arial', fontSize: 35.0, color: Hexcolor('#272343'),fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height:20.0),
//          Container(
//            height:MediaQuery.of(context).size.height/3,
//            width: MediaQuery.of(context).size.width*0.9,
//            decoration:BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('images/4398.jpg'),
//                  fit: BoxFit.cover,
//                ),
//              borderRadius:BorderRadius.circular(20),
//                border: Border.all(
//                  color: Colors.white,
//                  width: 2,
//                )
//            )
//
//          ),
//          SizedBox(height:20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Answer these questions and get gift recommendations for all needs",
                style:TextStyle(fontSize:20.0,
                fontFamily: 'Montserrat',
                color:Hexcolor('#272343'),
                fontWeight: FontWeight.w500)),
              ),
              SizedBox(height:35.0),
              //Question 1
              Container(
                  padding:EdgeInsets.all(10.0),
                  decoration:BoxDecoration(
                  color:Colors.white,
                  border: Border.all(
                  color: Colors.white,
                  width: 2,),
                      borderRadius:BorderRadius.circular(20)
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("What is the gender of the person you wish to gift?",
                          style:TextStyle(fontSize:18.0,
                              fontFamily: 'Montserrat',
                              color:Colors.black)),
                      RadioButtonGroup(
                        labelStyle:TextStyle(color:Hexcolor('#272343'),fontSize: 16.0),
                        orientation: GroupedButtonsOrientation.HORIZONTAL,
                          margin: EdgeInsets.only(left: 5.0),
                        activeColor: Hexcolor('#272343'),
                        labels:Gender,
                        onChange: (String label, int index) => _gender=label,
                        onSelected: (String label) => print(label),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:25.0),
              Container(
                  padding:EdgeInsets.all(10.0),
                  decoration:BoxDecoration(
                      color:Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2),
                      borderRadius:BorderRadius.circular(20)
                  ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("What age group does the person whom you wish to gift belong to?",
                          style:TextStyle(fontSize:18.0,
                              fontFamily: 'Montserrat',
                              color:Colors.black)),
                    ),
                    Form(
                       child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(

                              titleText: 'Age Group',
                              hintText: 'Please choose one',
                              value: _age,
                              onChanged: (value) {
                                setState(() {
                                  _age = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Toddler",
                                  "value": "Toddler",
                                },
                                {
                                  "display": "Teenager",
                                  "value": "Teenager",
                                },
//                            {
//                              "display": "School going",
//                              "value": "School going",
//                            },
//                            {
//                              "display": "Teenagers",
//                              "value": "Teenagers",
//                            },
//                            {
//                              "display": "Young Adult",
//                              "value": "Young Adults",
//                            },
                                {
                                  "display": "Adult",
                                  "value": "Adult",
                                },
//                            {
//                              "display": "Elderly",
//                              "value": "Elderly",
//                            },

                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),
                          SizedBox(height:20.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("On what occasion are you gifting the person?",
                                style:TextStyle(fontSize:18.0,
                                    fontFamily: 'Montserrat',
                                    color:Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(
                              titleText: 'Occasion for the gift',
                              hintText: 'Please choose one',
                              value: _oc,
                              onSaved: (value) {
                                setState(() {
                                  _oc = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  _oc = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Birthday",
                                  "value": "Birthday",
                                },
                                {
                                  "display": "Anniversary",
                                  "value": "Anniversary",
                                },
                                {
                                  "display": "Wedding",
                                  "value": "Wedding",
                                },

                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),

                          SizedBox(height:20.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("How are you related to the person you wish to gift?",
                                style:TextStyle(fontSize:18.0,
                                    fontFamily: 'Montserrat',
                                    color:Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(
                              titleText: 'Relation to the person',
                              hintText: 'Please choose one',
                              value: _relation,
                              onChanged: (value) {
                                setState(() {
                                  _relation = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Family",
                                  "value": "Family",
                                },
                                {
                                  "display": "Close Friend",
                                  "value": "Close Friend",
                                },
                                {
                                  "display": "Spouse",
                                  "value": "Spouse",
                                },
                                {
                                  "display": "Work Colleague",
                                  "value": "Work Colleague",
                                },
                               ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),
                          SizedBox(height:20.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("What are the interests of the Person you wish to gift?",
                                style:TextStyle(fontSize:18.0,
                                    fontFamily: 'Montserrat',
                                    color:Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownFormField(
                              titleText: 'Interests of the person',
                              hintText: 'Please choose one',
                              value: _interests,
                              onChanged: (value) {
                                setState(() {
                                  _interests = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Technology",
                                  "value": "Technology",
                                },
                                {
                                  "display": "Fashion",
                                  "value": "Fashion",
                                },
                                {
                                  "display": "Sports",
                                  "value": "Sports",
                                },
                                {
                                  "display": "Travelling",
                                  "value": "Travelling",
                                },
                                {
                                  "display": "Reading or Writing",
                                  "value": "Reading or Writing",
                                },
                                {
                                  "display": "Cooking and Home Decor",
                                  "value": "Cooking and Home Decor",
                                },
                                {
                                  "display": "None of the above",
                                  "value": "None of the above",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
//              SizedBox(height:20.0),
//              Container(
//                  padding:EdgeInsets.all(10.0),
//                  decoration:BoxDecoration(
//                      color:Colors.white,
//                      border: Border.all(
//                        color: Colors.white,
//                        width: 2,),
//                      borderRadius:BorderRadius.circular(20)
//                  ),
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    children: <Widget>[
//                      Text("What are the interests of the Person you wish to gift?",
//                      style:TextStyle(fontSize: 18.0)),
//                      SizedBox(height:10.0),
//                      CheckboxGroup(
//                        labelStyle: TextStyle(fontSize: 16.0),
//                        checkColor: Hexcolor('#ffd803'),
//                        activeColor: Hexcolor('#272343'),
//                        labels: <String>[
//                          "Technology",
//                          "Fashion",
//                          "Sports",
//                          "Travelling",
//                          "Reading or Writing",
//                          "Cooking and Home Decor",
//                          "None of the above"
//                        ],
//                        onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
//                        onSelected: (List<String> checked) {print("checked: ${checked.toString()}");
//                        _interests=checked;
//                        debugPrint('the data stored is $_interests gender is$_gender');},
//                      ),
//                    ],
//                  ),
//                ),
//              ),
              SizedBox(height:30.0),
//              RaisedButton(
//                onPressed: () {
//                  appendInterest(_interests);
//                  debugPrint("$_interests");
//                },
//                child:Center(child: Text('Start Quiz',style: TextStyle(fontSize: 17.0),)),
//                color:  Hexcolor("#ff8ba7"),
//                textColor: Colors.white,
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(topRight: Radius.circular(0.0),
//                      topLeft: Radius.circular(20.0),
//                      bottomLeft: Radius.circular(20.0),
//                      bottomRight: Radius.circular(0.0)
//                  ),
//                ),
//
//              ),
//              SizedBox(height:30.0),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height/12,
                    child: FlatButton(
                        onPressed: () async{
                          if(_gender=='female')
                            {debugPrint('new print');}
                          Results data=await sendChoice(_gender,_age,_oc,_relation,_interests);
                          debugPrint("$_gender is gender,$_age is age,$_oc is occasion, $_relation is relation,$_interests is interest");
                          debugPrint("data stored in variable data and gifts length is ${data.gifts.length}}");
                          debugPrint("the length of searchLinks is ${data.searchLinks.length}");
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            debugPrint("passed data to result page");
                            return GiftResults(products: data,);
                          }));
                        },
                      color: Hexcolor('#ff8ba7'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Done",style: TextStyle(fontSize: 18.0,color:Hexcolor('#ffffff'),fontWeight: FontWeight.w600),),
                    ),
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