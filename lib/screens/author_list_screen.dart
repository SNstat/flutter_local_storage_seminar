import 'package:flutter/material.dart';
import 'package:flutter_local_storage_seminar/screens/details_screen.dart';
import 'package:flutter_local_storage_seminar/static/constants.dart';
import 'package:flutter_local_storage_seminar/static/theme.dart';
import '../data/app_db.dart';

class AuthorListScreen extends StatelessWidget {
  final AppDb db;
  
  const AuthorListScreen({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<AuthorData>>(
        stream: db.authorDao.watchAuthors(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text(ConstantStrings.emptySelect));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => _AuthorExtensionTile(db: db, author: snapshot.data![index]),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailsScreen(db: db)),
        ),
        child: const Icon(ConstantIcons.floatingAdd),
      ),
    );
  }
}

class _AuthorExtensionTile extends StatelessWidget {
  final AppDb db;
  final AuthorData author;

  const _AuthorExtensionTile({required this.db, required this.author});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Autor ID: ${author.id}, ${author.firstName} ${author.lastName}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(ConstantIcons.edit),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => DetailsScreen(db: db, author: author),
            )),
          ),
          IconButton(
            icon: const Icon(ConstantIcons.delete, color: ThemeColors.accent),
            onPressed: () => db.authorDao.deleteAuthor(author.id),
          ),
        ],
      ),
      children: [
        StreamBuilder<List<BookData>>(
          stream: db.bookDao.watchBooksByAuthorId(author.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text(ConstantStrings.emptySelect));
            }
            
            return Column(
              children: [
                ...snapshot.data!.map((book) => ListTile(
                  dense: true,
                  title: Text(book.title),
                  subtitle: Text('ID: ${book.id} | ${book.language.name}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(
                          builder: (_) => DetailsScreen(db: db, book: book),
                        )),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                        onPressed: () => db.bookDao.deleteBook(book.id),
                      ),
                    ],
                  ),
                )),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => DetailsScreen(db: db, authorId: author.id),
                  )),
                  child: const Text(ConstantStrings.addBookList),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}