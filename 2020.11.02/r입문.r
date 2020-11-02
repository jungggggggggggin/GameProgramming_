help(c)
?c

#스칼라(scala) : 구성 인자가 1개인 벡터
n1 <- c(1)
s1 <- c("Kim")
n1
s1


#벡터(Vector)
v1 <- c(1, 2, 3)
v2 <- c("Kim", "Lee", "Choi")
v3 <- c(TRUE, FALSE, TRUE)
v1
v1[1]
v1[2]
v1[3]
v2
v3
v1 <- c(1, 2, 3, TRUE)
v1 
v2 <- c(1, 2, 3, "TRUE")
v2
v3 <- c(1+2i, 3, 4)
v3

#Factor
#(1)문자형 데이터를 그냥 입력하면, 따옴표가 있는 문자형 벡터가 생성
f1 <- c("Middle", "Low", "High")
f1
#(2) factor() 함수를 이용해서 문자형 벡터를 요인(factor)로 변환
#단, 순서를 지정하지 않으면 알파벳 순서로 수준(level)이 자동으로 지정됨
f2 <- factor(f1)
f2
#(3) 수준(level)에서 순서를 부여하려면 'order=TRUE' 옵션 설정, level=c("")에 순서대로 입력
f3 <- factor(f2, order=TRUE, level=c("Low", "Middle", "Hogh"))
f3

#yes, no를 명목형 범주로 지정하면 해당 값만 넣을 수 있음
answer <- factor("yes", c("yes", "no"))
answer
#범주 값을 벗어나는 값을 넣을 수 없다.
answer <- factor("why", "yes", "good"), c("yes", "no"))
answer
#순서형 범주로 레벨 순서를 줄 수 있다.
order1 <- factor(1, c(1, 2, 3), ordered=TRUE, levels = c(3, 2, 1))
order1

#Matrix
#1-12까지의 숫자를 행(row)의 수가 4개인 행렬로 만들어라.
m1 <- matrix(1:12, nrow=4)
m1
#1-12까지의 숫자를 행(row)의 수가 4개인 행렬을 만드는데, 행기준으로 만들어라.
m2 <- matrix(1:12, nrow=4, byrow=TRUE)
m2

y <- matrix(c(1,2,3,4), nrow=2, byrow=T)  #행렬만들기
y
y %*% y		#행렬간 곱하기
3*y		#모든 원소에 *3
y*y		#각 원소의 제곱
z <- matrix(c(1,1,1,2,1,0,3,0,1,4,0,0), nrow=4, byrow=T)  #행렬만들기
z
z %*% z		#에러 (4*3) * (4*3)
z %*% t(z)	#전치행렬 (4*3) * (3*4)
z[,2:3]		#행은 모두 출력하고 2, 3번째 열만 출력
z[-2]		#2행을 빼고 출력
dim(z)		#행렬이 몇 행 몇 열인지 출력
dim(z)[1]	#z행렬의 행의 개수 출력
dim(z)[2]	#z행렬의 열의 개수 출력
#수업중 실습
z[3,]        #특정열 출력 
z[3,1]       #특정행렬 출력

z <- matrix(c(1,2,3,4,5,6), nrow=3, byrow=F)	#행렬만들기
z
apply(z,1,mean)		#(1,4), (2,5), (3,6)의 평균
apply(z,2,mean)		#(1,2,3), (4,5,6)의 평균
apply(z,1,sum)		#(1,4), (2,5), (3,6)의 합
apply(z,2,sum)		#(1,2,3), (4,5,6)의 합

#Array
a1 <- array(1:24, c(2,3,4))
a1
arr1 <- array(1:12, dim=c(2,2,3))
arr1

#Data frame
#다른 유형의 벡터 생성
d1 <- c(1, 2, 3, 4)
d2 <- c("Kim", "Lee", "Choi", "Park")

#데이터 프레임으로 묶기 : data.frame() 함수 사용
d3 <- data.frame(cust_id=d1, last_name=d2)	#필드명 부여
d3

x <- data.frame(성명=c("홍길동", "손오공"), 나이=c(20,30), 주소=c("서울", "부산"))
x
x <- cbind(x, 학과=c("전산학", "경영학"))
x
x <- rbind(x, data.frame(성명="장발장", 나이=40, 주소="파리", 학과="전산학")
x
name <- c("팬텀", "크리스틴 다예", "라울드 샤니")
gender <- c("남", "여", "남")
score.eng <- c(80, 90, 100)
score.phil <- c(90, 95, 87)
df <- data.frame(성명=name, 성별=gender, 영어=score.eng, 철학=score.phil)
df

#List
list1 <- list(x=1:4, y=c("가", "나"))
list1
list1$x
list1[1]
list1$y
list1[2]
list2 <- list(name="팬텀", gender="남", score=c(85,90))
list2
list2$score
list2$score[1]

#Vector(L1), Matrix(L2), Array(L3), Data Frame(L4)를 만들어서 하나의 List(L5)로 묶어라.
L1 <- c(1,2,3,4)	#Vector
L2 <- matrix(1:6, 3, byrow=TRUE)	#Matrix
L3 <- array(1:24, c(3, 4, 2))		#Array
L4 <- data.frame(cust_id=c(1,2,3,4), last_name=c("Kim", "Lee", "Choi", "Park"))		#Data Frame
L5 <- list(L1, L2, L3, L4)
L5

#R에서 제공하는 data set
data()
quakes
head(quakes, n=10)  	#데이터의 앞부분 10개(디폴트=6)
tail(quakes, n=6)	#데이터의 뒷부분 6개(디폴트=6)
names(quakes)		#변수명 보기
str(quakes)		#차원보기(행과 열의 수)
summary(quakes)		#각 변수별 데이터 요약 보기
summary(quakes$mag)	#msg 변수 정보 보기

#파일 저장하기
write.table(quakes, "c:/temp/quakes.txt", sep=",")

#파일 읽어오기
x <- read.csv(file.choose(), header=T)
x

setwd("c:/datamarket")
getwd()
exam_df<-read.csv("exam.csv",header=TRUE)
str(exam_df)
head(exam_df)

exam_df$exam1[2:3]	#column명을 이용하는 방법
exam_df$exam1[c(2,3)]	
exam_df[2:3,1]		#matrix와 동일한 접근법 exam_df[2:3,1] or exam_df[2:3,"exam1"]	

index_vector<-rep(FALSE,11)
index_vector[2:3]<-TRUE
index_vector
exam_df[index_vector,1]		#TRUE, FALSE를 이용하는 방법

index_vector <- exam_df$exam1 < 3  	#exam1의 점수 중에 3보다 적은 것을 TRUE로
index_vector
exam_df[index_vector,1]			#exam1에서 3보다 적은 값 출력


index_wh<-which(exam_df$exam1<3)	#exam1<3 만족하는 값의 위치
index_wh
exam_df[index_wh,1]			#값 출력

index<-rep(FALSE,11*3)
index[13:14]<-TRUE
index_matrix<-matrix(index,ncol=3)
index_matrix
exam_df[index_matrix]
which(index_matrix)


#url을 이용하여 웹 파일 가져오기
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
x <- read.csv(url)
x

#함수 만들기
getCircleArea <- function(r) {
	area = 3.14*r^2 #r의 제곱
	return(area)
}

getCircleArea(3)
