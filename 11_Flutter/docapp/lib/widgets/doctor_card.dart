import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:docapp/models/doctor.dart';
import 'package:docapp/screens/doctor_details_screen.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  // Helper method to build star icons based on rating
  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor(); // Number of full stars
    bool hasHalfStar = (rating - fullStars) >= 0.5; // Check for half star

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.amber, size: 16),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.amber, size: 16),
        for (int i = 0; i < 5 - fullStars - (hasHalfStar ? 1 : 0); i++)
          const Icon(Icons.star_border, color: Colors.amber, size: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: InkWell(
        onTap: () {
          // Navigate to DoctorDetailsScreen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailsScreen(doctor: doctor),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12), // Match card's border radius
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor's profile picture
              CircleAvatar(
                backgroundImage:
                    doctor.imageUrl.startsWith('http') ||
                    doctor.imageUrl.startsWith('https')
                        ? CachedNetworkImageProvider(
                          doctor.imageUrl,
                        ) // Network image
                        : AssetImage(doctor.imageUrl)
                            as ImageProvider, // Local asset
                radius: 30,
                child:
                    doctor.imageUrl.isEmpty
                        ? Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ) // Fallback icon
                        : null,
              ),
              const SizedBox(width: 16),
              // Doctor's details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor's name
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Doctor's specialty
                    Text(
                      doctor.specialty,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    // Doctor's rating stars
                    _buildRatingStars(doctor.rating),
                    const SizedBox(height: 8),
                    // Doctor's description
                    Text(
                      doctor.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 2, // Limit to 2 lines
                      overflow:
                          TextOverflow.ellipsis, // Add ellipsis if overflow
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
