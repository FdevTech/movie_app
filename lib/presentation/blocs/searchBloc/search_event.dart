part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchQueryEvent extends SearchEvent
{
  final String searchQuery;

  const SearchQueryEvent({required this.searchQuery});
  @override
  List<Object?> get props => [searchQuery];

}