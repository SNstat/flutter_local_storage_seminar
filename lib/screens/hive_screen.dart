import 'package:flutter/material.dart';
import 'package:flutter_local_storage_seminar/static/constants.dart';
import 'package:flutter_local_storage_seminar/static/theme.dart';
import 'package:hive_ce_flutter/adapters.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  late final Box _hiveBox;
  final _keyController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hiveBox = Hive.box("TestBox");
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _add() {
    if (_keyController.text.isEmpty || _valueController.text.isEmpty) return;
  
    _hiveBox.put(_keyController.text, _valueController.text);

    _keyController.clear();
    _valueController.clear();
    
    setState(() {});
  }

  void _delete(dynamic key) {
    _hiveBox.delete(key);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _keyController,
            decoration: const InputDecoration(labelText: ConstantStrings.hiveKey),
          ),
          TextField(
            controller: _valueController,
            decoration: const InputDecoration(labelText: ConstantStrings.hiveValue),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _add,
            child: const Text(ConstantStrings.hiveAddEntry),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: _hiveBox.keys.map((key) {
                return ListTile(
                  title: Text(key.toString()),
                  subtitle: Text(_hiveBox.get(key).toString()),
                  trailing: IconButton(
                    icon: const Icon(ConstantIcons.delete, color: ThemeColors.accent),
                    onPressed: () => _delete(key),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}