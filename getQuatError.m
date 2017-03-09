clc; 
counter = 0;
for iCount = 1:length(EstData)
   q_est = EstData(1:4,iCount);
   q_gt = GTData(1:4,iCount);
   q_gt_star = [-q_gt(1:3);q_gt(4)];
   %if ~isnan(q_est)
       del_q = fn_CrossTensor(q_est,0)*q_gt_star;
       counter = counter + 1;
       if (del_q(4)) < 0.90
           if abs(del_q(4)) > 0.9
               del_q = -del_q;
           end
           display('waring, scalar low');
           q_est
           q_gt
           del_q(4)
       end
       del_q_v(:,counter) = del_q(1:3);
   %end
       
end
figure;
prev = 0;
subplot(3,1,1);
for iCount = 1:7    
    plot(prev+1:prev+rowsCount(iCount),del_q_v(1,prev+1:prev+rowsCount(iCount)));hold all;
    prev = prev + rowsCount(iCount);      
end
xlabel('samples from T_1 to T_7');
ylabel('$\delta{}q_1$','interpreter','latex','FontSize', 20);  
prev = 0;
subplot(3,1,2);
for iCount = 1:7    
    plot(prev+1:prev+rowsCount(iCount),del_q_v(2,prev+1:prev+rowsCount(iCount)));hold all;
    prev = prev + rowsCount(iCount);      
end
xlabel('samples from T_1 to T_7');
ylabel('$\delta{}q_2$','interpreter','latex','FontSize', 20); 

prev = 0;
subplot(3,1,3);
for iCount = 1:7    
    plot(prev+1:prev+rowsCount(iCount),del_q_v(3,prev+1:prev+rowsCount(iCount)));hold all;
    prev = prev + rowsCount(iCount);      
end
xlabel('samples from T_1 to T_7');
ylabel('$\delta{}q_3$','interpreter','latex','FontSize', 20);  