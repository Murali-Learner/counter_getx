import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllerC extends GetxController {
  var searchText = "".obs;
  var searchResults = <String>[].obs;

  void performSearch(String query) {
    searchText.value = query;
    searchResults.value = _fakeSearchResults(query);
  }

  List<String> _fakeSearchResults(String query) {
    return List.generate(5, (index) => "Result ${index + 1} for $query");
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          const SearchWidget(),
          Expanded(
            child: Obx(() {
              final results = Get.find<SearchControllerC>().searchResults;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(results[index]));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends GetView<SearchControllerC> {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.performSearch(value);
      },
      decoration: const InputDecoration(hintText: "Search..."),
    );
  }
}
