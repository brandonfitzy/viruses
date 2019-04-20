function [grid2]=virus(day, probInfect)
%this function will animate the rate of infection of a population
%the inputs are the number of days and the rate of infection
%intializing grid 1 with patient 0
grid1=zeros(100);
grid1(50,50)=1;
displayGrid(grid1)
%itialize grid2
grid2=zeros(100);
%for loop to run for the given days
for d=1:day
    %run through all rows
    for r=2:99
        %run through all columns
        for c=2:99
            %if the person is 0 they can get infected
            if grid1(r,c)==0
                %check to see if there is an infected person near
                if grid1(r+1,c)||grid1(r,c+1)||grid1(r-1,c)||grid1(r,c-1)==(1||2)
                    %randomly decide with give prob if the current person
                    %will get infected
                    if rand(1)<=probInfect
                        grid2(r,c)=1;
                    else
                        grid2(r,c)=0;
                    end
                else
                    %if no infected person near this person remains 0
                    grid2(r,c)=0;
                end
            else 
                %if already infected or imune they have a number 1 though 7
                if grid1(r,c)==7
                    %if at 7 it is reset to 0 and are suseptible again
                    grid2(r,c)=0;
                else
                    %if between 1 and 6 adds 1 to their number
                    grid2(r,c)=grid1(r,c)+1;
                end
            end
        end
    end
%displays new grid for the day with a .2 sec pause
displayGrid(grid2)
pause(.1)
%sets new grid to grid 1
grid1=grid2;
end