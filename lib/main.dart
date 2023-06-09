import 'package:flutter/material.dart';
//clevertap package
import 'package:clevertap_plugin/clevertap_plugin.dart';

void main() {
  runApp(const MyApp());
  CleverTapPlugin.initializeInbox();
  CleverTapPlugin.createNotificationChannel(
      "S69", "push", "push desc", 3, true);
  CleverTapPlugin.setDebugLevel(3);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter CTAPSDK Integration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onUserlogin() {
    var stuff = ["bags", "shoes"];
    var profile = {
      'Name': 'Shikha',
      'Identity': '200',
      'Email': 's@s.com',
      'Phone': '+9153653811',
      'stuff': stuff
    };
    CleverTapPlugin.onUserLogin(profile);
  }

  void eventrecord() {
    var eventData = {
      // Key:    Value
      'first': 'partridge',
      'second': 'turtledoves'
    };
    CleverTapPlugin.recordEvent("Flutter Event record", eventData);
  }

  void updateprofile() {
    var stuff = ["laptop", "tablet"];
    var profile = {
      'Name': 'Shivani',
      'Identity': '100',
      'DOB': '22-04-2000',
      //Key always has to be "DOB" and format should always be dd-MM-yyyy
      'Email': 'shivani@gmail.com',
      'Phone': '14155551234',
      'props': 'property1',
      'stuff': stuff
    };
    CleverTapPlugin.profileSet(profile);
  }

  void charged() {
    var item1 = {
      // Key:    Value
      'name': 'thing1',
      'amount': '100'
    };
    var item2 = {
      // Key:    Value
      'name': 'thing2',
      'amount': '100'
    };
    var items = [item1, item2];
    var chargeDetails = {
      // Key:    Value
      'total': '200',
      'payment': 'cash'
    };
    CleverTapPlugin.recordChargedEvent(chargeDetails, items);
  }

  void appinbox() {
    this.setState(() {
      print("inboxDidInitialize called");
      var styleConfig = {
        'noMessageTextColor': '#ff6600',
        'noMessageText': 'No message(s) to show.',
        'navBarTitle': 'App Inbox'
      };
      CleverTapPlugin.showInbox(styleConfig);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                'OnUserLogin',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: onUserlogin,
            ),
            ElevatedButton(
              child: Text(
                'RecordEvent',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: eventrecord,
            ),
            // ElevatedButton(
            //   child: Text(
            //     'ProfileUpdate',
            //     style: TextStyle(fontSize: 20.0),
            //   ),
            //   onPressed: updateprofile,
            // ),
            ElevatedButton(
              child: Text(
                'ChargedEvent',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: charged,
            ),
            ElevatedButton(
              child: Text(
                'AppInbox',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: appinbox,
            ),
          ],
        ),
      ),
    );
  }
}
