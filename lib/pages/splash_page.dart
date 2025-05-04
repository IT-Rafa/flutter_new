import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Splash Page")),
          ElevatedButton(
              onPressed: () {
                context.goNamed(appRouter.login.name);
              },
              child: const Text("Lets Login"))
        ],
      ),
    );
  }
}
