// Agent sample_agent in project jacamoRL

/* Initial beliefs and rules */
rl_parameter(myparam, myvalue).

rl_observe(reach_finish, pos).

rl_reward(reach_finish, 100) :- finishline.
rl_reward(reach_finish, -10) :- not finishline.

rl_terminal(reach_finish) :- finishline.

/* Initial goals */

!start.

/* Plans */

+!start : true <- rl.execute(reach_finish); !start.

@exe[rl_goal(reach_finish), rl_param(direction(set(right, left, up, down)))]
+!move(Direction) : true <- move(Direction).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
