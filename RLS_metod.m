function [  e,W,Y ] = RLS_metod( D,UINTER )
d=D;            % Эталонный сигнал выборки
Uinter=UINTER;  % Периферийные антенны выборки
L=length(Uinter);
lambda=0.87;%параметр взвешивания
N=length(Uinter);
W=zeros(length(Uinter(:,1)),1);
R=ones(length(Uinter(:,1)),1);
e(1)=0;
for j=1:length(Uinter(:,1))
for k=2:N
g(j,k)=(R(j,k-1)*Uinter(j,k)')/(lambda+Uinter(j,k)'*R(j,k-1)*Uinter(j,k));
R(j,k)=lambda.^(-1)*(R(j,k-1)-g(j,k)*Uinter(j,k)'*R(j,k-1));
e(k)=d(1,k)-W(j,k-1)'*Uinter(j,k);
W(j,k)=g(j,k)*e(k);
W(j,k)=W(j,k-1)+W(j,k);
end
end
W=W(:,N);
Y=W'*Uinter;
 std(e)%Среднее отклонение сходимости

end

