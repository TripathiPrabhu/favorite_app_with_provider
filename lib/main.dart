import 'package:favorite_app_with_provider/favorite_provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return favoriteProvider();
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Favorite-App with provider',
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) =>
              Consumer<favoriteProvider>(builder: (context, value, child)=>
                  ListTile(
                    onTap: () {
                      if (value.selectedItems.contains(index)){
                        value.removeItem(index);
                        print(value.selectedItems[index].toString());

                      }
                      else {
                        value.addFavorite(index);
                      }
                    },
                    leading: Text('item ${index}'),
                    trailing: value.selectedItems.contains(index)
                        ? Icon(Icons.favorite, color: Colors.red,)
                        : Icon(Icons.favorite_border),
                  ),
              ),


          ),
        ),
      ),
    );
  }
}
