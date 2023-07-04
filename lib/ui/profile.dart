import 'package:flutter/material.dart';
import 'beranda.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Container(
            height: 90,
            padding: EdgeInsets.only(left: 13, right: 13, top: 22),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.indigo.shade900,
                  Colors.indigo.shade700,
                  Colors.indigo.shade600,
                ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Beranda()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(77, 5, 158, 0.298),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("admin"),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("kelompok5@gmail.com"),
                      ],
                    ),
                  ],
                ),
                tombol_logout(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget tombol_logout() {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false);
      },
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              border: Border.all(
                color: Colors.red.shade700,
                width: 1.2,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                const BoxShadow(
                  color: Color.fromRGBO(46, 46, 46, 0.294),
                  blurRadius: 5,
                  offset: Offset(3, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Logout',
            style: TextStyle(
              fontSize: 13,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }
}
