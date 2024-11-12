import 'package:counter_getx/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecPage extends StatelessWidget {
  SecPage({super.key});
  final CounterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sec Page ${Get.arguments["name"]}"),
      ),
      body: Column(
        children: [
          GetX<CounterController>(
            init: CounterController(),
            builder: ((val) => Center(
                  child: Text("counter ${controller.counter}"),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.decrementCounter();
        },
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
