num_bit = 20;   %number of bits

samp_per_bit = 100;  %samples per bit

bits = randi([0,1], num_bit, 1); 

for i = 1:num_bit     %converting to polar nrz
    if bits(i) == 0
        bits(i) = -1;
    end
end

Tb = 1;     %bit duration
snr = 1;
fs = samp_per_bit/Tb;  %sampling frequency
fc = 0.005*fs;          %cutoff frequency

signal = repelem(bits, samp_per_bit);  %the original signal

[b,a] = butter(2, fc/(fs/2));

filtered_signal = filter(b,a,signal);

output_signal = awgn(filtered_signal, snr);

figure(1)

subplot(3,1,1);
stairs(signal, 'g');
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt/100);
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-2,2]);
title('Without ISI');

subplot(3,1,2);
plot(filtered_signal, 'b');
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt/100);
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-2,2]);
title('With ISI')

subplot(3,1,3);
plot(output_signal, 'r');
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt/100);
xlabel('Time (s)');
ylabel('Amplitude')
ylim([-2,2]);
title('With ISI and AWGN');