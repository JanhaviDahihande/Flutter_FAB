import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Beta 3"),
      ),
      body: Center(
        child: Container(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        elevation: 20.0,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.contacts),
              iconSize: 35.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.message),
              iconSize: 35.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.email),
              iconSize: 35.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.video_call),
              iconSize: 35.0,
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.forward();
            if(controller.isCompleted)
              controller.reverse();
          },
          child: Icon(Icons.call),
          backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FAB(controller),
    );
  }

}

class FAB extends FloatingActionButtonAnimator{

  AnimationController controller;


  FAB(this.controller);

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
      if(progress == 0.0)
        return begin;
      else
        return end;
  }

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
      return TrainHoppingAnimation(
        Tween(begin: 1.0,end: -1.0 ).animate(controller),
        Tween(begin: -1.0,end: 1.0 ).animate(controller)
      );
  }

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
        return Tween(begin: 1.0,end: -1.0 ).animate(controller);
  }

}