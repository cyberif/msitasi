import 'package:flutter/material.dart';
import '../models/siswa.dart';
import '../services/siswa.dart';
import 'siswa_detail.dart';

class SiswaForm extends StatefulWidget {
  const SiswaForm({Key? key}) : super(key: key);

  @override
  _SiswaFormState createState() => _SiswaFormState();
}

class _SiswaFormState extends State<SiswaForm> {
  final _formKey = GlobalKey<FormState>();
  final _nisCtrl = TextEditingController();
  final _namaSiswaCtrl = TextEditingController();
  final _kelasCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Siswa"),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 310,
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaSiswa(),
                SizedBox(height: 20),
                _fieldNis(),
                SizedBox(height: 20),
                _fieldKelas(),
                SizedBox(height: 20),
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Siswa tidak boleh kosong';
        }
        return null;
      },
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIS tidak boleh kosong';
        }
        return null;
      },
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Kelas tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Siswa siswa = Siswa(
            namaSiswa: _namaSiswaCtrl.text,
            nis: _nisCtrl.text,
            kelas: _kelasCtrl.text,
          );
          await SiswaService().simpan(siswa).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SiswaDetail(siswa: value)),
            );
          });
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
      child: const Text("Simpan"),
    );
  }
}
