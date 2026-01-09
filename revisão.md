# Dentro de RUN:
## Run
```C++
int run(char* file)
{
	e_group = new int[n_edge];

	group_of_edges = new int*[n_groups];
	for (int i = 0; i < n_groups; ++i)
		group_of_edges[i] = new int[3 * n_trig_p_group];

	group_trigs = new int*[n_groups];
	for (int i = 0; i < n_groups; ++i)
		group_trigs[i] = new int[3 * n_trig_p_group];

	n_group_edge = new int[n_groups];
	//================================================================================================

	n_trig = 0;
	read_nhdr(file);

	//================================================================================================
/*///LER ARQUIVO DO MODO DO ALEXANDRE
	arquivo = abre_arquivo();
	fscanf(arquivo,"%d %d %d\n",&size_x,&size_y,&size_z);
	fscanf(arquivo,"%f\n",&isovalue);
	printf("%d %d %d %f\n",size_x,size_y,size_z,isovalue);
	f_grid_data = (float*) malloc(size_x*size_y*size_z*sizeof(float));
	/*
	matriz = (float***) malloc(size_z * sizeof(m));
	for(int i =0;i<size_z+1;i++){
		matriz[i] = (float**) malloc(size_x * size_y * sizeof(isovalue));
	}
	 *//*
	float mat[size_y][size_x][size_z];

	int indice =0;
	for(int i=0;i<size_x;i++){
		printf("%d\n",i);
		for(int j=0;j<size_y;j++){
			printf("[");
			for(int k=0;k<size_z;k++){
				fscanf(arquivo,"%f",&mat[i][j][k]);
				f_grid_data[indice] = mat[i][j][k];
				//printf("%f ",mat[i][j][k]);
				printf("%f ",f_grid_data[indice]);
				indice++;
			}
			printf("]\n");
		}
	}printf("------------------------\n");
*/

	//================================================================================================


	//int size = size_x*size_y*size_z;
	//visited_cube = new int [size];
	//for(int i = 0; i < size; ++i)
	//	visited_cube[i] = -1;


	printf("ExtendedMC33:: Draw triangulation...\n");

//	 Octree* oct = new Octree(0,0,0,maior_pot_2(size_x),maior_pot_2(size_y),maior_pot_2(size_z),nullptr,isovalue,0,pot_2(fmax(size_x,fmax(size_y,size_z))),0);
	Octree* oct = new Octree(0,0,0,real_size_x,real_size_y,real_size_z,nullptr,isovalue,0,pot_2(fmax(real_size_x,fmax(real_size_y,real_size_z))-1),0);


	/*
	//	*********************************************************
	//MODIFICAR A FORMA COMO O GRID É PERCORRIDO
	//	*********************************************************
	for (_k = 0; _k < size_z - 1; _k++)
		for (_j = 0; _j < size_y - 1; _j++)
			for (_i = 0; _i < size_x - 1; _i++)
			{

				cont_pos_vert = 0;
				cont_zero_vert = 0;
				cont_neg_vert = 0;


				//visited_cube[_i + _j*size_x + _k*size_x*size_y] = 0;


								_cube[0] = get_data(_i, _j, _k) - isovalue;

								if(_cube[0] > 0.0)
									++cont_pos_vert;
								if(_cube[0] < 0.0)
									++ cont_neg_vert;
								if (_cube[0] == 0.0) cont_zero_vert++;


								_cube[1] = get_data(_i, _j, _k + 1) - isovalue;
								if(_cube[1] > 0.0)
									++cont_pos_vert;
								if(_cube[1] < 0.0)
									++ cont_neg_vert;
								if (_cube[1] == 0.0) cont_zero_vert++;


								_cube[2] = get_data(_i, _j +1, _k+1) - isovalue;
								if(_cube[2] > 0.0)
									++cont_pos_vert;
								if(_cube[2] < 0.0)
									++ cont_neg_vert;
								if (_cube[2] == 0.0) cont_zero_vert++;


								_cube[3] = get_data(_i, _j + 1, _k) - isovalue;
								if(_cube[3] > 0.0)
									++cont_pos_vert;
								if(_cube[3] < 0.0)
									++ cont_neg_vert;
								if (_cube[3] == 0.0) cont_zero_vert++;


								_cube[4] = get_data(_i + 1, _j, _k)- isovalue;
								if(_cube[4] > 0.0)
									++cont_pos_vert;
								if(_cube[4] < 0.0)
									++ cont_neg_vert;
								if (_cube[4] == 0.0) cont_zero_vert++;


								_cube[5] = get_data(_i+1, _j, _k+1)- isovalue;
								if(_cube[5] > 0.0)
									++ cont_pos_vert;
								if(_cube[5] < 0.0)
									++ cont_neg_vert;
								if (_cube[5] == 0.0) cont_zero_vert++;


								_cube[6] = get_data(_i+1, _j+1, _k+1) - isovalue;
								if(_cube[6] > 0.0)
									++ cont_pos_vert;
								if(_cube[6] < 0.0)
									++ cont_neg_vert;
								if (_cube[6] == 0.0) cont_zero_vert++;


								_cube[7] = get_data(_i+1, _j+1, _k) - isovalue;
								if(_cube[7] > 0.0)
									++cont_pos_vert;
								if(_cube[7] < 0.0)
									++ cont_neg_vert;
								if (_cube[7] == 0.0) cont_zero_vert++;



				if((cont_pos_vert != 8)&&(cont_neg_vert != 8)) topology();


	}*/

	oct->sinaliza_octree(oct);
	oct->mesh(oct);

	// printf("done!\n");

	printf("ExtendedMC33:: Writing mesh...");
	delete[]e_group;
	delete[] group_of_edges;
	delete[]group_trigs;
	delete[]n_group_edge;
	//delete[] visited_cube;

	snap_mesh_element.clear();
	snap_mesh_index.clear();
	snap_mesh_cube.clear();

//	read_triangulation();
	teste_read_triangulation(oct);

	write_mesh();

	_x.clear();
	_y.clear();
	_z.clear();

	printf("done!\n");


	return 0;
}
```

