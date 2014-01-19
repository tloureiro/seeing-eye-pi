#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/select.h>

#include "input.h"

/* ------------------------------------------------------------------ */

static void show_events(int nr, int timeout, int grab)
{
	struct input_event event;
	struct timeval tv;
	int fd, quit;
	fd_set set;

	fd = device_open(nr,1);
	if (-1 == fd)
		return;
	//~ device_info(fd);

	if (grab) {
		if (-1 == ioctl(fd,EVIOCGRAB,1)) {
			perror("ioctl EVIOCGRAB(1)");
			close(fd);
			return;
		}
		printf("grabbed input device\n");
	}
	
	//~ printf("waiting for events\n");
	quit = 0;
	for (;;) {
		/* wait for input */
		FD_ZERO(&set);
		FD_SET(fd,&set);
		//~ tv.tv_sec  = timeout;
		//~ tv.tv_usec = 0;
		//~ switch (select(fd+1,&set,NULL,NULL,&tv)) {
		//~ case -1:
			//~ perror("select");
			//~ quit = 1;
			//~ break;
		//~ case 0:
			//~ printf("timeout, quitting\n");
			//~ quit = 1;
			//~ break;
		//~ }
		if (quit)
			break;

		/* read input */
		if (FD_ISSET(fd,&set)) {
			switch (read(fd,&event,sizeof(event))) {
			case -1:
				perror("read");
				quit = 1;
				break;
			case 0:
				printf("EOF\n");
				quit = 1;
				break;
			default:
				print_event(&event);
				break;
			}
		}
		if (quit)
			break;
	}

	if (grab) {
		if (-1 == ioctl(fd,EVIOCGRAB,0)) {
			perror("ioctl EVIOCGRAB(0)");
			close(fd);
			return;
		}
		printf("released input device\n");
	}
	close(fd);
}

static int usage(char *prog, int error)
{
	fprintf(error ? stderr : stdout,
		"usage: %s"
		" [ -g ] "
		" devnr\n",
		prog);
	exit(error);
}

int main(int argc, char *argv[])
{
	int timeout  = 10;
	int grab     =  0;
	int c,devnr;

	for (;;) {
		if (-1 == (c = getopt(argc, argv, "hgt:")))
			break;
		switch (c) {
		case 't':
			timeout = atoi(optarg);
			break;
		case 'g':
			grab = 1;
			break;
		case 'h':
			usage(argv[0],0);
		default:
			usage(argv[0],1);
		}
	}

	if (optind == argc)
		usage(argv[0],1);

	devnr = atoi(argv[optind]);
	show_events(devnr,timeout,grab);
	return 0;
}

/* ---------------------------------------------------------------------
 * Local variables:
 * c-basic-offset: 8
 * End:
 */
