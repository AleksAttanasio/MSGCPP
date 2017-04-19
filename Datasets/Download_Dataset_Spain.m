 clear all
 warning('off','MATLAB:urlread:ReplacingSpaces')

%Data for the download
longitude1=-0.06;
width = 150;
longitude2=longitude1 + 0.03 * width;
latitude1=39.99;
length = 150;
latitude2= latitude1 + 0.03 * length;
longitude11=min(longitude1,longitude2);
longitude22=max(longitude1,longitude2);
latitude11=min(latitude1,latitude2);
latitude22=max(latitude1,latitude2);

width = ceil((longitude22 - longitude11)/0.03);
height = ceil((latitude22 - latitude11)/0.03);

% width=1;
% height=1;

year=2016;
% day=1;
start_day = 1;
end_day = 1;
start_month = 4;
end_month = 4;
% month=10;
urlwrongmax=15;
failvalue=-100;

% STR1 --> http://msgcpp-ogc-archive.knmi.nl/msgar.cgi? &service=wcs&version=1.0.0&request=getcoverage&coverage=surface_downwelling_shortwave_flux_in_air&FORMAT=AAIGRID&CRS=EPSG%3A4326&

str1='http://msgcpp-ogc-archive.knmi.nl/msgar.cgi? &service=wcs&version=1.0.0&request=getcoverage&coverage=surface_downwelling_shortwave_flux_in_air&FORMAT=AAIGRID&CRS=EPSG%3A4326&';

%Longitude and latitude  STR2 --> BBOX=-0.06,39.99,-0.06,39.99&

longitude1=num2str(longitude11);
longitude2=num2str(longitude22);
latitude1=num2str(latitude11);
latitude2=num2str(latitude22);

str2=strcat('BBOX=',longitude1,',',latitude1,',',longitude2,',',latitude2,'&');

%Width and height of the image  STR3 --> WIDTH=1&HEIGHT=1&

width=num2str(width);
height=num2str(height);

str3=strcat('WIDTH=',width,'&HEIGHT=',height,'&');

%Date STR4 --> time=2016-08-25T

values=[];
position=1;

for month = start_month:1:end_month
    
    for day = start_day:1:end_day
    year=num2str(year);
    day=num2str(day);
    month=num2str(month);

    str4=strcat('time=',year,'-',month,'-',day,'T');

    %Time  STR5 -->12:45:00Z

        for j=0:1:23
            for i=0:15:59
                hour=num2str(j);
                minute=num2str(i);

                str5=strcat(hour,':',minute,':00Z');
                address=strcat(str1,str2,str3,str4,str5);


                web=urlread(address,'Timeout',15);
                data=strsplit(web);       

                urlwrong=0;
                err=0;
                while (strcmp(data{1},'Invalid')&& err==0) %Try to download data again if something fails
                    web=urlread(address);
                    data=strsplit(web); 
                    urlwrong=urlwrong+1;
                    if urlwrong==urlwrongmax
                        urlwrongmax
                        strcat(str5,' ERROR')
                        err=1;
                    end
                end


                if err==0 % Data correctly downloaded
                    nodatapos=1;
                    while ~strcmp(data{nodatapos},'NODATA_value')
                        nodatapos=nodatapos+1;
                    end
                    nodatapos=nodatapos+1;% Position of the nodata_value number

                    NODATA_value=str2num(data{nodatapos});
                    rows=str2num(data{4});
                    columns=str2num(data{2});


                    matrix=zeros(rows,columns);

                    counter=1;
                    for r=1:rows
                        for c=1:columns
                            matrix(r,c)=str2num(data{nodatapos+counter});
                            if matrix(r,c)==NODATA_value
                                matrix(r,c)=0;
                            end
                            counter=counter+1;
                        end
                    end

                elseif err==1 %If data can't be downloaded, fills the matrix with the failvalue
                    rows=str2num(height);
                    columns=str2num(width);

                    for r=1:rows
                        for c=1:columns
                            matrix(r,c)=failvalue;
                        end
                    end

                end

                values(:,:,position)=matrix;
                position=position+1;

            end
        end
    end
end

beep
pause(1)
beep
pause(1)
beep

% irad(:,1)=values(1,1,:);
% plot(irad)
