# Dorisoy.POS
使用.Net7 + Angular4开发的一套零售快消POS进销存管理系统


# 功能

**仪表板：**

销售、采购、销售退货、采购退货总额的快速统计。
月度畅销产品排行榜。
带有提醒计划程序的日历。
最新查询列表。
最近的销售订单预计发货。
最近的采购订单预计交付

**产品：**
管理所有产品，包括品牌、类别、单位、销售价格、采购价格、税费和形象。

**供应商：**
管理所有有账单和发货地址的供应商。

**客户：**
管理所有客户的详细信息。

**采购订单：**

管理具有多种产品和税收、折扣、数量和价格的采购订单。
生成/打印采购订单发票/收据。
根据采购订单请求/报价创建多个采购订单。
管理采购订单付款。
从现有采购订单中返回特定项目，并生成/打印发票/收据。
在采购订单交付日期收到自动通知/电子邮件。

**销售订单：**

管理具有多种产品和税收、折扣、数量和价格的销售订单。
生成/打印销售订单发票/收据。
管理销售订单付款。
从现有销售订单中返回特定项目，并生成/打印发票/收据。
在销售订单的发货日期自动收到通知/电子邮件。

**库存：**

产品库存由具有平均销售额、采购价格和库存的采购订单和销售订单自动管理。通过手动添加来调整库存。
按单价查看所有采购、销售、采购退货和销售退货历史记录。

**费用：**
管理所有带有类别和收据的公司费用。

**查询：**
跟踪所有查询，并管理从不同来源生成的活动。您还可以在特定日期设置提醒，以便向用户发送通知或电子邮件。

**报告：**

采购订单报告
销售订单报告
采购订单付款报告
销售订单付款报告
支出报告
销售与采购报告。
产品采购报告
产品销售报告
库存报告
销售与采购报告
供应商付款报告
客户付款报告
损益报告

提醒计划程序：
您可以在系统中设置定期的每日、每周、每月、季度、半年、每年或特定日期提醒，以获取通知或电子邮件。

**支持多种语言：**
默认情况下，应用程序提供英语、中文、西班牙语、阿拉伯语、俄语、日语、德语和法语。您可以在几分钟内添加一种新语言。

**用户和角色管理：**
管理员可以通过管理面板创建用户和角色，并为用户分配角色。

**权限：**
您可以授予员工可以做什么或不能做什么的特定权限。每个员工都可以覆盖角色和用户权限。

**高性能：**
带库存管理的高级POS重量轻，具有闪电般的性能和开箱即用的页面加载时间。

**电子邮件：**
通过文本编辑器设置预定义的电子邮件模板，管理电子邮件SMTP，并一键将预定义的电子邮件模版发送给供应商/任何人。

**完整源代码：**
您将获得带有库存管理的高级POS的完整源代码，以及SQL Server和MySQL数据库提供商的构建版本。


# 演示地址

