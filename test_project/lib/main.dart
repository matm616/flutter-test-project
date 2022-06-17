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
      body: TabBarView(
        children: [
          const PageOne(),
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
  int index;
  PageTwo({Key? key, this.index = 0}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final List<Widget> _pages = [
    const Center(
      child: Text('1'),
    ),
    const Center(
      child: Text('2'),
    ),
    const Center(
      child: Text('3'),
    ),
    const Center(
      child: Text('4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: widget.index);

    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                widget.index = widget.index <= 0 ?
                0 : widget.index - 1;
              });
              pageController.animateToPage(
                  widget.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
              },
            icon: const Icon(Icons.arrow_left)
        ),
        Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: _pages
                  )
                ),
                Text((widget.index + 1).toString())
              ],
            )
        ),
        IconButton(
            onPressed: () {
              setState(() {
                widget.index = widget.index >= _pages.length - 1 ?
                widget.index : widget.index + 1;
              });
              pageController.animateToPage(
                  widget.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
              },
            icon: const Icon(Icons.arrow_right)
        ),
      ],
    );
  }
}

