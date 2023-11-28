

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text("Aplikasi News MaaN adalah aplikasi portal berita yang dimana berita yang disajikan adalah berita seputar hobby seperti: game, musik, toy's, gadget, technology.\n\nFitur yang disajikan juga beragam, antara lain beranda, detail berita, pencairan berita, login/register, dan update profile serta user dapat mengomentari berita.\n\nAlur dari aplikasi ini secara garis besar user bisa melihat berita tanpa harus login, namun user diharuskan login jika ingin update profile dan berkomentar.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                        child: ListTile(
                          leading: Icon(Icons.copyright),
                          title: Text("Copyright by: Firman Muhamad Ikhsan - 18111197", style: TextStyle(color: Colors.grey),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}