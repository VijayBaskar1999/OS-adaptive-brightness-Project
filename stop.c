#include<signal.h>
#include<stdio.h>
#include<sys/shm.h>
#include<sys/ipc.h>
int main()
{
        key_t key = ftok("shmfile",65);			
        int shmid = shmget(key,1024,0666|IPC_CREAT);
        char *str = (char*) shmat(shmid,(void*)0,0);
        int pid;
        sscanf(str,"%d",&pid);
        kill(pid,SIGINT);				//this program will obtain the process id from the shared memory and kills the process
        shmdt(str);
        shmctl(shmid,IPC_RMID,NULL);
        return 0;
}

