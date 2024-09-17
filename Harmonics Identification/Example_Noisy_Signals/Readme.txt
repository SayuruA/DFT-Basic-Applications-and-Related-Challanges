Consider your Index number as 210ABCX
Then, the corresponding signal to your index number is signalABC.

Examples 
1) 210001X --> signal is signal1
2) 210010X --> signal is signal10
3) 210100X --> signal is signal100

The test signal is saved as the variable named 'xn_test' in the mat file.
For example 1) above, to load the signal in to your matlab environment, you may use:
load('signal1.mat','xn_test');
and then use the varaible as required by your code.

