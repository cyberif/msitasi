import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/siswa.dart';
import '../services/siswa.dart';
import 'siswa_update_form.dart';
import 'siswa_page.dart';

class SiswaDetail extends StatefulWidget {
  final Siswa siswa;

  const SiswaDetail({super.key, required this.siswa});

  @override
  State<SiswaDetail> createState() => _SiswaDetailState();
}

class _SiswaDetailState extends State<SiswaDetail> {
  Stream<Siswa> getData() async* {
    Siswa data = await SiswaService().getById(widget.siswa.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Siswa"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Container(
            height: 240,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20, top: 10, right: 20),
            padding: EdgeInsets.only(left: 20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "NIS",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${widget.siswa.nis}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nama",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${widget.siswa.namaSiswa}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Kelas",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${widget.siswa.kelas}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _tombolHapus(),
                    _tombolUbah(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot<Siswa> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        Siswa data = snapshot.data!;
        return ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SiswaUpdateForm(siswa: data),
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text("Ubah"),
        );
      },
    );
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
// tombol ya
              StreamBuilder(
                stream: getData(),
                builder: (context, AsyncSnapshot<Siswa> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  Siswa data = snapshot.data!;
                  return ElevatedButton(
                    onPressed: () async {
                      await SiswaService().hapus(data).then((value) {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SiswaPage(),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Hapus"),
                  );
                },
              ),
// tombol batal
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Batal"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }
}
