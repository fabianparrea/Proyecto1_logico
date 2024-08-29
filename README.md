# Tarea1_Osejo_Paniaguerra_Salas

## 1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays
- **HDL**: Hardware Descriptive Language
- **Gray Code**: Sistema de numeración binaria en cuyos números consecutivos difieren en un solo bit
- **BCD**: Binary Code Decimal
- **7 Segmentos**: Arreglo de diodos LED dispuestos de tal forma para representar los dígitos del sistema decimal

## 2. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

## 3. Desarrollo

### 3.0 Descripción general del sistema

### 3.1 Módulo 1
#### 1. Encabezado del módulo
```SystemVerilog
module gray(input logic [3:0] s,
            output logic b3, b2, b1, b0);
```
#### 2. Parámetros
-

#### 3. Entradas y salidas:
- `entrada_s`: un array de tamaño 4 para leer el estado del dipswitch
- `salida_b3, b2, b1, b0`: salidas lógicas para alojar los bits del número en binario, b3 el más significativo y b0 el menos

#### 4. Criterios de diseño
    Se establece la función gray para convertir desde el MSB hasta el menos, s[3] se asigna directamente a b3. Usando lógica combinacional (sin flip-flops ni registros de memoria) el estado de las salidas cambia al instante al cambiar las entradas.
    El tamaño de los arreglos es tal para que el codigo gray pueda, con 4 bits, representar hasta 15 números.

#### 5. Testbench
En cada prueba del testbench se aplica el un código gray a la entrada 's', esperando que las salidas b3, b2, b1 y b0 reflejen la salida en binario; algunos ejemplos:

    Prueba 0: s = 4'b0000 (Gray: 0), Salida: b3b2b1b0 = 0000 (Binario: 0)
    Prueba 1: s = 4'b0001 (Gray: 1), Salida: b3b2b1b0 = 0001 (Binario: 1)
    Prueba 2: s = 4'b0011 (Gray: 2), Salida: b3b2b1b0 = 0010 (Binario: 2)

### 3.2 Módulo 2
#### 1. Encabezado del módulo
```SystemVerilog
module bcd(input logic [3:0] s,
            output logic [7:0] w);
```
#### 2. Parámetros
- Se tienen las variables a, b, c y d. Para alojar la salida del módulo gray.

#### 3. Entradas y salidas:
- `entrada_s [3:0]`: Un vector para 4 bits que representa el valor en código gray.
- `salida_w [7:0]`: Vector de salida de 8 bits. Su codificación es en binario deciman (BCD) listo para mostrar en el 7 segmentos. 

#### 4. Criterios de diseño
    Se utiliza el módulo gray de forma interna para convertir el valor de entrada 's' a binario, guardada posteriormente en las variables. 
    Luego es necesario hacer el codificado de la salida BCD en 'w' a través de las expresiones igualadas a 'y', por ejemplo:

    y[3]: Se activa si a es 1, mientras que b y c son 0.
    y[2]: Se activa si b es 1, mientras que a es 0 o c es 1.

    Como no se utiliza el MSB (y[7:5]), se le asigna el valor de cero.

#### 5. Testbench
    En cada prueba se aplica una expresión en código gray a la entrada 's' y se espera que en la salida 'w' se vea reflejada la conversión a BCD, algunos ejemplos:

    Prueba 7: s = 4'b0100 (Gray: 7), Salida: w = 8'b00000111 (BCD: 07)
    Prueba 8: s = 4'b1100 (Gray: 8), Salida: w = 8'b00001000 (BCD: 08)
    Prueba 9: s = 4'b1101 (Gray: 9), Salida: w = 8'b00001001 (BCD: 09)
    Prueba 10: s = 4'b1111 (Gray: 10), Salida: w = 8'b00010000 (BCD: 10)

### 3.3 Módulo 3
#### 1. Encabezado del módulo
```SystemVerilog
module ledsbin(input logic [3:0] s,
                output logic led3, led2, led1, led0);
```
#### 2. Parámetros
- `inv_led3, inv_led2, inv_led1, inv_led0`: Variables para los leds negados.

#### 3. Entradas y salidas:
- `entrada_s [3:0]`: Un vector para 4 bits que representa el valor en código gray.
- `salida_led3, led2, led1, led0`: Señales para controlar el encendido y apagado de los leds en la FPGA, representan el número binario final.

#### 4. Criterios de diseño
    Debido a que los leds en la FPGA son de cátodo común (pero el resto de los módulos del proyecto se escribieron no contando con esta información para este momento) se obta por negarlos para mantener la coherencia.

#### 5. Testbench
    Aquí se aplica un código gray a la entrada 's' para obtener en las salidas ledx, el valor binario (invertido) correspondiente, ejemplos:

    Prueba 2: s = 4'b0011 (Gray: 2), Salidas: led3 = 1, led2 = 1, led1 = 0, led0 = 1
    Prueba 3: s = 4'b0010 (Gray: 3), Salidas: led3 = 1, led2 = 1, led1 = 0, led0 = 0

    Mismamente para todas las combinaciones posibles.


### 3.4 Módulo 4
#### 1. Encabezado del módulo
```SystemVerilog
module segm(input logic [3:0] s, 
            input logic bot,
            output logic a, b, c, d, e, f, g, an0, an1, led3, led2, led1, led0);
```
#### 2. Parámetros
-

#### 3. Entradas y salidas:
- `entrada_s [3:0]`: Vector de 4 bits para recibir el número en código gray, para posterior conversión.
- `entrada_bot`: Entrada para el botón de selección entre unidades y decenas del 7 segmentos.
- `salidas_a, b, c, d, e, f, g`: Corresponden a los segmentos del 7 segmentos
- `salidas_an0, an1`: Señales para escoger cual 7 segmentos activar. Puestos ambos activos simultáneamente para este proyecto.
- `salidas_led3, led2, led1, led0`: Salidas para los LEDs de la FPGA, en binario invertido

#### 4. Criterios de diseño
    Se asginan ambas salidas am0,1 para actuar a la vez.
    Se definen el vector y para recibir la salida del módulo bcd.
    Hasta aquí la recepeción del bcd, pasando por la asignación del multiplexor para seleccionar entre decenas o unidades, se continúa con determinar la salida en cada segmento del 7 segmentos según su expresión lógica correspondiente


#### 5. Testbench
    Se decide por asignar en 1 el bot para que el display de 7 segmentos solo muestre unidades, se siguen distintas pruebas manteniendo para cada una el valor de bot pero ingresando en 's' valores distintos en código gray, espaciadas entre sí por delays de 10.

## 4. Consumo de recursos
    Del proyecto:
        x1 FPGA Tangnano 9k

    Adicionales:
        1x Protoboard estándar
        1x 7 Segmentos de ánodo común
        7x Resistencias de 100k ohmios
        x4 Resitencias de 320 ohmios
        2x Resistencias de 220 ohmios
        Varios puentes y jumppers
                

## 5. Problemas encontrados durante el proyecto
    Diversos percances se presentaron durante el desarrollo, desde errores conceptuales sobre el código gray y su distinción del binario, sintaxis general de verilog y su escritura, de implementación de métodos de resolución de la conversión (como los mapas de karnough para obtener las expresiones algebráicas correspondientes a cada segmento del 7 segmentos).

    Limitaciones técnicas y de hardware producto de la interpretación del problema y los materiales a disposición, como el ajuste de la lógica de los módulos al evindenciar que el 7 segmentos suministrado es uno de cátodo común, en lugar de ánodo común.

## Apendices:
### Apendice 1:
texto, imágen, etc
