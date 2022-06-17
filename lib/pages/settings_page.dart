import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsPage extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChange;

  const SettingsPage(this.onSettingsChange, this.settings);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    dynamic onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings!);
      },
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings!'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Settings', style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Gluten free',
                  'Only display gluten-free meals!',
                  settings!.isGlutenFree!,
                  (value) => setState(() => settings!.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose Free',
                  'Only displays lactose-free meals!',
                  settings!.isLactoseFree!,
                  (value) => setState(() => settings!.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan',
                  'Only displays vegan meals!',
                  settings!.isVegan!,
                  (value) => setState(() => settings!.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Only displays vegetarian meals!',
                  settings!.isVegetarian!,
                  (value) => setState(() => settings!.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
