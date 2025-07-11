// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:transizion_flutter/split_screen.dart';
import 'package:transizion_flutter/view_output_connector.dart';
import 'package:transizion_flutter/view_user_input.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';



void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
  // final res = await DotEnv().env['API_KEY'];
  // debugPrint(res);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelStateManagement(),
        )
      ],
      child: MaterialApp(
          title: 'Career Generator',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Oswald",
          ),
          home: SplitScreen()),

      // MyHomePage()) 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: ViewUserInput()
            ),
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(color: Colors.amber),
          ),
        ),
      ],
    );
  }
}
