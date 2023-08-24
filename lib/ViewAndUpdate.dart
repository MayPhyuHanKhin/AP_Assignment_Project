import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ViewandUpdate(),
    routes: {
    },
  ));
}

class ViewandUpdate extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _birthcontroller = TextEditingController();
  final TextEditingController _parentscontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _batchcontroller = TextEditingController();
  final TextEditingController _levelcontroller = TextEditingController();
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewAndUpdate'),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 250,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _phonecontroller,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the Email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _birthcontroller,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Date of Birth';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _parentscontroller,
                        decoration: InputDecoration(
                          labelText: 'Parents Name',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Father Name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _addresscontroller,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        controller: _levelcontroller,
                        decoration: InputDecoration(
                          labelText: 'Level',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the Level';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row( // Row for buttons
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _saveInfo();
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent,
                          ),
                          child: Text('OKAY'),
                        ),
                      ),
                      SizedBox(width: 16.0), // Add spacing between buttons
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _saveInfo();
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent,
                          ),
                          child: Text('Update'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
              ],
          ),
        ),
      ),
    ),
    ),
    );
  }

  void _saveInfo() {
    final email = _emailcontroller.text;
    final name = _nameController.text;
    final batch = _batchcontroller.text;
    final address = _addresscontroller.text;
    final parentsname = _parentscontroller.text;
    final birth = _birthcontroller.text;
    final phone = _phonecontroller.text;
    _emailcontroller.clear();
    _nameController.clear();
    _batchcontroller.clear();
    _addresscontroller.clear();
    _parentscontroller.clear();
    _birthcontroller.clear();
    _phonecontroller.clear();


  }
}




