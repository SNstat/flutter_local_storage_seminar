import 'package:flutter/material.dart';
import 'package:flutter_local_storage_seminar/data/app_db.dart';
import 'package:flutter_local_storage_seminar/data/data_seeder.dart';
import 'package:flutter_local_storage_seminar/screens/author_list_screen.dart';
import 'package:flutter_local_storage_seminar/screens/cross_join_screen.dart';
import 'package:flutter_local_storage_seminar/screens/hive_screen.dart';
import 'package:flutter_local_storage_seminar/static/screens.dart';
import 'package:flutter_local_storage_seminar/static/constants.dart';
import 'package:flutter_local_storage_seminar/static/theme.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox('TestBox');

  final db = AppDb();
  await seedMockData(db);

  runApp(MaterialApp(
    theme: ThemeData(colorSchemeSeed: ThemeColors.primary, useMaterial3: true),
    home: MainWidget(db: db),
  ));
}

class MainWidget extends StatefulWidget {
  
  final AppDb db;

  const MainWidget({super.key, required this.db});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _pageIndex = 0;
  late final List<AppScreen> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      AppScreen(
        appBarTitle: ConstantStrings.crudAppBarTitle,
        drawerTitle: ConstantStrings.crudDrawerTitle,
        icon: ConstantIcons.crud,
        screen: AuthorListScreen(db: widget.db),
      ),
      AppScreen(
        appBarTitle: ConstantStrings.crossJoinAppBarTitle,
        drawerTitle: ConstantStrings.crossJoinDrawerTitle,
        icon: ConstantIcons.crossJoin,
        screen: CrossJoinScreen(db: widget.db),
      ),
      AppScreen(
        appBarTitle: ConstantStrings.hiveAppBarTitle,
        drawerTitle: ConstantStrings.hiveDrawerTitle,
        icon: ConstantIcons.hive,
        screen: HiveScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_pageIndex].appBarTitle),
        backgroundColor: ThemeColors.primary,
        foregroundColor: ThemeColors.secondary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: ThemeColors.primary),
              child: Text(ConstantStrings.mainDrawerTitle, style: TextStyle(color: ThemeColors.secondary, fontSize: 24)),
            ),
            ..._screens.asMap().entries.map((e) => ListTile(
              leading: Icon(e.value.icon),
              title: Text(e.value.drawerTitle),
              selected: _pageIndex == e.key,
              onTap: () {
                setState(() => _pageIndex = e.key);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
      body: _screens[_pageIndex].screen,
    );
  }
}