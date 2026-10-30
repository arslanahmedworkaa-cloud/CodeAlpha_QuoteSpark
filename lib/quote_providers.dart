import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'quote.dart';
import 'quote_data.dart';

// ---------------------------------------------------------------
// 1. CURRENT QUOTE
// ---------------------------------------------------------------
class QuoteNotifier extends Notifier<Quote> {
  final Random _random = Random();

  // build() runs once when the app starts: pick a random quote to show first
  @override
  Quote build() {
    return allQuotes[_random.nextInt(allQuotes.length)];
  }

  // Called when the user taps "New Quote".
  // We keep picking until we get a quote that is different from the current one.
  void newQuote() {
    Quote next = allQuotes[_random.nextInt(allQuotes.length)];
    while (next.text == state.text) {
      next = allQuotes[_random.nextInt(allQuotes.length)];
    }
    state = next; // changing "state" updates every screen that is watching
  }
}

final quoteProvider = NotifierProvider<QuoteNotifier, Quote>(QuoteNotifier.new);

// ---------------------------------------------------------------
// 2. FAVORITE QUOTES
// ---------------------------------------------------------------
class FavoritesNotifier extends Notifier<List<Quote>> {
  // The list starts empty
  @override
  List<Quote> build() {
    return [];
  }

  // Is this quote already in favorites?
  bool isFavorite(Quote quote) {
    return state.any((item) => item.text == quote.text);
  }

  // Heart button: add the quote if it is not a favorite, remove it if it is
  void toggle(Quote quote) {
    if (isFavorite(quote)) {
      state = state.where((item) => item.text != quote.text).toList();
    } else {
      state = [...state, quote];
    }
  }
}

final favoritesProvider =
    NotifierProvider<FavoritesNotifier, List<Quote>>(FavoritesNotifier.new);
