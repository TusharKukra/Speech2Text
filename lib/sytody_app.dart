import 'package:flutter/material.dart';
import 'package:Speech2Text/languages.dart';
import 'package:Speech2Text/transcriptor.dart';

class SytodyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SytodyAppState();
}

class SytodyAppState extends State<SytodyApp> {
  Language selectedLang = languages.first;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Row(children: [
            new Image.asset('assets/sytody.png', fit: BoxFit.fitHeight),
            new Text('Speech to Text'),
          ]),
          backgroundColor: Colors.blueGrey,
          actions: [
            new PopupMenuButton<Language>(
              onSelected: _selectLangHandler,
              itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
            )
          ]),
        body: new TranscriptorWidget(lang: selectedLang),
      ));
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
    .map((l) => new CheckedPopupMenuItem<Language>(
    value: l,
    checked: selectedLang == l,
    child: new Text(l.name),
  ))
    .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }
}