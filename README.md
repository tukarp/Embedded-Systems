# Systemy Wbudowane

## Spis treści

### [Projekty](#projekty)

### Notatki

- [Notatki](#notatki-1)

# Projekty

Projekty zegarków dla DSM-51 z obsługą przerwań, wyświetlacza 7-segmentowego i klawiatury napisane w języku C oraz Assembler.

- [Zegarek dla DSM-51 w języku C](https://github.com/tukarp/Embedded-Systems/blob/main/DSM-51-CLOCK-IN-C/DSM-51-CLOCK-IN-C.c)
- [Zegarek dla DSM-51 w języku Assembler](https://github.com/tukarp/Embedded-Systems/blob/main/DSM-51-CLOCK-IN-ASM/DSM-51-CLOCK-IN-ASM.asm)

# Notatki

## Systemy wbudowane

### Definicje podzespołów systemów wbudowanych

```Systemy wbudowane``` - jest to system specjalnego przeznaczenia (np. system mikroprocesorowy wraz z oprogramowaniem), będący integralnym elementem sterowanego sprzętu.

```Procesor``` / ```Mikroprocesor``` - stanowi element większego systemu. Do poprawnej pracy wymaga dodatkowych podzespołów.

```Mikrokontroler``` - jest układem scalonym, którego struktura przeważnie umożliwia samodzielne wykonywanie operacji arytmetycznych i sterowanie układami lub elementami zewnętrznymi. Zawiera kompletny system, czyli CPU, pamięć i układy wejścia / wyjścia.

```System mikroprocesorowy``` - kompletny system w którego skład wchodzi mikrokontroler lub mikroprocesor wraz z niezbędnymi układami pamięci oraz układami wejścia / wyjścia.

### Zalety mikrokontrolerów

- niski koszt,
- małe rozmiary,
- bezawaryjność,
- niski pobór prądu,
- elastyczność w wykorzystaniu,
- możliwość sterowania urządzeniami,
- możliwość natychmiastowej reakcji na zdarzenia i zmiany,

### Poziomy oprogramowania systemu wbudowanego

```Oprogramowanie systemu wbudowanego```:
- ```C```, ```C++```, ```Java```, ```BASIC``` - języki programowania wyższego poziomu,
- ```Język Assemblera``` - 
- ```Kod maszynowy```
- ``` ``` - 

### ```Intel 8051``` - rdzeń mikrokontrolera

W skład rdzenia mikrokontrolera ```Intel 8051``` wchodzą:

- jeden port szeregowy,
- wbudowana pamięć ```ROM``` o wielkości 4kB,
- wbudowana pamięć ```RAM``` o wielkości 128B,
- dwa 16-bitowe układy czasowo-licznikowe,
- sterownik przerwań z układem priorytetów,
- 8-bitowa centralna jednostka procesorowa (```CPU```),
- układ generatora sygnału taktującego ```OSC``` (zegar procesora),
- cztery ośmiobitowe, równoległe porty wejścia / wyjścia (```P0...P3```),

### ```Intel 8051``` - opis pinów

- ```Piny 1 - 8``` - ```Port P1``` -  każdy z tych pinów może zostać wykorzystany jako wejściowy lub wyjściowy,
- ```Pin 9``` - ```RST``` - zatrzymuje pracę mikrokontrolera i opróżnia zawartość większości rejestrów (logiczna 1). Zmiana stanu tego pinu kolejno z logicznej 1 na logiczne 0 powoduje, że mikrokontroler rozpocznie wykonanie programu od początku,
- ```Piny 10 - 17``` - ```Port P3``` - każdy z tych pinów może zostać skonfigurowany jako wejściowy lub wyjściowy. Ponadto każdy z tych pinów posiada własną, alternatywną funkcjonalność,
- ```Piny 18 i 19``` - ```XTAL2``` i ```XTAL1``` - miejsce dołączenia zewnętrznego oscylatora kwarcowego, decydującego o szybkości pracy mikrokontrolera,
- ```Pin 20``` - ```GND``` - uziemienie,
- ```Piny 21 - 28``` - ```Port P2``` - każdy z tych pinów może zostać skonfigurowany jako wejściowy lub wyjściowy. W przypadku, gdy mikrokontroler wykorzystuje zewnętrzne układy pamięci, port ten wykorzystywany jest wyłącznie wcelu przekazania im starszej części adresu (bity A8 – A15),
- ```Pin 29``` - ```PSEN``` - ```Program Store Enable``` - linia jest wykorzystywana gdy mikrokontroler wykonuje kod z zewnętrznej pamięci ```ROM```. Pin ten zmienia swój stan na logiczne 0 za każdym razem, gdy mikrokontroler stara się pobrać kolejny bajt kodu do wykonania z zewnętrznej pamięci ```ROM```,
- ```Pin 30``` - ```ALE``` - ```Address Latch Enable``` - linia wykorzystywana gdy mikrokontroler wykorzystuje zewnętrzne układy pamięci,
- ```Pin 31``` - ```EA``` - ```External Acces Enable``` - Jeżeli chcemy, aby mikrokontroler pobierał rozkazy do wykonania wyłącznie z zewnętrznej pamięci ```ROM```, wówczas musimy wymusić na tym pinie stan logicznego 0. Wymuszenie na tym pinie stanu logicznej 1 spowoduje, że mikrokontroler w pierwszej kolejności wykona program zapisany w pamięci wewnętrznej i dopiero w przypadku przekroczenia adresu wbudowanej pamięci programu spróbuje odwołać się do pamięci zewnętrznej,
- ```Piny 32 - 39``` - ```Port P0``` - każdy z tych pinów może zostać skonfigurowany jako wejściowy lub wyjściowy. W przypadku, gdy mikrokontroler wykorzystuje zewnętrzne układy pamięci, port ten wykorzystywany jest wyłącznie, aby przekazać im młodszą część adresu (bity A0 – A7) gdy linia ```ALE``` jest w stanie logicznej 1 lub jako magistrala danych gdy pin ```ALE``` jest w stanie logicznego 0,
- ```Pin 40``` - ```VCC``` - napięcie zasilania.

### Poziomy napięć

- ```VIH``` - napięcie na wejściu elementu, które zostanie zinterpretowane przez układ cyfrowy jako stan wysoki 1 (```High```),
- ```VIL``` - napięcie na wejściu elementu, które zostanie zinterpretowane przez układ cyfrowy jako stan niski 0 (```Low```),
- ```VOH``` - napięcie na wyjściu elementu oznaczające stan wysoki 1 (```High```),
- ```VOL``` - napięcie na wyjściu elementu oznaczające stan niski 0 (```Low```).

### Przedrostki sytemu ```SI```

| Nazwa | Prefix |                Rozmiar               |
| :---: | :----: | :----------------------------------: |
| Kilo  | k      | 103 = 1 000 * 1                      |
| Mega  | M      | 106 = 1 000 000 = 1 000 * 1k         |
| Giga  | G      | 109 = 1 000 000 000 = 1 000 * 1M     |
| Tera  | T      | 1012 = 1 000 000 000 000 = 1000 * 1G |

### Przedrostki sytemu ```IEC```

| Nazwa | Prefix |                Rozmiar               |
| :---: | :----: | :----------------------------------: |
| Kibi  | Ki     | 210 = 1024 * 1                       |
| Mebi  | Mi     | 220 = 1 048 576 = 1024 * 1Ki         |
| Gibi  | Gi     | 230 = 1 073 741 824 = 1024 * 1Mi     |
| Tebi  | Ti     | 240 = 1 099 511 627 776 = 1024 * 1Gi |

### System pozycyjny zapisu liczb

```System pozycyjny``` - to sposób zapisu liczb, w którym każda cyfra ma przypisaną wartość zależną od jej pozycji w liczbie.

```LSB``` - Least Significant Bit - Najmniej znaczący bit.

```MSB``` - Most Significant Bit - Najbardziej znaczący bit.

### Systemy liczbowe

| System dziesiętny | System szesnastkowy | System dwójkowy |
| :---------------: | :-----------------: | :-------------: |
|        $0$        |         $0$         |      $0000$     |
|        $1$        |         $1$         |      $0001$     |
|        $2$        |         $2$         |      $0010$     |
|        $3$        |         $3$         |      $0011$     |
|        $4$        |         $4$         |      $0100$     |
|        $5$        |         $5$         |      $0101$     |
|        $6$        |         $6$         |      $0110$     |
|        $7$        |         $7$         |      $0111$     |
|        $8$        |         $8$         |      $1000$     |
|        $9$        |         $9$         |      $1001$     |
|        $10$       |         $A$         |      $1010$     |
|        $11$       |         $B$         |      $1011$     |
|        $12$       |         $C$         |      $1100$     |
|        $13$       |         $D$         |      $1101$     |
|        $14$       |         $E$         |      $1110$     |
|        $15$       |         $F$         |      $1111$     |

### Zapisy systemów liczbowych

- ```System dziesiętny``` - dopisanie liter ```d``` lub ```D```, np:
    - ```10d```,
    - ```10D```,
    - ```010d```,
    - ```010D```,
- ```System dwójkowy``` - dopisanie liter ```b``` lub ```B```, np:
    - ```1010b```,
    - ```1010B```,
    - ```01010b```,
    - ```01010B```,
- ```System ósemkowy``` - dopisanie liter ```q```, ```Q```, ```o``` lub ```O``` np:
    - ```377q```,
    - ```377o```,
    - ```377Q```,
    - ```377O```,

### System dziesiętny

Wartość liczby w systemie dziesiętnym można wyznaczyć przy pomocy wzoru

$$ \sum_{i=0}^{n-1} a_{i} 10^{i} = a_{0} 10^{0} + a_{1} 10^{1} + a_{2} 10^{2} + ... + a_{n-1} 10^{n-1} $$

Przykładowy zapis

$574_{10}$

Jest skróconym zapisanem następującego wyrażenia

$(5 * 10^{2}) + (7 * 10^{1}) + (4 * 10^{0})$

### System dwójkowy

Wartość liczby w systemie dwójkowym można wyznaczyć przy pomocy wzoru

$$ \sum_{i=0}^{n-1} a_{i} 2^{i} = a_{0} 2^{0} + a_{1} 2^{1} + a_{2} 2^{2} + ... + a_{n-1} 2^{n-1} $$

Przykładowy zapis

$1001_{2}$

Jest skróconym zapisanem następującego wyrażenia

$(1 * 2^{3}) + (0 * 2^{2}) + (0 * 2^{1}) + (1 * 2_{0})$

Konwersja z systemu dziesiętnego na system dwójkowy

| Dzielenie przez podstawę | Wynik | Reszta | Znaczenie bitów |
| :----------------------: | :---: | :----: | :-------------: |
|          $9 / 2$         |  $4$  |  $1$   |       LSB       |
|          $4 / 2$         |  $2$  |  $0$   |                 |
|          $2 / 2$         |  $1$  |  $0$   |                 |
|          $1 / 2$         |  $0$  |  $1$   |       MSB       |

### System szesnastkowy

Wartość liczby w systemie dziesiętnym można wyznaczyć przy pomocy wzoru

$$ \sum_{i=0}^{n-1} a_{i} 16^{i} = a_{0} 16^{0} + a_{1} 16^{1} + a_{2} 16^{2} + ... + a_{n-1} 16^{n-1} $$

Przykładowy zapis

$9DF_{16}$

Jest skróconym zapisanem następującego wyrażenia

$(9 * 16^{2}) + (D * 16^{1}) + (F * 16^{0})$

Konwersja z systemu dziesiętnego na system szesnastkowy

| Dzielenie przez podstawę | Wynik  |    Reszta    | Znaczenie bitów |
| :----------------------: | :----: | :----------: | :-------------: |
|        $2527 / 16$       | $157$  |   $15_{10}$  |       LSB       |
|        $157 / 16$        |  $9$   |   $13_{10}$  |                 |
|         $9 / 16$         |  $0$   |   $9_{10}$   |       MSB       |

### Mikrokontroler 80C51

```Mikrokontroler 80C51``` jako typowy przedstawiciel rodziny ```MCS 51``` wyposażony jest w:
  - 128B wbudowanej pamięci ```RAM```,
  - 4KB wbudowanej pamięci ```ROM```,
  - możliwość podłączenia dodatkowej zewnętrznej pamięci.

### Pamięć stała - ```ROM```

```ROM``` - Read only Memory - pamięć wykorzystywana do jednokrotnego zapisu (np. przy kompilacji programu) i późniejszego wykorzystywania zapisanych danych.

- wykorzystujemy do trwałego przechowywania wykonywanego kodu
programu oraz niektórych stałych wartości,
- wielkość kodu programu jest ograniczona przez wielkość tej pamięci,
- ROM może być wbudowany w mikrokontroler lub dołączony w formie zewnętrznego układu.
