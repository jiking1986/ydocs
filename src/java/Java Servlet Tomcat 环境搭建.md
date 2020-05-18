# Servlet 环境搭建
---

### JDK Tomcat 版本对应关系
---
* http://tomcat.apache.org/whichversion.html

### 安装 JDK | 配置 JDK 环境变量
---

#### Java 版本
Java SE（Java Platform，Standard Edition）

#### 下载地址
* https://www.oracle.com/technetwork/java/javase/downloads/index.html

#### 环境变量
```
JAVA_HOME
...\Java\jdk1.8.0_91

CLASSPATH
.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;

Path
%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;

```

### 安装 Tomcat | 配置 Tomcat 环境变量
---
#### 下载地址
* https://tomcat.apache.org/download-70.cgi | Core

#### 启动
* ...\apache-tomcat-7.0\bin\startup.bat

#### 启动日志乱码
```
java.util.logging.ConsoleHandler.encoding = UTF-8
->
java.util.logging.ConsoleHandler.encoding = GBK

```

### eclipse
---
#### 下载
* https://www.eclipse.org/downloads/

#### 安装
Eclipse IDE for Enterprise Java Developers | Java EE（Java Platform，Enterprise Edition）

#### 关联 tomcat
Window->Preferences->
Server->Runtime Environments->
Add->Apache Tomcat v7.0->[Browse & JRE->jre1.8.0]->Finish

#### 默认浏览器设置
Window->Web Browser

#### 404
Servers->Add and Remove...->Remove All->Finish

Use workspace metadata->Use Tomcat installation

### Test
---
File->New->Dynamic Web Project
TomcatTest

WebContent->index.jsp
```
<%
    out.println("Hello World!");
%>
```

File->New->Servlet
com.servlet.test
ServletTest

#### 其他
Servlet3.0特性：Servlet类添加@WebServlet，可以不配置web.xml
