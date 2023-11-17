import 'package:flutter/material.dart';
import 'package:news/models/source_response.dart';
import 'package:news/models/sources.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static String routeName = "homeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: FutureBuilder<SourceResponse>(
        future: apiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              children: [
                const Text("Something went wrong"),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("try again"),
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.status == "error") {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("try again"),
                )
              ],
            );
          }
          List<Sources> sources = snapshot.data?.sources ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(sources[index].name ?? "");
            },
            itemCount: sources.length,
          );
        },
      ),
    );
  }
}
