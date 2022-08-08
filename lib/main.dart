import 'package:app_notes_notifier/notes/notes_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Notes Notifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple.shade50,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.shade200,
          centerTitle: true,
        ),
      ),
      home: const NotesPage(),
    );
  }
}
