function part_6e(pattern, scene)

%%threshold
 threshold = 6e7;

%%add pad for pattern
bigp = zeros(size(scene));
bigp(1:size(pattern,1),1:size(pattern,2)) = pattern;

%%do the correlation
t0 = clock;			% record the time 
r = ifft2(fft2(scene).*conj(fft2(bigp)));     
elapsedTime = etime(clock, t0);

fprintf('Elapsed time is %s seconds\n',elapsedTime);
f = figure;
set(f,'Name','Correlation Value 2D_FFT','numbertitle','off');
image(r);

f = figure;
set(f,'Name','Correlation Value 3D_FFT','numbertitle','off');

[eh, ew] = size(pattern);
h = surf(r');
set(h,'LineStyle','none');

f = figure;
set(f,'Name','Locate the letter o_FFT','numbertitle','off');
imshow(scene);
hold on;

[x,y] = find(r > threshold);
for i=1:size(x)
        rectangle('position',[y(i), x(i), 53, 61],'edgecolor','cyan');
end

hold off;


%%????????????
%%     a.?????????????????????????????????????????????
%%     b.????????????????????????(3d???????????????????????????????????????????????????
%%     c.??? o c ?????????????????????????????????
%%????????????
%      a.????????????????????????????????????threshold??????????????????
%      b.???padding???FFT???????????????
%      c.??????padding??????6.833874e+02??????????????????????????????