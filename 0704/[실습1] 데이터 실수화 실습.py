#!/usr/bin/env python
# coding: utf-8

# In[5]:


'Hello'


# In[6]:


import pandas as pd
#pandas package 임포트
from sklearn.preprocessing import LabelEncoder #범주형 데이터의 실수화 함수 임포트
from sklearn.preprocessing import OneHotEncoder #더미변수 생성,가변환 함수 임포트


# In[11]:


#데이터 set 생성
x_train = pd.DataFrame(["남성","여성","남성","여성","남성","여성"],columns=["성별"])
#데이터 확인
x_train.head(3)


# In[12]:


x_train.info()
# 데이터 프레임의 정보 확인 : object 타입 '성별'변수


# In[14]:


x_train['성별'].value_counts()
#범주용 데이터의 갯수 확인


# In[15]:


#레이블 인코더 생성
encoding = LabelEncoder()
#X_train 데이터를 이용하여 피팅하고 레이블 숫자로 변환
encoding.fit(x_train["성별"])
x_train["성별_인코딩"]=encoding.transform(x_train["성별"])


# In[16]:


x_train


# In[18]:


print(list(encoding.classes_))
#클래스 확인
print(list(encoding.inverse_transform([1,0])))
#인코딩 값으로 문자값 확인


# In[19]:


x_train.head(2)


# In[23]:


#원핫인코더 생성
#sparse를 True로 할 경우"(행,열) 1"의 좌표리스트의 형식, False로 할 경우 넘파이 배열로 변환
one_encoding = OneHotEncoder(sparse=False)
#X_train 데이터를 이용하여 피팅
one_encoding.fit(x_train[["성별"]])
#가변환값 변환
one_encoding.transform(x_train[["성별"]])
#one_encoding.fit_transform(x_train[["성별"]])


# In[24]:


#가변환된 피쳐 확인
print(one_encoding.get_feature_names())


# In[26]:


#가변환된 값을 x_train_one 데이터 프레임으로 저장
x_train_one = pd.DataFrame(one_encoding.transform(x_train[['성별']]),
columns=['성별0','성별1'])


# In[27]:


#x_train 데이터와 x_train_one의 가변환된 속성 합침
x_train = pd.concat([x_train,x_train_one],axis=1)


# In[28]:


x_train.head(3)


# In[30]:


from sklearn.feature_extraction.text import CountVectorizer


# In[31]:


corpus = ['청년 인재 개발 양성 과정','인공지능 청년 양성','미래 인공지능 데이터 대한민국','데이터 원유 기술사 청년 개발]']


# In[32]:


corpus


# In[33]:


type(corpus)


# In[34]:


count_vect = CountVectorizer()
count_vect.fit(corpus)
count_vect.vocabulary_


# In[35]:


count_vect.transform(corpus).toarray()


# In[36]:


features = count_vect.transform(corpus)


# In[37]:


features


# In[40]:


vocab_idf = count_vect.get_feature_names()


# In[41]:


vocab


# In[42]:


DTM = pd.DataFrame(features.toarray(),columns=vocab).head()


# In[43]:


DTM


# In[44]:


count_vect.transform(['기술사 대한민국 인재 만세']).toarray()


# In[45]:


from sklearn.feature_extraction.text import TfidfVectorizer


# In[46]:


corpus


# In[48]:


tfid = TfidfVectorizer()
tfid.fit(corpus)
tfid.vocabulary_


# In[50]:


tfid.transform(corpus).toarray()


# In[51]:


features_idf = tfid.transform(corpus)


# In[52]:


features_idf


# In[54]:


vocab_idf = count_vect.get_feature_names()


# In[55]:


vocab_idf


# In[56]:


DTM_idf = pd.DataFrame(features_idf.toarray(),columns = vocab_idf).head()


# In[57]:


DTM_idf


# In[ ]:




