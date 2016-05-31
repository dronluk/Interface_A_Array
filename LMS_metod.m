function [ e,W,Y,coef ] = LMS_metod( D,UINTER,MU,STEP )
%���������������-���������  ������ ������������ ������
d=D;            % ��������� ������ �������
Uinter=UINTER;  % ������������ ������� �������
mu =MU;         % ��� ����������
step=STEP;
coef=zeros(3,step);
W=zeros(length(Uinter(:,1)),1);
% W=[0;0;0;0;0;0;0;0;0];%����������
%W=[0;0;0];
for n=1:step
    Y = W'*Uinter;     %������� � ������������ ������ ����������� � ����������
    e = d - Y;         % �������� ������ 
    W_ = mu*Uinter*e'; % ������ �����������
    W = W + W_;
    for k=1:3          %������ � ������ ����������� ��� 3� ������������ �����
    coef_filtr(k,n)=W(k,1);
    end
end;
std(e)%������� ���������� ����������
figure(11);hold on
plot(real(coef_filtr(1,:)),'r');plot(real(coef_filtr(2,:)),'g');plot(real(coef_filtr(3,:)),'k');%����������� ��� ������ �����������
title('�����������');

end

