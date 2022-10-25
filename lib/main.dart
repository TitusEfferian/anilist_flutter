import 'package:anime_collections/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  HttpLink httpLink = HttpLink('https://graphql.anilist.co/');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));
  runApp(GraphQLProvider(
    client: client,
    child: const RootClass(),
  ));
}

class RootClass extends StatelessWidget {
  const RootClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage()
    );
  }
}
