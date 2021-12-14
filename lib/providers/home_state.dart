
import 'package:flutter/foundation.dart';

enum FilterOptions{
  Favorites,
  All,
}

class HomeState with ChangeNotifier{
  var _showOnlyFavorites = false;

  get homeSate{
    return _showOnlyFavorites;
  }
   get favorites{
    return FilterOptions.Favorites;
   }
   get all{
     return FilterOptions.All;
   }

   void changeState(value){
    if(value==FilterOptions.Favorites){
      _showOnlyFavorites=true;
    }else{
      _showOnlyFavorites=false;
    }
     notifyListeners();
   }
}