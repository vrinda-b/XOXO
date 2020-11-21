import 'package:flutter/material.dart';
class Account extends StatefulWidget {
  @override
  Acc createState() => Acc();
}

class Acc extends State {
//  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  static String _name='';
  static String _num='';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form Validation'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
             decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage('https://wonderfulengineering.com/wp-content/uploads/2016/01/black-wallpaper-22.jpg'),
              fit: BoxFit.cover,
    ),
  ),
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

// Here is our Form UI
  Widget formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
          validator: (String arg) {
    if(arg.isEmpty)
      return 'Name shouldn\'t be empty';
    else
      return null;
  },
  onSaved: (String val)  => setState(()=>_name = val),
    initialValue: _name,
  
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          keyboardType: TextInputType.phone,
          validator: (String arg) {
    if(arg.length!=10)
      return 'Enter a valid phone number';
    else
      return null;
  },
  onSaved: (String val)  => setState(()=>_num = val),
  initialValue: _num,
        ),

        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: new Text('Save'),
        )
      ],
    );
  }

  void _validateInputs() {
  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
    return Navigator.pop(context);
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });
  }
}
}