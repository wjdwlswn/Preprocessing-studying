#!/usr/bin/env python
# coding: utf-8

# In[1]:


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


# In[4]:


from sklearn.datasets import load_iris
iris = load_iris()


# In[5]:


iris.feature_names


# In[12]:


df = pd.DataFrame(iris.data, columns=iris.feature_names)
sy = pd.Series(iris.target, dtype="category")
sy = sy.cat.rename_categories(iris.target_names)
df['species']=sy

cols = iris.feature_names

df.tail()


# In[13]:


from sklearn.feature_selection import VarianceThreshold


# In[17]:


selector = VarianceThreshold()
selector.fit(df[cols])
print(selector.variances_)


# In[18]:


selector.set_params(threshold = 0.6)
v_sel = selector.fit_transform(df[cols])
print(selector.variances_)
print(selector.get_support())


# In[19]:


iris_sel_df = df.iloc[:,[0,2]]
iris_sel_df.head()


# In[20]:


iris_sel_df = pd.concat([iris_sel_df, df[['species']]], axis=1)
iris_sel_df.head()


# In[21]:


df.describe()


# In[22]:


cor = df.corr()
cor


# In[23]:


sns.heatmap(cor, annot = False, cmap = plt.cm.Blues)
plt.show()


# In[27]:


cor_target = abs(cor['sepal length (cm)'])
print(cor_target)


# In[28]:


cor_target[cor_target > 0.6]


# In[29]:


selected_cols = cor_target[cor_target > 0.6]
print("상관관계 게수 > 0.6인 속성")
print(selected_cols)


# In[30]:


selected_cols.index


# In[31]:


df[selected_cols.index].head()


# In[ ]:


df_cor_sel = df[selected_cols.index]
df_cor_sel.head()

