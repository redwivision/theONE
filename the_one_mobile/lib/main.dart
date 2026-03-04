import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models/movie.dart';
import 'widgets/movie_card.dart';
import 'screens/discarded_movies_page.dart';
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
  late Future<Movie> _movieFuture;
  String _selectedVibe = "random";

  @override
  void initState() {
    super.initState();
    _movieFuture = ApiService().getMovie();
  }

  void _refresh() {
    setState(() {
      _movieFuture = ApiService().getMovie(vibe: _selectedVibe);
    });
  }

  Future<void> _discardMovie(String movieId) async {
    await ApiService().discardMovie(movieId);
    _refresh();
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
        child: Center(
          child: FutureBuilder<Movie>(
            future: _movieFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return MovieCardShimmer();
              } else if (snapshot.hasError) {
                final errorMsg = snapshot.error.toString();
                final isNoMoreMovies = errorMsg.contains('No more movies');

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 2. Change the Icon dynamically!
                    Icon(
                      isNoMoreMovies
                          ? Icons.auto_awesome_rounded
                          : Icons.wifi_off_rounded,
                      color: const Color(0xFFFF6584),
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    // 3. Change the Text dynamically!
                    Text(
                      isNoMoreMovies
                          ? "YOU'VE SEEN IT ALL! 🎬"
                          : "CONNECTION ERROR",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isNoMoreMovies
                          ? "Try a different vibe in the sidebar."
                          : "Check your server or internet.",
                      style: const TextStyle(color: Colors.white38),
                    ),
                    // 4. Hide the Retry button if there are actually no movies left
                    if (!isNoMoreMovies) ...[
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _refresh,
                        child: const Text("RETRY"),
                      ),
                    ],
                  ],
                );
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Dismissible(
                    key: Key(snapshot.data!.id),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        _discardMovie(snapshot.data!.id);
                      }
                      if (direction == DismissDirection.endToStart) {
                        _refresh();
                      }
                    },
                    child: MovieCard(
                      movie: snapshot.data!,
                      onRefresh: _refresh,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
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
                    builder: (context) => const DiscardedMoviesPage(),
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
