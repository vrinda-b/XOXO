import'loading.dart';
import 'account.dart';
import 'package:flutter/cupertino.dart';
import'host.dart';
import'dummy.dart';
import 'package:flutter/material.dart';
import'dart:ui' as ui;
import 'dart:async';

void main()
{
    var first=MainPage();
    
    
    runApp(MaterialApp(
      initialRoute:'/',
      routes: {
        '/':(context) => first,
      
        
      },
    
    ));
}
class MainPage extends StatefulWidget {


  @override
  A createState() => A();
}
 
class A extends State with TickerProviderStateMixin  {
  bool loading=true;
_displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
          title: Text('        SELECT PLAYERS   ',style: TextStyle(color:Colors.white,fontSize: 20 ),),
          shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0))+Border.all(color: Colors.pink),
          backgroundColor: Colors.transparent,
          content: Container(
            height:MediaQuery.of(context).size.height*.25,
            width: MediaQuery.of(context).size.width*.5,
            child:Column(
              children: <Widget>[
                  SizedBox(height:MediaQuery.of(context).size.height*.025),
                  
                    OutlineButton.icon(
                    onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new Host1();
              }));
            },
                    label: Text("2 Players",style: TextStyle(color:Colors.white,fontSize: 20 ),),
                    icon: Icon(Icons.people,color: Colors.white,),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*.04),
                     OutlineButton.icon(
                    onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new Host1();
              }));
            },
                    label: Text("4 Players",style: TextStyle(color:Colors.white,fontSize: 20 ),),
                    icon: Icon(Icons.group_add,color: Colors.white,),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
         
                ]
            ),
          ),
          
          actions: <Widget>[
            FlatButton(child: Text('CANCEL', style: TextStyle(color: Colors.white,fontSize: 20 )),onPressed: () {
              Navigator.pop(context);
            },),
          ],
        );
      
        });
  }
 
  AnimationController _resizableController;
  static Color colorVariation(int note){
    if(note <= 1){
      return Colors.purple;
    }else if(note>1 && note<=2){
      return Colors.purple[800];
    }else if(note>2 && note<=3){
      return Colors.purple[600];
    }else if(note>3 && note<=4){
      return Colors.purple[400];
    }else if(note>4 && note<=5){
      return Colors.purple[200];
    }else if(note>5 && note<=6){
      return Colors.pink[200];
    }else if(note>6 && note<=7){
      return Colors.pink[400];
    }else if(note>7 && note<=8){
      return Colors.pink[600];
    }else if(note>8 && note<=9){
      return Colors.pink[800];
    }else if(note>9 && note<=10){
      return Colors.pink;
    }
  }

  AnimatedBuilder getContainer() {
    return new AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) {
          return Container(
            //color: colorVariation((_resizableController.value *100).round()),
            padding: EdgeInsets.all(24),
            child: Text(
              'XOXO',
                style: TextStyle(
                fontSize: 100,
                foreground: Paint()..shader = ui.Gradient.linear(
                const Offset(0, 150),
              const Offset(150, 0),
              <Color>[
              Colors.deepPurpleAccent,
              Colors.redAccent,
              ],
      )
  ),
),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                  color: colorVariation((_resizableController.value *10).round()), width:10),
            ),
          );
        });
  }

  @override
  void initState() {
    _resizableController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });
    _resizableController.forward();
    super.initState();
  }
  startTime() async{
    
    var duration= new Duration(seconds:1);
    return new Timer(duration,route);
    } 
     route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Loading()
      )
    ); 
  }  

  Widget build(BuildContext context ) {
      
              

    return Scaffold(
    body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage('https://wonderfulengineering.com/wp-content/uploads/2016/01/black-wallpaper-22.jpg'),
              fit: BoxFit.cover,
    ),
  ),
        
 
        padding: new EdgeInsets.all(40.0),
          child : Center(
          child : new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
               
               
                
                
              Container(
                height:MediaQuery.of(context).size.height*.3,
                child: getContainer(),
                 ),    
                SizedBox(height:MediaQuery.of(context).size.height*.075),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Container(
        child: OutlineButton(
                   onPressed: () async {
                   return startTime();
                   },
              
                    child: Text("HOST",style: TextStyle(color:Colors.black87,fontSize: 20 ),),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
        height:MediaQuery.of(context).size.height*.075,
        width: MediaQuery.of(context).size.width*.325,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ]
        ),
      ),
                 Container(
        child: OutlineButton(
                    onPressed: () => _displayDialog(context),
                    child: Text("JOIN",style: TextStyle(color:Colors.black87,fontSize: 20 ),),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
        height:MediaQuery.of(context).size.height*.075,
        width: MediaQuery.of(context).size.width*.325,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ]
        ),
      ),
                    ],
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*.05,),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Container(
        child: OutlineButton(
                    onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return Account();
              }));
            },
                    child: Text("ACCOUNT",style: TextStyle(color:Colors.black87,fontSize: 20 ),),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
        height:MediaQuery.of(context).size.height*.075,
        width: MediaQuery.of(context).size.width*.325,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ]
        ),
      ),
                     Container(
        child: OutlineButton(
                    onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return MyApp();
              }));
            }, 
                    child: Text("SETTINGS",style: TextStyle(color:Colors.black87,fontSize: 20 ),),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
        height:MediaQuery.of(context).size.height*.075,
        width: MediaQuery.of(context).size.width*.325,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ]
        ),
      ),
                    ],
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*.05,),
                     new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                     Container(
        child: OutlineButton(
                    onPressed: (){},
                    child: Text("HELP",style: TextStyle(color:Colors.black87,fontSize: 20 ),),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
        height:MediaQuery.of(context).size.height*.075,
        width: MediaQuery.of(context).size.width*.325,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ]
        ),
      ),
                      Container(
        child: OutlineButton(
                    onPressed: (){},
                    child: Text("QUIT",style: TextStyle(color:Colors.black87,fontSize: 20 ),),
                    borderSide: BorderSide(color: Colors.pink,width: 3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    ),
        height:MediaQuery.of(context).size.height*.075,
        width: MediaQuery.of(context).size.width*.325,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            ),
          ]
        ),
      ),
                    ],
                    ),
                  ],   
          ),
        ),
    ),
    );
  }
}

