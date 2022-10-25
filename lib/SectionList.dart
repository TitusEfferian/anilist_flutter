import 'package:anime_collections/AnimeCard.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SectionList extends StatelessWidget {
  const SectionList({super.key, required this.gqlData, this.sectionTitle = ''});

  final String sectionTitle;
  final QueryResult<Object?> gqlData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimeCard(
              sectionTitle: this.sectionTitle,
              shouldShowSectionTitle: true,
              animeTitle: gqlData.data?['Page']?['media'][0]['title']
                  ?['userPreferred'],
              animeImageUrl: gqlData.data?['Page']?['media'][0]['coverImage']
                  ?['large'],
            ),
            AnimeCard(
              animeTitle: gqlData.data?['Page']?['media'][1]['title']
                  ?['userPreferred'],
              animeImageUrl: gqlData.data?['Page']?['media'][1]['coverImage']
                  ?['large'],
            ),
            AnimeCard(
              animeTitle: gqlData.data?['Page']?['media'][2]['title']
                  ?['userPreferred'],
              animeImageUrl: gqlData.data?['Page']?['media'][2]['coverImage']
                  ?['large'],
            ),
            AnimeCard(
              animeTitle: gqlData.data?['Page']?['media'][3]['title']
                  ?['userPreferred'],
              animeImageUrl: gqlData.data?['Page']?['media'][3]['coverImage']
                  ?['large'],
            ),
            AnimeCard(
              animeTitle: gqlData.data?['Page']?['media'][4]['title']
                  ?['userPreferred'],
              animeImageUrl: gqlData.data?['Page']?['media'][4]['coverImage']
                  ?['large'],
            ),
          ],
        )
      ],
    );
  }
}
