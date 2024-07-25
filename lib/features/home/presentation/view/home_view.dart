import 'package:dalel/core/funcations/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customReplacementNavigate(context, '/signin');
            },
            icon: const Icon(Icons.logout)),
      ),
      body: const Center(child: Text("home page")),
    );
  }
}
