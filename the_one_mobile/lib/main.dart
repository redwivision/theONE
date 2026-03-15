import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models/movie.dart';
import 'widgets/movie_card.dart';
import 'screens/saved_movies_page.dart';
import 'widgets/movie_card_shimmer.dart';

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
  String _selectedVibe = "random";
  bool _isLoading = false;
  List<Movie> _movies = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadBatch();
  }

  // The Batch Loader: awaits OUTSIDE setState, then assigns the result
  Future<void> _loadBatch() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null; // Reset error on retry
    });
    try {
      final result = await ApiService().getMovie(vibe: _selectedVibe);
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

  void _refresh() {
    _loadBatch(); // _loadBatch already calls setState internally
  }

  Future<void> _discardMovie(String movieId) async {
    await ApiService().discardMovie(movieId); // Tell the backend
    setState(
      () => _movies.removeWhere((m) => m.id == movieId),
    ); // Remove locally
    if (_movies.isEmpty) _loadBatch(); // Auto-reload when feed runs out
  }

  Future<void> _addToWatchlist(String movieId) async {
    await ApiService().addToWatchlist(movieId); // Tell the backend
    setState(
      () => _movies.removeWhere((m) => m.id == movieId),
    ); // Remove locally
    if (_movies.isEmpty) _loadBatch(); // Auto-reload when feed runs out
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Keeps the dark aesthetic
        elevation: 0, // Removes the shadow for a flat, modern look
        centerTitle: true,
        title: Text(
          _selectedVibe.toUpperCase(), // Shows the current vibe in the title
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            color: Colors.white70,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF6C63FF),
        ), // Makes the ☰ icon Purple
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: MovieCardShimmer())
            : _errorMessage != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wifi_off_rounded,
                      color: Color(0xFFFF6584),
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "CONNECTION ERROR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white38),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _loadBatch,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("RETRY"),
                    ),
                  ],
                ),
              )
            : _movies.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_awesome_rounded,
                      color: Color(0xFFFF6584),
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "YOU'VE SEEN IT ALL! 🎬",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Try a different vibe in the sidebar.",
                      style: TextStyle(color: Colors.white38),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_movies[index].id),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        _discardMovie(_movies[index].id);
                      }
                      if (direction == DismissDirection.endToStart) {
                        _addToWatchlist(_movies[index].id);
                      }
                    },
                    child: MovieCard(
                      movie: _movies[index],
                      onRefresh: _refresh,
                    ),
                  );
                },
              ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(
          0xFF0D0D1A,
        ), // 🌌 Matches the app background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.movie_filter_outlined,
                    color: Color(0xFF6C63FF),
                    size: 48,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'THE ONE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                ],
              ),
            ),
            _buildVibeTile(context, 'Random 🎲', 'random'),
            const Divider(color: Colors.white10, height: 1),
            _buildVibeTile(context, 'Anime 🍜', 'anime'),
            _buildVibeTile(context, 'Sci-Fi 🚀', 'scifi'),
            _buildVibeTile(context, 'Masterpiece 💎', 'masterpiece'),
            _buildVibeTile(context, 'Mind-Blowing 🌌', 'mindblown'),
            _buildVibeTile(context, 'Mind Games 🧠', 'mindgame'),
            _buildVibeTile(context, 'Thriller 🔪', 'thriller'),
            _buildVibeTile(context, 'Action 💥', 'action'),
            _buildVibeTile(context, 'Horror 👻', 'horror'),
            _buildVibeTile(context, 'Comedy 😂', 'comedy'),
            _buildVibeTile(context, 'Drama 🎭', 'drama'),
            _buildVibeTile(context, 'Romance ❤️', 'romance'),
            const Divider(
              color: Colors.white10,
              height: 32,
            ), // 📏 Visual separation
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.white38),
              title: const Text(
                'Discarded Movies',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context); // 🚪 Close drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedMoviesPage(
                      title: "Discarded",
                      emptyMessage: "No discarded movies yet. 🗑️",
                      actionIcon: Icons.restore,
                      fetchData: ApiService().getDiscardedMovies,
                      onAction: ApiService().undiscardMovie,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.list_alt_rounded,
                color: Colors.white38,
              ),
              title: const Text(
                'Watchlist',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context); // 🚪 Close drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedMoviesPage(
                      title: "Watchlist",
                      emptyMessage: "Nothing in your watchlist yet. ⭐",
                      actionIcon: Icons.delete,
                      fetchData: ApiService().getWatchlist,
                      onAction: ApiService().removeFromWatchlist,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Senior Tip: A helper function to keep the Drawer code clean 🛠️
  Widget _buildVibeTile(BuildContext context, String title, String vibeKey) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: _selectedVibe == vibeKey
              ? const Color(0xFF6C63FF)
              : Colors.white70,
          fontWeight: _selectedVibe == vibeKey
              ? FontWeight.bold
              : FontWeight.normal,
          fontSize: 16,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedVibe = vibeKey; // 🧠 Update the "Memory"
        });
        _refresh(); // 🔄 Fetch the new movie
        Navigator.pop(context); // 🚪 Close the drawer
      },
    );
  }
}
