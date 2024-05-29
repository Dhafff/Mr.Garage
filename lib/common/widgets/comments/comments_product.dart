import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mr_garage/utils/global.colors.dart';

class CommentsProduct extends StatelessWidget {
  const CommentsProduct({
    super.key,
    required this.userImg,
    required this.user,
    required this.userComment,
    required this.rating,
    required this.date,
  });

  final String userImg;
  final String user;
  final String userComment;
  final double rating;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(userImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  user,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColor,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showMoreModal(context);
              },
              child: Icon(
                FeatherIcons.moreVertical,
                size: 15,
                color: GlobalColors.textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (_, __) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              unratedColor: GlobalColors.secondColor,
              itemCount: 5,
              itemSize: 20,
              direction: Axis.horizontal,
            ),
            const SizedBox(width: 10),
            Text(
              date,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 12,
                color: GlobalColors.secondColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          userComment,
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 12,
            color: GlobalColors.textColor2,
            height: 1.8,
          ),
        ),
      ],
    );
  }

  void showMoreModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(),
              ),
            ],
          ),
        );
      },
    );
  }
}
