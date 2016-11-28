6 Display Runner
===
###### MU0 Assembly Game

---
### Description
A short description about what the program does and the inspiration behind it.




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
The following memory locations have been alocated for accessing the ```FGPA Board``` features:

| Feature       | Address       | Description                                                                       |
|:------------- |:--------------|-----------------------------------------------------------------------------------|
| KeyRow 1      | &FEF          | Using the ```AC``` button for sending the ```KILL``` signal to the system.        |
| KeyRow 4      | &FF2          | Using the ```RESET``` button to ```FLUSH``` the displays and ```SHIFT```for tests.|
| Switch        | &FEE          | Using the two switches for moving the ```player``` (```display5```) up or down.   |
| Buzzer Input  | &FFD          | Used for playing "music".                                                         |
| Buzzer Busy   | &FF3          | Decide if buzzer can play the next sound.                                         |

| Display | Address | Description     |
|---------|---------|-----------------|
|   0     | &FF5    |   ```player```  |
|   1     | &FF6    | Obstacle        |
|   2     | &FF7    | Obstacle        |
|   3     | &FF8    | Obstacle        |
|   4     | &FF9    | Obstacle        |
|   5     | &FFA    | Obstacle        |

---
### References
Links to references.
