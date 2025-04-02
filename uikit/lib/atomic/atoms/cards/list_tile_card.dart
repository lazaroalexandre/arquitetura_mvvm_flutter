import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';


class ListTileCard extends StatelessWidget {
  final void Function()? onPressedCard;
  final void Function()? onPressedTrailing;
  final String leading;
  final String title;
  final String subtitle;
  final Icon? iconTrailing;
  const ListTileCard({
    super.key,
    this.onPressedCard,
    this.onPressedTrailing,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.iconTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedCard,
      child: Card(
        shadowColor: Colors.transparent,
        child: ListTile(
          leading: CircleAvatar(
            child: SuperTitleText(text: leading),
          ),
          title: TitleText(text: title),
          subtitle: SubtitleText(text: subtitle),
          trailing: iconTrailing != null
              ? IconButton(
                  onPressed: onPressedTrailing,
                  icon: iconTrailing!,
                )
              : null,
        ),
      ),
    );
  }
}
