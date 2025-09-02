import 'package:counter_app/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus{loading,success, failure}

class FavouriteItemStates extends Equatable {

  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temfavouriteItemList;
  final ListStatus listStatus;
  const FavouriteItemStates({
    this.favouriteItemList = const [],
    this.temfavouriteItemList = const [],
    this.listStatus = ListStatus.loading
});

  FavouriteItemStates copyWith({List<FavouriteItemModel>? favouriteItemList, List<FavouriteItemModel>? temfavouriteItemList, ListStatus? listStatus}){
    return FavouriteItemStates(
    favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      temfavouriteItemList: temfavouriteItemList ?? this.temfavouriteItemList,
      listStatus: listStatus ?? this.listStatus
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteItemList,listStatus,temfavouriteItemList];

}