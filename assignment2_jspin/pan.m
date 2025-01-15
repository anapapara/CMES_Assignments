#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM ltl_0 */
	case 3: /* STATE 1 - _spin_nvr.tmp:3 - [((!(!((anyConflict==0)))&&!(scheduled)))] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0; int nn = (int) ((Pclaim *)this)->_n;
			if (verbose && !reported1)
			{	printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!(( !( !((((int)now.anyConflict)==0)))&& !(((int)now.scheduled)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 7 - _spin_nvr.tmp:8 - [(!(scheduled))] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported7 = 0; int nn = (int) ((Pclaim *)this)->_n;
			if (verbose && !reported7)
			{	printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#else
{	static int reported7 = 0;
			if (verbose && !reported7)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][7] = 1;
		if (!( !(((int)now.scheduled))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 11 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported11 = 0; int nn = (int) ((Pclaim *)this)->_n;
			if (verbose && !reported11)
			{	printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported11 = 1;
				fflush(stdout);
		}	}
#else
{	static int reported11 = 0;
			if (verbose && !reported11)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported11 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC SchedulingSystem */
	case 6: /* STATE 1 - scheduling_system.pml:50 - [channel?submitPreferences] (0:0:0 - 1) */
		reached[1][1] = 1;
		if (boq != now.channel) continue;
		if (q_len(now.channel) == 0) continue;

		XX=1;
		if (4 != qrecv(now.channel, 0, 0, 0)) continue;
		if (q_flds[((Q0 *)qptr(now.channel-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
		;
		qrecv(now.channel, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.channel))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 7: /* STATE 2 - scheduling_system.pml:51 - [printf('Scheduling System: Received preferences.\\n')] (0:25:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		Printf("Scheduling System: Received preferences.\n");
		/* merge: goto sendResponse(25, 3, 25) */
		reached[1][3] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 8: /* STATE 5 - scheduling_system.pml:55 - [channel?requestChange] (0:0:0 - 1) */
		reached[1][5] = 1;
		if (boq != now.channel) continue;
		if (q_len(now.channel) == 0) continue;

		XX=1;
		if (3 != qrecv(now.channel, 0, 0, 0)) continue;
		if (q_flds[((Q0 *)qptr(now.channel-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
		;
		qrecv(now.channel, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.channel))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 9: /* STATE 6 - scheduling_system.pml:56 - [printf('Scheduling System: Received change request.\\n')] (0:25:0 - 1) */
		IfNotBlocked
		reached[1][6] = 1;
		Printf("Scheduling System: Received change request.\n");
		/* merge: goto sendResponse(25, 7, 25) */
		reached[1][7] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 10: /* STATE 12 - scheduling_system.pml:66 - [((response==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][12] = 1;
		if (!((((int)now.response)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 13 - scheduling_system.pml:67 - [printf('Scheduling System: Sent optimized schedule.\\n')] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][13] = 1;
		Printf("Scheduling System: Sent optimized schedule.\n");
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 14 - scheduling_system.pml:68 - [channel!optimizedSchedule] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][14] = 1;
		if (q_len(now.channel))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d!", now.channel);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.channel, 0, 2, 1);
		{ boq = now.channel; };
		_m = 2; goto P999; /* 0 */
	case 13: /* STATE 17 - scheduling_system.pml:71 - [((response==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][17] = 1;
		if (!((((int)now.response)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 18 - scheduling_system.pml:72 - [printf('Scheduling System: Sent conflict notification.\\n')] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][18] = 1;
		Printf("Scheduling System: Sent conflict notification.\n");
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 19 - scheduling_system.pml:73 - [channel!conflictNotification] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][19] = 1;
		if (q_len(now.channel))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d!", now.channel);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.channel, 0, 1, 1);
		{ boq = now.channel; };
		_m = 2; goto P999; /* 0 */
	case 16: /* STATE 20 - scheduling_system.pml:74 - [anyConflict = 1] (0:11:1 - 1) */
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.oval = ((int)now.anyConflict);
		now.anyConflict = 1;
#ifdef VAR_RANGES
		logval("anyConflict", ((int)now.anyConflict));
#endif
		;
		/* merge: goto waiting(11, 21, 11) */
		reached[1][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 17: /* STATE 26 - scheduling_system.pml:81 - [scheduled = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][26] = 1;
		(trpt+1)->bup.oval = ((int)now.scheduled);
		now.scheduled = 1;
#ifdef VAR_RANGES
		logval("scheduled", ((int)now.scheduled));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 28 - scheduling_system.pml:84 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][28] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Student */
	case 19: /* STATE 1 - scheduling_system.pml:13 - [printf('Student: Sent schedule preferences to SS.\\n')] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		Printf("Student: Sent schedule preferences to SS.\n");
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 2 - scheduling_system.pml:14 - [channel!submitPreferences] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (q_len(now.channel))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d!", now.channel);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.channel, 0, 4, 1);
		{ boq = now.channel; };
		_m = 2; goto P999; /* 0 */
	case 21: /* STATE 3 - scheduling_system.pml:15 - [preferencesSent = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)preferencesSent);
		preferencesSent = 1;
#ifdef VAR_RANGES
		logval("preferencesSent", ((int)preferencesSent));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 5 - scheduling_system.pml:21 - [channel?optimizedSchedule] (0:0:0 - 1) */
		reached[0][5] = 1;
		if (boq != now.channel) continue;
		if (q_len(now.channel) == 0) continue;

		XX=1;
		if (2 != qrecv(now.channel, 0, 0, 0)) continue;
		if (q_flds[((Q0 *)qptr(now.channel-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
		;
		qrecv(now.channel, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.channel))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 23: /* STATE 6 - scheduling_system.pml:22 - [printf('Student: Received optimized schedule.\\n')] (0:21:0 - 1) */
		IfNotBlocked
		reached[0][6] = 1;
		Printf("Student: Received optimized schedule.\n");
		/* merge: goto done(21, 7, 21) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 24: /* STATE 9 - scheduling_system.pml:25 - [channel?conflictNotification] (0:0:0 - 1) */
		reached[0][9] = 1;
		if (boq != now.channel) continue;
		if (q_len(now.channel) == 0) continue;

		XX=1;
		if (1 != qrecv(now.channel, 0, 0, 0)) continue;
		if (q_flds[((Q0 *)qptr(now.channel-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
		;
		qrecv(now.channel, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.channel);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.channel))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3d: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 25: /* STATE 10 - scheduling_system.pml:26 - [printf('Student: Received conflict notification.\\n')] (0:19:0 - 1) */
		IfNotBlocked
		reached[0][10] = 1;
		Printf("Student: Received conflict notification.\n");
		/* merge: goto submitChange(19, 11, 19) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 26: /* STATE 16 - scheduling_system.pml:35 - [printf('Student: Sent request change.\\n')] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][16] = 1;
		Printf("Student: Sent request change.\n");
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 17 - scheduling_system.pml:36 - [channel!requestChange] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][17] = 1;
		if (q_len(now.channel))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d!", now.channel);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.channel, 0, 3, 1);
		{ boq = now.channel; };
		_m = 2; goto P999; /* 0 */
	case 28: /* STATE 20 - scheduling_system.pml:41 - [scheduled = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.scheduled);
		now.scheduled = 1;
#ifdef VAR_RANGES
		logval("scheduled", ((int)now.scheduled));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 22 - scheduling_system.pml:43 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

