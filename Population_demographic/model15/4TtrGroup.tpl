//Parameters for the coalescence simulation program : fastsimcoal.exe
4 samples to simulate :
//Population effective sizes (number of genes)
NG1
NG2
NG3
NG4
//Samples sizes and samples age 
94
98
82
62
//Growth rates	: negative growth implies population expansion
0
0
0
0
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
6 historical event
TF$ 1 0 ASY 1 0 0
TE$ 1 3 1 Res_E$ 0 0
TD$ 3 2 1 Res_D$ 0 0   
TC$ 2 0 1 Res_C$ 0 0
TB$ 0 0 0 Res_B$ 0 0
TA$ 0 0 0 Res_A$ 0 0
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per generation recombination and mutation rates and optional parameters
FREQ   1   0   3e-9 OUTEXP
