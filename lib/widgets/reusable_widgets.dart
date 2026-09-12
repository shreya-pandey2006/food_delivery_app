import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../theme/app_theme.dart';

class BadgeChip extends StatelessWidget {
  final String label;
  final String? type;
  const BadgeChip({super.key, required this.label, this.type});
  @override
  Widget build(BuildContext context) {
    bool isGreen = type == 'green' || label == 'Free Delivery' || label == 'Vegan' || label == 'PRIMARY' || label == 'Required';
    Color bgColor = isGreen ? const Color(0xFFD1FAE5) : const Color(0xFFFFEDD5);
    Color textColor = isGreen ? const Color(0xFF047857) : const Color(0xFFC2410C);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
        style: TextStyle(
          color: textColor,fontSize: 10,fontWeight: FontWeight.w700,letterSpacing: 0.2,
        ),
      ),
    );
  }
}
class CategoryChip extends StatelessWidget {
  final CategoryItem category;
  final bool isSelected;
  final VoidCallback onTap;
  const CategoryChip({
    super.key,
    required this.category,required this.isSelected,required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryRed : AppTheme.surface,borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? AppTheme.primaryRed : AppTheme.borderLight, width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.primaryRed.withValues(alpha: 0.3), blurRadius: 8,offset: const Offset(0, 3),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            Text(category.icon, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 6),
            Text(category.name,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textPrimary,fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600, fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class FoodCardTile extends StatelessWidget {
  final FoodItem food;
  final VoidCallback onTap;
  const FoodCardTile({
    super.key,required this.food,required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppTheme.surface,borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),blurRadius: 10,offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    food.imageUrl,
                    height: 160,width: double.infinity,fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 160, color: Colors.grey[200],
                        child: const Icon(Icons.fastfood, size: 50, color: Colors.grey),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 12,left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text('${food.rating}',
                          style: const TextStyle(
                            fontSize: 12,fontWeight: FontWeight.bold,color: AppTheme.textPrimary,
                          ),
                        ),
                        Text(' (${food.reviewCount})',
                          style: const TextStyle(
                            fontSize: 11,color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (food.badge != null)
                  Positioned(
                    top: 12, right: 12, child: BadgeChip(label: food.badge!, type: food.badgeColor),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(food.name,
                          style: const TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold,color: AppTheme.textPrimary,
                          ),
                          maxLines: 1,overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text('\$${food.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,fontWeight: FontWeight.bold,color: AppTheme.primaryRed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(food.description,
                    style: const TextStyle(
                      fontSize: 12,color: AppTheme.textSecondary,height: 1.3,
                    ),
                    maxLines: 2,overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 14, color: AppTheme.textMuted),
                          const SizedBox(width: 4),
                          Text(food.prepTime,
                            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.two_wheeler, size: 14, color: AppTheme.textMuted),
                          const SizedBox(width: 4),
                          Text(food.deliveryFee,
                            style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                      Container(
                        width: 32,height: 32,
                        decoration: const BoxDecoration(
                          color: AppTheme.primaryRed,shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}