signal = randi([0,1], 20,1);
%figure
%stairs(signal)
power = var(signal);
snr = 10;
No = power/snr;
noise = randn(20,1)*sqrt(No);
recieved_signal = signal + noise;
%figure
%stairs(recieved_signal)
dec = zeros(20,1);
%figure
%stairs(dec)
for c = 1:length(recieved_signal)
    if recieved_signal(c) >= 0.5
        dec(c) = 1;
    else
        dec(c) = 0;
    end
end
count = 0;
for c = 1:length(dec)
    if signal(c) ~= dec(c)
        count = count + 1;
    end
end
display(count)
Y = [signal, dec];
figure
stairs(Y)
        