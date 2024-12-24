import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:riverpod_intro/page2.dart";

part "main.g.dart";

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // MaterialAppを追加
        home: MyApp(),
      ),
    ),
  );
}

@riverpod
String helloWorld(Ref ref) {
  return "Hello World by Riverpod!!!!";
}

final countProvider = StateProvider((ref) => 0);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int count = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(title: Text("page2")),
      body: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value),
          Text("Count: $count"),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                onPressed: () {
                  ref.read(countProvider.notifier).state++;
                },
                child: const Text("Click me")),
          ),
          const A(),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyPage2(),
                  ),
                );
              },
              child: const Text("page2に行くボタン"))
        ],
      )),
    );
  }
}

class A extends ConsumerWidget {
  const A({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(countProvider);
    return Center(
        child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Riverpodのおかげでここでも値参照できる!"),
        Text("Count: $count"),
      ],
    ));
  }
}
