import 'package:flutter/material.dart';
import 'package:flutter_local_storage_seminar/screens/details_screen.dart';
import '../data/app_db.dart';

class AuthorListScreen extends StatelessWidget {
  final AppDb db;
  const AuthorListScreen({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library'), backgroundColor: Colors.blueAccent),
      body: StreamBuilder<List<AuthorData>>(
        stream: db.authorDao.watchAuthors(),
        builder: (context, snapshot) {
          final authors = snapshot.data!;
          if (authors.isEmpty) {
            return const Center(child: Text('Empty library. Add more authors and books!'));
          }

          return ListView.builder(
            itemCount: authors.length,
            itemBuilder: (context, index) => _AuthorTile(db: db, author: authors[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(builder: (_) => DetailsScreen(db: db))
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AuthorTile extends StatelessWidget {
  final AppDb db;
  final AuthorData author;
  const _AuthorTile({required this.db, required this.author});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Author: ${author.firstName} ${author.lastName}'),
      subtitle: Text('Id: ${author.id}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => DetailsScreen(db: db, existingAuthor: author)
            )),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => db.authorDao.deleteAuthor(author.id),
          ),
        ],
      ),
      children: [
        StreamBuilder<List<BookData>>(
          stream: db.bookDao.watchBooksByAuthorId(author.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();
            final books = snapshot.data!;
            return Column(
              children: [
                ...books.map((book) => ListTile(
                  dense: true,
                  leading: const Icon(Icons.notes, size: 20),
                  title: Text(book.title),
                  subtitle: Text('ID: ${book.id} | ${book.language.name}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(
                          builder: (_) => DetailsScreen(db: db, existingBook: book)
                        )),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                        onPressed: () => db.bookDao.deleteBook(book.id),
                      ),
                    ],
                  ),
                )),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add book'),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => DetailsScreen(db: db, fixedAuthorId: author.id)
                  )),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}