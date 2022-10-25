import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard(
      {super.key,
      required this.animeImageUrl,
      required this.animeTitle,
      this.sectionTitle = "",
      this.shouldShowSectionTitle = false});
  final String animeTitle;
  final String animeImageUrl;
  final bool shouldShowSectionTitle;
  final String sectionTitle;
  @override
  Widget build(BuildContext context) {
    if (shouldShowSectionTitle) {
      return Container(
          margin: EdgeInsets.only(
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  this.sectionTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87),
                ),
                height: 40,
              ),
              // Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),child: Image(image: NetworkImage(animeImageUrl), width: 200, height: 300,fit: BoxFit.fill)),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                      image: NetworkImage(animeImageUrl),
                      width: 200,
                      height: 300,
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                child: Text(animeTitle),
                margin: EdgeInsets.only(top: 16),
              )
            ],
          ));
    }
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
          ),
          // Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),child: Image(image: NetworkImage(animeImageUrl), width: 200, height: 300,fit: BoxFit.fill)),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                  image: NetworkImage(animeImageUrl),
                  width: 200,
                  height: 300,
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            child: Text(animeTitle),
            margin: EdgeInsets.only(top: 16),
          )
        ],
      ),
    );
  }
}
