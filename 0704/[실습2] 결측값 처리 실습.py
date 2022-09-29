#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
#pandas package
import numpy as np #numpy package : np.nan이용 결측값 생성
import matplotlib.pyplot as plt #matplotlib 시각화 패키지
import seaborn as sns #seaborn 시각화 패키지


# In[4]:


import os
if os.name == 'nt' : #Window OS
    font_family = "Malgun Gothic"
else : #MAC OS
    font_family = "AppleGothic"
    
sns.set(font=font_family, rc={"axes.unicode_minus" : False})

from sklearn.impute import SimpleImputer
from sklearn import linear_model


# temp_dict = {'A열' : [np,nan,4,6,5,5,np,nan],'B열' : ['a','a',np.nan, 'b','b','b'], 'C열' : [np.npn,3.5,-1.5,np.nan,5.5,np.nan], 'D열' : [1,0,1,0,1,1]}
# missing_data = pd.DataFrame(temp_dict)
# missing_data

# In[7]:


temp_dict = {'A열' : [np.nan,4,6,5,5,np.nan],
             'B열' : ['a','a',np.nan, 'b','b','b'], 
             'C열' : [np.nan,3.5,-1.5,np.nan,5.5,np.nan], 
             'D열' : [1,0,1,0,1,1]} 
missing_data = pd.DataFrame(temp_dict) 
missing_data


# missing_data.info()

# In[8]:


missing_data.info()


# In[9]:


missing_data.dropna(thresh=5,axis=1)


# In[12]:


missing_data[missing_data['B열'].notnull()]


# In[13]:


missing_data


# In[14]:


missing_data ["A열"].fillna(0)
# missing_data ["A열"]=missing_data["A열"].fillna(0)


# In[15]:


missing_data["B열"].fillna(method = "ffill")


# In[16]:


missing_data["C열"].fillna(method = "bfill").head


# In[17]:


missing_data.fillna(missing_data.mean())
#missing_data.where(pd.notnull(missing_data), missing_data.min(), axis='columns')


# In[18]:


df = missing_data.copy()
imputer = SimpleImputer(strategy="most_frequent")


# In[20]:


df["A열"]=imputer.fit_transform(missing_data[["A열"]])


# In[21]:


df


# In[25]:


data = pd.read_csv("http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data",
                  header=None,
                  names=['sex','length','diameter','height','whole_weight','shucked_weight','viscera_weight','shell_weight','rings'])
df_missing = data.copy()[:20]


# In[26]:


df_missing.loc[0:4, 'whole_weight']=np.nan


# In[27]:


df_missing.head(10)


# In[30]:


X = df_missing.dropna(axis=0)[['diameter','height','shell_weight']]
Y = df_missing.dropna(axis=0)['whole_weight']


# In[31]:


X.head()


# In[32]:


Y.head()


# In[34]:


lin_reg = linear_model.LinearRegression()
lin_reg_model = lin_reg.fit(X,Y)
Y_pred = lin_reg_model.predict(df_missing.loc[:,['diameter','height','shell_weight']])
Y_pred


# In[37]:


df_missing['whole_weight'].fillna(pd.Series(Y_pred.flatten()), inplace=True)
df_missing


# In[ ]:




