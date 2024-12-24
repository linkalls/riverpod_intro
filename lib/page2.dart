import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_intro/main.dart'; // main.dartをインポート
//* これするだけで勝手にriverpod読み込んでくれる

class MyPage2 extends ConsumerWidget {
  const MyPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider); // helloWorldProviderを使用
    final int count = ref.watch(countProvider);

    return Scaffold(
      appBar: AppBar(title: Text("MyPage")),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            Text("Count: $count"),
            ElevatedButton(
              onPressed: () {
                ref.read(countProvider.notifier).state++;
              },
              child: const Text("Click me"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                  child: const Text("main.dartに行くボタン")),
            )
          ],
        ),
      ),
    );
  }
}
