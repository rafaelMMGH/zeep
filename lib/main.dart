import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/zeep_theme.dart';
import './widget/change_theme_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: ZeepTheme.lightTheme,
          darkTheme: ZeepTheme.darkTheme,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
          actions: [
            ChangeThemeButtonWidget(),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 20, bottom: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Favourites',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    return buildCard(index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20);
                  },
                  itemCount: 5),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recent',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    return buildCard(index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20);
                  },
                  itemCount: 5),
            ),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget buildCard(int index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://source.unsplash.com/random?sig=$index',
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Card $index')
        ],
      );
}
