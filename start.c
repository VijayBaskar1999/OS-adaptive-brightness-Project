#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/shm.h>
#include<sys/ipc.h>
int main()
{
	pid_t pid;					//obtain the start program processs id and share the process id in the shared memory 
        pid=getpid();					//the purpose of sharing the process id is to kill this process with another process called stop.c
        key_t key = ftok("shmfile",65);
        int shmid = shmget(key,1024,0666|IPC_CREAT);
        char *str = (char*) shmat(shmid,(void*)0,0);
        sprintf(str,"%d",pid);
        shmdt(str);

	int flag=1;
	while(flag)
	{
		system("./1.sh");			//runs the program in the infinite while loop with the sleep duration of 15 minutes 
		printf("brightness updated\t");		//i.e this program runs the 1.sh shell script for every fifteem minutes
		system("xbacklight -get");
		sleep(10);
	}

}

