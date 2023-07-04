import 'package:flutter/material.dart';
import '../models/siswa.dart';
import '../services/siswa.dart';
import 'siswa_detail.dart';

class SiswaUpdateForm extends StatefulWidget {
  final Siswa siswa;

  const SiswaUpdateForm({Key? key, required this.siswa}) : super(key: key);
  _SiswaUpdateFormState createState() => _SiswaUpdateFormState();
}

class _SiswaUpdateFormState extends State<SiswaUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nisCtrl = TextEditingController();
  final _namaSiswaCtrl = TextEditingController();
  final _kelasCtrl = TextEditingController();

  Future<Siswa> getData() async {
    Siswa data = await SiswaService().getById(widget.siswa.id.toString());
    setState(() {
      _namaSiswaCtrl.text = data.namaSiswa!;
      _nisCtrl.text = data.nis!;
      _kelasCtrl.text = data.kelas!;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Siswa"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        height: 330,
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 20, top: 10, right: 20),
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNis(),
                SizedBox(height: 20),
                _fieldNamaSiswa(),
                SizedBox(height: 20),
                _fieldKelas(),
                SizedBox(height: 30),
                _tombolSimpan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaSiswa() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Nama Siswa",
        labelStyle: TextStyle(color: Colors.indigo),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
      ),
      controller: _namaSiswaCtrl,
    );
  }

  Widget _fieldNis() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "NIS",
        labelStyle: TextStyle(color: Colors.indigo),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
      ),
      controller: _nisCtrl,
    );
  }

  Widget _fieldKelas() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Kelas",
        labelStyle: TextStyle(color: Colors.indigo),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.indigo)),
      ),
      controller: _kelasCtrl,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Siswa siswa = new Siswa(
          namaSiswa: _namaSiswaCtrl.text,
          nis: _nisCtrl.text,
          kelas: _kelasCtrl.text,
        );
        String id = widget.siswa.id.toString();
        await SiswaService().ubah(siswa, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SiswaDetail(siswa: value),
            ),
          );
        });
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
      child: const Text("Simpan Perubahan"),
    );
  }
}
