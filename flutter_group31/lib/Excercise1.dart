import 'package:flutter/material.dart';
import 'package:flutter_group31/example.dart';

class Excercise1 extends StatelessWidget {
  Excercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Profile example"),
          ),
          body: Center(
            child: Container(
                width: 300,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.yellow,
                          backgroundImage:
                              NetworkImage("https://picsum.photos/200/200"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'PHL Arty',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12,),
                        Row(
                    children: const [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email: email@example.com'),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8,),
                      Text('Phone: 092312321')
                    ],
                  )

                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}

class Excercise2 extends StatelessWidget {
  Excercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 7,

        itemBuilder: (context, index) {
        
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network('https://picsum.photos/100/100',
              width: 60,
              height: 60,
              fit: BoxFit.cover),
              
            ),
            title: Text("Post number ${index + 1}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Text(
              "Description less easy understand post ${index + 1}",
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              print('Tap post number ${index + 1}');
            },
          ),
        );
      })
    );
  }
}


