import 'package:app_movies/browse/view/list_item.dart';
import 'package:app_movies/browse/view_model/cubit_list.dart';
import 'package:app_movies/browse/view_model/statue_list.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
final  viewModel=CubitList();
  @override
  void initState() {
    super.initState();
    // استدعِ ViewModel باستخدام BlocProvider
    context.read<CubitList>().getListViewModel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const Text("Browse Category ",
              style: TextStyle(fontSize: 30, color: Colors.white),),
            Expanded(
              child: BlocBuilder<CubitList, StatueList>(
                builder: (context, state) {
                  if (state is listLoading) { return const LoadingIndicator();}
                  else if(state is listError){ return ErrorWidget(state.message);}
                  else if(state is listSuccess){
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),

                      itemBuilder: (context, index) => ListItem(state.genres[index]),
                      itemCount: state.genres.length,
                    );
                  }
                 else {
                 return  const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      );
  }
}