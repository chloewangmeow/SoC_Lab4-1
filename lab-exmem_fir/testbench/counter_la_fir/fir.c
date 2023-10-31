#include "fir.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	for(int i = 0; i < 11; i++) {
	    outputsignal[i] = 0;
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	//write down your fir
	int tmp = 0;
	
	for(int i = 0; i < 11; i++) {
	    tmp = 0;
	    for(int j = 0; j <= i; j++) {
	        tmp = tmp + (taps[10 - i + j] * inputsignal[j]);
	    }
	    outputsignal[i] = tmp;
	}
	return outputsignal;
}
		
