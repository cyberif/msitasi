import 'package:flutter/material.dart';
import '../services/siswa.dart';
import '../models/siswa.dart';
import 'beranda.dart';
import 'siswa_item.dart';
import 'siswa_form.dart';

class SiswaPage extends StatefulWidget {
  const SiswaPage({Key? key}) : super(key: key);
  _SiswaPageState createState() => _SiswaPageState();
}

class _SiswaPageState extends State<SiswaPage> {
  Stream<List<Siswa>> getList() async* {
    List<Siswa> data = await SiswaService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Data Siswa"),
        backgroundColor: Colors.indigo,
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SiswaForm()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Siswa>>(
        stream: getList(),
        builder: (context, AsyncSnapshot<List<Siswa>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return SiswaItem(siswa: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }

  Widget tombol_logout() {
    return GestureDetector(
      // onTap: ,
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
