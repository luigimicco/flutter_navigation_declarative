import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Test navigazione',
    home: Main(),
  ));
}

class Main  extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String _selected="prima";

  Page _buildMain(){
    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Prima pagina'),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.red,
                child: const Text('Pagina 2'),
                onPressed: (){
                  setState(() {
                    _selected="seconda";
                  });
                },
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Pagina 3'),
                onPressed: (){
                  setState(() {
                    _selected="terza";
                  });
                },
              ),
            ],
          ),
        ),        
      ),
      key: const ValueKey("prima")
    );
  }

  Page _buildSecondPage(){
    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Seconda pagina"),
        ),
        body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.amber,
              onPressed: (){
                setState(() {
                  _selected="prima";
                  }
                );
              },
              child: const Text('Pagina 1'),
             ),
            MaterialButton(
              color: Colors.amber,
              onPressed: (){
                setState(() {
                  _selected="terza";
                  }
                );
              },
              child: const Text('Pagina 3'),
             ),

          ],
        ),          
        ),
      ),
      key: const ValueKey("seconda")
    );
  }

  Page _buildThirdPage(){
    return MaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Terza pagina"),
        ),
        body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.pink,
              onPressed: (){
                setState(() {
                  _selected="prima";
                  }
                );
              },
              child: const Text('Pagina 1'),
             ),
            MaterialButton(
              color: Colors.pink,
              onPressed: (){
                setState(() {
                  _selected="seconda";
                  }
                );
              },
              child: const Text('Pagina 2'),
             ),

          ],
        ),          
        ),
      ),
      key: const ValueKey("terza")
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        onPopPage: (route, result) => route.didPop(result),
        pages: [
           _buildMain(),
          if (_selected=="seconda") _buildSecondPage(),
          if (_selected=="terza") _buildThirdPage(),
        ],
      ),
    );
  }
}
