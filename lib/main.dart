import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/app/app.dart';
import 'package:flutter_instagram_clone_with_provider/src/ui/app/app_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: false,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            colorScheme: const ColorScheme.light(
              primary: Colors.white,
              secondary: Colors.black,
            )),
        home: const App(),
      ),
    );
  }
}