* Na chamada do construtor da Octree:

```
//Octree* oct = new Octree(0,0,0,maior_pot_2(size_x),maior_pot_2(size_y),maior_pot_2(size_z),nullptr,isovalue,0,pot_2(fmax(size_x,fmax(size_y,size_z))),0);
Octree* oct = new Octree(0,0,0,real_size_x,real_size_y,real_size_z,nullptr,isovalue,0,pot_2(fmax(real_size_x,fmax(real_size_y,real_size_z))-1),0);
```
Aqui, tem 2 chamadas, a 1º na linha 3149 está com uma função `maior_pot_2()` que no limite do dado (coordenadas do dado volumétrico), altera para a menor potência de 2 acima do valor dado, para que o dado esteja sempre dentro de um cubo perfeito. Dentro do construtor, tem uma condição que preenche com 0 esses vértices que estão fora do dado. (está comentado no momento)
o 2º não tem essa função, logo o limite é o tamanho do próprio dado.


### Construtor Octree
```C++
Octree::Octree(int x1, int y1, int z1, int x2, int y2, int z2,Octree* pai,float iso, int lvl_atual,int lvl_max,int identidade)
{
	// This use to construct Octree
	// with boundaries defined
	if (x2 < x1
			|| y2 < y1
			|| z2 < z1) {
		cout << "boundary points are not valid" << endl;
		return;
	}

	//point = nullptr;
	this->id = identidade;
	this->isfather = true;
	this->parent = pai;
	//point = new Point(x1,y1,z1);
	this->sinal = 0; 						//0 = cubo vazio ou cheio | 1 = cubo intersectado
	this->nivel_max = lvl_max;
	this->nivel = lvl_atual;//fmax(x2,fmax(y2,z2))/(x2-x1)-1;
	this->V_0 = new Point(x1, y1, z1);
	this->V_6 = new Point(x2, y2, z2);
	// Assigning null to the children
	for(int i=0;i<8;i++){
		this->children[i] = nullptr;
	}
	this->isovalue_ = iso;

	//Enquanto não está no nível máximo cria 8 nós filhos.
	if(nivel < nivel_max){
		Octree* temp = nullptr;
		temp = new Octree(x1,y1,z1,(x1+x2)/2,(y1+y2)/2,(z1+z2)/2,this,iso,nivel+1,lvl_max,0);
		this->children[0] = temp;
		temp = new Octree((x1+x2)/2,y1,z1,x2,(y1+y2)/2,(z1+z2)/2,this,iso,nivel+1,lvl_max,1);
		this->children[1] = temp;
		temp = new Octree(((x1+x2)/2),y1,((z1+z2)/2),x2,((y1+y2)/2),z2,this,iso,nivel+1,lvl_max,2);
		this->children[2] = temp;
		temp = new Octree(x1,y1,((z1+z2)/2),((x1+x2)/2),((y1+y2)/2),z2,this,iso,nivel+1,lvl_max,3);
		this->children[3] = temp;
		temp = new Octree(x1,((y1+y2)/2),z1,((x1+x2)/2),y2,(z1+z2)/2,this,iso,nivel+1,lvl_max,4);
		this->children[4] = temp;
		temp = new Octree(((x1+x2)/2),((y1+y2)/2),z1,x2,y2,((z1+z2)/2),this,iso,nivel+1,lvl_max,5);
		this->children[5] = temp;
		temp = new Octree(((x1+x2)/2),((y1+y2)/2),((z1+z2)/2),x2,y2,z2,this,iso,nivel+1,lvl_max,6);
		this->children[6] = temp;
		temp = new Octree(x1,(y1+y2)/2,(z1+z2)/2,(x1+x2)/2,y2,z2,this,iso,nivel+1,lvl_max,7);
		this->children[7] = temp;

	//Chegou no nível máximo, carrega o nó folha.
	}else{
		this->isfather = false;
		int _i = this->V_0->x;
		int _j = this->V_0->y;
		int _k = this->V_0->z;

		if(_i < size_x -1 and _j < size_y-1 and _k < size_z-1)
		{


		cube[0] = get_data(_i, _j, _k) - isovalue_;

		if(cube[0] > 0.0)
			++cont_pos_vert_;
		if(cube[0] < 0.0)
			++ cont_neg_vert_;
		if (cube[0] == 0.0) cont_zero_vert_++;


		cube[1] = get_data(_i, _j, _k + 1) - isovalue_;
		if(cube[1] > 0.0)
			++cont_pos_vert_;
		if(cube[1] < 0.0)
			++ cont_neg_vert_;
		if (cube[1] == 0.0) cont_zero_vert_++;


		cube[2] = get_data(_i, _j +1, _k+1) - isovalue_;
		if(cube[2] > 0.0)
			++cont_pos_vert_;
		if(cube[2] < 0.0)
			++ cont_neg_vert_;
		if (cube[2] == 0.0) cont_zero_vert_++;


		cube[3] = get_data(_i, _j + 1, _k) - isovalue_;
		if(cube[3] > 0.0)
			++cont_pos_vert_;
		if(cube[3] < 0.0)
			++ cont_neg_vert_;
		if (cube[3] == 0.0) cont_zero_vert_++;


		cube[4] = get_data(_i + 1, _j, _k)- isovalue_;
		if(cube[4] > 0.0)
			++cont_pos_vert_;
		if(cube[4] < 0.0)
			++ cont_neg_vert_;
		if (cube[4] == 0.0) cont_zero_vert_++;


		cube[5] = get_data(_i+1, _j, _k+1)- isovalue_;
		if(cube[5] > 0.0)
			++ cont_pos_vert_;
		if(cube[5] < 0.0)
			++ cont_neg_vert_;
		if (cube[5] == 0.0) cont_zero_vert_++;


		cube[6] = get_data(_i+1, _j+1, _k+1) - isovalue_;
		if(cube[6] > 0.0)
			++ cont_pos_vert_;
		if(cube[6] < 0.0)
			++ cont_neg_vert_;
		if (cube[6] == 0.0) cont_zero_vert_++;


		cube[7] = get_data(_i+1, _j+1, _k) - isovalue_;
		if(cube[7] > 0.0)
			++cont_pos_vert_;
		if(cube[7] < 0.0)
			++ cont_neg_vert_;
		if (cube[7] == 0.0) cont_zero_vert_++;
		}
//		else{//Aqui eh para cubos que estao fora do dado, quando o grid temq ser maior na potencia de 2. O dado eh menor mas a potencia de 2 temq ser maior.
//			for(int p =0; p<8;p++){
//				cube[p] = 0.0 - isovalue_;
//				cont_pos_vert = 8.0;
//				cont_neg_vert = 8.0;
//			}
//		}//Nao precisa

		if((cont_pos_vert_ != 8)&&(cont_neg_vert_ != 8)){
			this->sinal = 1; //Sinal 1 significa que a isosuperficie passa por ele, logo tem informacao para ser visto.
			//Neste ponto isso somente ocorre nos nos folha da arvore octree
		}
	}
}
```

