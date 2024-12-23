import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "main.g.dart";

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

@riverpod
String helloWorld(Ref ref) {
  return "Hello World by Riverpod!!!!";
}

// final helloWorldProvider = Provider<String>((ref) {
//   return "Hello World";
// });s

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("appBar")),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
