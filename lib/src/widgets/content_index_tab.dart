import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentIndexTab extends StatefulWidget {
  final List<IndexItem> items;
  final ScrollController scrollController;
  final VoidCallback onClose;

  const ContentIndexTab({
    super.key,
    required this.items,
    required this.scrollController,
    required this.onClose,
  });

  @override
  State<ContentIndexTab> createState() => _ContentIndexTabState();
}

class _ContentIndexTabState extends State<ContentIndexTab> {
  String? selectedItemId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF34495E),
          ],
        ),
        border: const Border(
          right: BorderSide(
            color: Color(0xFF00BCD4),
            width: 2,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF34495E),
                  Color(0xFF2C3E50),
                ],
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF00BCD4).withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BCD4).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.list_alt,
                    color: Color(0xFF00BCD4),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Content Index',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    onPressed: widget.onClose,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white70,
                      size: 18,
                    ),
                    padding: const EdgeInsets.all(6),
                    constraints: const BoxConstraints(),
                  ),
                ),
              ],
            ),
          ),

          // Content List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = selectedItemId == item.id;
                
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              item.color.withValues(alpha: 0.15),
                              item.color.withValues(alpha: 0.05),
                            ],
                          )
                        : null,
                    color: isSelected ? null : const Color(0xFF1A1A1A).withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected 
                          ? item.color.withValues(alpha: 0.5)
                          : Colors.white.withValues(alpha: 0.1),
                      width: isSelected ? 2 : 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: item.color.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          selectedItemId = item.id;
                        });
                        _scrollToItem(item);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    item.color.withValues(alpha: 0.3),
                                    item.color.withValues(alpha: 0.1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: item.color.withValues(alpha: 0.5),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                item.icon,
                                color: item.color,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected ? item.color : Colors.white,
                                    ),
                                  ),
                                  if (item.subtitle != null) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      item.subtitle!,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white60,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.chevron_right,
                                color: item.color,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToItem(IndexItem item) {
    if (item.globalKey.currentContext != null) {
      final RenderBox renderBox = item.globalKey.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      
      widget.scrollController.animateTo(
        widget.scrollController.offset + position.dy - 100,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}

class IndexItem {
  final String id;
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final GlobalKey globalKey;

  IndexItem({
    required this.id,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.color,
    required this.globalKey,
  });
}