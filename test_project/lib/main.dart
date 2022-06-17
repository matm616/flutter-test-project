import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // routes: {
      //   // '/pageOne': (context) => const PageOne(),
      // },
      home: DefaultTabController(
        length: 2,
        child: Screen(),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App"),
        bottom: const TabBar(
          tabs: [
            Tab(
              text: "Page One",
            ),
            Tab(
              text: "Page Two",
            ),
          ]
        )
      ),
      body: const TabBarView(
        children: [
          PageOne(),
          PageTwo(),
        ]
      )
    );
  }
}


class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [
          Text("1"),
          Text("2"),
          Text("3"),
          Text("4"),
          Text("5"),
          Text("6"),
          Text("7"),
          Text("8"),
          Text("9"),
          Text("10"),
        ]
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return Row(
      children: [
        IconButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear);
            },
            icon: const Icon(Icons.arrow_left)


        ),
        Expanded(
            child: PageView(
                controller: _pageController,
                children: const <Widget> [
                  Center(
                    child: Text('1'),
                  ),
                  Center(
                    child: Text('2'),
                  ),
                  Center(
                    child: Text('3'),
                  ),
                  Center(
                    child: Text('4'),
                  ),
                ]
            )
        ),
        IconButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear);
            },
            icon: const Icon(Icons.arrow_right)


        ),
      ],
    );
  }
}

