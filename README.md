6 Display Runner
===
###### MU0 Assembly Game

---
### Description
The game was inspired by the old games, usually found on cheap devices for "gaming". The purpose of the game is to dodge the incoming "cars" by moving up or down. There are four difficulties randing from ```EASY``` to ```IMPOSSIBLE```. You can get hit 3 times as there is a health system (displayed on the ```bar graph```). The game also has background sounds and diffrent sounds for each action.

---
### Specifications

#### MU0 - Micro Processor

MU0 Has a small limited set of instructions.

| Code | Mneomonic | Use      | Description                                               |
|------|-----------|----------|-----------------------------------------------------------|
| 0000 | LDA       | LDA S    | Load the value ```S``` into the ```ACC```                 |
| 0001 | STA       | STA S    | Store the value from ```ACC``` into ```S```               |
| 0010 | ADD       | ADD S    | Add ```S``` to ```ACC``` (```ACC = ACC + S```)            |
| 0011 | SUB       | SUB S    | Sub ```S``` from ```ACC``` (```ACC = ACC - S```)          |
| 0100 | JMP       | JMP S    | Set the ```PC``` to the value of ```S```                  |
| 0101 | JGE       | JGE S    | Set the ```PC``` to the value of ```S``` if ```ACC >= 0```|
| 0110 | JNE       | JNE S    | Set the ```PC``` to the value of ```S``` if ```ACC != 0```|
| 0111 | STP       | STP      | Stop the program from running.                            |



#### COMP12111 - Lab FGPA Board

![fgpa](https://i.imgur.com/eAvww7o.png "Board")

The following memory locations have been alocated for accessing the ```FGPA Board``` features:

| EQU | Feature       | Address       | Description                                                                       |
|-----|:------------- |:--------------|-----------------------------------------------------------------------------------|
| kr1 | KeyRow 1      | &FEF          | Using the ```AC``` button for sending the ```KILL``` signal to the system.        |
| kr3 | KeyRow 3      | &FF1          | Using the `1` `2` `3` `X` buttons for choosing difficulty.                        |
| kr4 | KeyRow 4      | &FF2          | Using the ```RESET``` button to ```FLUSH``` the displays and ```SHIFT```for tests.|
| ksw | Switch        | &FEE          | Using the two switches for moving the ```player``` (```display5```) up or down.   |
| bzz | Buzzer Input  | &FFD          | Used for playing "music".                                                         |
| bsy | Buzzer Busy   | &FF3          | Decide if buzzer can play the next sound.                                         |
| dgb | Graph Bar     | &FFE          | Display loading times.                                                            |

| EQU | Display | Address | Description     |
|-----|---------|---------|-----------------|
| dp0 |   0     | &FF5    | Obstacle        |
| dp1 |   1     | &FF6    | Obstacle        |
| dp2 |   2     | &FF7    | Obstacle        |
| dp3 |   3     | &FF8    | Obstacle        |
| dp4 |   4     | &FF9    | Obstacle        |
| dp5 |   5     | &FFA    | ```player```    |

