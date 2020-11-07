import 'package:flutter/material.dart';
import 'package:flutter_app/FirstScreen.dart';
import 'package:flutter_app/result.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flip_card/flip_card.dart';
class GiftResults extends StatefulWidget {
  final Results products;
  GiftResults({Key key,this.products}):super(key:key);
  @override
  _GiftResults createState() => _GiftResults();
}
_launchURL(String url) async {
  debugPrint("url launcher got called for $url");
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class _GiftResults extends State<GiftResults>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'RESULTS',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 25.0, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) {
              debugPrint("passed data to result page");
              return FirstScreen();
            }));},
          ),
        ],
      ),
      body:Container(
        padding:EdgeInsets.all(10.0),
        child: ListView.builder(
//            itemCount:5,
            itemCount:widget.products.gifts.length,

            itemBuilder:(BuildContext context, int i) {
              return Container(
                margin: EdgeInsets.only(bottom: 15.0),
                  padding:EdgeInsets.all(10.0),
                  height:MediaQuery.of(context).size.height*0.75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0,
                              3), // changes position of shadow
                        ),
                      ]
                  ),
                  child: _flipCard(i)
              );

              //

            } ),
      )

    );
  }

  Widget _flipCard(int i){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // default
      front: Material(
        color: Hexcolor('#eaddcf').withOpacity(0.9),
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Color(0x802196F3).withOpacity(0.5),
        child: _frontflip(i),//pass i
      ),
      back: Material(
        color: Hexcolor('#eaddcf').withOpacity(0.7),
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Color(0x802196F3).withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _backflip(i),//pass i
        ),
      ),
    );
  }
  Widget _frontflip(int i) {//index i will be passed
    String imageLink=widget.products.links[i][0]==" "?"https://images.unsplash.com/photo-1575383359917-e585c563a8e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=726&q=80":"${widget.products.images[i][0]}";
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
//            image:AssetImage('Images/tomas-malik-9Ge69X3yfAE-unsplash.jpg'),
            image: NetworkImage(
                imageLink),//image of index i of gift
            fit: BoxFit.cover,
          ),
        borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          )
      ),
      child:Align(
        alignment:Alignment.bottomCenter,
        child: Container(
          height:MediaQuery.of(context).size.height*0.175,
          width: (MediaQuery.of(context).size.width - 35.0),
                    decoration: BoxDecoration(
                    color:Colors.black12.withOpacity(0.7),
                    borderRadius:
                    BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                //text(widget.gift[i])
//            Text('${widget.products.gifts[i]}'
                child: Text('${widget.products.gifts[i]}',
                style:TextStyle(fontSize:24.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Montserrat',
                  color:Colors.white
                )),//gift[i]
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text('Tap the Card to find your gifts',
                    style:TextStyle(fontSize:17.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat',
                        color:Colors.white
                    )),
              )

            ],
          ),
        ),
      )
    );
  }
  Widget _backflip(int i) {//gets a parameter i for gift
   int s=widget.products.links[i][0]==" "?0:1;
//  int s=1;
    if(s>0){
      return Column(
        children: <Widget>[
        Container(
          child: Row(
                children: <Widget>[
                  card(i,0),//img1 pas index 0//pass i of what has come
                  SizedBox(width:15.0),
                  card(i,1)//pass index 2
                ])
        ),
        SizedBox(height:10.0,),
        Container(
            child: Row(
                children: <Widget>[
                  card(i,2),//pass index 3
                  SizedBox(width:15.0),
                  card(i,3)//pass index 4
                ])
        ),
        SizedBox(height:10.0),
        card(i,4)//pass index 5

      ],
    );
    }
    else{
      return oneCard(i);
    }
  }
  Widget card(int i,int j){//passed index and corresponding index ka data is displayed
    return InkWell(
      splashColor: Colors.white38,
      onTap:() {
//        _launchURL("https://www.amazon.in/iKraft-Amazing-Printed-Unicorn-White-11Oz/dp/B07H2F1KFR/ref=sr_1_21?dchild=1&keywords=white+coffee+mug&qid=1595851079&s=kitchen&sr=1-21");
        debugPrint("${widget.products.links[i][j]}");
        _launchURL("${widget.products.links[i][j]}");
        },
      child: Container(
          height:(MediaQuery.of(context).size.height*0.75-75)/3 ,
          width: (MediaQuery.of(context).size.width - 85.0)/2,
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
//                image:AssetImage('Images/back_image.jpg'),
                image: NetworkImage("${widget.products.images[i][j]}"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0,
                      3), // changes position of shadow
                ),
              ]
          ),
//          child:Align(alignment:Alignment.bottomCenter,
//              child:Container(
//                decoration: BoxDecoration(
//                  color:Colors.black12.withOpacity(0.7),
//                  borderRadius:
//                  BorderRadius.circular(20),
//                ),
//                  child: Padding(
//                    padding:EdgeInsets.all(8.0),
////                      "${widget.products.names[i][j].substring(0,30)}..."
//                    child: Text("${widget.products.names[i][j].substring(0,30)}...",
//                      style:TextStyle(color:Colors.white),
//                      textAlign: TextAlign.center,)
//                  )
//              )//widget.products.names[i][j]
//          )
      ),
    );
  }
  Widget oneCard(int i){
    return Container(
      height:(MediaQuery.of(context).size.height*0.75-75) ,
      width: (MediaQuery.of(context).size.width - 85.0),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1575383359917-e585c563a8e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=726&q=80"),
//              image:AssetImage('Images/tomas-malik-9Ge69X3yfAE-unsplash.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
       ),
        child:Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding:EdgeInsets.all(8.0),
            height:(MediaQuery.of(context).size.height*0.75-75)/3,
                decoration: BoxDecoration(color:Colors.black38.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)
                ),

             child:Column(
                children: <Widget>[
                  //"${widget.products.gifts[i]}"
                  Text("${widget.products.gifts[i]}",
                      style:TextStyle(fontSize:22.0,
                      color:Colors.white,
                      fontWeight: FontWeight.w600)),
                  SizedBox(height:10.0),
                  Text(
                      "Find a collection of ${widget.products.gifts[i]} by tapping on the button below",
                      style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white)
                  ),//${widget.products.gifts[i]}
                  SizedBox(height:10.0),
                  FlatButton(
                    //String url=widget.products.searchLinks[i];
                    onPressed: () {
                      debugPrint("${widget.products.searchLinks[i]}");
                      _launchURL("${widget.products.searchLinks[i]}");
                    },
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("Find More"),
                  )
            ],
          ),
          ),
        )

    );
  }

}