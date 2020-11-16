signal = randi([0,1], 20,1);
figure
stairs(signal)
power = var(signal);
snr = 0.1;
No = power/snr;
noise = randn(20,1)*sqrt(No/2);
recieved_signal = signal + noise;
figure
stairs(recieved_signal)
th = 0.5;
output = recieved_signal>th;
error = abs(signal - output);
index = find(error>0);
count = length(index);
display(count)