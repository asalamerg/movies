
import 'package:app_movies/search/view/Search_movies_delegate.dart' show SearchMovies;
import 'package:app_movies/search/view_model/cubit_search.dart';
import 'package:app_movies/shared/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final viewModelSearch = CubitSearch();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 48.h,
              width: 343.w,
              child: InkWell(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: SearchMovies(viewModel: viewModelSearch),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ThemeApp.backgroundList,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.30),
            Center(
              child: Image.asset("assets/image/search.png", height: 114, width: 104),
            ),
          ],
        ),
      ),
    );
  }
}
