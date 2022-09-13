import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample_flutter_app/app_fonts.dart';
import 'package:sample_flutter_app/app_styles.dart';
import 'package:sample_flutter_app/app_ui.dart';
import 'package:sample_flutter_app/pages/landing_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  return runZonedGuarded(() async {
    runApp(const App());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: const LandingPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppUI.imgAvatar),
          Container(
            height: 50,
          ),
          const Text(
            '08:00 AM',
            style: TextStyle(fontFamily: AppFonts.quicksand, fontSize: 16),
          ),
          Container(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: 'Good morning! ',
              children: const [
                TextSpan(
                    text: 'Tue Vo',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
              style: AppStyles.h3Quicksand.copyWith(color: Colors.blue))),
          Container(
            height: 20,
          ),
          Text.rich(TextSpan(
              text: 'Welcome to ',
              style: AppStyles.h3ChakraPetch,
              children: const [
                TextSpan(
                  text: '247 BPO',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )
              ])),
          Container(
            height: 50,
          ),
          Image.asset(AppUI.icFolderPlus)
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final String title;
  final void Function(int count) onChange;

  const CounterWidget({Key? key, required this.title, required this.onChange})
      : super(key: key);

  void _onChange(int count) {
    onChange(count);
  }

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  int _total = 0;
  String _title = '';

  _incrementCounter() {
    setState(() {
      var newCounter = _counter + 1;
      _counter = newCounter;
      _total += newCounter;
      super.widget._onChange(_counter);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.title.toUpperCase();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('dependencies changed');
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('widget updated');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('widget disposed');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('$_title (Total count: $_total)'),
      Text('$_counter', style: const TextStyle(fontSize: 30)),
      ElevatedButton.icon(
          onPressed: _incrementCounter,
          icon: const Icon(Icons.add),
          label: const Text('Increment'))
    ]);
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another page'),
      ),
      body: Wrap(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Container(
            color: Colors.red,
            child: const Text('Some text'),
          ),
          Container(
            width: 100,
            height: 700,
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
            child: const Text(
              'some text',
              style: TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {
//             print('menu clicked');
//           },
//         ),
//         title: const Text('Home page'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             const Text(
//               'This a overflow widget in my flutter app! This a overflow widget in my flutter app! This a overflow widget in my flutter app!',
//               overflow: TextOverflow.fade,
//               maxLines: 2,
//               style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                   backgroundColor: Colors.lime),
//             ),
//             Image.network(
//                 'https://ca.slack-edge.com/T0167K651E2-U01SDNCE8SD-23d1a438027d-512'),
//             TextButton(
//                 onPressed: () {
//                   print('clicked');
//                 },
//                 child: Text('Click me')),
//             TextButton.icon(
//                 onPressed: () {
//                   print('Back');
//                 },
//                 icon: const Icon(Icons.arrow_back),
//                 label: const Text('Back')),
//             ElevatedButton(onPressed: () {}, child: Text('Click me')),
//             const Text.rich(
//               TextSpan(text: 'Hi ', children: [
//                 TextSpan(
//                     text: 'everyone!',
//                     style: TextStyle(
//                         color: Colors.red, fontWeight: FontWeight.bold)),
//               ]),
//               style: TextStyle(color: Colors.blue),
//             ),
//             CounterWidget(
//                 title: 'Increment your number',
//                 onChange: (count) {
//                   print(count);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
