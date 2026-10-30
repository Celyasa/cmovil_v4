import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

final class CommercialBanner extends StatelessWidget {
  const CommercialBanner({
    super.key,
    required this.onViewPortfolio,
    required this.onDownloadPdf,
    this.isDownloading = false,
  });

  final VoidCallback onViewPortfolio;
  final VoidCallback onDownloadPdf;
  final bool isDownloading;

  static const String _backgroundUrl =
      'https://lh3.googleusercontent.com/d/1f6c7LHbVdPYq7YFJ7pLiHLsJ5jfrOIy2';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            _backgroundUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) {
              return const ColoredBox(color: Color(0xFF401A1D));
            },
          ),

          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xF2241517),
                  Color(0xD944181C),
                  Color(0x995A1E22),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PORTAFOLIO COMERCIAL',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.82),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Bebidas para\ncada cliente',
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    height: 1.05,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: onViewPortfolio,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Ver portafolio ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: isDownloading ? null : onDownloadPdf,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          disabledForegroundColor: Colors.white.withValues(
                            alpha: 0.65,
                          ),
                          backgroundColor: Colors.black.withValues(alpha: 0.24),
                          minimumSize: const Size.fromHeight(44),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.75),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: isDownloading
                            ? const SizedBox.square(
                                dimension: 17,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                Icons.picture_as_pdf_outlined,
                                size: 18,
                              ),
                        label: Text(
                          isDownloading ? 'Descargando...' : 'Descargar PDF',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
