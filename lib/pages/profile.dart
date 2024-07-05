import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  String _name = 'Your Name';
  int _age = 18;
  String _language = 'Language';
  String _gender = 'Male';
    Uint8List? _image;
  Future<void> _pickImage() async {
    final XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      final Uint8List? bytes = await pickedImage.readAsBytes();
      setState(() {
        _image = bytes;
      });
    }
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _genderController,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                  ),
                ),
                TextField(
                  controller: _languageController,
                  decoration: const InputDecoration(
                    labelText: 'Language',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _name = _nameController.text;
                      _age = int.tryParse(_ageController.text) ?? _age;
                      _gender = _genderController.text;
                      _language = _languageController.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: _image != null
                ? MemoryImage(_image!)
                : const AssetImage('assets/default_profile.png')
                    as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: _image == null
            ? const Icon(
                Icons.camera_alt,
                size: 50,
              )
            : null,
      ),
    );
  }

  Widget _buildInfoText({required String title, required String info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          info,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Center(child: _buildProfileImage()),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: _editProfile,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Edit Profile Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildInfoText(title: 'Name', info: _name),
            const SizedBox(height: 15),
            _buildInfoText(title: 'Age', info: _age.toString()),
            const SizedBox(height: 15),
            _buildInfoText(title: 'Gender', info: _gender),
            const SizedBox(height: 15),
            _buildInfoText(title: 'Coding Language', info: _language),
            const SizedBox(height: 25),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 3),
                    color: const Color.fromARGB(31, 208, 205, 205),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
