# Guía: Cómo configurar la clase de entrada y empaquetado ejecutable en Java con Maven

Esta guía explica por qué y cómo se configura una clase lanzadora (`AppLauncher`) y un plugin de empaquetado (`maven-shade-plugin`) para generar un archivo `.jar` ejecutable que incluya todas sus dependencias y pueda asociarse a un acceso directo.

---

## Parte 1: ¿Por qué creamos `AppLauncher.java`?

En Java, cualquier aplicación de consola o de escritorio necesita un punto de entrada: un método con la firma exacta:
```java
public static void main(String[] args)
```

### ¿Por qué no ponerlo directamente en `App.java`?

Hay varias razones prácticas para separar esto:

1. **Separación de responsabilidades:** `App` suele contener la lógica de interfaz, inicialización de frameworks o configuración de vistas. Mezclarlo con el punto de entrada puede dificultar las pruebas unitarias o la integración con herramientas de empaquetado.

2. **Control de argumentos:** `AppLauncher` actúa como un puente limpio. Recibe los argumentos del sistema, los pasa intactos a `App.main()`, y evita inicializaciones prematuras.

3. **Compatibilidad con empaquetadores:** Algunos plugins o entornos esperan una clase específica para inyectar el `Main-Class` en el manifiesto. Tener un lanzador dedicado simplifica este proceso.

### Código base

Cree un archivo llamado `AppLauncher.java` en la ruta `src/main/java/cr/ac/una/suPaquete/`:

```java
package cr.ac.una.suPaquete; // Reemplaza "suPaquete" por su paquete real

/**
 * Clase lanzadora dedicada.
 * Su única responsabilidad es delegar la ejecución a la clase App.
 */
public class AppLauncher {
    public static void main(String[] args) {
        // Delegamos la ejecución manteniendo los argumentos originales
        App.main(args);
    }
}
```

Verifique rápidamente que:
- Existe una clase `App.java` en el mismo paquete con `public static void main(String[] args)`
- El nombre del paquete en `package` coincida exactamente con la estructura de carpetas

---

## Parte 2: Configurar `maven-shade-plugin` en `pom.xml`

Maven no empaqueta dependencias por defecto. Si su proyecto usa librerías externas, el JAR resultante fallará con `ClassNotFoundException` si no las incluimos. El `maven-shade-plugin` resuelve esto creando un "fat JAR" que contiene todas las dependencias compiladas dentro, modifica automáticamente el archivo `META-INF/MANIFEST.MF` para indicar cuál es la clase principal, y resuelve conflictos de nombres y firmas digitales al fusionar JARs.

### Bloque a agregar en `<build><plugins>`

Abra su `pom.xml` y localice la sección `<plugins>`. Agregue el siguiente bloque:

```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-shade-plugin</artifactId>
  <version>3.5.2</version>
  <executions>
    <execution>
      <!-- Se ejecuta automáticamente cuando corre: mvn package -->
      <phase>package</phase>
      <goals>
        <goal>shade</goal>
      </goals>
      <configuration>
        <!-- Define la clase que se ejecutará al dar doble clic o usar java -jar -->
        <transformers>
          <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
            <mainClass>cr.ac.una.suPaquete.AppLauncher</mainClass>
          </transformer>
        </transformers>
        <!-- Evita conflictos con firmas digitales de librerías de terceros -->
        <filters>
          <filter>
            <artifact>*:*</artifact>
            <excludes>
              <exclude>META-INF/*.SF</exclude>
              <exclude>META-INF/*.DSA</exclude>
              <exclude>META-INF/*.RSA</exclude>
            </excludes>
          </filter>
        </filters>
      </configuration>
    </execution>
  </executions>
</plugin>
```

Algunos detalles importantes sobre lo que está sucediendo:

- `<phase>package</phase>` indica en qué etapa del ciclo de vida de Maven se ejecuta. `package` ocurre después de compilar y probar.
- `<goal>shade</goal>` es la acción específica del plugin: fusionar clases y dependencias.
- `ManifestResourceTransformer` reescribe `MANIFEST.MF` para incluir `Main-Class: ...`. Sin esto, `java -jar` no sabría qué ejecutar.
- Los filtros que excluyen `META-INF/*.SF`, `META-INF/*.DSA` y `META-INF/*.RSA` son necesarios porque las librerías suelen venir firmadas. Al fusionarlas, las firmas se rompen y Java lanza `SecurityException`. Estos filtros las eliminan de forma segura.

Asegúrese de que el valor en `<mainClass>` coincida exactamente con el paquete y nombre de su `AppLauncher.java`.

---

## Parte 3: Construir y ejecutar

1. Abra una terminal en la carpeta raíz de su proyecto (donde está `pom.xml`).
2. Ejecute:
   ```bash
   mvn clean package
   ```
3. Si todo compila correctamente, Maven generará dos archivos en `target/`:
   - `su-proyecto-1.0-SNAPSHOT.jar` (JAR original)
   - `su-proyecto-1.0-SNAPSHOT-shaded.jar` (JAR ejecutable con dependencias)

4. Pruébelo con:
   ```bash
   java -jar target/su-proyecto-1.0-SNAPSHOT-shaded.jar
   ```

Si la aplicación inicia sin errores, su configuración es correcta.

---

## Cómo crear un acceso directo (Windows / macOS / Linux)

Una vez validado que `java -jar` funciona, puede asociar el JAR a un ícono:

**Windows:**
1. Copie el `-shaded.jar` a una carpeta permanente.
2. Clic derecho → `Crear acceso directo`.
3. Edite las propiedades → Destino: `"C:\ruta\java.exe" -jar "C:\ruta\app-shaded.jar"`

**macOS:**
Puede usar `chmod +x` en un script `.command` o arrastrar el JAR a `Automator` → `Ejecutar shell script`: `java -jar "$1"`

**Linux:**
Cree un archivo `.desktop` en `~/.local/share/applications/` con `Exec=java -jar /ruta/app-shaded.jar`

El acceso directo no compila ni empaqueta. Solo es un lanzador que ejecuta el mismo comando que ya probó en la terminal.

---

## Preguntas para reflexionar

1. ¿Qué pasaría si olvida cambiar `nombrePaquete` en el `pom.xml` pero sí lo cambia en `AppLauncher.java`?
2. ¿Por qué el plugin se llama `shade` y no `jar` o `bundle`?
3. Si su proyecto usa JavaFX, ¿por qué a veces se requiere un lanzador separado?
4. ¿Cómo verificaría qué clase está definida como `Main-Class` dentro de un JAR? (Puede usar `jar tf` o descomprimir y abrir `META-INF/MANIFEST.MF`)

---

## Recursos útiles

- [Maven Shade Plugin Docs](https://maven.apache.org/plugins/maven-shade-plugin/)
- [Java Manifest Specification](https://docs.oracle.com/javase/tutorial/deployment/jar/manman.html)
- [Ciclo de vida de Maven](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

Si algo falla, revise primero la coincidencia de nombres de paquete y la salida de `mvn package`. El 90% de los errores en esta etapa se deben a inconsistencias entre el `package` de Java y el `<mainClass>` de Maven.