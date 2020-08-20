import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  
  final List<Pelicula> peliculas;

  final Function siguientePagina;
  
  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,
          viewportFraction: 0.3,
  );
  
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _displaySize = _screenSize.height * 0.2;

    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    return Container(
      height: _displaySize,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        // children: _tarjetas(context, _displaySize),
        itemBuilder: (context, i) =>  _tarjeta(context, peliculas[i], _displaySize)
        ,
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula, double displaySize){
    return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
              height: displaySize * 0.85,
              ),
          ),
          SizedBox(height: 5.0,),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],)
      );
  }

}