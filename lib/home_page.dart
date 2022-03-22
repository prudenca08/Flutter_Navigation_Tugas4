import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'upload_page.dart';

class HomePage extends StatefulWidget {
  final String username, pass;

  const HomePage({Key? key, required this.username, required this.pass})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Hallo ${widget.username}\nSelamat Datang",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                Image.asset('images/daffa.jpg'),
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UploadPage(username: widget.username, pass: widget.pass);
            }));
          },
          child: Text('Next Page')),
    );
  }
}
