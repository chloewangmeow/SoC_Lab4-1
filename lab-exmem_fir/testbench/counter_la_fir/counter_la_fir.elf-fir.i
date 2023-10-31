# 0 "fir.c"
# 1 "/home/ubuntu/course-lab_4-1/lab-exmem_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1





int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[11];
int inputsignal[11] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[11];
# 2 "fir.c" 2

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {

 for(int i = 0; i < 11; i++) {
     outputsignal[i] = 0;
 }
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
 initfir();

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
