# retoBackEndSoaint
Mario Martin Anciburo

# Karate API Test Project

Este proyecto automatiza pruebas funcionales para una API REST utilizando el framework **[Karate](https://github.com/karatelabs/karate)**. Se implementa un CRUD completo sobre el endpoint `https://serverest.dev/`, aplicando principios de reutilización y buenas prácticas de BDD.

---

## Estructura del Proyecto

```
├── src
│   └── test
│       ├── java
│       │   └── com.RESTAPI.test
│       │       └── TestRunner.java
│       └── resources
│           ├── CP01ListarUsuarios.feature
│           ├── CP02ListarUsuariosID.feature
│           ├── CP03RegistrarUsuario.feature
│           ├── CP04ActualizarUsuario.feature
│           ├── CP05EliminarUsuario.feature
│           └── karate-config.js
├── pom.xml
└── README.md
```

---

## ⚙Requisitos Previos

- Java 17 o superior
- [Maven](https://maven.apache.org/)
- IntelliJ IDEA
- Plugin Cucumber for Java (opcional pero recomendado)

---

## Dependencias Principales (`pom.xml`)

```xml
<dependencies>
    <dependency>
        <groupId>com.intuit.karate</groupId>
        <artifactId>karate-junit5</artifactId>
        <version>1.4.1</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <version>1.4.11</version>
    </dependency>
</dependencies>
```

---

## ¿Cómo ejecutar las pruebas?
1. Clonar el repositorio

git clone https://github.com/riomatter/retoBackEndSoaint.git

### Desde IntelliJ IDEA:

1. Abre el proyecto en IntelliJ.
2. Navega a la clase `TestRunner.java` (`com.RESTAPI.test`).
3. Haz clic derecho sobre el método `test()` y selecciona `Run 'TestRunner'`.

### 🛠️ Desde la línea de comandos:

```bash
mvn test
```

---

## Configuración de autenticación

El archivo `karate-config.js` contiene las credenciales de autenticación usadas para obtener el token JWT:

```js
function fn() {
  var config = {
    apiUrl: 'https://serverest.dev/',
    email: 'suso@qa.com.br',
    password: 'teste'
  };
  karate.log('Loaded karate-config.js successfully');
  return config;
}
```

---

## Features implementados

| Archivo Feature                | Descripción                             |
|------------------------------|-----------------------------------------|
| CP01ListarUsuarios.feature   | Listar usuarios y validar errores       |
| CP02ListarUsuariosID.feature | Obtener usuario por ID                  |
| CP03RegistrarUsuario.feature | Registrar nuevo usuario (POST)          |
| CP04ActualizarUsuario.feature| Actualizar usuario (PUT)                |
| CP05EliminarUsuario.feature  | Eliminar usuario (DELETE)               |

---

## Reportes

Karate genera por defecto un reporte HTML en:

```
target/karate-reports/karate-summary.html
```

---

## Logs

Se guardan en:

```
target/karate.log
```

Controlados por el archivo `logback-test.xml`.
