---
tags:
  - SIPROCU
  - notas
  - universidad
created: 14-04-2026
updated: 14-04-2026
---
# Notas SIPROCU

## Observaciones iniciales
- Git branches: es posible que empecemos a usar branches en SIPROCU, ya que anteriormente no se usaba (OK).
- Explorar a Arturo.
- Ejecutar la acción que nos diga cuántos cursos abrir el otro ciclo en base a cuántos aprobaron.
- Tienen que cargar las mallas de las carreras, requisitos y correquisitos.
- Al suave saber cuántos pasaron y cuántos no, ir creando un historial de los estudiantes para saber cuántos pasaron y cuántos no.

## Requisitos y necesidades
1) Que podamos modificar cosas.

2) Sismología:
- Quieren trabajar en dos cosas: sismología y otra línea.
- Red neuronal en PyTorch.
- Se alimenta de sismos, carga los datasets y logra clasificar los sismos y cuando no.
- También se iba a trabajar con OVSICORI, que tiene mucha información.
- A veces un sismo hace que el osciloscopio brinque y luego se estabilice, pero mientras está supuestamente estable, hay supuestos sismos no apreciables a simple vista (considerados ruido, siempre hay de fondo).
- El profesor ya logró montar unos datasets; eso ocupan que hagamos.
- Para lo de los sismos, el profe quiere lo de Kabré.

3) Detección de SDC (Silent Data Corruption):
- Ayudar a Elvis a buscar información.
- Es una cuestión con una gente de SJ sobre cómo detectar SDC (fallos que no causan caída).
- Un asistente está encargándose de eso.
- Ocupa buscar información de artículos sobre eso, y sobre qué pasa si se le da un bit flip.

4) Analizar grupos de personas con inteligencia artificial:
- Por ejemplo: una red neuronal con una cámara grabando al grupo de Sistemas Operativos.
- Por IA se detectan las caras.
- La clase dura 4 horas.
- Cuando ven a Aryel está muy feliz porque la profe está dando clases, y Alex está distraído.
- Analizar los temas y actividades dadas por el profe para que la IA determine el nivel de satisfacción.
- La idea es determinar cómo hacer eso, qué software usar y qué software utilizar.
- Nota: siempre todo lo hacen en Python pero con nivel inferior de lenguajes de bajo nivel.s

## Tasks
- Calcular jornadas, horas (SIPROCU).
- Hay diferentes tipos de nombramiento (categorías de profe, instructor, profesor 1, 2, 2.5, etc.).
- Dependiendo de la categoría son diferentes; un profe puede dar 3 cursos y ser tiempo completo, pero otro profe puede dar 3 cursos y ser 3/4 de tiempo.
- El sistema tiene que saber hacer eso.
- La idea es generar un reporte.

- Uno de nosotros se va a encargar de buscar información sobre cómo detectar patrones en personas:
  - análisis de sentimientos
  - PLN
  - machine learning
  - artículos de ACM (Association for Computing Machinery)
  - ACM Digital Library
  - compartirle al profe qué encontramos.

- Lo de los sismos ya mencionado antes: para lo de los sismos el profe quiere lo de Kabré.
- Opción: el profe le gustaría cómo poner una pantalla táctil en la entrada y que se vea la U en 3D.
- También comentó: usted quiere ir al CIUNA, y se mete por todos los lados llevando como guiado (anda loco el profe aquí).

## Notas adicionales
- SLURM (cluster management) para resource management: eso reparte recursos, es interesante.
