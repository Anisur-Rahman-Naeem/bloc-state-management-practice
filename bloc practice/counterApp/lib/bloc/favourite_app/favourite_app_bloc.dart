import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_event.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_state.dart';
import 'package:counter_app/model/favourite_item_model.dart';
import 'package:counter_app/repository/favourite_repository.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {

  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> temFavouriteList = [];

  FavouriteRepository favouriteRepository;
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemStates()){
    on<FetchFavouriteList>(fetchList);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unselectItem);
    on<FavouriteItem>(_addFavouriteItem);
    on<DeleteItem>(_deleteItem);
  }

  Future<void> fetchList(FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(favouriteItemList: List.from(favouriteList),listStatus: ListStatus.success,));
  }
  Future<void> _addFavouriteItem(FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
    final index = favouriteList.indexWhere((element) => element.id == event.item.id);
    
    if(event.item.isFavourite){
      if(temFavouriteList.contains(favouriteList[index])){
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
      }
    }else{
      if(temFavouriteList.contains(favouriteList[index])){
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
      }
    }

    favouriteList[index] = event.item;

    emit(state.copyWith(favouriteItemList: List.from(favouriteList), temfavouriteItemList: List.from(temFavouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteItemStates> emit) async {
    temFavouriteList.add(event.item);
    emit(state.copyWith(temfavouriteItemList: List.from(temFavouriteList)));
  }

  Future<void> _unselectItem(UnSelectItem event, Emitter<FavouriteItemStates> emit) async {
    temFavouriteList.remove(event.item);
    emit(state.copyWith(temfavouriteItemList: List.from(temFavouriteList)));
  }

  Future<void> _deleteItem(DeleteItem event, Emitter<FavouriteItemStates> emit) async {
    for(int i = 0; i<temFavouriteList.length; i++){
      favouriteList.remove(temFavouriteList[i]);
    }
    temFavouriteList.clear();
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
        temfavouriteItemList: List.from(temFavouriteList)));
  }
}