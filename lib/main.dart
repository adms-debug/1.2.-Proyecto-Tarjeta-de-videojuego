import 'package:flutter/material.dart';

void main() {
  runApp(const CyberpunkStoreApp());
}

class CyberpunkStoreApp extends StatelessWidget {
  const CyberpunkStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // CONFIGURACIÓN DE TEMA BASE
      // ThemeData.dark() invierte la paleta por defecto a tonos oscuros (textos blancos).
      // copyWith() nos permite sobrescribir propiedades específicas, como el fondo.
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor define el fondo global de la pantalla.
        // Se usa un tono oscuro profundo (azul marino casi negro) para imitar el diseño original.
        scaffoldBackgroundColor: const Color(0xFF0D0D14),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Sans-serif'),
        ),
      ),
      home: const GameDetailScreen(),
    );
  }
}

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea es un widget crucial: añade padding automático para evitar que
      // la UI colisione con elementos del hardware del teléfono (el 'notch',
      // la isla dinámica o la barra de estado de Android/iOS).
      body: SafeArea(
        // SingleChildScrollView permite que el contenido sea 'scrolleable' verticalmente,
        // evitando errores de "overflow" (desbordamiento) en pantallas más pequeñas.
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. LOGO SUPERIOR
              Center(
                child: Image.asset(
                  'imagenes/Cyberpunk_2077_logo.svg.webp',
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // 2. IMAGEN HERO (PORTADA)
              // ClipRRect recorta a sus hijos (en este caso el Container/Imagen)
              // para que tengan las esquinas redondeadas especificadas en su borderRadius.
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'imagenes/cyberpunk_parte.png',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // 3. PANEL DE ESTADÍSTICAS Y DETALLES
              // Este Container simula una tarjeta ("Card") semitransparente.
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFF11111A,
                  ), // Un tono sutilmente más claro que el fondo
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ), // Esquinas redondeadas
                  // Border.all crea el fino delineado translúcido alrededor de la tarjeta
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                // IntrinsicHeight es VITAL aquí. Obliga a que la fila (Row) calcule la
                // altura del elemento más alto en su interior y expanda todos los demás
                // elementos a esa misma altura. Sin esto, los VerticalDivider no se verían
                // porque no sabrían qué altura ocupar.
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoColumn(
                        'Género',
                        'Rol / Acción',
                        Icons.sports_esports,
                        Colors.purpleAccent,
                      ),
                      // VerticalDivider traza una línea vertical de separación.
                      const VerticalDivider(
                        color: Colors.white12,
                        thickness: 1,
                      ),
                      _buildInfoColumn(
                        'Desarrollador',
                        'CD Projekt Red',
                        Icons.local_fire_department,
                        Colors.redAccent,
                      ),
                      const VerticalDivider(
                        color: Colors.white12,
                        thickness: 1,
                      ),
                      _buildPlatformColumn(),
                      const VerticalDivider(
                        color: Colors.white12,
                        thickness: 1,
                      ),
                      _buildInfoColumn(
                        'Lanzamiento',
                        '10 dic. 2020',
                        Icons.calendar_month,
                        Colors.purpleAccent[200]!,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 4. PANEL DE DESCRIPCIÓN
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF11111A),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DESCRIPCIÓN',
                      style: TextStyle(
                        color: Color(0xFFA575FF),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tras aceptar un encargo clandestino de alto riesgo que sale terriblemente mal, V se ve atrapado en una conspiración corporativa masiva. Con un chip experimental implantado en su cabeza que amenaza con destruir su propia mente, V inicia una desesperada carrera contrarreloj por las calles de Night City para encontrar una cura y sobrevivir.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        height: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 5. BOTÓN DE COMPRA (CTA - Call To Action)
              // Se usa un Container exterior para poder aplicar la sombra de resplandor (efecto neón).
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    // BoxShadow genera el brillo debajo del botón.
                    // blurRadius define lo difuminado que es el brillo.
                    // offset(0, 8) empuja la sombra 8 píxeles hacia abajo.
                    BoxShadow(
                      color: const Color(0xFF00B259).withValues(alpha: 0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009846),
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    // Se quita la elevación nativa (0) para que la sombra del Container
                    // sea la única que se muestre, logrando el efecto neón personalizado.
                    elevation: 0,
                  ),
                  child: const Text(
                    'Comprar 39.99\$',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Constructor auxiliar para las columnas del panel de estadísticas.
  /// Agrupa la lógica de construir el Título, el Subtítulo y el Icono inferior.
  Widget _buildInfoColumn(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    // Expanded fuerza a la columna a ocupar exactamente su fracción de espacio disponible en el Row.
    // Como hay 4 columnas, cada una ocupará un 25% del ancho de la pantalla, manteniendo la simetría.
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // La columna solo ocupará el alto estrictamente necesario
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // =========================================================================
          // EXPLICACIÓN SOLICITADA
          // =========================================================================

          // SizedBox actúa como una "caja vacía" invisible en la interfaz.
          // En este contexto, se utiliza como un separador vertical. Toma 12 píxeles de altura (height: 12)
          // y empuja el widget que tiene debajo (el Icon) hacia abajo, creando un margen de respiración
          // visual entre el texto del subtítulo y el icono para evitar que se vean amontonados.
          const SizedBox(height: 12),

          // Icon renderiza un gráfico vectorial (glifo) de la fuente de iconos de Material Design.
          // - 'icon': Es la variable (IconData) que define QUÉ símbolo mostrar (ej. el calendario o el fueguito).
          // - 'color': Es la variable (Color) que tiñe el icono, aplicando los tonos neón del diseño (morado, rojo, etc.).
          // - 'size: 22': Fija el ancho y alto del icono a 22 píxeles lógicos, haciéndolo ligeramente
          //               más pequeño que el tamaño por defecto (24px) para que encaje mejor en la tarjeta.
          Icon(icon, color: iconColor, size: 22),

          // =========================================================================
        ],
      ),
    );
  }

  /// Constructor auxiliar para la columna específica de "Plataformas" que requiere múltiples iconos
  Widget _buildPlatformColumn() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Plataformas',
            style: TextStyle(color: Colors.white54, fontSize: 10),
          ),
          const SizedBox(height: 22),
          // Un Row dentro del Column para colocar los iconos horizontalmente
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.gamepad, color: Colors.blueAccent, size: 18),
              SizedBox(width: 6), // Separador horizontal entre iconos
              //Icon(Icons.xbox, color: Colors.greenAccent, size: 18),
              SizedBox(width: 6),
              Icon(Icons.window, color: Colors.lightBlue, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
