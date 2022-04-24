import 'package:e_coin/models/noticias.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int i) {
          return _Noticia(noticia: noticias[i], index: i);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            _TarjetaTitulo(noticia),
            _TarjetaImagen(noticia),
            _TarjetaBotones(noticia),
            const SizedBox(height: 15.0),
          ],
        ));
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.title, style: Theme.of(context).textTheme.headline3),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
            constraints: const BoxConstraints(
              maxHeight: 200, //max height
            ),
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const Image(
                          image: AssetImage('assets/img/dragon.png'));
                    },
                    placeholder:
                        const AssetImage('assets/img/loadingDataTr.gif'),
                    image: NetworkImage(noticia.urlToImage),
                  )
                : const Image(
                    image: AssetImage('assets/img/dragon.png'),
                  )),
      ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Article noticia;

  const _TarjetaBotones(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => _NoticiaCompleta(noticia)),
            )
          },
          child: Text('Ver más',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.white)),
        ),
      ],
    );
  }
}

// Noticia completa
class _NoticiaCompleta extends StatelessWidget {
  final Article noticia;
  late WebViewController controller;

  _NoticiaCompleta(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/img/dragon.png',
                fit: BoxFit.contain,
                height: 40,
              ),
            ],
          )),
      body: WebView(
        initialUrl: noticia.url,
        javascriptMode: JavascriptMode.disabled,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
      ),
    );
  }
}
