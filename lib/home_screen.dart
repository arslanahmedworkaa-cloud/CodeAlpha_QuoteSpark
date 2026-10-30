import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_colors.dart';
import 'favorites_screen.dart';
import 'quote.dart';
import 'quote_data.dart';
import 'quote_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Copy the quote to the phone clipboard and show a small message
  Future<void> _copyQuote(BuildContext context, Quote quote) async {
    await Clipboard.setData(
      ClipboardData(text: '"${quote.text}" - ${quote.author}'),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Quote copied!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // Small round button with an icon (used for Copy and Heart)
  Widget _roundButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
    String tooltip = '',
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
          ),
          child: Icon(icon, color: iconColor, size: 26),
        ),
      ),
    );
  }

  // The quote text and author, shown in the middle of the screen
  Widget _buildQuoteContent(Quote quote) {
    return Column(
      // The key tells AnimatedSwitcher "this is a NEW quote", so it plays the fade
      key: ValueKey(quote.text),
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.format_quote, color: Colors.white54, size: 64),
        const SizedBox(height: 8),
        Text(
          quote.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            height: 1.4,
            fontWeight: FontWeight.w600,
            fontFamily: 'serif',
          ),
        ),
        const SizedBox(height: 28),
        Container(width: 50, height: 3, color: Colors.white54),
        const SizedBox(height: 16),
        Text(
          quote.author,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch = "listen to this provider and rebuild when it changes"
    final quote = ref.watch(quoteProvider);
    final favorites = ref.watch(favoritesProvider);

    final isFavorite = favorites.any((item) => item.text == quote.text);

    // Pick a background color for this quote
    final gradientIndex =
        allQuotes.indexOf(quote) % AppColors.backgroundGradients.length;

    return Scaffold(
      // AnimatedContainer smoothly changes the background color between quotes
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradients[gradientIndex],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                // ---------- Top bar ----------
                Row(
                  children: [
                    const Text(
                      'QuoteSpark',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    // Favorites button with the number of saved quotes
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FavoritesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.favorite,
                                color: Colors.white, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              '${favorites.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // ---------- Quote in the middle ----------
                Expanded(
                  child: Center(
                    // Scroll view keeps very long quotes from overflowing
                    child: SingleChildScrollView(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        // Fade + small slide up when the quote changes
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.08),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: _buildQuoteContent(quote),
                      ),
                    ),
                  ),
                ),

                // ---------- Bottom buttons ----------
                Row(
                  children: [
                    _roundButton(
                      icon: Icons.copy,
                      tooltip: 'Copy',
                      onTap: () => _copyQuote(context, quote),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton.icon(
                          // ref.read = "do something once" (no listening)
                          onPressed: () {
                            ref.read(quoteProvider.notifier).newQuote();
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('New Quote'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.textDark,
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    _roundButton(
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                      iconColor:
                          isFavorite ? Colors.pinkAccent[100]! : Colors.white,
                      tooltip: 'Favorite',
                      onTap: () {
                        ref.read(favoritesProvider.notifier).toggle(quote);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
