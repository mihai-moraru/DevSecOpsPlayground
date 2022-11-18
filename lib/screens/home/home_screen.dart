import 'package:flutter/material.dart';
import 'package:my_movie_app/screens/home/tabs/movie_tab.dart';
import 'package:my_movie_app/screens/home/tabs/tv_show_tab.dart';
import 'package:my_movie_app/screens/splash/splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout() {
    final route = MaterialPageRoute(
      builder: (_) => const SplashScreen(),
    );
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Discover'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Movie'),
              Tab(text: 'TV Shows'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: logout,
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            MovieTab(),
            TvShowTab(),
          ],
        ),
      ),
    );
  }
}
