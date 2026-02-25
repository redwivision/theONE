import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onRefresh;

  const MovieCard({super.key, required this.movie, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final details = movie.details;
    final bool isSeries = details.type.toLowerCase() == 'series';
    final String durationLabel = isSeries
        ? '${details.totalseason} Season${details.totalseason == "1" ? "" : "s"}'
        : details.runtime;

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color(0xFF1A1A2E),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header Row: Type Badge + Duration ---
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: isSeries
                        ? const Color(0xFF6C63FF).withOpacity(0.2)
                        : const Color(0xFFFF6584).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSeries
                          ? const Color(0xFF6C63FF)
                          : const Color(0xFFFF6584),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    isSeries ? '📺  SERIES' : '🎬  MOVIE',
                    style: TextStyle(
                      color: isSeries
                          ? const Color(0xFF6C63FF)
                          : const Color(0xFFFF6584),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule_rounded,
                      color: Color(0xFF888888),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      durationLabel,
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 14),
                    // Refresh Button
                    GestureDetector(
                      onTap: onRefresh,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A4A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.refresh_rounded,
                          color: Color(0xFF6C63FF),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --- Poster ---
          ClipRRect(
            borderRadius: BorderRadius.zero,
            child: details.posterUrl != 'N/A' && details.posterUrl.isNotEmpty
                ? Image.network(
                    details.posterUrl,
                    height: 340,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 340,
                        color: const Color(0xFF2A2A4A),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 340,
                      color: const Color(0xFF2A2A4A),
                      child: const Center(
                        child: Icon(
                          Icons.broken_image_rounded,
                          color: Color(0xFF888888),
                          size: 48,
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 340,
                    color: const Color(0xFF2A2A4A),
                    child: const Center(
                      child: Icon(
                        Icons.movie_rounded,
                        color: Color(0xFF888888),
                        size: 48,
                      ),
                    ),
                  ),
          ),

          // --- Title + Year ---
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 6),
            child: Text(
              details.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
            child: Text(
              details.year,
              style: const TextStyle(
                color: Color(0xFF888888),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // --- Divider ---
          Divider(color: Colors.white.withOpacity(0.07), height: 1),

          // --- Plot ---
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 22),
            child: Text(
              details.plot,
              style: const TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 14,
                height: 1.6,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
