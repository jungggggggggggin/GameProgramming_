#include <stdio.h>  // fopen, fputs, fclose 함수가 선언된 헤더 파일
#include <conio.h>
#include <windows.h>

int menu_display(void);		  //주메뉴 표시
int sub_menu_display01(void); //서브메뉴1 표시
int sub_menu_display02(void); //서브메뉴2 표시
void sub_main01(void);        //서브메뉴 1 제어
void sub_main02(void);        //서브메뉴 2 제어
void press_any_key(void);     //아무키나 누르면 이전 메뉴로 

void display_carbonara_recipe(void); //까르보나라 레시피출력 
void display_BostonButtpilaf_recipe(void); //목살필라프 레시피 출력
void volume_calculation(void);//부피환산 
void weight_calculation(void);//무게환산
void print_unit(char *ms_char[], int n);
void volume_calculate(int basic, int transe, double measure, char *ms_char[]);
void weight_calculate(int basic, int transe, double measure, char *ms_char[]);

//메인메뉴 
int main(void)
{
	int c;
	while((c=menu_display())!=3)
	{
		switch(c)
		{
			case 1 : sub_main01();
				break;
			case 2 : sub_main02();
				break;
			default : break; 
		}
	}
	printf("\n");
	return 0;
}

//주메뉴 선택 
int menu_display(void)
{ 
    int select;
    system("cls");
    printf("디지털 레시피\n\n");
    printf("1. 레시피 \n");
    printf("2. 단위환산 \n");
    printf("3. 프로그램 종료\n\n");
    printf("메뉴번호 입력 > ");
    select=getch()-48;
    return select;
}

//서브메뉴1제어 (레시피 고르기)  
void sub_main01(void)
{
    int c;
    while((c=sub_menu_display01())!=3) //3(메인 메뉴로 이동)이 아니면 
    {
      switch(c) //1이면 까르보나라 2면 필라프 
      {
           case 1 : display_carbonara_recipe();
  	 	     break;
  	 	   case 2 : display_BostonButtpilaf_recipe();
           default : break; 
     }
   }
}

//서브메뉴1 표시  
int sub_menu_display01(void)
{
    int select;
    system("cls");
    printf("레시피\n\n");
    printf("1. 까르보나라\n");
    printf("2. 목살필라프\n"); 
    printf("3. 메인 메뉴로 이동\n\n");
    printf("메뉴번호 입력>");
    select=getch()-48; 
    return select;
}

//서브메뉴2제어 (단위환산)  
void sub_main02(void)
{
    int c;
    while((c=sub_menu_display02())!= 3) //3(메인 메뉴로 이동)이 아니면 
    {
      switch(c) //1이면 부피환산 2면 무게환산  
      {
           case 1 : volume_calculation();
  	 	     break;
           case 2 : weight_calculation();
  		     break;
           default : break;
     }
   }
}

//서브메뉴2 표시  
int sub_menu_display02(void)
{
        int select;
        system("cls");
        printf("단위환산\n\n");
        printf("1. 부피(volume) 환산 \n");
        printf("2. 무게(weight) 환산 \n");
        printf("3. 메인 메뉴로 이동\n\n");
        printf("메뉴번호 입력>");
        select=getch()-48;
        return select;
}


void press_any_key(void)
{
       printf("\n\n");
       printf("아무키나 누르면 이전 메뉴로 이동합니다 ! ");
       getch();
}

//까르보나라 레시피출력 
void display_carbonara_recipe(void)
{
  //[함수 9.2.6]의 정의 부분 참고
	FILE *fp1;
	char chr1[82];
	char *file1="carbonara.txt"; 
	fp1=fopen(file1, "r"); //파일을 읽기 모드로 열어주세요 라는 뜻 
	system("cls"); //clean screen 이라는 뜻 
	while(!feof(fp1)) //fp1에 더이상의 데이터가 없을 경우 참을 반환  
	{
		fgets(chr1, 80, fp1); //문자열 읽기 함수 까르보나라 파일을 80문자씩 읽기 
		if (chr1[0]==10) 
		{
			printf("\n다음단계로 이동하려면 아무키나 누르세요!");
			getch();
			system("cls");
		}
		else
			printf("%s", chr1);
	}
	printf("\n레시피 끝!\n");
	press_any_key();
	fclose(fp1);
}

