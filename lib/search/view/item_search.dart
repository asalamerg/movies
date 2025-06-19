import 'package:app_movies/home/data/model/Results.dart';
import 'package:flutter/material.dart';

class ItemSearch extends StatelessWidget {
  final Results results;

  const ItemSearch({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: results.backdropPath != null
                  ? Image.network(
                "https://image.tmdb.org/t/p/w500${results.backdropPath}",
                height: 100,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 100,
                  width: 150,
                  color: Colors.grey[700],
                  child: const Icon(Icons.broken_image, color: Colors.white),
                ),
              )
                  : Container(
                height: 100,
                width: 150,
                color: Colors.grey[800],
                child: const Icon(Icons.image_not_supported, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.title ?? 'No Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Year: ${results.releaseDate?.split('-').first ?? 'Unknown'}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Language: ${results.originalLanguage?.toUpperCase() ?? 'N/A'}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
