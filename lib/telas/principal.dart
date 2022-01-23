import 'package:facebook_interface/componentes/navegacao_abas.dart';
import 'package:facebook_interface/componentes/navegacao_abas_desktop.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'home.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    const Home(),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.yellow),
    const Scaffold(backgroundColor: Colors.purple),
    const Scaffold(backgroundColor: Colors.black),
    const Scaffold(backgroundColor: Colors.orange),
  ];

  final List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    final Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: NavegacaoAbasDesktop(),
                preferredSize: Size(tamanho.width, 65))
            : null,
        body: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), //bloqueia o "arrastar tela para o lado"
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavegacaoAbas(
                indiceAbaSelecionada: _indiceAbaSelecionada,
                onTap: (indice) => setState(() {
                      _indiceAbaSelecionada = indice;
                    }),
                icones: _icones),
      ),
    );
  }
}
