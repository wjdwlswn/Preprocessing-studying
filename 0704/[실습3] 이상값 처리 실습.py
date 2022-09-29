#!/usr/bin/env python
# coding: utf-8

# In[4]:


import random
import pandas as pd
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import seaborn as sns

import os
if os.name == 'nt' : #Windows OS
    font_family = "Malgun Gothic"
else : #MAC OS
    font_family = "AppleGothic"
    
sns.set(font=font_family, rc={"axes.unicode_minus" : False})


# In[5]:


np_data = np.random.randint(1,100,size = 3000)
data = list(np_data)


# In[6]:


data[0:2]


# In[7]:


plt.hist(data)
plt.show()


# In[9]:


data_mean = np.mean(data)
data_std = np.std(data)

print(data_mean)
print(data_std)

pdf = stats.norm.pdf(np.sort(data),data_mean,data_std)

plt.figure()
plt.plot(np.sort(data),pdf)


# In[10]:


std_list = []

for i in data :
    z = (i - data_mean)/data_std
    std_list.append(z)
    
ol_data_mean = np.mean(std_list)
ol_data_std = np.std(std_list)

print(ol_data_mean)
print(ol_data_std)

ol_pdf = stats.norm.pdf(np.sort(std_list),ol_data_mean, ol_data_std)

plt.figure()
plt.plot(np.sort(std_list),ol_pdf)


# In[12]:


ol_data = data.copy()
ol_no = 10

for i in range(ol_no):
    rand_no = random.randint(0, len(data))
    ol_data.insert(rand_no, ol_data[rand_no]*2)
    
ol_data_mean = np.mean(ol_data)
ol_data_std = np.std(ol_data)

print(ol_data_mean)
print(ol_data_std)

ol_pdf = stats.norm.pdf(np.sort(ol_data),ol_data_mean, ol_data_std)

plt.figure()
plt.plot(np.sort(ol_data),ol_pdf)


# In[13]:


ol_std_list = []
for i in ol_data:
    z = (i - ol_data_mean) / ol_data_std
    ol_std_list.append(z)
    
ol_st_data_mean = np.mean(ol_std_list)
ol_st_data_std = np.std(ol_std_list)

print(ol_st_data_mean)
print(ol_st_data_std)

ol_std_pdf = stats.norm.pdf(np.sort(ol_std_list), ol_st_data_mean, ol_st_data_std)

plt.figure
plt.plot(np.sort(ol_std_list),ol_std_pdf)


# In[14]:


len(ol_std_list)


# In[15]:


for i in ol_std_list :
    z = i
    if z>2 :
        ol_std_list.remove(z)
    if z < -2 :
        ol_std_list.remove(z)


# In[16]:


len(ol_std_list)


# In[17]:


ol_std_pdf = stats.norm.pdf(np.sort(ol_std_list), ol_st_data_mean, ol_st_data_std)

plt.figure()
plt.plot(np.sort(ol_std_list), ol_std_pdf)


# In[18]:


boxdata = pd.DataFrame(np.random.randn(100,3), columns = ["A열","B열","C열"])


# In[19]:


boxdata.head()


# In[20]:


boxdata.describe()


# In[21]:


sns.boxplot(data=boxdata)
plt.show()


# In[31]:


def get_outlier(df=None, column=None, weight=1.5):
    quantile_25 = np.percentile(df[column].values, 25)
    quantile_75 = np.percentile(df[column].values, 75)
    
    IQR = quantile_75 - quantile_25
    IQR_weight = IQR*weight

    lowest = quantile_25 - IQR_weight
    highest = quantile_75 + IQR_weight

    outlier_idx = df[column][(df[column]<lowest) | (df[column]>highest)].index
    return outlier_idx


# In[32]:


outlier_idx = get_outlier(df=boxdata, column = 'B열', weight = 1.5)


# In[33]:


outlier_idx


# In[34]:


boxdata.drop(outlier_idx, axis=0, inplace=True)


# In[35]:


boxdata.shape


# In[36]:


sns.boxplot(data = boxdata)
plt.show()


# In[37]:


outlier_idx = get_outlier(df=boxdata, column = 'A열', weight=1.5)
outlier_idx


# In[38]:


boxdata.drop(outlier_idx, axis=0, inplace=True)
boxdata.shape


# In[ ]:




