///Pengaturan dan metode untuk terhubung ke web
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'school.dart';

class HttpHelper {
  //url untuk konek k service
  final String urlUpcoming =
      'https://api-sekolah-indonesia.vercel.app/sekolah/sma?kab_kota=136000&page=1&perPage=45';

  //url search
  final String urlSearchBase =
      'https://api-sekolah-indonesia.vercel.app/sekolah/s?sekolah=';

  //mengambil data dari web[]
  Future<List> getUpcoming() async {
    final String upcoming = urlUpcoming;
    Response result = await get(Uri.parse(
        upcoming)); //menunggu ini selesai baru dilanjut codingan selanjutnya

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body); //parsing konten JSONs
      final schoolsMap = jsonResponse['dataSekolah'];
      List schools = schoolsMap.map((i) => DataSekolah.fromJson(i)).toList();
      return schools;
    } else {
      return [];
    }
  }

  // Mengambil string yang berisi judul ketika melakukan search
  Future<List> findSchools(String title) async {
    final String query = urlSearchBase + title;
    Response result = await get(Uri.parse(query));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final schoolsMap = jsonResponse['dataSekolah'];
      List schools = schoolsMap.map((i) => DataSekolah.fromJson(i)).toList();
      return schools;
    } else {
      return [];
    }
  }
}
