// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/texts/subtitle_text.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/texts/super_title_text.dart';
import 'package:arquitetura_flutter/app/uikit/atomic/molecules/texts/title_text.dart';
import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  final void Function()? onPressedCard;
  final void Function()? onPressedTrailing;
  final String leading;
  final String title;
  final String subtitle;
  final Icon? iconTrailing;
  const ListTileCard({
    Key? key,
    this.onPressedCard,
    this.onPressedTrailing,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.iconTrailing,
  }) : super(key: key);

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
