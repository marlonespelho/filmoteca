import 'package:flutter/material.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/widgets/cast_card.dart';

class CastList extends StatelessWidget {
  final List<Cast> castList;

  const CastList({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.castTitleLabel,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: castList.map((cast) {
              return CastCard(cast: cast);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
