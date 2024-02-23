#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

/**
 * infinite_while - self explanatory
 *
 * Return: 0 if ok
**/

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * zombie - create zombie
**/

void zombie(void)
{
	pid_t pid = fork();

	if (pid == 0)
	{
		printf("Zombie process created, PID: %d\n", getpid());
		exit(EXIT_SUCCESS);
	}
}

/**
 * main - main function
 *
 * Return: 0 if ok
**/

int main(void)
{
	int i = 0;

	for (i = 0; i < 5; i++)
		zombie();
	sleep(10);
	return (0);
}
