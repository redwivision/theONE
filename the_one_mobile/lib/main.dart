import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models/movie.dart';
import 'widgets/movie_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Movie> _movieFuture;

  @override
  void initState() {
    super.initState();
    _movieFuture = ApiService().getMovie();
  }

  void _refresh() {
    setState(() {
      _movieFuture = ApiService().getMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<Movie>(
            future: _movieFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Color(0xFF6C63FF),
                );
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wifi_off_rounded,
                      color: Color(0xFFFF6584),
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Could not connect to server.',
                      style: TextStyle(color: Color(0xFFAAAAAA)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _refresh,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: MovieCard(movie: snapshot.data!, onRefresh: _refresh),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
