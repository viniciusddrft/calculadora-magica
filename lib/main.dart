import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'key_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textEditingController = TextEditingController();
  final textEditingControllerSecret = TextEditingController();
  String messageSecret = '';
  int count = 0;
  bool isOn = true;

  @override
  void initState() {
    SharedPreferences.getInstance()
        .then((prefs) => messageSecret = prefs.getString('message') ?? '');
    super.initState();
  }

  late final List<KeyModel> keys = [
    KeyModel(
      icon: const Text(
        'AC',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      onPressed: () => textEditingController.clear(),
      color: const Color(0xff5E3C54),
    ),
    KeyModel(
      icon: const Text(
        '( )',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      onPressed: () => textEditingController.text += '(',
      color: const Color(0xff444559),
    ),
    KeyModel(
      icon: const Text(
        '%',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      onPressed: () => textEditingController.text += '%',
      color: const Color(0xff444559),
    ),
    KeyModel(
      icon: const Text(
        '÷',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      onPressed: () => textEditingController.text += '÷',
      color: const Color(0xff444559),
    ),
    KeyModel(
        icon: const Text(
          '7',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '7',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '8',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '8',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '9',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '9',
        color: const Color(0xff232429)),
    KeyModel(
      icon: const Text(
        'X',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      color: const Color(0xff444559),
      onPressed: () => textEditingController.text += 'X',
    ),
    KeyModel(
        icon: const Text(
          '4',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '4',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '5',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '5',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '6',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '6',
        color: const Color(0xff232429)),
    KeyModel(
      icon: const Text(
        '-',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      onPressed: () => textEditingController.text += '-',
      color: const Color(0xff444559),
    ),
    KeyModel(
        icon: const Text(
          '1',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '1',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '2',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '2',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '3',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '3',
        color: const Color(0xff232429)),
    KeyModel(
      icon: const Text(
        '+',
        style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
      ),
      onPressed: () => textEditingController.text += '+',
      color: const Color(0xff444559),
    ),
    KeyModel(
        icon: const Text(
          '0',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += '0',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          ',',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () => textEditingController.text += ',',
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Icon(
          Icons.backspace,
          color: Color(0xffD9DAEF),
        ),
        onPressed: () {
          if (textEditingController.text.isNotEmpty) {
            textEditingController.text = textEditingController.text
                .substring(0, textEditingController.text.length - 1);
          }
        },
        color: const Color(0xff232429)),
    KeyModel(
        icon: const Text(
          '=',
          style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF)),
        ),
        onPressed: () {
          if (isOn) {
            if (count == 3) {
              SharedPreferences.getInstance().then((prefs) {
                messageSecret = prefs.getString('message') ?? '';
                textEditingController.text = messageSecret;
                count = 0;
              });
            } else {
              count++;
              if (textEditingController.text.contains('+')) {
                final numbers = textEditingController.text.split('+');

                final result =
                    double.parse(numbers.first) + double.parse(numbers.last);

                textEditingController.text = result.toString();
              } else if (textEditingController.text.contains('X')) {
                final numbers = textEditingController.text.split('X');

                final result =
                    double.parse(numbers.first) * double.parse(numbers.last);

                textEditingController.text = result.toString();
              } else if (textEditingController.text.contains('÷')) {
                final numbers = textEditingController.text.split('÷');

                final result =
                    double.parse(numbers.first) / double.parse(numbers.last);

                textEditingController.text = result.toString();
              } else if (textEditingController.text.contains('-')) {
                final numbers = textEditingController.text.split('-');

                final result =
                    double.parse(numbers.first) - double.parse(numbers.last);

                textEditingController.text = result.toString();
              }
            }
          } else {
            if (textEditingController.text.contains('+')) {
              final numbers = textEditingController.text.split('+');

              final result =
                  double.parse(numbers.first) + double.parse(numbers.last);

              textEditingController.text = result.toString();
            } else if (textEditingController.text.contains('X')) {
              final numbers = textEditingController.text.split('X');

              final result =
                  double.parse(numbers.first) * double.parse(numbers.last);

              textEditingController.text = result.toString();
            } else if (textEditingController.text.contains('÷')) {
              final numbers = textEditingController.text.split('÷');

              final result =
                  double.parse(numbers.first) / double.parse(numbers.last);

              textEditingController.text = result.toString();
            } else if (textEditingController.text.contains('-')) {
              final numbers = textEditingController.text.split('-');

              final result =
                  double.parse(numbers.first) - double.parse(numbers.last);

              textEditingController.text = result.toString();
            }
          }
        },
        color: const Color(0xff3C4179)),
  ];

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingControllerSecret.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B1A1F),
      appBar: AppBar(
        backgroundColor: const Color(0xff31313D),
        title: SizedBox(
          height: 220,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  textAlign: TextAlign.end,
                  controller: textEditingController,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Color(0xffD9DAEF),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  readOnly: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
        ),
        toolbarHeight: 220,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onDoubleTap: () => isOn = !isOn,
                    child: const Text('√',
                        style:
                            TextStyle(fontSize: 28, color: Color(0xffD9DAEF))),
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: TextFormField(
                              controller: textEditingControllerSecret),
                          actions: [
                            TextButton(
                              onPressed: () {
                                SharedPreferences.getInstance().then((prefs) =>
                                    prefs.setString('message',
                                        textEditingControllerSecret.text));
                                Navigator.pop(context);
                              },
                              child: const Text('Salvar!'),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Text('π',
                        style:
                            TextStyle(fontSize: 28, color: Color(0xffD9DAEF))),
                  ),
                  const Text('^',
                      style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF))),
                  const Text('!',
                      style: TextStyle(fontSize: 28, color: Color(0xffD9DAEF))),
                  CircleAvatar(
                    backgroundColor: const Color(0xff23232B),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xffD9DAEF),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: keys.length,
                itemBuilder: (context, index) => CircleAvatar(
                  backgroundColor: keys[index].color,
                  child: IconButton(
                    onPressed: keys[index].onPressed,
                    icon: keys[index].icon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
