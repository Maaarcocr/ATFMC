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

In case the script gives you some errors or strange results be sure that your main function, in graph.c, prints at the very end either:
```c
printf("The formula %s is true\n", name); 
```
or:
```c
printf("The formula %s is false\n", name);
```
N.B. You need to have ghci installed in your machine in order to run the script.
