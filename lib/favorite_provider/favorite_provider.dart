import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class favoriteProvider with ChangeNotifier{
  List selectedItems= [];


  addFavorite(value)
  {
    selectedItems.add(value);
    notifyListeners();
  }
 removeItem(value){
    selectedItems.remove(value);
    notifyListeners();
 }

}