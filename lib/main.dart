import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'midterm_620710653',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final _lengthController = TextEditingController();
  final _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children: [
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'PIG THE WEIGHT',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 30.0,
              ),
            ),
            Text(
              'CALCULATOR',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage('assets/images/pig.png'), height: 160.0,),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('LENGTH', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                      const Text('(cm)', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),

                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                        child: TextField(
                            controller: _lengthController,
                            decoration: const InputDecoration(
                              hintText: 'Enter length',
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20.0)
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('GIRTH', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                      const Text('(cm)', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),

                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                        child: TextField(
                            controller: _girthController,
                            decoration: const InputDecoration(
                              hintText: 'Enter girth',
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20.0)
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: ElevatedButton(onPressed: () {
          var Length_text = _lengthController.text;
          var Girth_text = _girthController.text;
          double? length = double.tryParse(Length_text);
          double? girth = double.tryParse(Girth_text);

          if (length == null || girth == null) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("ERROR"),
                  content: const Text("Invalid input"),
                  actions: [
                    // ปุ่ม OK ใน dialog
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        // ปิด dialog
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
          else {
            double weight = (girth / 100) * (girth / 100) * (length / 100) *
                69.3;
            double price = weight * 112.50;
            double weight_max = (0.03 * weight) + weight;
            double price_max = (0.03 * price) + price;
            double weight_min = weight - (0.03 * weight);
            double price_min = price - (0.03 * price);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/ic_pig.png',
                            width: 30, height: 30),
                        Text('  RESULT'),
                      ],
                    ),
                  ),
                  content: Text(
                      'Weight: ${weight_min.round()} - ${weight_max.round()} kg\nPrice: ${price_min.round()} - ${price_max.round()} Baht'),
                  actions: [
                    // ปุ่ม OK ใน dialog
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        // ปิด dialog
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }, child: Text('CALCULATE'),

        ),
      ),
            ],
        ),
      ),
    );
  }
}