### Condição citada
```C++
...
		if (cube[7] == 0.0) cont_zero_vert_++;
		}
//		else{//Aqui eh para cubos que estao fora do dado, quando o grid temq ser maior na potencia de 2. O dado eh menor mas a potencia de 2 temq ser maior.
//			for(int p =0; p<8;p++){
//				cube[p] = 0.0 - isovalue_;
//				cont_pos_vert = 8.0;
//				cont_neg_vert = 8.0;
//			}
//		}//Nao precisa
...
```

Este else, é a parte citada acima.
Este código preenche com 0 os vértices a mais para o dado ficar dentro de um cubo perfeito.

## Voltando para a Run e seguindo

### Dentro de Sinaliza Octree
```C++
int Octree::sinaliza_octree(Octree* oct){
	//Quando em um nó folha da octree, verifica a topologia dele e carrega na variável do nó
	//a topologia e retorna o sinal do nó folha para o pai.
	if(oct->nivel == oct->nivel_max){
		//chamar o topology
		//if(oct->sinal == 1){
		if((oct->cont_pos_vert_==8)||(oct->cont_neg_vert_==8)){//se no estiver vazio ou cheio (vertices todos em 0 ou 1)
			oct->topology_ =-1;
			oct->sinal = 0;/*************************************************/ //se ele esta vazio seu sinal deve ser 0 ?
			return 1;//return oct->sinal   //retorno deveria ser o sinal
		}
		else{//se nao ta vazio, precisa ver a topologia
			oct->topology_ = topology(oct);
			oct->sinal = 1;
		}
	}
	//Se não for um nó folha entra nos 8 filhos trazendo o sinal deles,se todos
	//ou nenhum possuei topologia simples, então neste nó pode ser feito o merge, logo
	//seu sinal será 0(sem informação relevante nos filhos, 1 Com informação relevante
	//nos filhos, necessário ir neles.
	else{
		int cont = 0;
		cont += sinaliza_octree(oct->children[0]);
		cont += sinaliza_octree(oct->children[1]);
		cont += sinaliza_octree(oct->children[2]);
		cont += sinaliza_octree(oct->children[3]);
		cont += sinaliza_octree(oct->children[4]);
		cont += sinaliza_octree(oct->children[5]);
		cont += sinaliza_octree(oct->children[6]);
		cont += sinaliza_octree(oct->children[7]);

		//Todos ou nenhum dos nós fihos possuem topologia simples, nó pai recebe 0,
		//e pode ser vitima do merge.

		if(cont != 0){
			//SE contador ==8, signal =1(faz merge), else signal =0(não faz)
			oct->sinal = 1;

		}
		//Não pode ser vitima do merge pois os nós filhos possuem informação relevante.
		else{
			oct->sinal = 0;
		}
	}
	//retorna o sinal deste nó para o pai dele.
	return oct->sinal;
}
```
Primeiro if `if(oct->nivel == oct->nivel_max){...}` verifica se o nó atual é um nó folha da octree, logo é o próprio voxel. Dentro dele ele checa: 


`if((oct->cont_pos_vert_==8)||(oct->cont_neg_vert_==8)){...}`

Se este voxel está vazio (*TODOS* os vértices são positivo ou negativos)
    neste caso fica a dúvida, se ele está vazio (isosuperfície não corta o voxel, o valor da topologia fica -1, mas o sinal deveria ser 0 e o retorno deveria ser o próprio sinal, pois a recursão da função `sinaliza_octree()` depende desse retorno, explicarei mais a frente.)


`else{...}`

Se não estiver vazio, chama topology para determinar a topologia, seu sinal recebe 1 (existe informação) e deveria ter um `return oct->sinal` ali tbm.


``` 
Lembrando: 
Topology:
 *-1: cubo vazio
 * 0: TUNNEL 
 * 1: LEAF
 * 2: ADD_INT_P

 Sinal:
 * 0: Não tem informação
 * 1: significa que a isosuperficie passa por ele, logo tem informacao para ser visto.
```

