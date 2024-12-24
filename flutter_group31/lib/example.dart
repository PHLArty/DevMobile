import 'package:flutter/material.dart';
import 'Excercise1.dart';

class CardExample extends StatelessWidget {
  CardExample({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Example'),
        ),
        body: Center(
          child: Card(
            elevation: 4.0,
            child: Padding(padding: const EdgeInsets.all(16.0),
            child: Text('This is a card'),),
          )
        )
      )
    );
  }
}

class BorderExample extends StatelessWidget {
  BorderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Boder Example'),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 3,
              )
            ),
            child: const Center(child: Text("Border example"),
            )
          )
        ),
      )
    );
    
  }
}

class CircleAvatarExample extends StatelessWidget {
  const CircleAvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Circle example"),
        ),
        body: Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://picsum.photos/200/200"),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExample();
}

class _BottomNavigationBarExample extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  
  static final List<Widget> _widgetOption = <Widget> [
    BorderExample(),
    const CircleAvatarExample(),
    Excercise1(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom navigation example"),
        ),
        body: _widgetOption.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,

          selectedItemColor: Colors.amber[800],

          onTap: _onItemTapped,
           
        
        ),
      )
    );
  }
}

class SingleChildScrollViewExample extends StatelessWidget {
  SingleChildScrollViewExample({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Single child scroll view"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            for(int i=0; i< 100; i++)
              Center(
                child: Text('Item $i'),
              )
          ],),
        )
      )
    ); 
  }
}

class ListViewExample extends StatelessWidget {
  ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView example'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Abuml'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        )
      )
    );
    
  }
}

class GridViewExample extends StatelessWidget {
  GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Girl view"),
        ),
        body: GridView.count(crossAxisCount: 2,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(child: Text('Item 1'),)
          ),
          Container(
            color: Colors.yellow,
            child: Center(child: Text('Item 2'),)
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Item 3'),)
          ),

        ],),
      ),
    );
  }
}

class PositionedExample extends StatelessWidget {
  PositionedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Positioned example"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Top left'),),
            ),top:50, left: 50),
            Positioned(child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: Center(child: Text('Bottom right'),),
            ),bottom:50, right: 50)

          ],
        ),
      ),
    );
  }
}







