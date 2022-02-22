import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main()  async{

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCnXhpuFSIIYOGvDNTbTvJ4vQQerRMyfBo',
          appId: '1:270569521129:android:eed8188a83a2bfec781578',
          messagingSenderId: '270569521129',
          projectId: 'book-sharing-app-bbe5f',
          authDomain: 'Book-Sharing-App.firebaseapp.com',
          databaseURL: 'http://{Book-Sharing-App}.firebaseio.com'
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  FirebaseFirestore operation= FirebaseFirestore.instance;

  addData(String name, String pass) async{
    return await operation.collection("collection_Name").add(
      {
        "name": name,
        "password": pass,
        "location": "Sylhet"
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    addData("Shamim", "123456");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
