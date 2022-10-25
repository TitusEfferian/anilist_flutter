import 'package:anime_collections/SectionList.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const trendingGQL = """query AnimeHomeSection {
  Page(page: 1, perPage: 5) {
    media(type: ANIME, sort: [TRENDING_DESC, POPULARITY_DESC]) {
      id
      title {
        userPreferred
      }
      coverImage {
        extraLarge
        large
        color
      }
    }
  }
}
""";

const popularSeason = """query AllTimePopular {
  Page(page: 1, perPage: 5) {
    media(type: ANIME, sort: [POPULARITY_DESC]) {
      id
      title {
        userPreferred
      }
      coverImage {
        extraLarge
        large
        color
      }
    }
  }
}
""";

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('AniList Flutter')),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Query(
                    options: QueryOptions(
                      document: gql(trendingGQL),
                    ),
                    builder: ((result, {fetchMore, refetch}) {
                      if (result.hasException) {
                        return Text(result.exception.toString());
                      }

                      if (result.isLoading) {
                        return const Text('Loading');
                      }
                      return SectionList(
                        sectionTitle: 'Trending Now',
                        gqlData: result,
                      );
                    })),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Query(
                      options: QueryOptions(
                        document: gql(popularSeason),
                      ),
                      builder: ((result, {fetchMore, refetch}) {
                        if (result.hasException) {
                          return Text(result.exception.toString());
                        }

                        if (result.isLoading) {
                          return const Text('Loading');
                        }
                        return SectionList(
                          sectionTitle: 'All Time Popular',
                          gqlData: result,
                        );
                      }))
                ],
              ),
            )
          ],
        ));
  }
}
