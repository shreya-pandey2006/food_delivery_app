class FoodItem {
  final String id;
  final String name;
  final String subtitle;
  final String description;
  final double price;
  final double rating;
  final String reviewCount;
  final String prepTime;
  final String deliveryFee;
  final String imageUrl;
  final String? badge;
  final String? badgeColor;
  final int calories;
  final String category;
  const FoodItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.prepTime,
    required this.deliveryFee,
    required this.imageUrl,
    this.badge,
    this.badgeColor,
    required this.calories,
    required this.category,
  });
}

class CategoryItem {
  final String id;
  final String name;
  final String icon;
  final bool isActive;
  const CategoryItem({
    required this.id,
    required this.name,
    required this.icon,
    this.isActive = false,
  });
}

class IngredientItem {
  final String name;
  final String subtitle;
  final String iconName;
  const IngredientItem({
    required this.name,
    required this.subtitle,
    required this.iconName,
  });
}

class CartItemModel {
  final String id;
  final FoodItem food;
  final String selectedOptions;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.food,
    required this.selectedOptions,
    required this.price,
    this.quantity = 1,
  });
}

class DemoData {
  static const List<CategoryItem> categories = [
    CategoryItem(id: '1', name: 'All', icon: '🍽️', isActive: true),
    CategoryItem(id: '2', name: 'Burgers', icon: '🍔'),
    CategoryItem(id: '3', name: 'Pizza', icon: '🍕'),
    CategoryItem(id: '4', name: 'Asian', icon: '🍜'),
  ];

  static const FoodItem truffleBurger = FoodItem(
    id: 'food_1',
    name: 'Truffle Smash Burger',
    subtitle: 'The Burger Lab • Gourmet Grills',
    description:'Two smashed prime Angus beef patties seared to crusty perfection, layered with double melted Vermont cheddar, caramelized shallots, crisp baby arugula, and our signature black truffle emulsion on a toasted artisan brioche bun.',
    price: 14.99,
    rating: 4.9,
    reviewCount: '1.2k',
    prepTime: '20-25 min',
    deliveryFee: 'No fee',
    imageUrl:'data:image/jpeg;base64,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',
    badge: 'Free Delivery',
    badgeColor: 'green',
    calories: 580,
    category: 'Burgers',
  );

  static const FoodItem artisanPizza = FoodItem(
    id: 'food_2',
    name: 'Artisan Margherita Pizza',
    subtitle: 'Pizzeria Bella • Woodfired',
    description:'San Marzano tomatoes, fresh buffalo mozzarella, fragrant basil leaves on 48-hour fermented crust.',
    price: 16.50,
    rating: 4.8,
    reviewCount: '850',
    prepTime: '25-30 min',
    deliveryFee: '\$1.99 Delivery',
    imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_1tUflJT6zehK1OQdIVTj4t96aQfdxA9BwRxMMfbPgQ&s',
    badge: null,
    calories: 720,
    category: 'Pizza',
  );

  static const FoodItem koreanChicken = FoodItem(
    id: 'food_3',
    name: 'Crispy Korean Fried Chicken Bowl',
    subtitle: 'Seoul Kitchen • Asian Fusion',
    description:'Glazed soy garlic chicken bites, steamed jasmine rice, pickled radish, scallions, toasted sesame.',
    price: 13.25,
    rating: 4.9,
    reviewCount: '2.1k',
    prepTime: '15-20 min',
    deliveryFee: 'Free over \$15',
    imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCoDjBddGPRZjPBZKwpLfXALOUjmBjh3Y774XMG0M4vQ&s=10',
    badge: 'Bestseller',
    badgeColor: 'orange',
    calories: 640,
    category: 'Asian',
  );

  static const FoodItem goddessSalad = FoodItem(
    id: 'food_4',
    name: 'Avocado Green Goddess Salad',
    subtitle: 'Fresh & Co • Organic Greens',
    description:'Sliced avocado, organic baby kale, edamame, toasted pumpkin seeds with signature green goddess dressing.',
    price: 11.80,
    rating: 4.7,
    reviewCount: '430',
    prepTime: '15-20 min',
    deliveryFee: '\$0.99 Delivery',
    imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3stRmjVOoyQtjE8DQ2J_DhvfC9KGpt9wt4HS8Vh0C5Q&s=10',
    badge: 'Vegan',
    badgeColor: 'green',
    calories: 390,
    category: 'Salads',
  );

  static final List<FoodItem> foodList = [
    truffleBurger,
    artisanPizza,
    koreanChicken,
    goddessSalad,
  ];

  static const List<IngredientItem> ingredients = [
    IngredientItem(
      name: '100% Angus',
      subtitle: 'Prime Patties',
      iconName: '🥩',
    ),
    IngredientItem(
      name: 'Truffle Aioli',
      subtitle: 'House Emulsion',
      iconName: '🫙',
    ),
    IngredientItem(
      name: 'Vermont Cheddar',
      subtitle: 'Aged Melted',
      iconName: '🧀',
    ),
    IngredientItem(
      name: 'Brioche Bun',
      subtitle: 'Artisan Toasted',
      iconName: '🍞',
    ),
  ];
}
