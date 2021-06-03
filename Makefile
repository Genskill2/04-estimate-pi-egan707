.PHONY: test_mc test_wallis test exercises
%: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $< -o $@ -lm

exercises: monte_carlo wallis

test: test_mc test_wallis

test_mc: monte_carlo
float mc_pi(int n)
{
  float x_cor,y_cor,pi;
  double dist;
  int i=0,cc;
  cc=0;
  while(i<=n)
  {
  x_cor=frandom();
  y_cor=frandom();
    dist=x_cor*x_cor+y_cor*y_cor;
    if (dist<=1.0)
    {
      cc++;
    }
    i++;
  }
  pi=4*cc/n;
  return pi;
  
}
	./monte_carlo

test_wallis: wallis
float wallis_pi(int n)
{
  double pc=1.0;
  for(int i=1;i<= n;i++)
  {
    pc=pc*((2*i/(2*i-1.0))*(2*i/(2*i-1.0)));
  }
  return pc;
}
	./wallis
	
