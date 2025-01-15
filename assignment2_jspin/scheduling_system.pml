mtype = { submitPreferences, requestChange, optimizedSchedule, conflictNotification }

chan channel = [0] of { mtype };
bool response = true;
bool scheduled = false;
bool preferencesSent = false;
bool anyConflict = false;

active proctype Student() {

	//Submit schedule preference
    submitSchedule: atomic {
						printf("Student: Sent schedule preferences to SS.\n");
    					channel!submitPreferences;
						preferencesSent = true;
		   			};
	
	// Wait response from system
	waiting: atomic{
    		if
    		:: channel?optimizedSchedule -> atomic{
        						printf("Student: Received optimized schedule.\n");
								goto done;
								};
    		:: channel?conflictNotification -> atomic{
       			 						printf("Student: Received conflict notification.\n");
										goto submitChange;
										};
    		fi;
			};


	// Send a request to change the schedule
	submitChange: atomic{
        			printf("Student: Sent request change.\n");
					channel!requestChange;
					goto waiting;
					};
	
	done: {
		scheduled = true;
	}
}


active proctype SchedulingSystem() {

	waiting: atomic{
				if
    			:: channel?submitPreferences -> atomic{
        							printf("Scheduling System: Received preferences.\n");
        							goto sendResponse;
								};

    			:: channel?requestChange -> atomic{
									printf("Scheduling System: Received change request.\n");
									goto sendResponse;
								};
    			fi;
				};


	// Send optimized schedule or conflict notification
	sendResponse: atomic{
        		if
        		:: response == true -> atomic {
						printf("Scheduling System: Sent optimized schedule.\n");
						channel!optimizedSchedule;
						goto done;
					};
        		:: response == true -> atomic {
           				printf("Scheduling System: Sent conflict notification.\n");
						channel!conflictNotification;
						anyConflict=true;
						goto waiting;
					};
        		fi;
				};	
	
	done: {
		scheduled = true;
	}
    
}

/*ltl {[](preferencesSent -> <>scheduled)}*/
/*ltl {[](anyConflict==true -> <>scheduled)} */
ltl {[](anyConflict==false -> <>scheduled)}


