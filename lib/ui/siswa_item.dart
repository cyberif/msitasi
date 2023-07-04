import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/siswa.dart';
import 'siswa_detail.dart';

class SiswaItem extends StatelessWidget {
  final Siswa siswa;
  const SiswaItem({super.key, required this.siswa});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(
            "${siswa.namaSiswa}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            "NIS: ${siswa.nis} | Kelas: ${siswa.kelas}",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SiswaDetail(siswa: siswa)));
      },
    );
  }
}
