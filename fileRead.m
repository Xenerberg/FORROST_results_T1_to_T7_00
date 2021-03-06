clear all;
counter = 0;
iCount1 = 0;
iCount2 = 0;
for filesCount = 1:7
    fileName = strcat(strcat('trajectory_T',num2str(filesCount)),'_00.txt');
    fid = fopen(fileName,'r');
   
    if fid ~= -1      
        rowCounter = 0;
        while ~feof(fid)
           line = fgets(fid);%read line
           if length(line) == 1
               continue;
           end
           counter = counter + 1;           
           rowCounter = rowCounter + 1;
           row = sscanf(line,'%f');
           if mod(counter,2) == 1
              %Ground Truth 
              iCount1 = iCount1 + 1;          
              temp = reshape(row,4,3)';
              q = dcm2quat(temp(1:3,1:3));   
              GTData(:,iCount1) = [q';temp(1:3,4)/1000];
           else
              %Estimated Truth
              iCount2 = iCount2 + 1;
              if length(row) ~= 1
                temp = reshape(row,4,3)';
                q = dcm2quat(temp(1:3,1:3));   
                EstData(:,iCount1) = [q';temp(1:3,4)/1000];
              else
                EstData(:,iCount1) = nan(7,1);  
              end
           end
           
        end
    end
    fclose(fid);
    rowsCount(filesCount) = rowCounter;
end
rowsCount = rowsCount/2;

