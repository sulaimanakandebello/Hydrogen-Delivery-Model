%% Hydrogen Refuelling Station + Vehicle consumption Model
%
% This example models a hydrogen refueling station. Hydrogen is stored in
% low-pressure storage tanks at 200 bar at the station. A 3-stage
% intercooled compressor maintains the necessary pressure in a cascade
% buffer storage system so that the station is ready to dispatch hydrogen
% to any connected vehicles. The buffer is divided into high-pressure tanks
% at 950 bar, medium-pressure tanks at 650 bar, and low-pressure tanks at
% 450 bar. To avoid wasting compression energy, the lowest pressure buffer
% that is greater than the vehicle tank pressure is used to dispatch
% hydrogen. Priority valves switches between the different buffer tanks to
% control which buffer tanks to fill and discharge from.
%
% When dispensing, a reduction valve controls the flow between the cascade
% buffer storage and the vehicle tank. A precooler chills the hydrogen
% before it is dispatched to the vehicle to avoid excessive temperature
% rise in the vehicle tank. This example is modeled after a type A70
% refueling station from the SAE J2601 fueling protocols, which means that
% hydrogen is delivered at -40 degC and up to 700 bar.
% 
% A Stateflow(R) chart is used to model the logic needed to control the
% operations of the station. It determines when to turn on the compressor
% to recharge the buffer, when to dispatch hydrogen to the vehicle, and the
% switching logic of the cascade buffer priority valves. When dispensing,
% the Valve Controller and the Precooler Controller subsystems are enabled.
% They contain PI controllers that maintain the flow rate and temperature
% of the hydrogen fuel being dispatched.
% 
% Added to the Station model described above is the model of the vehicle
% storage and consumption model. The On-Tank-Valve manages the flow to and
% from the vehicle tank. There is a pressure regulator to reduce the
% delivery pressure from 700 bar to a manageable 200 bar in the buffer tank
% and eventual delivery at about 16 bars to the engine.


finSimulation = 4000;                                   % [s] Duration of Simulation


% Load all systems and Simulation parameters
System_Parameters

 
% Simulation initialisation parameters 
p_vehTank_init = 100;                                   % [bar] initial pressure on vehicle tank 
T_env = 25;                                             % [degC] Environmental Temperature 
T_Tank_init = 25;                                       % [degC] Initial Temperature in Vehicle Tank
EngDemandTime = 3000;                                   % [s] Simulation time of Engine demand Vehicle Must be greater than 2650 seconds 
EngThrottle = 1;                                        % [1] Engine demand Throttle mapped to [3.29 4.39 5.31 6.26 6.92] g/s (starting at time Eng DemandTime)

%Launch Simulink Model
% sim("HydrogenRefuelingStation_Param.slx")