	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM ltl_0 */
;
		;
		;
		;
		
	case 5: /* STATE 11 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC SchedulingSystem */

	case 6: /* STATE 1 */
		;
		XX = 1;
		unrecv(now.channel, XX-1, 0, 4, 1);
		;
		;
		goto R999;
;
		
	case 7: /* STATE 2 */
		goto R999;

	case 8: /* STATE 5 */
		;
		XX = 1;
		unrecv(now.channel, XX-1, 0, 3, 1);
		;
		;
		goto R999;
;
		
	case 9: /* STATE 6 */
		goto R999;
;
		;
		;
		;
		
	case 12: /* STATE 14 */
		;
		_m = unsend(now.channel);
		;
		goto R999;
;
		;
		;
		;
		
	case 15: /* STATE 19 */
		;
		_m = unsend(now.channel);
		;
		goto R999;

	case 16: /* STATE 20 */
		;
		now.anyConflict = trpt->bup.oval;
		;
		goto R999;

	case 17: /* STATE 26 */
		;
		now.scheduled = trpt->bup.oval;
		;
		goto R999;

	case 18: /* STATE 28 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Student */
;
		;
		
	case 20: /* STATE 2 */
		;
		_m = unsend(now.channel);
		;
		goto R999;

	case 21: /* STATE 3 */
		;
		preferencesSent = trpt->bup.oval;
		;
		goto R999;

	case 22: /* STATE 5 */
		;
		XX = 1;
		unrecv(now.channel, XX-1, 0, 2, 1);
		;
		;
		goto R999;
;
		
	case 23: /* STATE 6 */
		goto R999;

	case 24: /* STATE 9 */
		;
		XX = 1;
		unrecv(now.channel, XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		
	case 25: /* STATE 10 */
		goto R999;
;
		;
		
	case 27: /* STATE 17 */
		;
		_m = unsend(now.channel);
		;
		goto R999;

	case 28: /* STATE 20 */
		;
		now.scheduled = trpt->bup.oval;
		;
		goto R999;

	case 29: /* STATE 22 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

