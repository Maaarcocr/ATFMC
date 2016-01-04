# ATFMC: An Automatic Tester For Model Checker

Hello, I'm Marco, a CS student at UCL.

Our CW for the Chirstmas holiday 2015 was to create a Model Checker for first order logic formulas. In order to test the correctness of the programm I have created a little script that automatically test the model checker against different formulas.

Now I want to share what I have done to help my coursemates and also to share my first personal and little project. I hope that this little script will help you test your model checker. 

##How to use the script:

To make the script works first download it with the folder resources. Then copy and paste both the script and the resources in the folder where you graph script is. Please make sure that you have compiled your graph.c using: 

```
$ gcc -o graph graph.c
```

Secondly and finally run these commands in your terminal: 
```sh
$ chmod u+x ./script.sh
$ ./script.sh
```
Now the script should run and you should read from the terminal if your model checker has generated the 
correct answers.

In case the script gives you some errors or strange results be sure that your main function in graph.c looks like this (it is really important that you have a new line each printf):

```c
int main()
{
  /*Input a string and check if its a formula*/
  char *name=malloc(Fsize);
  printf("Enter a formula:\n");
  scanf("%s", name);
  int p=parse(name);
  switch(p)
  { 
    case 0: printf("Not a formula\n");break;
    case 1: printf("An atomic formula\n");break;
    case 2: printf("A negated formula\n");break;
    case 3: printf("A binary connective formula\n");break;
    case 4: printf("An existential formula\n");break;
    case 5: printf("A universal formula\n");break;
    default: printf("Not a formula\n");break;
  }

  /*Input a graph.  No. of nodes, edges, then input each edge.*/
  printf("How many nodes in the graph?\n");
  scanf(" %d", &no_nodes);
  printf("The nodes are 0, 1, ..., %d\n", no_nodes-1);
  printf("Now the edges\n");
  printf("How many edges?\n");
  scanf(" %d", &no_edges);

  int edges[no_edges][2];  /*Store edges in 2D array*/
  int  i, k, j;
  for(i=0;i<no_edges;i++)
    {
      printf("input a pair of nodes (<%d)\n", no_nodes);
      scanf(" %d", &j);scanf(" %d", &k);
      edges[i][0]=j; edges[i][1]=k;
    }

  /*Assign variables x, y, z to nodes */
  int V[3]; 
/*Store variable values in array
value of x in V[0]
value of y in V[1]
value of z in V[2] */
  printf("Assign variables x, y, z\n");
  printf("x is ?(<%d)\n", no_nodes);scanf(" %d", &V[0]);
  printf("y is ?\n");scanf(" %d", &V[1]);
  printf("z is ?\n");scanf(" %d", &V[2]);

  /*Now check if formula is true in the graph with given variable assignment. */
  if (eval(name, edges, no_nodes,  V)==1) 
    printf("The formula %s is true\n", name); else printf("The formula %s is false\n", name);
 
  free(name);
  return(1);
}
```

N.B. You need to have ghci installed in your machine in order to run the script.
