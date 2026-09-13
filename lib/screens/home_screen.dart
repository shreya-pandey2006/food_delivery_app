import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../theme/app_theme.dart';
import '../widgets/reusable_widgets.dart';
import 'food_details_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  int _currentNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildOfferBanner(),
              const SizedBox(height: 20),
              _buildCategoriesSection(),
              const SizedBox(height: 24),
              _buildPopularSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar:_buildBottomNavigationBar(),
    );
  }
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppTheme.iconBgLight,shape: BoxShape.circle,
              ),
              child: const Icon(Icons.location_on,
                color: AppTheme.primaryRed,size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const Text('DELIVER TO',
                  style: TextStyle(
                    fontSize: 10,fontWeight: FontWeight.bold,color: AppTheme.textSecondary,letterSpacing: 0.5,
                  ),
                ),
                Row(
                  children: const [Text('742 Evergreen Terrace, Spring...',
                      style: TextStyle(
                        fontSize: 13,fontWeight: FontWeight.bold,color: AppTheme.textPrimary,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down,
                      size: 16,color: AppTheme.textPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Colors.white,shape: BoxShape.circle,border: Border.all(color: AppTheme.borderLight),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined,
                      size: 20,color: AppTheme.textPrimary,
                    ),
                  ),
                  Positioned(
                    top: -2,right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryRed,shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,minHeight: 16,
                      ),
                      child: const Text('2',
                        style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(color: Color(0xFF2D3748),shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person,size: 20,color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildSearchBar() {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.chipBg,borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: AppTheme.textMuted, size: 20),SizedBox(width: 10),
          Expanded(
            child: Text('Search dishes, restaurants or cuisines...',
              style: TextStyle(
                color: AppTheme.textMuted,fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.tune, color: AppTheme.textMuted, size: 18),
        ],
      ),
    );
  }
  Widget _buildOfferBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),gradient: const LinearGradient(colors: [Color(0xFF991B1B), Color(0xFFDC2626), Color(0xFFEA580C),
          ],
          begin: Alignment.topLeft,end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDC2626).withValues(alpha: 0.3),blurRadius: 12,offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('WELCOME OFFER',
                  style: TextStyle(color: Colors.white,fontSize: 9,fontWeight: FontWeight.bold,letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Get 30% OFF',
                style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w800,height: 1.1,
                ),
              ),
              const Text('on your first 3 orders',
                style: TextStyle(color: Colors.white70,fontSize: 12,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Claim Now',
                          style: TextStyle(color: Color(0xFF991B1B),fontSize: 11,fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),Icon(Icons.arrow_forward, size: 12, color: Color(0xFF991B1B)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.white30, width: 1),
                    ),
                    child: const Text('CRAVE30',
                      style: TextStyle(
                        color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold,letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,bottom: 0,top: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),shape: BoxShape.circle,
                ),
                child: const Text('🍔',
                  style: TextStyle(fontSize: 44),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Categories',
          style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold,color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(DemoData.categories.length,
              (index) => CategoryChip(category: DemoData.categories[index],
                isSelected: _selectedCategoryIndex == index,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPopularSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Popular Near You',
                  style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold,color: AppTheme.textPrimary,
                  ),
                ),
                SizedBox(height: 2),
                Text('Top-rated dishes prepared fresh right now',
                  style: TextStyle(fontSize: 11,color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
            const Text('See All >',
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppTheme.primaryRed,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ListView.builder(
	        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: DemoData.foodList.length,
          itemBuilder: (context, index) {
            final food = DemoData.foodList[index];
            return FoodCardTile(food: food,
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodDetailsScreen(food: food),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryRed,
        unselectedItemColor: AppTheme.textMuted,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),activeIcon: Icon(Icons.explore),label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),activeIcon: Icon(Icons.favorite),label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),activeIcon: Icon(Icons.receipt_long),label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),activeIcon: Icon(Icons.person),label: 'Profile',
          ),
        ],
      ),
    );
  }
}