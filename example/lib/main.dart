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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Strength"),
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: PasswordField(textEditingController: textctrl)),
      ),
    );
  }
}
