import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_newsapp/models/news_model.dart';
import 'package:riverpod_newsapp/services/news_services.dart';
part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLoading,
    required NewsModel newsModel,
  }) = _NewsState;
  const NewsState._();
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsModel: NewsModel(results: []))) {
    getNews();
  }

  getNews() async {
    state = state.copyWith(isLoading: true);
    final response = await NewsServices().getNews();
    final news = NewsModel.fromJson(response);
    state = state.copyWith(isLoading: false, newsModel: news);
  }
}
