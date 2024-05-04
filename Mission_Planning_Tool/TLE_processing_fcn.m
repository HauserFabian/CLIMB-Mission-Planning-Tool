function [OE_array,Epoch_vect,epoch_jul] = TLE_processing_fcn(fname)
% Description
% From https://de.mathworks.com/matlabcentral/fileexchange/39364-two-line-element#functions_tab
% and slightly modified
% Input .txt file with TLE
% Output:
%   OE_array -> OE = [a e inc ra rp RAAN w E n Db M] -> 
%               OE = [semi-majer axis, eccentricity, inclination, apogee, perigee, RAAN, 
%                     Argument of periapsis, Eccentricic anomaly, Mean motion [Revs per day], 
%                     Ballistic Coefficient, Mean anomaly]
%   Epoch_vect -> TLE epoch in datetime format

    fid = fopen(fname, 'r');        % Open the TLE file for reading
    OE_array = [];                  % Initialize an empty array to store orbital elements
    Epoch_vect = [];
    mu = 398600; % Standard gravitational parameter for the earth
    
    % Read and process TLE sets from the file
    while ~feof(fid)
    % while fopen(fid)

        % Read two lines from the file
        L1c = fgets(fid);
        L2c = fgets(fid);
        
        % Display the two lines
        %fprintf(L1c);
        %fprintf(L2c);
        
        % Extract relevant data from the lines
        %L1 = sscanf(L1c,'%d%6d%*c%9d%*c%*2f%f%f%5d%*c%*d%5d%*c%*d%d%5d',[1,9])  % deletes first two digits (year) of epoch

        L1 = sscanf(L1c,'%d%6d%*c%9d%*c%f%f%5d%*c%*d%5d%*c%*d%d%5d%*2f',[1,9]);   % keeps first two digits (year) of epoch
        L2 = sscanf(L2c,'%d%6d%f%f%f%f%f%f%f',[1,8]);
        
        % Epoch
        epoch_jul = L1(1,4);   % Epoch Date and Julian Date Fraction
        
        % Apparently there is no direct way in matlab to convert tle epoch
        % in date, therefore the apporach below is used (there is for sure a simpler way)
        epoch_str =  num2str(epoch_jul);                            % convert tle to str
        year = str2num(epoch_str(1:2))+2000;                        % extract number of year (first 2 digits)
        epoch_dayfract = str2num(epoch_str(3:end));                 % exctract the other digits (day fraction)
        date_0 = append('1 Jan ',num2str(year),' 00:00:00.000');    % combine it and convert to date
        epoch = char(datetime(date_0,'Format','d MMM uuuu HH:mm:ss.SSS') + days(epoch_dayfract-1)); % actual date of TLE

        % Orbital elements
        Db = L1(1,5);          % Ballistic Coefficient
        inc = L2(1,3);         % Inclination [deg]
        RAAN = L2(1,4);        % Right Ascension of the Ascending Node [deg]
        e = L2(1,5)/1e7;       % Eccentricity
        w = L2(1,6);           % Argument of periapsis [deg]
        M = L2(1,7);           % Mean anomaly [deg]
        n = L2(1,8);           % Mean motion [Revs per day]

        a = (mu/(n*2*pi/(24*3600))^2)^(1/3);  % Semi-major axis [km]
        ra = a*(e+1)-6378;      % Apogee
        rp = a*(1-e)-6378;      % Perigee
    
        % Calculate the eccentric anomaly using Mean anomaly
        err = 1e-10;  % Calculation Error
        M_rad = M*pi/180;
        E0 = M;
        t = 1;
        itt = 0;
        while (t)
            E = M + e*sind(E0);     % Eccentrcic anomaly
            if (abs(E-E0) < err)
                t = 0;
            end
            E0 = E;
            itt = itt + 1;
        end
        
        % get true anoamly
        theta = acosd((cosd(E)-e)/(1-e*cosd(E)));   % Not 100% sure this is correct

        % Six orbital elements
        OE = [a e inc ra rp RAAN w E n Db M];
        OE_array = [OE_array; OE];                  % Append OE to the array
        Epoch_vect = [Epoch_vect; epoch];
       
    end
    
    % Close the file
    fclose(fid);
end
