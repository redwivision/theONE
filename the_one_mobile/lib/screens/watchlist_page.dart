import 'package:flutter/material.dart';
import 'package:the_one_mobile/api_service.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  late Future<List<dynamic>> _watchlistFuture;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _watchlistFuture = ApiService().getWatchlist();
    });
  }

  void _removeFromWatchlist(String id) async {
    await ApiService().removeFromWatchlist(id);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "WATCHLIST",
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
        future: _watchlistFuture,
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
                    onPressed: () => _removeFromWatchlist(id),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No movies in your watchlist yet.',
                style: TextStyle(color: Colors.white38, fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}