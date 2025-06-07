import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 30, 179, 40),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Demo Flutter App'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),

        //THIS LINE WAS ADDED BY ME, WAS CHECKING OUT HOW THIS SECTIONS WORKS
        //EVEN WITHOUT THIS LINE THE OUTPUT WAS ALMOST IDENTICAL
        //the colour changes the texts colour, not the app bar's colour
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0),
      ),

      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 330,
              height: 170,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(1),
                    borderRadius: BorderRadius.circular(32.0),
                  ), //Decoration
                ), //Container
              ),
            ),
            Container(
              width: 360,
              height: 190,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1000.0, sigmaY: 1000.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(32.0),
                  ), //Decoration
                ), //Container
              ),
            ), //BackdropFilter
            //This is the main container that holds the text and the counter
            Container(
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.pinkAccent,
                    ),
                  ),

                  Text(
                    'Why are you annoying me T_T ?',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      //decoration: TextDecoration.underline,
                    ),
                  ), //a custom text i was tinkering around
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 15,
        //floatingactionactionbutton already comes with a shadow of 6.0 elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.3),
          side: BorderSide(
            color: const Color.fromARGB(255, 32, 193, 40),
            width: 3.0,
            //added style to the border of the button
          ),
        ),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
