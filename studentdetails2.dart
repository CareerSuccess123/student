import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/dashboard.dart';

import 'package:image_picker/image_picker.dart';

class StudentDetailsForm extends StatefulWidget {
  const StudentDetailsForm({Key? key}) : super(key: key);

  @override
  _StudentDetailsFormState createState() => _StudentDetailsFormState();
}

class _StudentDetailsFormState extends State<StudentDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  Uint8List? _imageBytes;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  Uint8List? get imageBytes => null;

  Future _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageBytes = imageBytes;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1f566d),
        appBar: AppBar(
          title: const Text('MY PROFILE'),
          backgroundColor: Colors.black,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change the color to red
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Register number',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change the color to red
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your register number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'CGPA',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change the color to red
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your CGPA';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'branch',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change the color to red
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your branch';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'gender',
                      labelStyle: TextStyle(
                        color: Colors.white, // Change the color to red
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your gender';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Select Image'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set the background color to blue
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_imageBytes != null)
                    Image.memory(
                      _imageBytes!,
                      fit: BoxFit.cover,
                      height: 20,
                      width: 20,
                    )
                  else
                    const Placeholder(fallbackHeight: 20, fallbackWidth: 5),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Set the background color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },

                    // ignore: prefer_const_constructors

                    child: Text('Submit'),
                  ),
                ]))));
  }
}
