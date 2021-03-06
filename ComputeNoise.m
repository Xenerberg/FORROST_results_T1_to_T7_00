mu = [pd_1.mu,pd_2.mu,pd_2.mu];
sigma = diag([pd_1.sigma,pd_2.sigma,pd_3.sigma].^2);
del_q_v_est = mvnrnd(mu,sigma,length(del_q_v));
figure;
subplot(3,1,1);
plot(del_q_v_est(:,1));
xlabel('samples from T_1 to T_7');
ylabel('$\delta{}\hat{q}_1$','interpreter','latex','FontSize', 20);
subplot(3,1,2);
plot(del_q_v_est(:,2));
xlabel('samples from T_1 to T_7');
ylabel('$\delta{}\hat{q}_1$','interpreter','latex','FontSize', 20);
subplot(3,1,3);
plot(del_q_v_est(:,3));
xlabel('samples from T_1 to T_7');
ylabel('$\delta{}\hat{q}_1$','interpreter','latex','FontSize', 20);
