import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary_ui_204/models/food.dart';
import 'package:food_delivary_ui_204/models/restaurant.dart';
import 'package:food_delivary_ui_204/widgets/rating_order.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem){
      return Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 175.0,
                width: 175.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage(menuItem.imageUrl),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(15.0)
                ),
              ),
            ),
            Container(
              height: 175.0,
              width: 175.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3)
                  ],
                  stops: [0.1,0.4,0.6,0.9]
                )
              ),
            ),
            Positioned(
              bottom: 60.0,
              child: Column(
                children: [
                  Text(menuItem.name,style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold,letterSpacing: 1.2)),
                  Text('\$${menuItem.price}',style: TextStyle(color: Colors.white,fontSize: 18.0,letterSpacing: 1.2),)
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
                right: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 30.0,
                    color: Colors.white, onPressed: () {  },
                  ),
                ))
          ],
        ),
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.restaurant.imageUrl,
                    child: Image(
                      height: 220.0,
                      width: MediaQuery.of(context).size.width,
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30.0,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.favorite),
                          color: Theme.of(context).primaryColor,
                        )
                ],
              ),),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('0.2 miles away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6.0,),
                RatingStars(
                  widget.restaurant.rating
                ),
                SizedBox(height: 6.0,),
                Text('200 mt main road New York',
                style: TextStyle(
                  fontSize: 18.0
                ),),
                SizedBox(height: 10.0),
                //add row for button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {  },
                      child: Text('Reviews'),
                    ),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text('Contact'))
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                }
                ),
            ),
          )
        ],
      ),
    );
  }
}
