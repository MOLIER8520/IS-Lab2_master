clc
clear all
close all

%Sukuriami duomenys 
x= 0.1:1/22:1;
y = ((1+0.6*sin(2*pi*x/0.7))+0.3*sin(2*pi*x))/2;
%I koki iejima is kokio isejimo 

%paslepti sluoksniai, iejimo sloksnis, isejimo sloksnis 
figure (1);
plot(x,y);
grid on;
w11_1 = rand(1);
w21_1 = rand(1);
w31_1 = rand(1);
w41_1 = rand(1);
w51_1 = rand(1);
b1_1 = rand(1);
b2_1 = rand(1);
b3_1 = rand(1);
b4_1 = rand(1);
b5_1 = rand(1);

w11_2 = rand(1);
w12_2 = rand(1);
w13_2 = rand(1);
w14_2 = rand(1);
w15_2 = rand(1);
b1_2 = rand(1);

Y=zeros(1,length(x));
eta =0.1;
%Perceptrono atsakas
for a = 1:50000
    for i = 1:length(x)
        v1_1 = w11_1 * x(i) + b1_1;
        v2_1 = w21_1 * x(i) + b2_1;
        v3_1 = w31_1 * x(i) + b3_1;
        v4_1 = w41_1 * x(i) + b4_1;
        v5_1 = w51_1 * x(i) + b5_1;
    
        % Pasleptojo sluoksnio aktyvacijos funkcija
    
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);
            
        %Antras isejimo sluoksnis
    
        v1_2 = y1_1*w11_2+y2_1*w12_2+y3_1*w13_2+y4_1*w14_2+y5_1*w15_2+b1_2;
    
        %Isejimo sluoksnio aktyvacijos funkcija
    
        y1_2 = v1_2;
        Y(i) = y1_2;
    
        %klaios skaiciavimas
    
        e = y(i)-y1_2;
    
        %Pasleptojo sluoksnio klaidos gradientai

        delta1_2 = e ;
        delta1_1 = (1-tanh(v1_1)^2)*delta1_2*w11_2;
        delta2_1 = (1-tanh(v2_1)^2)*delta1_2*w12_2;
        delta3_1 = (1-tanh(v3_1)^2)*delta1_2*w13_2;
        delta4_1 = (1-tanh(v4_1)^2)*delta1_2*w14_2;
        delta5_1 = (1-tanh(v5_1)^2)*delta1_2*w15_2;

        %Atnaujinti svorius

        w11_2 = w11_2+eta*delta1_2*y1_1;
        w12_2 = w12_2+eta*delta1_2*y2_1;
        w13_2 = w13_2+eta*delta1_2*y3_1;
        w14_2 = w14_2+eta*delta1_2*y4_1;
        w15_2 = w15_2+eta*delta1_2*y5_1;
        b1_2 = b1_2+eta*delta1_2;

        %Pasleptasis sluoksnis

        w11_1 = w11_1+eta*delta1_1*x(i);
        w21_1 = w21_1+eta*delta2_1*x(i);
        w31_1 = w31_1+eta*delta3_1*x(i);
        w41_1 = w41_1+eta*delta4_1*x(i);
        w51_1 = w51_1+eta*delta5_1*x(i);
        b1_1 = b1_1+eta*delta1_1;
        b2_1 = b2_1+eta*delta2_1;
        b3_1 = b3_1+eta*delta3_1;
        b4_1 = b4_1+eta*delta4_1;
        b5_1 = b5_1+eta*delta5_1;
    
    end
    
end

hold on;
plot(x,Y);
hold off;

x_test= 0.1:1/220:1;


  for i = 1:length(x_test)
        v1_1 = w11_1 * x_test(i) + b1_1;
        v2_1 = w21_1 * x_test(i) + b2_1;
        v3_1 = w31_1 * x_test(i) + b3_1;
        v4_1 = w41_1 * x_test(i) + b4_1;
        v5_1 = w51_1 * x_test(i) + b5_1;
    
        % Pasleptojo sluoksnio aktyvacijos funkcija
    
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);
    
        %Antras isejimo sluoksnis
    
        v1_2 = y1_1*w11_2+y2_1*w12_2+y3_1*w13_2+y4_1*w14_2+y5_1*w15_2+b1_2;
    
        %Isejimo sluoksnio aktyvacijos funkcija
    
        y1_2 = v1_2;
        Y(i) = y1_2;
  end
hold on;
plot(x_test,Y);
legend;
hold off;
