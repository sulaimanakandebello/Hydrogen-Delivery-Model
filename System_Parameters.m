%
% This script loads the parameters for the station, the connectors,
% manifold, On-Tank Valve, Vehicle Tank, Pressure Regulator, buffer tank
% and Engine. 

load("hydrogen_properties.mat");                        % Hydrogen gas properties
load("silicone_fluid_properties.mat");                  % silicon fluid properties

WP_high = 700;                                          % [bar] Working pressure from station to tank
WP_medium = 160;                                        % [bar] Working pressure after pressure regulation
WP_low = 16;                                            % [bar] Working pressure engine supply


%% Station Parameters
% intercooler parameters
intercooler_L = 2;                                      % [m] intercooler lenght 
intercooler_num_tubes = 25;                             % [1] number of tubes in intercooler 
intercooler_shell_D = 0.1;                              % [m] intercooler shell diameter
intercooler_tube_D = 0.008;                             % [m] intercooler tube diameter
num_buffer = 2;                                         % [1] number of buffer tanks

% Precooler parameters
precooler_L = 1;                                        % [m] Length of pipe
precooler_num_tubes = 1250;                             % [1] number of tubes in Precooler
precooler_tube_W = 0.001;                               % [m] Width of tubes in Precooler

hose_D = 0.0064;                                        % [m] hose diameter
pipe_D = 0.1;                                           % [m] Pipe diameter
tube_D = 0.04; 

p_storage = 200;                                        % [bar] storage tank pressure 
stationTrigger_Time = 2400;                             % [s] Simulation time to trigger station refuelling of Vehicle
T_fluid = -60;                                          % [degC] initial temperature of Thermal Liquid (silicon)



%% Connectors
statConn_D = 0.0064;                                    % [m] Station Connector Diameter
vehConn_D = 0.0064;                                     % [m] Vehicle Connector Diameter

Pipe_ConnMan_D = 0.0064;                                % [m] Vehicle Connector to Manifold Pipe Diameter
Pipe_ConnMan_L = 1;                                     % [m] Vehicle Connector to Manifold Pipe Length


%% Manifold Parameters
V_manifold = 0.05;                                      % [L] Volume of manifold
in_Man_D = 0.0064;                                      % [m] Manifold input port Diameter
out_Man_D = 0.0064;                                     % [m] Manifold output port Diameter
tank_Man_D = 0.0064;                                    % [m] Manifold to Tank port Diameter

M_Manifold = 0.025;                                     % [kg] mass of manifold
c_Manifold = 1200;                                      % [J/(K*kg)] Specific heat of manifold

h_ext_Manifold = 10;                                    % [W/(K*m²)] external Heat transfer coeffcient of Manifold 
h_int_Manifold = 300;                                   % [W/(K*m²)] internal Heat transfer coeffcient of Manifold 

ext_Manifold_D = 0.007;                                 % [m] external diameter of Manifold (to calculate area for heat exchange)
int_Manifold_D = 0.0064;                                % [m] internal diameter of Manifold (to calculate area for heat exchange)
L_Manifold = 1;                                         % [m] length of Manifold


%% On Tank Valve Paremeters 
MV_D = 0.0064;                                          % [m] Manual Valve Diameter
SV_D = 0.0064;                                          % [m] Solenoid Valve Diameter


%% Vehicle Tank Parameters 

Pipe_ManTank_D = 0.0064;                                % [m] Tank to Manifold Pipe Diameter
Pipe_ManTank_L = 2;                                     % [m] Tank to Manifold Pipe Pipe Length


% n_vehTank = 1;                                        % [1] number of vehicle tanks
V_vehTank = 172;                                        % [L] Volume of each vehicle tank
inOut_vehTank_D = 0.0064;                               % [m] In/Out port diameter of Tank

M_vehTank = 86;                                         % [kg] mass of vehicle Tank
c_vehTank = 1200;                                       % [J/(K*kg)] Specific heat of Tank

h_ext_vehTank = 10;                                     % [W/(K*m²)] external Heat transfer coeffcient of Tank 
h_int_vehTank = 300;                                    % [W/(K*m²)] internal Heat transfer coeffcient of Tank 

ext_vehTank_D = 0.25;                                   % [m] external diameter of Tank 
int_vehTank_D = 0.22;                                   % [m] internal diameter of Tank 
L_vehTank = 2;                                          % [m] length of vehicle Tank

relief_vehTank_D = 0.0064;                              % [m] Tank Pressure relief port diameter
relief_vehTank_setP = WP_high + 100;                    % [bar] Pressure threshold to activate tank pressure relief valve
relief_vehtank_range = 75;                              % [bar] Pressure regulation range


TempCont_vehTank_D = 0.0064;                            % [m] Tank temperature relief port diameter
TempCont_vehTank_setT = 110;                            % [degC] Temperature threshold to activate tank temperature control valve
TempCont_vehTank_Trange = 10;                           % [degC] Temperature regulation range


%% Pressure Regulator parameters
Pipe_ManPR_D = 0.0064;                                  % [m] Manifold to Pressure regulator Pipe Diameter
Pipe_ManPR_L = 1;                                       % [m] Manifold to Pressure regulator Pipe Length

redn_PR_D = 0.0064;                                     % [m] Pressure reducing valve diameter
redn_PR_setP = 160;                                     % [bar] Set Pressure for Pressure reducing valve
redn_PR_range = 20;                                     % [bar] Pressure regulation range

relief_PR_D = 0.0064;                                   % [m] Pressure relief port diameter
relief_PR_setP = WP_medium + 40;                        % [bar] Pressure threshold to activate pressure relief valve
relief_PR_range = 20;                                   % [bar] Pressure regulation range


%% Buffer Tank parameters
Pipe_PRBuffer_D = 0.0064;                               % [m] Pressure regulator to Buffer tank Pipe Diameter
Pipe_PRBuffer_L = 1;                                    % [m] Pressure regulator to Buffer tank Pipe Length

V_bufferEng = 10;                                       % [L] Volume of buffer tank
in_bufferEng_D = 0.0064;                                % [m] In port diameter of buffer tank
out_bufferEng_D = 0.0064/2;                             % [m] Out port diameter of buffer tank

M_bufferEng = 5;                                        % [kg] mass of buffer Tank
c_bufferEng = 1200;                                     % [J/(K*kg)] Specific heat of buffer Tank

h_ext_bufferEng = 10;                                   % [W/(K*m²)] external Heat transfer coeffcient of Buffer Tank 
h_int_bufferEng = 300;                                  % [W/(K*m²)] internal Heat transfer coeffcient of Buffer Tank 

ext_bufferEng_D = 0.025;                                % [m] external diameter of Buffer Tank 
int_bufferEng_D = 0.024;                                % [m] internal diameter of Buffer Tank 
L_bufferEng = 1;                                        % [m] Length of Buffer Tank 


%% Engine Parameters
in_Eng_D = 0.0064;                                      % [m] Engine injection input port Diameter
out_Eng_D = 0.0064;                                     % [m] Engine injection output port Diameter
p_Eng = WP_low;                                         % [bar] Injection Pressure in Engine cylinder
T_Eng = 323.15;                                         % [degC] Engine injection Temperature 


