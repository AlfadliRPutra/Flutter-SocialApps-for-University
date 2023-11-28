

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProfilePage();
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 35, 15, 25),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xccbbccbb),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("https://adminlte.io/themes/AdminLTE/dist/img/user2-160x160.jpg")
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: TextFormField(
                    initialValue: "stainkiller4",
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_identity), labelText: "Username"),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: TextFormField(
                    initialValue: "Firman Muhamad Ikhsan",
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_identity), labelText: "Nama Lengkap"),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: TextFormField(
                    initialValue: "stainkiller4@gmail.com",
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email), labelText: "E-mail"),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock), labelText: "Password"),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: FlatButton.icon(
                    onPressed: () {

                    },
                    icon: Icon(Icons.save),
                    label: Text("Simpan"),
                    textColor: Colors.white,
                    color: Theme.of(context).cursorColor,
                    minWidth: 350,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}