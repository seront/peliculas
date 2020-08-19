import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){},
            )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
        ],),
        ) 
    );
  }

  Widget _swiperTarjetas() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: 300,
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context,int index){
            return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
          },
          itemCount: 3,
          itemWidth: 250,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ),
    );
  }
}