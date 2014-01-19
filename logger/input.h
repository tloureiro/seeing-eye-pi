#include <inttypes.h>

#include <sys/ioctl.h>
#include <linux/input.h>

#define ev_name(code)  ((code) < EV_MAX  && EV_NAME[code]  ? EV_NAME[code]  : "???")
#define ev_type_name(type, code) ((code) < EV_TYPE_MAX[type] && EV_TYPE_NAME[type][code] ? EV_TYPE_NAME[type][code] : "???")

#define BITFIELD uint32_t

extern char *EV_NAME[EV_CNT];
extern int EV_TYPE_MAX[EV_CNT];
extern char **EV_TYPE_NAME[EV_CNT];
extern char *BUS_NAME[];

static __inline__ int test_bit(int nr, BITFIELD * addr)
{
	BITFIELD mask;

	addr += nr >> 5;
	mask = 1 << (nr & 0x1f);
	return ((mask & *addr) != 0);
}

/* ------------------------------------------------------------------ */

int device_open(int nr, int verbose);
void device_info(int fd);
void print_event(struct input_event *event);


void keySelector(int key_code, int pressedOrReleased);
