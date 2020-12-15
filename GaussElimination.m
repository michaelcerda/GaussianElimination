%-----Gauss Elimination with Partial Pivoting-----%

clear all; close all; clc;

A = [2 1 -1; 2 1 -2; 1 -1 1];
B = [1 -2 2]';

% Results from gaussElim function
X = gaussElim(A,B)


% Results using MATLAB built-in function
Results_from_MATLAB_Built_in_function = A\B


function X = gaussElim(A,B)

M=[A,B]; %Concatenate matrix and column vector
[nr,nc]=size(M);%Extract size of rows and columns from M matrix

for r=1:nr %Create main loop
    %Partial Pivoting
    scale = M(r,r);
    max = abs(scale); 
    maxr = r; %Assign position of pivot to maxr

    %Find row with max column value and keep track of the row index
    for mr = r:nr
        scale3 = M(mr,r);
        if max < abs(scale3)
            max = abs(scale3);
            maxr = mr;   %Keep track of the row index      
        end
    end
    
    %Swap rows r and maxr to fix singularity issue
    temp_A2 = M(r,:);
    M(r,:) = M(maxr,:);
    M(maxr,:) = temp_A2;

%Scale each row according to corresponding pivot    
scale2 = M(r,r);
    for c= r:nc
        M(r,c)=M(r,c)./scale2;
    end

%Reduce rows except for the current row
    for rr=1:nr
        if (rr~=r)
            scale4 = M(rr,r);
            for c = r:nc
                M(rr,c)=M(rr,c)-scale4*M(r,c);
            end
        end
    end
end
X = M(:,nc); %Extract solution from last column of M matrix
end


