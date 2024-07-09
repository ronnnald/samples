import 'dart:ui';

import '../themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).extension<TagChipTheme>()?.chipColor ??
                AppColors.whiteTransparent,
          ),
          child: SizedBox(
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _iconFrom(tag),
                    color: Theme.of(context)
                        .extension<TagChipTheme>()
                        ?.onChipColor,
                    size: 10,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    tag,
                    textAlign: TextAlign.center,
                    style: _textStyle(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData? _iconFrom(String tag) {
    return switch (tag) {
      'Adventure sports' => Icons.kayaking_outlined,
      'Beach' => Icons.beach_access_outlined,
      'City' => Icons.location_city_outlined,
      'Cultural experiences' => Icons.museum_outlined,
      'Foodie' || 'Food tours' => Icons.restaurant,
      'Hiking' => Icons.hiking,
      'Historic' => Icons.menu_book_outlined,
      'Island' || 'Coastal' || 'Lake' || 'River' => Icons.water,
      'Luxury' => Icons.attach_money_outlined,
      'Mountain' || 'Wildlife watching' => Icons.landscape_outlined,
      'Nightlife' => Icons.local_bar_outlined,
      'Off-the-beaten-path' => Icons.do_not_step_outlined,
      'Romantic' => Icons.favorite_border_outlined,
      'Rural' => Icons.agriculture_outlined,
      'Secluded' => Icons.church_outlined,
      'Sightseeing' => Icons.attractions_outlined,
      'Skiing' => Icons.downhill_skiing_outlined,
      'Wine tasting' => Icons.wine_bar_outlined,
      'Winter destination' => Icons.ac_unit,
      _ => Icons.label_outlined,
    };
  }

  // Note: original Figma file uses Google Sans
  // which is not available on GoogleFonts
  _textStyle(BuildContext context) => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: Theme.of(context).extension<TagChipTheme>()?.onChipColor ??
              Colors.white,
          textBaseline: TextBaseline.alphabetic,
        ),
      );
}

class TagChipTheme extends ThemeExtension<TagChipTheme> {
  final Color chipColor;
  final Color onChipColor;

  TagChipTheme({
    required this.chipColor,
    required this.onChipColor,
  });

  @override
  ThemeExtension<TagChipTheme> copyWith({
    Color? chipColor,
    Color? onChipColor,
  }) {
    return TagChipTheme(
      chipColor: chipColor ?? this.chipColor,
      onChipColor: onChipColor ?? this.onChipColor,
    );
  }

  @override
  ThemeExtension<TagChipTheme> lerp(
    covariant ThemeExtension<TagChipTheme> other,
    double t,
  ) {
    if (other is! TagChipTheme) {
      return this;
    }
    return TagChipTheme(
      chipColor: Color.lerp(chipColor, other.chipColor, t) ?? chipColor,
      onChipColor: Color.lerp(onChipColor, other.onChipColor, t) ?? onChipColor,
    );
  }
}