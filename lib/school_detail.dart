import 'package:flutter/material.dart';
import 'school.dart';

class SchoolDetail extends StatelessWidget {
  final DataSekolah school;

  const SchoolDetail({super.key, required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(school.sekolah ?? ''),
      ),
      //scroll list school

      body: SingleChildScrollView(
        child: DataTable(
          headingRowHeight: 0,
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Key',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Value',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Nama')),
                DataCell(Text(school.sekolah!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('NPSN')),
                DataCell(Text(school.npsn!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Status')),
                DataCell(Text(school.status!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Alamat')),
                DataCell(Text(school.alamatJalan!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Kabupaten/Kota')),
                DataCell(Text(school.kabupatenKota!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Kecamatan')),
                DataCell(Text(school.kecamatan!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Jenjang Pendidikan')),
                DataCell(Text(school.bentuk!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Garis Lintang')),
                DataCell(Text(school.lintang!)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Garis Bujur')),
                DataCell(Text(school.bujur!)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
