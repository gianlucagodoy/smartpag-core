import 'package:flutter/material.dart';

import '../../dependencies/dependecies.dart';

/*
 * Define o tipo de função que recebe um contexto de construção, argumentos opcionais e retorna um Widget. 
 * 
 * @param context O contexto de construção do widget. 
 * 
 * @param args Os argumentos opcionais passados para a função. 
 * 
 * @return O widget construído com base no contexto e nos argumentos fornecidos. 
 * 
 */
typedef WidgetBuilderArgs = Widget Function(
  BuildContext context,
  Arguments? args,
);
