import 'package:flutter/material.dart';
import 'package:flutter_local_storage_seminar/static/constants.dart';
import '../data/app_db.dart';

class CrossJoinScreen extends StatefulWidget {
  final AppDb db;
  const CrossJoinScreen({super.key, required this.db});

  @override
  State<CrossJoinScreen> createState() => _CrossJoinScreenState();
}

class _CrossJoinScreenState extends State<CrossJoinScreen> {
  List<Map<String, dynamic>> _rows = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await widget.db.bookDao.getCrossJoinWithAuthor();

    setState(() {
      _rows = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_rows.isEmpty) {
      return const Center(child: Text(ConstantStrings.emptySelect));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID Knjige')),
            DataColumn(label: Text('Naslov knjige')),
            DataColumn(label: Text('ID autora')),
            DataColumn(label: Text('Autor')),
          ],
          rows: _rows.map((row) {
            return DataRow(cells: [
              DataCell(Text(row['bookId']?.toString() ?? '-')),
              DataCell(Text(row['bookTitle'] ?? '-')),
              DataCell(Text(row['authorId']?.toString() ?? '-')),
              DataCell(Text('${row['authorFirstName'] ?? '-'} ${row['authorLastName'] ?? '-'}')),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}