import 'package:flutter/material.dart';
import 'siswa_page.dart';
import 'profile.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "SITASI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 20,
            padding: EdgeInsets.only(left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome admin :)",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 119,
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
                tombol_siswa(),
                tombol_transaksi(),
                tombol_tabungan(),
                tombol_profile(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget tombol_siswa() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SiswaPage()),
        );
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
                color: Colors.indigo,
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
              Icons.people_alt_rounded,
              color: Colors.indigo,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Siswa',
            style: TextStyle(
              fontSize: 13,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }

  Widget tombol_tabungan() {
    return GestureDetector(
      // onTap: (),
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
                color: Colors.indigo,
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
              Icons.account_balance_rounded,
              color: Colors.indigo,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Tabungan',
            style: TextStyle(
              fontSize: 13,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }

  Widget tombol_transaksi() {
    return GestureDetector(
      // onTap: (),
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
                color: Colors.indigo,
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
              Icons.payments_rounded,
              color: Colors.indigo,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Transaksi',
            style: TextStyle(
              fontSize: 13,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }

  Widget tombol_profile() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
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
                color: Colors.indigo,
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
              Icons.account_circle_rounded,
              color: Colors.indigo,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Profile',
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
