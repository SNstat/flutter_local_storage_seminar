import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import '../data/app_db.dart';
import '../data/entities/book.dart';

class DetailsScreen extends StatefulWidget {
  final AppDb db;
  final AuthorData? existingAuthor;
  final BookData? existingBook;
  final int? fixedAuthorId;

  const DetailsScreen({
    super.key,
    required this.db,
    this.existingAuthor,
    this.existingBook,
    this.fixedAuthorId
  });

  @override
  State<DetailsScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<DetailsScreen> {
  late TextEditingController _firstNameControler;
  late TextEditingController _lastNameControler;
  
  late TextEditingController _titleControler;
  late TextEditingController _descriptionControler;
  late TextEditingController _pageCountControler;
  DateTime _selectedDate = DateTime.now();
  Language _selectedLanguage = Language.english;

  bool get isAuthorForm => widget.existingAuthor != null || widget.existingBook == null && widget.fixedAuthorId == null;
  bool get isEditing => widget.existingAuthor != null || widget.existingBook != null;

  @override
  void initState() {
    super.initState();
    _firstNameControler = TextEditingController(text: widget.existingAuthor?.firstName ?? '');
    _lastNameControler = TextEditingController(text: widget.existingAuthor?.lastName ?? '');
    
    _titleControler = TextEditingController(text: widget.existingBook?.title ?? '');
    _descriptionControler = TextEditingController(text: widget.existingBook?.description ?? '');
    _pageCountControler = TextEditingController(text: widget.existingBook?.pageCount.toString() ?? '100');
    
    if (widget.existingBook != null) {
      _selectedDate = widget.existingBook!.publishingDate;
      _selectedLanguage = widget.existingBook!.language;
    }
  }

  @override
  void dispose() {
    _firstNameControler.dispose();
    _lastNameControler.dispose();
    _titleControler.dispose();
    _descriptionControler.dispose();
    _pageCountControler.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (isAuthorForm) {
      if (_firstNameControler.text.isEmpty) return;
      if (isEditing) {
        await widget.db.authorDao.updateAuthor(AuthorCompanion(
          id: Value(widget.existingAuthor!.id),
          firstName: Value(_firstNameControler.text),
          lastName: Value(_lastNameControler.text),
        ));
      } else {
        await widget.db.authorDao.insertAuthor(AuthorCompanion.insert(
          firstName: _firstNameControler.text,
          lastName: _lastNameControler.text,
        ));
      }
    } else {
      if (_titleControler.text.isEmpty) return;
      final pageCount = int.tryParse(_pageCountControler.text) ?? 1;
      
      if (isEditing) {
        await widget.db.bookDao.updateBook(BookCompanion(
          id: Value(widget.existingBook!.id),
          title: Value(_titleControler.text),
          description: Value(_descriptionControler.text),
          pageCount: Value(pageCount),
          publishingDate: Value(_selectedDate),
          language: Value(_selectedLanguage),
        ));
      } else {
        await widget.db.bookDao.insertBook(BookCompanion.insert(
          title: _titleControler.text,
          description: _descriptionControler.text,
          pageCount: pageCount,
          publishingDate: _selectedDate,
          language: _selectedLanguage,
          authorId: widget.fixedAuthorId!,
        ));
      }
    }
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAuthorForm 
            ? (isEditing ? 'Edit Author' : 'Add Author') 
            : (isEditing ? 'Edit Book' : 'Add Book')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: isAuthorForm ? _buildAuthorFields() : _buildBookFields(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _save,
        label: const Text('Save'),
      ),
    );
  }

  List<Widget> _buildAuthorFields() {
    return [
      TextField(controller: _firstNameControler, decoration: const InputDecoration(labelText: 'First Name')),
      const SizedBox(height: 12),
      TextField(controller: _lastNameControler, decoration: const InputDecoration(labelText: 'Last Name')),
    ];
  }

  List<Widget> _buildBookFields() {

    final dateFormat = DateFormat('dd.MM.yyyy.');

    return [
      TextField(controller: _titleControler, decoration: const InputDecoration(labelText: 'Title')),
      const SizedBox(height: 12),
      TextField(controller: _descriptionControler, decoration: const InputDecoration(labelText: 'Description')),
      const SizedBox(height: 12),
      TextField(controller: _pageCountControler, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Page Count')),
      const SizedBox(height: 12),
      DropdownButtonFormField<Language>(
        initialValue: _selectedLanguage,
        decoration: const InputDecoration(labelText: 'Language'),
        items: Language.values.map((l) => DropdownMenuItem(value: l, child: Text(l.name.toUpperCase()))).toList(),
        onChanged: (val) => setState(() => _selectedLanguage = val!),
      ),
      const SizedBox(height: 12),
      ListTile(
        title: Text('Published: ${dateFormat.format(_selectedDate)}'),
        trailing: const Icon(Icons.calendar_month),
        onTap: () async {
          final picked = await showDatePicker(
            context: context, initialDate: _selectedDate, firstDate: DateTime(1900), lastDate: DateTime(2100),
          );
          if (picked != null) setState(() => _selectedDate = picked);
        },
      ),
    ];
  }
}