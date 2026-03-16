import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie2_application/pages/home_screen/widget_home/movie_card.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';
import '../../cubit/search_cubit.dart';
import '../../cubit/search_state.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => SearchCubit(),
        child: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: ColorPallete.black,
                appBar: AppBar(

                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 70,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        context.read<SearchCubit>().searchMovies(value);
                      },
                      style: TextStyle(
                        color: ColorPallete.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Image.asset("assets/icons/searchIcon.png"),
                        filled: true,
                        fillColor: ColorPallete.gray,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                        return Center(
                          child: Image.asset(
                            ImageRepository.EmptySearch,
                            width: 200,
                          ),
                        );
                      }

                      if (state is SearchLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is SearchSuccess) {
                        final movies = state.movies;

                        return GridView.builder(
                          itemCount: movies.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (context, index) {
                            final movie = movies[index];

                            return MovieCard(
                              imagePath: movie["medium_cover_image"],
                              movieId: movie["id"],
                              rating: (movie["rating"] ?? 0).toDouble(),
                            );
                          },
                        );
                      }

                      return SizedBox();
                    },
                  ),
                ),
              );
            }
        )
    );
  }
}