#include<signal.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/shm.h>
#include<sys/ipc.h>
int main()				//this program will stop the process and reset the values to the default value by running the 2.sh sell script
{
        key_t key = ftok("shmfile",65);
        int shmid = shmget(key,1024,0666|IPC_CREAT);
        char *str = (char*) shmat(shmid,(void*)0,0);
        int pid;
        sscanf(str,"%d",&pid);
        kill(pid,SIGINT);
        shmdt(str);
        shmctl(shmid,IPC_RMID,NULL);
	system("./2.sh");
        return 0;
}

