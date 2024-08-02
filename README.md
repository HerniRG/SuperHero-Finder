
# SuperHero Finder

SuperHero Finder es una aplicación de iOS desarrollada en SwiftUI que permite buscar información sobre superhéroes utilizando la API de ApiNetwork. La aplicación muestra detalles como estadísticas de poder, biografía, apariencia, trabajo y conexiones de los superhéroes.

## Capturas de pantalla

### Modo Oscuro
![Main Screen Dark](https://live.staticflickr.com/65535/53897813090_eaf80357f7_o.png)
![Details Screen Dark](https://live.staticflickr.com/65535/53897734519_ee1de23210_o.png)

### Modo Día
![Main Screen Light](https://live.staticflickr.com/65535/53897387516_72e26fc52b_o.png)
![Details Screen Light](https://live.staticflickr.com/65535/53897813150_0034b98eca_o.png)

## Características

- Buscar superhéroes por nombre.
- Ver estadísticas detalladas de poder.
- Consultar biografía, apariencia, trabajo y conexiones de cada superhéroe.
- Interfaz de usuario limpia y moderna.

## Requisitos

- iOS 14.0 o superior
- Xcode 12.0 o superior
- Swift 5.0 o superior

## Instalación

1. Clona este repositorio en tu máquina local:
    ```sh
    git clone https://github.com/HerniRG/SuperHero-Finder.git
    ```

2. Abre el proyecto en Xcode:
    ```sh
    cd superhero-finder
    open SuperHeroFinder.xcodeproj
    ```

3. Instala las dependencias utilizando Swift Package Manager:
    - Navega a `File > Swift Packages > Add Package Dependency`.
    - Añade la dependencia para `SDWebImageSwiftUI`:
        ```sh
        https://github.com/SDWebImage/SDWebImageSwiftUI.git
        ```

4. Compila y ejecuta la aplicación en un simulador o dispositivo físico.

## Uso

1. En la pantalla principal, ingresa el nombre de un superhéroe en el campo de texto.
2. Presiona tecla enter para realizar la búsqueda.
3. Selecciona un superhéroe de la lista de resultados para ver los detalles.

## Contacto

Autor: Hernán Rodríguez  
Correo electrónico: hernanrg85@gmail.com
