import 'package:flutter/material.dart';

import '../../../core/themes/color_theme.dart';

class TabButtonWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButtonWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : null,
              color: isSelected
                  ? ColorsTheme.primary
                  : ColorsTheme.secondaryText,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            height: 2,
            width: 60,
            color: isSelected ? ColorsTheme.primary : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
