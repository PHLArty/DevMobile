import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Example'),
      ),
      body: Center(child: Text(
        'My name is Arty',
        style: TextStyle(fontSize: 24, color: Colors.orange),
      ),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.access_alarm),
      ),
    );
  }
}

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Example'),
      ),
      body: Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(Icons.email),
        Text('long151103@gmail.com')
      ],
    ),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.access_alarm),
      ),
    );
  }
}

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Example'),
      ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(Icons.circle),
        Icon(Icons.star),
        Icon(Icons.alarm)
      ],
    ),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.access_alarm),
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Example'),
      ),
      body: Center(child: Stack(
      children: <Widget> [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        )
      ],
    ),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.access_alarm),
      ),
    );
  }
}


class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Example'),
      ),
      body: Center(child: Container(
        padding: EdgeInsets.all(16.6),
        color: Colors.blue,
        child: Text('Hello arty'),
    ),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.access_alarm),
      ),
    );
  }
}


class ImageExample extends StatelessWidget{
  const ImageExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Example'),
      ),
      body: Center(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('../assets/images/01.jpg',
                width: 750,
                height: 350,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // Khoảng cách giữa các hìn
              Image.network('https://picsum.photos/200/200')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
