help(c)
?c

#��Į��(scala) : ���� ���ڰ� 1���� ����
n1 <- c(1)
s1 <- c("Kim")
n1
s1


#����(Vector)
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
#(1)������ �����͸� �׳� �Է��ϸ�, ����ǥ�� �ִ� ������ ���Ͱ� ����
f1 <- c("Middle", "Low", "High")
f1
#(2) factor() �Լ��� �̿��ؼ� ������ ���͸� ����(factor)�� ��ȯ
#��, ������ �������� ������ ���ĺ� ������ ����(level)�� �ڵ����� ������
f2 <- factor(f1)
f2
#(3) ����(level)���� ������ �ο��Ϸ��� 'order=TRUE' �ɼ� ����, level=c("")�� ������� �Է�
f3 <- factor(f2, order=TRUE, level=c("Low", "Middle", "Hogh"))
f3

#yes, no�� ����� ���ַ� �����ϸ� �ش� ���� ���� �� ����
answer <- factor("yes", c("yes", "no"))
answer
#���� ���� ����� ���� ���� �� ����.
answer <- factor("why", "yes", "good"), c("yes", "no"))
answer
#������ ���ַ� ���� ������ �� �� �ִ�.
order1 <- factor(1, c(1, 2, 3), ordered=TRUE, levels = c(3, 2, 1))
order1

#Matrix
#1-12������ ���ڸ� ��(row)�� ���� 4���� ��ķ� ������.
m1 <- matrix(1:12, nrow=4)
m1
#1-12������ ���ڸ� ��(row)�� ���� 4���� ����� ����µ�, ��������� ������.
m2 <- matrix(1:12, nrow=4, byrow=TRUE)
m2

y <- matrix(c(1,2,3,4), nrow=2, byrow=T)  #��ĸ����
y
y %*% y		#��İ� ���ϱ�
3*y		#��� ���ҿ� *3
y*y		#�� ������ ����
z <- matrix(c(1,1,1,2,1,0,3,0,1,4,0,0), nrow=4, byrow=T)  #��ĸ����
z
z %*% z		#���� (4*3) * (4*3)
z %*% t(z)	#��ġ��� (4*3) * (3*4)
z[,2:3]		#���� ��� ����ϰ� 2, 3��° ���� ���
z[-2]		#2���� ���� ���
dim(z)		#����� �� �� �� ������ ���
dim(z)[1]	#z����� ���� ���� ���
dim(z)[2]	#z����� ���� ���� ���
#������ �ǽ�
z[3,]        #Ư���� ��� 
z[3,1]       #Ư����� ���

z <- matrix(c(1,2,3,4,5,6), nrow=3, byrow=F)	#��ĸ����
z
apply(z,1,mean)		#(1,4), (2,5), (3,6)�� ���
apply(z,2,mean)		#(1,2,3), (4,5,6)�� ���
apply(z,1,sum)		#(1,4), (2,5), (3,6)�� ��
apply(z,2,sum)		#(1,2,3), (4,5,6)�� ��

#Array
a1 <- array(1:24, c(2,3,4))
a1
arr1 <- array(1:12, dim=c(2,2,3))
arr1

#Data frame
#�ٸ� ������ ���� ����
d1 <- c(1, 2, 3, 4)
d2 <- c("Kim", "Lee", "Choi", "Park")

#������ ���������� ���� : data.frame() �Լ� ���
d3 <- data.frame(cust_id=d1, last_name=d2)	#�ʵ�� �ο�
d3

x <- data.frame(����=c("ȫ�浿", "�տ���"), ����=c(20,30), �ּ�=c("����", "�λ�"))
x
x <- cbind(x, �а�=c("������", "�濵��"))
x
x <- rbind(x, data.frame(����="�����", ����=40, �ּ�="�ĸ�", �а�="������")
x
name <- c("����", "ũ����ƾ �ٿ�", "���� ����")
gender <- c("��", "��", "��")
score.eng <- c(80, 90, 100)
score.phil <- c(90, 95, 87)
df <- data.frame(����=name, ����=gender, ����=score.eng, ö��=score.phil)
df

#List
list1 <- list(x=1:4, y=c("��", "��"))
list1
list1$x
list1[1]
list1$y
list1[2]
list2 <- list(name="����", gender="��", score=c(85,90))
list2
list2$score
list2$score[1]

#Vector(L1), Matrix(L2), Array(L3), Data Frame(L4)�� ���� �ϳ��� List(L5)�� �����.
L1 <- c(1,2,3,4)	#Vector
L2 <- matrix(1:6, 3, byrow=TRUE)	#Matrix
L3 <- array(1:24, c(3, 4, 2))		#Array
L4 <- data.frame(cust_id=c(1,2,3,4), last_name=c("Kim", "Lee", "Choi", "Park"))		#Data Frame
L5 <- list(L1, L2, L3, L4)
L5

#R���� �����ϴ� data set
data()
quakes
head(quakes, n=10)  	#�������� �պκ� 10��(����Ʈ=6)
tail(quakes, n=6)	#�������� �޺κ� 6��(����Ʈ=6)
names(quakes)		#������ ����
str(quakes)		#��������(��� ���� ��)
summary(quakes)		#�� ������ ������ ��� ����
summary(quakes$mag)	#msg ���� ���� ����

#���� �����ϱ�
write.table(quakes, "c:/temp/quakes.txt", sep=",")

#���� �о����
x <- read.csv(file.choose(), header=T)
x

setwd("c:/datamarket")
getwd()
exam_df<-read.csv("exam.csv",header=TRUE)
str(exam_df)
head(exam_df)

exam_df$exam1[2:3]	#column���� �̿��ϴ� ���
exam_df$exam1[c(2,3)]	
exam_df[2:3,1]		#matrix�� ������ ���ٹ� exam_df[2:3,1] or exam_df[2:3,"exam1"]	

index_vector<-rep(FALSE,11)
index_vector[2:3]<-TRUE
index_vector
exam_df[index_vector,1]		#TRUE, FALSE�� �̿��ϴ� ���

index_vector <- exam_df$exam1 < 3  	#exam1�� ���� �߿� 3���� ���� ���� TRUE��
index_vector
exam_df[index_vector,1]			#exam1���� 3���� ���� �� ���


index_wh<-which(exam_df$exam1<3)	#exam1<3 �����ϴ� ���� ��ġ
index_wh
exam_df[index_wh,1]			#�� ���

index<-rep(FALSE,11*3)
index[13:14]<-TRUE
index_matrix<-matrix(index,ncol=3)
index_matrix
exam_df[index_matrix]
which(index_matrix)


#url�� �̿��Ͽ� �� ���� ��������
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
x <- read.csv(url)
x

#�Լ� �����
getCircleArea <- function(r) {
	area = 3.14*r^2 #r�� ����
	return(area)
}

getCircleArea(3)
