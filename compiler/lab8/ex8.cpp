#include<bits/stdc++.h>
using namespace std;
void fun1(int v,string s)
{
   cout<<"if(s"<<v<<"=="<<s<<") goto Block"<<s<<endl;
}
int main()
{
     int n,i,j,k;
     cin>>n;

     vector<string> in;

     for(i=0;i<n;i++)
     {
         string s;
         cin>>s;
         in.push_back(s);
     }

     string t="s";

     int v=1;
     queue<int> q;

     cout<<t<<v<<"="<<in[0].substr(7,3)<<endl;
     bool flag=false;
     int temp;
        for(i=1;i<n;i++)
        {
            if(in[i]=="{"||in[i]=="}")
            {
                continue;
            }
            else if(in[i].substr(0,4)=="case")
            {
                q.push(i);
                fun1(v,in[i].substr(4,1));
            }
            else
            {
                flag=true;
                temp=i;
                cout<<"goto Block"<<i-1<<endl;
            }
        }


        while(!q.empty())
        {
             int l=q.front();
             q.pop();
             cout<<"Block"<<l-1<<":"<<endl;
             v++;
             cout<<t<<v<<"="<<in[l].substr(8,3)<<endl;
             cout<<"x="<<t<<v<<endl;
             if(in[l].size()>=12)
             {
                  if(in[l].substr(12,6)=="break;")
                  {
                      cout<<"goto Block"<<n<<endl;
                  }
             }
        }

        if(flag)
        {
                v++;
                cout<<"Block"<<temp-1<<":"<<endl;
                cout<<t<<v<<"="<<in[temp].substr(10,3)<<endl;
                cout<<"x="<<t<<v<<endl;
                cout<<"goto Block"<<n<<endl;
        }

        cout<<"Block"<<n<<":end"<<endl;
        return 0;
}
