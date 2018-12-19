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
static const char *ng0 = "C:/Users/Mossi Shahi/Desktop/vhdl-proj/1525893960_569__%255B94243022%255D%255BMostafa%2BShahhosseini%255D%255BHW6%255D/hw6/mem4k.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_1750604169_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    int t13;
    int t14;
    char *t15;
    int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    unsigned char t20;
    char *t21;
    char *t22;
    int t23;
    int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 7416U);
    t3 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t4 = (t0 + 2448U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((int *)t4) = t3;
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 992U);
    t7 = xsi_signal_has_event(t1);
    if (t7 == 1)
        goto LAB5;

LAB6:    t6 = (unsigned char)0;

LAB7:    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 992U);
    t7 = xsi_signal_has_event(t1);
    if (t7 == 1)
        goto LAB32;

LAB33:    t6 = (unsigned char)0;

LAB34:    if (t6 != 0)
        goto LAB29;

LAB31:
LAB30:    t1 = (t0 + 3752);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1832U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)2);
    if (t11 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t7 = (t6 == (unsigned char)3);
    if (t7 != 0)
        goto LAB27;

LAB28:
LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t8 = *((unsigned char *)t4);
    t9 = (t8 == (unsigned char)3);
    t6 = t9;
    goto LAB7;

LAB8:    xsi_set_current_line(61, ng0);
    t3 = xsi_vhdl_pow(2, 12);
    t2 = (t0 + 73076);
    *((int *)t2) = 0;
    t12 = (t0 + 73080);
    *((int *)t12) = t3;
    t13 = 0;
    t14 = t3;

LAB11:    if (t13 <= t14)
        goto LAB12;

LAB14:    goto LAB9;

LAB12:    xsi_set_current_line(62, ng0);
    t15 = (t0 + 73076);
    t16 = *((int *)t15);
    t17 = (t16 == 1);
    if (t17 != 0)
        goto LAB15;

LAB17:    t1 = (t0 + 73076);
    t3 = *((int *)t1);
    t6 = (t3 == 2);
    if (t6 != 0)
        goto LAB20;

LAB21:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 73116);
    t6 = (16U != 16U);
    if (t6 == 1)
        goto LAB24;

LAB25:    t4 = (t0 + 2448U);
    t5 = *((char **)t4);
    t3 = *((int *)t5);
    t16 = (t3 - 0);
    t25 = (t16 * 1);
    t26 = (16U * t25);
    t27 = (0U + t26);
    t4 = (t0 + 3832);
    t12 = (t4 + 56U);
    t15 = *((char **)t12);
    t18 = (t15 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t1, 16U);
    xsi_driver_first_trans_delta(t4, t27, 16U, 0LL);

LAB16:
LAB13:    t1 = (t0 + 73076);
    t13 = *((int *)t1);
    t2 = (t0 + 73080);
    t14 = *((int *)t2);
    if (t13 == t14)
        goto LAB14;

LAB26:    t3 = (t13 + 1);
    t13 = t3;
    t4 = (t0 + 73076);
    *((int *)t4) = t13;
    goto LAB11;

LAB15:    xsi_set_current_line(63, ng0);
    t18 = (t0 + 73084);
    t20 = (16U != 16U);
    if (t20 == 1)
        goto LAB18;

LAB19:    t21 = (t0 + 2448U);
    t22 = *((char **)t21);
    t23 = *((int *)t22);
    t24 = (t23 - 0);
    t25 = (t24 * 1);
    t26 = (16U * t25);
    t27 = (0U + t26);
    t21 = (t0 + 3832);
    t28 = (t21 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t18, 16U);
    xsi_driver_first_trans_delta(t21, t27, 16U, 0LL);
    goto LAB16;

LAB18:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB19;

LAB20:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 73100);
    t7 = (16U != 16U);
    if (t7 == 1)
        goto LAB22;

LAB23:    t5 = (t0 + 2448U);
    t12 = *((char **)t5);
    t16 = *((int *)t12);
    t23 = (t16 - 0);
    t25 = (t23 * 1);
    t26 = (16U * t25);
    t27 = (0U + t26);
    t5 = (t0 + 3832);
    t15 = (t5 + 56U);
    t18 = *((char **)t15);
    t19 = (t18 + 56U);
    t21 = *((char **)t19);
    memcpy(t21, t2, 16U);
    xsi_driver_first_trans_delta(t5, t27, 16U, 0LL);
    goto LAB16;

LAB22:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB23;

LAB24:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB25;

LAB27:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t1 = (t0 + 2448U);
    t5 = *((char **)t1);
    t3 = *((int *)t5);
    t13 = (t3 - 0);
    t25 = (t13 * 1);
    t26 = (16U * t25);
    t27 = (0U + t26);
    t1 = (t0 + 3832);
    t12 = (t1 + 56U);
    t15 = *((char **)t12);
    t18 = (t15 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t4, 16U);
    xsi_driver_first_trans_delta(t1, t27, 16U, 0LL);
    goto LAB9;

LAB29:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t10 = *((unsigned char *)t5);
    t11 = (t10 == (unsigned char)3);
    if (t11 != 0)
        goto LAB35;

LAB37:
LAB36:    goto LAB30;

LAB32:    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t8 = *((unsigned char *)t4);
    t9 = (t8 == (unsigned char)2);
    t6 = t9;
    goto LAB34;

LAB35:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2152U);
    t12 = *((char **)t2);
    t2 = (t0 + 2448U);
    t15 = *((char **)t2);
    t3 = *((int *)t15);
    t13 = (t3 - 0);
    t25 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 4096, 1, t3);
    t26 = (16U * t25);
    t27 = (0 + t26);
    t2 = (t12 + t27);
    t18 = (t0 + 3896);
    t19 = (t18 + 56U);
    t21 = *((char **)t19);
    t22 = (t21 + 56U);
    t28 = *((char **)t22);
    memcpy(t28, t2, 16U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB36;

}


void ieee_p_2592010699_sub_3130575329_503743352();

extern void work_a_1750604169_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1750604169_3212880686_p_0};
	xsi_register_didat("work_a_1750604169_3212880686", "isim/top_module_isim_beh.exe.sim/work/a_1750604169_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_resolution_function(1, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 4);
}
