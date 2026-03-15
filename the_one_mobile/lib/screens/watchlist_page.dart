import 'package:flutter/material.dart';
import 'package:the_one_mobile/api_service.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  bool _isLoading = false;
  List<dynamic> _watchlist = [];

  @override
  void initState() {
    super.initState();
    _loadwatchlist();
  }

  void _loadwatchlist()
    async {
    setState(() {
      _isLoading = true;
    });
    try {
      final watchlist = await ApiService().getWatchlist();
      setState(() {
        _watchlist = watchlist;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }



  void _removeFromWatchlist(String id) async {
    await ApiService().removeFromWatchlist(id);
    _loadwatchlist();
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
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
      ) : _watchlist.isEmpty ? const Center(
        child: Text(
          'No movies in your watchlist yet.',
          style: TextStyle(color: Colors.white38, fontSize: 16),
        ),
      ) : ListView.builder(
        itemCount: _watchlist.length,
        itemBuilder: (context, index) {
          final movie = _watchlist[index];
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
              icon: const Icon(Icons.delete, color: Color(0xFF6C63FF)),
              onPressed: () => _removeFromWatchlist(id),
            ),
          );
        },
      ),
    );
  }
}