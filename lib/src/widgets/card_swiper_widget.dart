import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiperWidget({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            return crearTarjeta(context, peliculas[index]);
          },
          itemCount: peliculas.length,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5),
    );
  }

  Widget crearTarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uniqueID = '${pelicula.id}-tarjeta';
    final tarjeta = Hero(
        tag: pelicula.uniqueID,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(pelicula.getPosterImg()),
              fit: BoxFit.cover,
            )));

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        print('ID de la pelicula ${pelicula.id}');
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
