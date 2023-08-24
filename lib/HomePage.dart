import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      theme: ThemeData(primaryColor: Colors.greenAccent[700]),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fb = FirebaseDatabase.instance;
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  var k;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AddNote()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: FirebaseAnimatedList(
          query: ref,
          shrinkWrap: true,
          itemBuilder: (context, snapshot, animation, index) {
            Map<String, dynamic>? todo = snapshot.value as Map<String, dynamic>?;

            if (todo == null) {
              return SizedBox(); // Handle null case gracefully
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  k = snapshot.key;
                });

                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextField(
                        controller: second,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    content: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextField(
                        controller: third,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Batch',
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: Colors.indigo[100],
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      onPressed: () {
                        ref.child(snapshot.key!).remove();
                      },
                    ),
                    title: Text(
                      todo['Name'] ?? '',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      todo['Batch'] ?? '',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController nameController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var k = rng.nextInt(10000);

    final ref = fb.ref().child('todos/$k');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Records"),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: batchController,
                decoration: InputDecoration(labelText: 'Batch'),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone number'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: fatherNameController,
                decoration: InputDecoration(labelText: "Father's name"),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  ref.set({
                    "name": nameController.text,
                    "batch": batchController.text,
                    "dob": dobController.text,
                    "phone": phoneController.text,
                    "email": emailController.text,
                    "fatherName": fatherNameController.text,
                    "address": addressController.text,
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Home()),
                  );
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... (rest of the code)