[http://pos.dorisoy.com/](http://pos.dorisoy.com/)

## 测试账户
用户名：admin@pos.com  密码：admin@123
用户名：employee@pos.com 密码：employee@123


# 屏幕

<img src="https://github.com/dorisoy/Dorisoy.POS/blob/main/Screen/sc%20(1).png">
<img src="https://github.com/dorisoy/Dorisoy.POS/blob/main/Screen/sc%20(2).png">
<img src="https://github.com/dorisoy/Dorisoy.POS/blob/main/Screen/sc%20(3).png">
<img src="https://github.com/dorisoy/Dorisoy.POS/blob/main/Screen/sc%20(4).png">
<img src="https://github.com/dorisoy/Dorisoy.POS/blob/main/Screen/sc%20(5).png">

# .Net Core安装

## 先决条件

.NET CORE 6 SDK和VISUAL STUDIO 2022、SQL SERVER或MySql 8+


## 运行本地副本

根据您的需求，在相应的源文件夹中选择SQL或MySQL API。
将.Net核心文件夹中的解决方案文件POS.sln打开到visual studio 2022中。
右键单击解决方案资源管理器并还原nuget包。
更改POS.API项目中appsettings.Development.json中的数据库连接字符串。
在解决方案资源管理器中，右键单击POS.API项目，然后从菜单中单击“设置为启动项目”。
要运行项目，请按F5。

# Angular安装

## 先决条件

虽然POS可以在没有任何开发经验的情况下运行，但如果您已经有一些经验，它会更容易。以下说明允许您在计算机上运行本地副本。

## 安装工具

如果您还没有安装nodejs，请下载并全局安装nodejs:https://nodejs.org

注意：大多数用户推荐下载版本
这里提供了关于如何安装NodeJS的详细说明。
注意：请确保节点版本>=4.0，NPM>=3。还全局安装了typescript。
全局安装Angular CLI就像运行以下简单命令一样简单：npm install-g@Angular/CLI
安装工具后，进入Angular目录并运行以下命令来安装依赖项：
运行npm install-f来安装package.json中定义的节点依赖项。

## 运行本地副本

若要在开发模式下运行本地副本，请在src-->environments->environment.ts内的环境文件中替换REST API URI（apiUrl）变量
执行发球并去http://localhost:4200在您的浏览器中。
要在生产模式下运行本地副本并构建源，请执行ng构建。这将构建应用程序的生产版本。所有的html、css和js代码都被缩小并放到dist文件夹中。发布应用程序时可以将此文件夹的内容放入生产服务器。


# 主机寄宿

## 先决条件

[.Net 7运行时](https://dotnet.microsoft.com/download)
[用于Window的.NET核心托管捆绑包](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/hosting-bundle?view=aspnetcore-7.0)
SQL Server或MySQL数据库提供程序

为了在Windows或Linux服务器上托管应用程序，甚至不需要手动创建数据库。您只需要更改连接字符串，并且在应用程序初始化后，将根据您的连接设置自动创建数据库。

## 更改连接字符串
````json
{
  "Logging": {
    "IncludeScopes": false,
    "LogLevel": {
      "Default": "Trace",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information",
      "Microsoft.EntityFrameworkCore.Database.Command": "Information",
      "Hangfire": "Information"
    },
    "DbConnectionString": "server='xxx';Port=3306;user='xxx';password='xxx';database=dorisoy_pos;Allow User Variables=True"

  },
  "connectionStrings": {
    "DbConnectionString": "server='xxx';Port=3306;user='root';password='xxx';database=dorisoy_pos;Allow User Variables=True"
  },
  "JwtSettings": {
    "key": "This*Is&A!Long)Key(For%Creating@A$SymmetricKey",
    "issuer": "http://localhost:5000",
    "audience": "PTCUsers",
    "minutesToExpiration": "720"
  },
  "ImagePathSettings": {
    "ProductImages": "ProductImages",
    "BrandImages": "BrandImages",
    "NoImageFound": "no-image-found.png",
    "SupplierImages": "SupplierImages",
    "CustomerImages": "CustomerImages",
    "ArticleBannerImagePath": "ArticleImages",
    "TestimonialsImagePath": "TestimonialImages",
    "Attachments": "Attachments",
    "CompanyLogo": "Logo"
  },
  "DocumentPath": "wwwroot\\Documents",
  "UserProfilePath": "Users",
  "DefaultUser": {
    "DefaultUserId": "xxx"
  },
  "AesEncryptionKey": "xxxxx",
  "ReminderFromEmail": "admin@gmail.com"
}
````
参照更改appsettings.Development.json文件中的连接。

## IIS服务器上的主机：

从MySQLProviderBuild或SqlServerProviderBuild中的Build文件夹复制所有文件和文件夹，并粘贴到
C:\inetpub\wwwroot\{{yoursitename}}
打开IIS
添加新网站
输入您的站点名称
将C:\inetpub\wwwroot\｛｛yoursitename｝｝文件夹路径复制到物理路径。

## Linux服务器上的主机（nginx）：
步骤1:Intall.Net Core 6在Linux上安装.Net Core 6
步骤2：进气发动机

```shell
sudo apt update
sudo apt install nginx
```

步骤：3安装MySQL

```shell
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql.service
```

步骤：4安装zip

```shell
sudo apt-get install zip
```

步骤：5从MySQLProviderBuild或SqlServerProviderBuild的Build文件夹复制所有文件和文件夹，并粘贴到/var/www/｛｛yourwebsitename｝｝
步骤：6创建linux自定义服务，遵循以下步骤：

```shell
cd /etc/systemd/system
```
创建一个名为your-service.service的文件，并包含以下内容：

```shell
[Unit]
Description=Example .NET Web API App running on Linux

[Service]
WorkingDirectory=/var/www/{{yourwebsitename}}
ExecStart=/usr/share/dotnet/dotnet  /var/www/{{yourwebsitename}}/POS.API.dll
Restart=always
# 如果网络服务崩溃，10秒后重新启动服务:
RestartSec=10
KillSignal=SIGINT
SyslogIdentifier=dotnet-example
User=www-data
Environment=ASPNETCORE_ENVIRONMENT=Development

[Install]
WantedBy=multi-user.target
```

重新加载服务文件以包含新服务。
```shell
sudo systemctl daemon-reload
```
在每次重新启动时启用服务
```shell
sudo systemctl enable your-service.service
```
启动您的服务
```shell
sudo systemctl start your-service.service
```
检查您的服务状态
```shell
sudo systemctl status your-service.service
```
欲了解更多详情，请访问：

[Host ASP.NET Core on Linux with Nginx](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/linux-nginx?view=aspnetcore-7.0)

步骤：7 配置Nginx反向代理

```shell
cd /etc/nginx/sites-available
```
创建一个名为yoursite.com的文件，并包含以下内容：
```shell
server {
    listen 80;
    server_name {{yoursitename}} www.{{yoursitename}};
    #listen 80 default_server;
    #listen [::]:80 default_server;
    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

启动服务
```shell
sudo ln -s /etc/nginx/sites-available/yoursite.com /etc/nginx/sites-enabled/
```

重新启动nginx
```shell
sudo systemctl restart nginx
```

