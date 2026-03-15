import 'package:flutter/material.dart';

/// A reusable, generic page for displaying lists of movies (e.g., Watchlist or Discarded).
/// It uses "Dependency Injection" by receiving its data-fetching and action-handling logic
/// through the constructor, making it agnostic to *what* data it actually displays.
class SavedMoviesPage extends StatefulWidget {
  final String title; // Header title (e.g., "Watchlist")
  final String emptyMessage; // Message shown when the list is empty
  final IconData
  actionIcon; // The icon for the trailing button in each list item

  // These are the "Engine" functions — passed from main.dart
  final Future<List<dynamic>> Function() fetchData; // Function to get the list
  final Future<void> Function(String)
  onAction; // Function to handle the button tap

  const SavedMoviesPage({
    super.key,
    required this.title,
    required this.emptyMessage,
    required this.actionIcon,
    required this.fetchData,
    required this.onAction,
  });

  @override
  State<SavedMoviesPage> createState() => _SavedMoviesPageState();
}

class _SavedMoviesPageState extends State<SavedMoviesPage> {
  bool _isLoading = false;
  List<dynamic> _movies = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await widget.fetchData();
      setState(() {
        _movies = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _handleAction(String id) async {
    try {
      await widget.onAction(id);
      // Local update for immediate feedback
      setState(() {
        _movies.removeWhere((m) => m[0] == id);
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Action failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white70,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF6C63FF)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _loadData,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
            )
          : _errorMessage != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white38,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadData,
                    child: const Text('RETRY'),
                  ),
                ],
              ),
            )
          : _movies.isEmpty
          ? Center(
              child: Text(
                widget.emptyMessage,
                style: const TextStyle(color: Colors.white38, fontSize: 16),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: _movies.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.white10),
              itemBuilder: (context, index) {
                final movie = _movies[index];
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
                    icon: Icon(
                      widget.actionIcon,
                      color: const Color(0xFF6C63FF),
                    ),
                    onPressed: () => _handleAction(id),
                  ),
                );
              },
            ),
    );
  }
}
