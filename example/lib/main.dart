import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strengthpassword/strengthpassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textctrl = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Strength"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 100),
                  child: PasswordField(textEditingController: textctrl)),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, print password. In the real world,
                    // you'd often call a server or save the information in a database.
                    print("Password is "+ textctrl.text);

                  }
                },
                child: Text('Submit'),
              )
            ],
          )),
    );
  }
}
