import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Row(
          children: [
            // Back Button
            IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 18, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const Spacer(), // Pushes icons to the right

            // Action Icons
            _buildIcon(Icons.bookmark_border), // Bookmark
            _buildIcon(Icons.download_outlined), // Download
            _buildIcon(Icons.check), // Checkmark
            _buildIcon(Icons.share_outlined), // Share
            _buildIcon(Icons.shopping_cart_outlined), // Cart
          ],
        ),
      ),
    );
  }

  // Helper function to create action icons
  Widget _buildIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(icon, color: Colors.black54, size: 22),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
