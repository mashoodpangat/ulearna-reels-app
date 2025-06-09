import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String profileImageUrl;
  final VoidCallback onProfileTap;

  const TopBar({
    super.key,
    required this.title,
    required this.profileImageUrl,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
              icon: CircleAvatar(
                radius: 17.sp,
                backgroundImage: const NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
              ),
              onPressed: onProfileTap,
            ),
          ],
        ),
      ],
    );
  }
}

class ReelCard extends StatelessWidget {
  final String? thumbnailUrl;
  final String? profileImage;
  final String username;
  final String description;
  final String categoryLabel;

  final int views;
  final int likes;
  final int comments;

  const ReelCard({
    super.key,
    this.thumbnailUrl,
    this.profileImage,
    required this.username,
    required this.description,
    required this.categoryLabel,
    required this.views,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  thumbnailUrl ?? "https://img.youtube.com/vi/<video_id>/1.jpg",
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                        "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg");
                  },
                )),
            const Icon(Icons.play_circle_fill, color: Colors.white, size: 48),
          ],
        ),
        SizedBox(height: 8.sp),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
              backgroundImage: NetworkImage(profileImage ??
                  "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D")),
          title: Row(
            children: [
              Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 4.sp),
              Icon(Icons.verified, color: Colors.blue, size: 16.sp),
            ],
          ),
          subtitle: Text(description),
        ),
        Row(
          children: [
            SizedBox(
              width: 12.sp,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                categoryLabel,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            SizedBox(width: 17.sp),
            Row(
              children: [
                Image.asset(
                  "assets/FRAME (3).png",
                  scale: 6.5.sp,
                ),
                // Icon(Icons.remove_red_eye_outlined, size: 18.sp),
                const SizedBox(width: 4),
                Text('$views K'),
              ],
            ),
            SizedBox(width: 17.sp),
            Row(children: [
              Image.asset(
                "assets/like.png",
                scale: 6.5.sp,
              ),
              SizedBox(width: 6.sp),
              Text('$likes K'),
            ]),
            SizedBox(width: 17.sp),
            Row(children: [
              Image.asset(
                "assets/comment.png",
                scale: 6.5.sp,
              ),
              const SizedBox(width: 4),
              Text('$comments K'),
            ]),
          ],
        ),
      ],
    );
  }
}
