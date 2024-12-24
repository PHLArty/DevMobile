import 'package:flutter/material.dart';
import 'package:flutter_group31/Excercise1.dart';

class ElevatedButtonExample extends StatelessWidget {
  ElevatedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Elevated button example"),
        ),
        body: Center(
          child: ElevatedButton(onPressed: () {print("Elevated pressed");}, child: Text('Press me')),
        ),
      )
    );
  }
}

class OutlineButtonExample extends StatelessWidget {
  OutlineButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Outline button example"),
        ),
        body: Center(
          child: OutlinedButton(onPressed: () {print("Outline pressed");}, child: Text('Press me')),
        ),
      )
    );
  }
}

class GesturesExample extends StatelessWidget {
  GesturesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gestures example"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              print('Container tap');
            },
            onDoubleTap: () {
              print('Container double-taped');
            },
            onLongPress: () {
              print('Container long-pressed');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Tap me'),),
            ),
          ),
        ),
      )
    );
  }
}

class TextFieldExample extends StatelessWidget {
  TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text field example"),
        ),
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        )
        ),
        
      )
    );
  }
}

class LoginScreenExample extends StatefulWidget {
  @override
  _LoginScreenExample createState() => _LoginScreenExample();
}

class _LoginScreenExample extends State<LoginScreenExample> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if(_formKey.currentState!.validate()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form example"),
        ),
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
            SizedBox(height: 8,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeExample()),
                );
              },
              child: const Text('Login'),
            ), 
          ],
        )
        ),
        
      )
    );
  }
}

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExample();
}

class _HomeExample extends State<HomeExample> {
  int _selectedIndex = 0;
  
  static final List<Widget> _widgetOption = <Widget> [
    Excercise2(),
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



