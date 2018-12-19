/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Mossi Shahi/Desktop/vhdl-proj/1525893960_569__%255B94243022%255D%255BMostafa%2BShahhosseini%255D%255BHW6%255D/hw6/reg16b.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_3930306422_3212880686_p_0(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB5;

LAB6:    t1 = (t0 + 1632U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 != 0)
        goto LAB9;

LAB10:
LAB3:    t1 = (t0 + 3432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t1 = xsi_get_transient_memory(12U);
    memset(t1, 0, 12U);
    t5 = t1;
    memset(t5, (unsigned char)2, 12U);
    t6 = (t0 + 3512);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 12U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = (t0 + 6188U);
    t6 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t11, t5, t1, (unsigned char)3);
    t7 = (t11 + 12U);
    t12 = *((unsigned int *)t7);
    t13 = (1U * t12);
    t14 = (12U != t13);
    if (t14 == 1)
        goto LAB7;

LAB8:    t8 = (t0 + 3512);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 12U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB7:    xsi_size_not_matching(12U, t13, 0);
    goto LAB8;

LAB9:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t18 = *((unsigned char *)t6);
    t19 = (t18 == (unsigned char)3);
    if (t19 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB3;

LAB11:    t2 = (t0 + 1672U);
    t5 = *((char **)t2);
    t14 = *((unsigned char *)t5);
    t17 = (t14 == (unsigned char)3);
    t3 = t17;
    goto LAB13;

LAB14:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1032U);
    t7 = *((char **)t2);
    t2 = (t0 + 3512);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    memcpy(t15, t7, 12U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB15;

}


extern void work_a_3930306422_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3930306422_3212880686_p_0};
	xsi_register_didat("work_a_3930306422_3212880686", "isim/top_module_isim_beh.exe.sim/work/a_3930306422_3212880686.didat");
	xsi_register_executes(pe);
}
