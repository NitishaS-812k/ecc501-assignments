num_bit = 200;

samp_per_bit = 100;

bits = randi([0,1], num_bit, 1);

for i = 1:num_bit
    if bits(i) == 0
        bits(i) = -1;
    end
end

Tb = 1;
snr = 10;
fs = samp_per_bit/Tb;
fc = 0.005*fs;

signal = repelem(bits, samp_per_bit);
[b,a] = butter(2, fc/(fs/2));
filtered_signal = filter(b,a,signal);
output_signal = awgn(filtered_signal, snr);

h = eyediagram(signal, num_bit);
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-2,2]);
title('Without ISI');

j = eyediagram(filtered_signal, num_bit,h);
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-2,2]);
title('With ISI')

eyediagram(output_signal, num_bit, h);
xlabel('Time (s)');
ylabel('Amplitude')
ylim([-2,2]);
title('With ISI and AWGN');