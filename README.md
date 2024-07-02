# Filter_Related_Distortion
In this project we are going to form 500 symbols of a QPSK modulated communication signal with a sqrt-Nyquist shaping filter, a signal distorting band limiting low pass filter and a sqrt-Nyquist matched filter. Our goal is to compare the distortion levels induced by the low-pass filter and identify the filter with the minimum distortion.  

BW_0.25: A square root Nyquist filter with 25% excess bandwidth
BW_0.50: A square root Nyquist filter with 50% excess bandwidth

*These all use the BW_0.50*
Cheby2: Pass through a 5-th order cheby2 filter with 50 dB stopband attenuation and cutoff frequency of 0.6. 
Cheby2_matched: Pass the output of the cheby2 filter through the Matched filter 
Cheby1: Pass through a 5-th order cheby1 filter
Cheby1_matched: Pass the output of the cheby1 filter through the Matched filter 
FIR_filter: Pass through a 30-tap linear phase FIR Filter 
FIR_filter_matched: ass the output of the FIR filter through the Matched filter
