import 'package:counter_getx/counter_controller.dart';
import 'package:counter_getx/sec_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SecCounterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<CounterController>(
              init: CounterController(),
              builder: (controller) {
                return Text(
                  '${controller.counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            GetX<CounterController>(
              init: CounterController(),
              initState: (_) {},
              builder: (controller) {
                return Text(
                  '${controller.counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${controller.counter.value}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                        onPressed: () {
                          controller.incrementCounter();
                        },
                        icon: const Icon(Icons.add))
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.find<CounterController>().incrementCounter();

              // controller.incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(
                '/sec',
                arguments: {"name": "saimurali"},
              );
            },
            tooltip: 'NextPage',
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
