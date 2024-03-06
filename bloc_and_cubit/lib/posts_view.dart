import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_and_cubit/posts_cubit.dart';

import 'post.dart';

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsCubit, List<Post>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(post.title),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 10, bottom: 10),
                  child: Text(
                    post.body,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ));
          });
        },
      ),
    );
  }
}
