import 'package:flutter/material.dart';
import '../../data/category_model.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(CategoryModel)? onTap;
  const CategoryList({Key? key, required this.categories, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onTap?.call(category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  if (category.coverPictureUrl.isNotEmpty)
                    Image.network(
                      category.coverPictureUrl,
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(width: 8),
                  Text(
                    category.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
