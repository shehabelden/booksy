import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,i){
        return Padding(
          padding: const EdgeInsets.only(right: 20.0,left: 20,bottom: 20),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160.0),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12),bottomRight:Radius.circular(12) )
                  ),
                  child:const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                         Icon(Icons.upload,color: Colors.grey),
                        SizedBox(width: 200,),
                        Icon(Icons.chat_bubble_outline,color: Colors.grey),
                        SizedBox(width: 20,),
                        Icon(Icons.favorite_border,color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
