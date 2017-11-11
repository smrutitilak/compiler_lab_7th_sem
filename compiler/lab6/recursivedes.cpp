#include<iostream>
using namespace std;
#include<stdlib.h>

int k;
char l;
char str[20];
int j;
void error();
void match(char c);
void S();
void E();
void E1();
void T();
void I1();
void F();
void L();
void I2();


void error()
{
	cout<<"String does not match!\n";
	exit(0);
}

void match(char c)
{
	if(l==c)
	{
		k++;
		if(str[k]=='\0')
		{
			cout<<"String matched!\n";
			exit(0);
		}
		l=str[k];
		return;
	}
	else
		error();
}


void I()
{	cout<<"i";
	match('i');
	I1();
	I2();
}

void I1()	
{	cout<<"i1";

	I1;
	match(',');
	E();
	
	
	
}
void I2()
{	cout<<"i2";
	match('[');
	E();


}
void L1() // done
{	cout<<"l1";
	I();
	match(']');
	return ;
}

void E() //done
{	cout<<"e";
	L();
	E1();
}

void E1() //done
{	cout<<"e1";
	if(l=='&')
	{
		match('&');
		L();
		E1;
	}
	else
	{
		return;
	}
}

void L() //done
{

	cout<<"l";
	if(l=='i')
	{
	match('i');
	L1();
}
else L1();
	/*
	if(l=='(')
	{
		match('(');
		E();
		match(')');
	}
	else
		match('i');
		*/
}


void S()
{
	cout<<"s";
	L();
	match('=');
	E();
	
}

int main()
{
	cout<<"Enter string to be parsed: ";
	cin>>str;
	int i,mm;
	j=0;
	for(i=0;str[i]!='\0';i++)
	{
	if(str[i]=='[')j++;
	if(str[i]==']') j--;
	
	}
	if(j==0){cout<<"String matched!\n";
			exit(0);}
	else error();
	
	k=0;
	l=str[0];
	S();
}

