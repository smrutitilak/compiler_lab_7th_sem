#include <stdio.h>

int main()
{
  int n, i, j,flag=0;
  char c;
  scanf(" %d", &n);
  char code[20][100];
  j = 0;
  scanf("%c", &c);
 
  i = 0;
  while(i < n)
    {
      scanf("%c", &c);
      if(c == '\n')
	{
	  code[i][j] = 0;
	  i++;
	  j = 0;
	  continue;
	}
      code[i][j] = c;
      j++;
    }
  
  printf("\nThree Address code=:\n\nt1 = ");
  i = 7;
  while(code[0][i] != ')')
    {
      printf("%c", code[0][i]);
      i++;
    }
  printf("\n");
  if(code[n-2][1]=='d')
  flag = 1;
  int k = n-2;
  if(flag == 0) k++;
  for(i = 2; i < k; i++)
    {
      printf("if(t1 ==  %c) JUMP TO A%c\n", code[i][6], code[i][6]);
    } 
  if(flag)
  {
  	i = 11;
  	printf("t2");
  	while(code[n-2][i] != 0)
    	{
      		printf("%c", code[n-2][i]);
      		i++;
    	}
  	printf("\n %c = t2\nJump to END\n",code[n-2][10]);
  }
  for(i = 2; i < k; i++)
    {
      printf("A%c: ", code[i][6]);
      j = 10;
      printf("t2");
      while(code[i][j] != 0)
	{
	  printf("%c", code[i][j]);
	  j++;
	}
      printf("\n %c = t2\nJump to END\n",code[i][9]);
    }
  printf("END:\n");
  return 0;
}