//목살필라프 레시피 출력 
void display_BostonButtpilaf_recipe(void)
{
	//까르보나라 레시피와 동일한 구조 
	FILE *fp2;
	char chr2[82];
	char *file2="BostonButtpilaf.txt";
	fp2=fopen(file2, "r");
	system("cls");
	while(!feof(fp2))
	{
		fgets(chr2, 80, fp2);
		if (chr2[0]==10)
		{
			printf("\n다음단계로 이동하려면 아무키나 누르세요!");
			getch();
			system("cls");
		}
		else
			printf("%s", chr2);
	}
	printf("\n레시피 끝!\n");
	press_any_key();
	fclose(fp2);
}

//부피환산 
void volume_calculation(void)
{
  //[함수 9.2.1]의 정의 부분 참고
  char *ms_char[6]={"밀리리터", "teaspoon", "tablespoon", 
                     "cup", "리터", "갤런"};
  double measure;
  int basic, transe;
  system("cls");	
  printf("부피에 대한 도량형 환산 프로그램\n\n");
  print_unit(ms_char, 6);
  printf("\n\n기본단위와 변환단위\n입력 후 Enter(예:1 5)>");
  scanf("%d %d",&basic,&transe);
  printf("값을 입력하고 Enter>");
  scanf("%lf", &measure);
  printf("\n");
  volume_calculate(basic, transe, measure, ms_char);
  press_any_key();
}

//무게환산 
void weight_calculation(void)
{
  //[함수 9.2.2]의 정의 부분 참고
  char *ms_char[4]={"그램", "온즈", "파운드", "킬로그램"};
  double measure;
  int basic, transe;
  system("cls");	
  printf("무게에 대한 도량형 환산 프로그램\n\n");
  print_unit(ms_char, 4);
  printf("\n\n기본단위와 변환단위\n입력 후 Enter(예:1 5)>");
  scanf("%d %d",&basic,&transe);

  printf("값을 입력하고 Enter>");
  scanf("%lf", &measure);
  printf("\n");
  weight_calculate(basic, transe, measure, ms_char);
  press_any_key();

}

//단위 이름 붙이는 과정 
void print_unit(char *ms_char[], int n)
{
 	 //[함수 9.2.5]의 정의 부분 참고
	int i;
	for(i=0;i<n;i++)
	{
		printf("%d : %-9s  ", i, ms_char[i]); 
		if (i%3==2)  //1줄에 3개씩 출력 
			printf("\n");
	}
}

//부피 계산 과정 
void volume_calculate(int basic, int transe, double measure, char *ms_char[])
{
  //[함수 9.2.3]의 정의 부분 참고
  double msre[10], unit, result;
  msre[0]=3758.279; //밀리미터 
  msre[1]=msre[0]/5.; //teaspoon
  msre[2]=msre[1]/3.; //tablespoon
  msre[3]=msre[2]/16.667; //cup
  msre[4]=msre[3]/4.; //리터 
  msre[5]=msre[4]/3.758; //갤런 
  unit=msre[basic]; 
  result=measure*(msre[transe]/unit); 
  printf("%.3f %-10s : ", measure, ms_char[basic]);
  printf("%.3f %-10s", result, ms_char[transe]);
}

//무게 계산과정 
void weight_calculate(int basic, int transe, double measure, char *ms_char[])
{
  //[함수 9.2.4]의 정의 부분 참고
  double msre[4], unit, result;
  msre[0]=1000; //그램 
  msre[1]=msre[0]/28.3459; //온즈 
  msre[2]=msre[1]/16.; //파운드 
  msre[3]=msre[2]/2.205; //킬로그램 
  unit=msre[basic]; 
  result=measure*(msre[transe]/unit);
  printf("%.2f %-8s:", measure, ms_char[basic]);
  printf("%.5f %-8s", result, ms_char[transe]);
}




