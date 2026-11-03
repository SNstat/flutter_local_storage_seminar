import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:flutter_local_storage_seminar/static/constants.dart';
import 'package:intl/intl.dart';
import '../data/app_db.dart';
import '../data/entities/book.dart';

class DetailsScreen extends StatefulWidget {
  final AppDb db;
  final AuthorData? author;
  final BookData? book;
  final int? authorId;

  const DetailsScreen({
    super.key,
    required this.db,
    this.author,
    this.book,
    this.authorId,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final TextEditingController
    _firstNameController,
    _lastNameController,
    _titleController,
    _descriptionController,
    _pagesCountController;

  DateTime _datetimePicker = DateTime.now();
  Language _languagePicker = Language.hrvatski;

  bool get addingAuthorMode =>
    widget.book == null && widget.authorId == null;

  bool get editingMode =>
    widget.author != null || widget.book != null;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.author?.firstName ?? '');
    _lastNameController  = TextEditingController(text: widget.author?.lastName ?? '');
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _descriptionController  = TextEditingController(text: widget.book?.description ?? '');
    _pagesCountController = TextEditingController(text: widget.book?.pageCount.toString() ?? '0');

    if (widget.book != null) {
      _datetimePicker = widget.book!.publishingDate;
      _languagePicker = widget.book!.language;
    }
  }

  Future<void> _save() async {
    if (addingAuthorMode) {
      AuthorCompanion companion;

      if (widget.author == null) {
        companion = AuthorCompanion(
          firstName: Value(_firstNameController.text),
          lastName: Value(_lastNameController.text));
        await widget.db.authorDao.insertAuthor(companion);
      } else {
        companion = AuthorCompanion(
          id: Value(widget.author!.id),
          firstName: Value(_firstNameController.text),
          lastName: Value(_lastNameController.text));
        await widget.db.authorDao.updateAuthor(companion);
      }
    } else {
      BookCompanion companion;

      if (widget.book == null) {
        companion = BookCompanion(
              title: Value(_titleController.text),
              description: Value(_descriptionController.text),
              pageCount: Value(int.parse(_pagesCountController.text)),
              publishingDate: Value(_datetimePicker),
              language: Value(_languagePicker),
              authorId: Value(widget.authorId!),
            );
        await widget.db.bookDao.insertBook(companion);
      } else {
        companion = BookCompanion(
              id: Value(widget.book!.id),
              title: Value(_titleController.text),
              description: Value(_descriptionController.text),
              pageCount: Value(int.parse(_pagesCountController.text)),
              publishingDate: Value(_datetimePicker),
              language: Value(_languagePicker),
              authorId: Value(widget.book!.authorId),
            );
        await widget.db.bookDao.updateBook(companion);
      }
  }
  if (mounted) Navigator.pop(context);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _pagesCountController.dispose();
    super.dispose();
  }

  String get _appBarTitle {
  if (addingAuthorMode) {
    return editingMode ? ConstantStrings.editAuthor : ConstantStrings.addAuthor;
  } else {
    return editingMode ? ConstantStrings.editBook : ConstantStrings.addBook;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: addingAuthorMode ? _authorInputControllers() : _bookInputControllers(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _save, child: const Icon(ConstantIcons.floatingSave)),
    );
  }

  List<Widget> _authorInputControllers() => [
    TextField(
      controller: _firstNameController,
      decoration: const InputDecoration(labelText: ConstantStrings.decoFirst)),
    TextField(
      controller: _lastNameController,
      decoration: const InputDecoration(labelText: ConstantStrings.decoLast)),
  ];

  List<Widget> _bookInputControllers() => [
    TextField(
      controller: _titleController,
      decoration: const InputDecoration(labelText: ConstantStrings.decoTitle)),
    TextField(
      controller: _descriptionController,
      decoration: const InputDecoration(labelText: ConstantStrings.decoDesc)),
    TextField(
      controller: _pagesCountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: ConstantStrings.decoPCount)),
    DropdownButtonFormField<Language>(
      initialValue: _languagePicker,
      decoration: const InputDecoration(labelText: ConstantStrings.decoLang),
      items: Language.values.map((lang) => DropdownMenuItem(value: lang, child: Text(lang.name))).toList(),
      onChanged: (newValue) => setState(() => _languagePicker = newValue!),
    ),
    ListTile(
      title: Text('Izdano na datum: ${DateFormat('dd.MM.yyyy.').format(_datetimePicker)}'),
      trailing: const Icon(Icons.calendar_month),
      onTap: () async {
        final p = await showDatePicker(context: context, initialDate: _datetimePicker, firstDate: DateTime(-1000), lastDate: DateTime(2050));
        if (p != null) setState(() => _datetimePicker = p);
      },
    ),
  ];
}