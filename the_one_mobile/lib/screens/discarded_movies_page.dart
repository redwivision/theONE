import 'package:flutter/material.dart';
import 'package:the_one_mobile/api_service.dart';

class DiscardedMoviesPage extends StatefulWidget {
  const DiscardedMoviesPage({super.key});

  @override
  State<DiscardedMoviesPage> createState() => _DiscardedMoviesPageState();
}

class _DiscardedMoviesPageState extends State<DiscardedMoviesPage> {
  late Future<List<dynamic>> _discardedFuture;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _discardedFuture = ApiService().getDiscardedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "DISCARDED",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white70,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF6C63FF)),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _discardedFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white70),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                final id = movie[0];
                final title = movie[1];
                return ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    id,
                    style: const TextStyle(color: Colors.white38),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.restore, color: Color(0xFF6C63FF)),
                    onPressed: () async {
                      await ApiService().undiscardMovie(id);
                      _refresh(); // 🔄 Re-fetches the list
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No discarded movies yet. 🗑️',
                style: TextStyle(color: Colors.white38, fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}
