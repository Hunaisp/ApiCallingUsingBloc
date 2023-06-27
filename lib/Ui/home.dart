import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Anime/anime_bloc.dart';
import '../Repository/modelclass/AnimeModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late AnimeModel anime;

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(FetchAnimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          if (state is AnimeblocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AnimeblocError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<AnimeBloc>(context)
                    .add(FetchAnimeEvent());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    // color: Colors.red,
                    child:
                        const Center(child: Text('Oops something went wrong'))),
              ),
            );
          }
          if (state is AnimeblocLoaded) {
            anime = BlocProvider.of<AnimeBloc>(context).animeModel;
            return GridView.builder(
              itemCount: anime.data!.length,
              // replace with the actual number of items in your list
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {

                return Card(color: Colors.white,
                  elevation: 4,
                  child: Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.all(8),
                      color: Colors.white,
                      child:
                          Image.network(anime.data![index].image.toString(),fit: BoxFit.cover,)),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
