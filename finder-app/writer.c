#include<stdio.h>
#include<syslog.h>
#include<errno.h>

int main(int argc, char *argv[]) {

	openlog(NULL,0,LOG_USER);
	if(argc==1) {
           syslog(LOG_ERR,"No argument has been passed through command line.");
	   return 1;
	}

        if(argc<3) {
	   syslog(LOG_ERR,"Invalid Number of arguments.");
	   return 1;
        }

	char *filename = argv[1];
	char *writestr = argv[2];
	FILE *fptr;
	fptr = fopen(filename, "w");
	if(!fptr) {
	   perror("failed to create a file!");
	   syslog(LOG_ERR,"Failed to create the file");
	   return 1;
	}
	syslog(LOG_DEBUG,"Writing string %s to file %s",writestr, filename);
	fprintf(fptr, writestr);
	fclose(fptr);
 
	return 0;
}
