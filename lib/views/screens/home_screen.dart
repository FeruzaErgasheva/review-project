import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("Review"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQuU6m7jPRrh1bwj-Ql2D1MXnp-JsDAjz4OA&s",
                fit: BoxFit.cover,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: const Text("Home"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/courses");
                },
                child: const Text("Courses"))
          ],
        ),
      ),
    );
  }
}
