import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  final String username, pass;

  const UploadPage({Key? key, required this.username, required this.pass}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadState();
}

class _UploadState extends State<UploadPage> {
  String _imagePath = "";
  final ImagePicker _picker = ImagePicker();
  Future<String> getImage(bool isCamera) async {
    final XFile? image;
    image = await _picker.pickImage(source: ImageSource.gallery);
    return image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Gambar'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Column(
              children: [
                Text("Username : ${widget.username}\n"
                    "Password : ${widget.pass}"),
                Container(
                  height: 100.0,
                ),
                Container(
                  height: 100.0,
                ),
                IconButton(
                  onPressed: () async {
                    _imagePath = await getImage(false);
                    setState(() {
                    });
                  },
                  icon: Icon(Icons.insert_drive_file)),
                SizedBox(height: 10,),
                _imagePath.isEmpty ? Container() :
                Image.file(File(_imagePath),height: 300, width:
                300,),
                Container(
                  height: 100.0,
                ),
                _backButton(),
              ],
          ),
        ),
      ),
    );
  }
  Widget _backButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Back Page')),
    );
  }
}


