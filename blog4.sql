/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.11 : Database - blog_ssm2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog_ssm2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog_ssm2`;

/*Table structure for table `adm` */

DROP TABLE IF EXISTS `adm`;

CREATE TABLE `adm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `pass` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `adm` */

insert  into `adm`(`id`,`userName`,`pass`) values (1,'admin','admin'),(2,'abc','abc');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '0',
  `userId` int(11) NOT NULL DEFAULT '0',
  `sysCategoryId` int(11) NOT NULL DEFAULT '0',
  `categoryId` int(11) NOT NULL DEFAULT '0',
  `content` mediumtext NOT NULL,
  `summary` mediumtext NOT NULL,
  `publishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isTop` bit(1) NOT NULL DEFAULT b'0',
  `isDelete` bit(1) NOT NULL DEFAULT b'0',
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_artical` (`userId`),
  KEY `fk_scategory` (`sysCategoryId`),
  KEY `fc_category` (`categoryId`),
  CONSTRAINT `fc_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_artical` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_scategory` FOREIGN KEY (`sysCategoryId`) REFERENCES `syscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`title`,`userId`,`sysCategoryId`,`categoryId`,`content`,`summary`,`publishTime`,`isTop`,`isDelete`,`count`) values (1,'JQUERY前端框架的学习',3,1,3,'layui（谐音：类UI) 是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式，门槛极低，拿来即用。其外在极简，却又不失饱满的内在，体积轻盈，组件丰盈，从核心代码到 API 的每一处细节都经过精心雕琢，非常适合界面的快速开发。layui 首个版本发布于2016年金秋，她区别于那些基于 MVVM 底层的 UI 框架，却并非逆道而行，而是信奉返璞归真之道。准确地说，她更多是为服务端程序员量身定做，你无需涉足各种前端工具的复杂配置，只需面对浏览器本身，让一切你所需要的元素与交互，从这里信手拈来。\r\n','layui（谐音：类UI) 是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式，门槛极低，拿来即用。其外在极简，却又不失饱满的内在，体积轻盈，组件丰盈，从核心代码到 API 的每一处细节都经过精心雕琢，非常适合界面的快速开发。layui 首个版本发布于2016年金秋，她区别于那些基于 MVVM 底层的 UI 框架，却并非逆道而行，而是信奉返璞归真之道。准确地说，她更多是为服务端程序员量身定做，你无需涉足各种前端工具的复杂配置，只需面对浏览器本身，让一切你所需要的元素与交互，从这里信手拈来。\r\n','2013-10-28 16:03:17','\0','',23),(40,'Ajax',4,2,1,'使用Ajax的最大优点，就是能在不更新整个页面的前提下维护数据。这使得Web应用程序更为迅捷地回应用户动作，并避免了在网络上发送那些没有改变的信息。\r\nAjax不需要任何浏览器插件，但需要用户允许JavaScript在浏览器上执行。就像DHTML应用程序那样，Ajax应用程序必须在众多不同的浏览器和平台上经过严格的测试。随着Ajax的成熟，一些简化Ajax使用方法的程序库也相继问世。同样，也出现了另一种辅助程序设计的技术，为那些不支持JavaScript的用户提供替代功能。\r\n对应用Ajax最主要的批评就是，它可能破坏浏览器的后退与加入收藏书签功能。在动态更新页面的情况下，用户无法回到前一个页面状态，这是因为浏览器仅能记下历史记录中的静态页面。一个被完整读入的页面与一个已经被动态修改过的页面之间的可能差别非常微妙；用户通常都希望单击后退按钮，就能够取消他们的前一次操作，但是在Ajax应用程序中，却无法这样做。不过开发者已想出了种种办法来解决这个问题，HTML5之前的方法大多是在用户单击后退按钮访问历史记录时，通过创建或使用一个隐藏的IFRAME来重现页面上的变更。（例如，当用户在Google Maps中单击后退时，它在一个隐藏的IFRAME中进行搜索，然后将搜索结果反映到Ajax元素上，以便将应用程序状态恢复到当时的状态）。\r\n关于无法将状态加入收藏或书签的问题，HTML5之前的一种方式是使用URL片断标识符（通常被称为锚点，即URL中#后面的部分）来保持追踪，允许用户回到指定的某个应用程序状态。（许多浏览器允许JavaScript动态更新锚点，这使得Ajax应用程序能够在更新显示内容的同时更新锚点。）HTML5以后可以直接操作浏览历史，并以字符串形式存储网页状态，将网页加入网页收藏夹或书签时状态会被隐形地保留。上述两个方法也可以同时解决无法后退的问题。\r\n进行Ajax开发时，网络延迟——即用户发出请求到服务器发出响应之间的间隔——需要慎重考虑。如果不给予用户明确的回应，没有恰当的预读数据，或者对XMLHttpRequest的不恰当处理，都会使用户感到厌烦。通常的解决方案是，使用一个可视化的组件来告诉用户系统正在进行后台操作并且正在读取数据和内容。 [2] ','Ajax 即“Asynchronous Javascript And XML”（异步 JavaScript 和 XML），是指一种创建交互式网页应用的网页开发技术。\r\nAjax = 异步 JavaScript 和 XML（标准通用标记语言的子集）。\r\nAjax 是一种用于创建快速动态网页的技术。\r\nAjax 是一种在无需重新加载整个网页的情况下，能够更新部分网页的技术。\r\n通过在后台与服务器进行少量数据交换，Ajax 可以使网页实现异步更新。这意味着可以在不重新加载整个网页的情况下，对网页的某部分进行更新。\r\n传统的网页（不使用 Ajax）如果需要更新内容，必须重载整个网页页面。','2018-12-05 18:19:43','\0','\0',14),(44,'Vue.js 是什么',4,5,1,'Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。\r\n\r\n如果你想在深入学习 Vue 之前对它有更多了解，我们制作了一个视频，带您了解其核心概念和一个示例工程。\r\n\r\n如果你已经是有经验的前端开发者，想知道 Vue 与其它库/框架有哪些区别，请查看对比其它框架。Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。\r\n\r\n如果你想在深入学习 Vue 之前对它有更多了解，我们制作了一个视频，带您了解其核心概念和一个示例工程。\r\n\r\n如果你已经是有经验的前端开发者，想知道 Vue 与其它库/框架有哪些区别，请查看对比其它框架。Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。\r\n\r\n如果你想在深入学习 Vue 之前对它有更多了解，我们制作了一个视频，带您了解其核心概念和一个示例工程。\r\n\r\n如果你已经是有经验的前端开发者，想知道 Vue 与其它库/框架有哪些区别，请查看对比其它框架。','Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。\r\n\r\n如果你想在深入学习 Vue 之前对它有更多了解，我们制作了一个视频，带您了解其核心概念和一个示例工程。\r\n\r\n如果你已经是有经验的前端开发者，想知道 Vue 与其它库/框架有哪些区别，请查看对比其它框架。','2013-10-28 16:03:17','\0','\0',4),(60,'javascript',2,5,1,'JavaScript是一种属于网络的脚本语言,已经被广泛用于Web应用开发,常用来为网页添加各式各样的动态功能,为用户提供更流畅美观的浏览效果。通常JavaScript脚本是通过嵌入在HTML中来实现自身的功能的。 [3] \r\n是一种解释性脚本语言（代码不进行预编译）。 [4] \r\n主要用来向HTML（标准通用标记语言下的一个应用）页面添加交互行为。 [4] \r\n可以直接嵌入HTML页面，但写成单独的js文件有利于结构和行为的分离。 [4] \r\n跨平台特性，在绝大多数浏览器的支持下，可以在多种平台下运行（如Windows、Linux、Mac、Android、iOS等）。\r\nJavascript脚本语言同其他语言一样，有它自身的基本数据类型，表达式和算术运算符及程序的基本程序框架。Javascript提供了四种基本的数据类型和两种特殊数据类型用来处理数据和文字。而变量提供存放信息的地方，表达式则可以完成较复杂的信息处理。 [5] \r\n日常用途\r\n嵌入动态文本于HTML页面。 [4] \r\n对浏览器事件做出响应。 [4] \r\n读写HTML元素。 [4] \r\n在数据被提交到服务器之前验证数据。 [4] \r\n检测访客的浏览器信息。 [4] \r\n控制cookies，包括创建和修改等。 [4] \r\n基于Node.js技术进行服务器端编程。 [6] \r\n历史\r\n它最初由Netscape的Brendan Eich设计。JavaScript是甲骨文公司的注册商标。Ecma国际以JavaScript为基础制定了ECMAScript标准。JavaScript也可以用于其他场合，如服务器端编程。完整的JavaScript实现包含三个部分：ECMAScript，文档对象模型，浏览器对象模型。 [7] \r\nNetscape在最初将其脚本语言命名为LiveScript，后来Netscape在与Sun合作之后将其改名为JavaScript。JavaScript最初受Java启发而开始设计的，目的之一就是“看上去像Java”，因此语法上有类似之处，一些名称和命名规范也借自Java。但JavaScript的主要设计原则源自Self和Scheme。JavaScript与Java名称上的近似，是当时Netscape为了营销考虑与Sun微系统达成协议的结果。为了取得技术优势，微软推出了JScript来迎战JavaScript的脚本语言。为了互用性，Ecma国际（前身为欧洲计算机制造商协会）创建了ECMA-262标准（ECMAScript）。两者都属于ECMAScript的实现。尽管JavaScript作为给非程序人员的脚本语言，而非作为给程序人员的脚本语言来推广和宣传，但是JavaScript具有非常丰富的特性。 [8] \r\n发展初期，JavaScript的标准并未确定，同期有Netscape的JavaScript，微软的JScript和CEnvi的ScriptEase三足鼎立。1997年，在ECMA（欧洲计算机制造商协会）的协调下，由Netscape、Sun、微软、Borland组成的工作组确定统一标准：ECMA-262。\r\n特性\r\nJavaScript脚本语言具有以下特点:\r\n(1)脚本语言。JavaScript是一种解释型的脚本语言,C、C++等语言先编译后执行,而JavaScript是在程序的运行过程中逐行进行解释。\r\n(2)基于对象。JavaScript是一种基于对象的脚本语言,它不仅可以创建对象,也能使用现有的对象。\r\n(3)简单。JavaScript语言中采用的是弱类型的变量类型,对使用的数据类型未做出严格的要求,是基于Java基本语句和控制的脚本语言,其设计简单紧凑。\r\n(4)动态性。JavaScript是一种采用事件驱动的脚本语言,它不需要经过Web服务器就可以对用户的输入做出响应。在访问一个网页时,鼠标在网页中进行鼠标点击或上下移、窗口移动等操作JavaScript都可直接对这些事件给出相应的响应。\r\n(5)跨平台性。JavaScript脚本语言不依赖于操作系统,仅需要浏览器的支持。因此一个JavaScript脚本在编写后可以带到任意机器上使用,前提上机器上的浏览器支 持JavaScript脚本语言,目前JavaScript已被大多数的浏览器所支持。 [3] \r\n不同于服务器端脚本语言，例如PHP与ASP，JavaScript主要被作为客户端脚本语言在用户的浏览器上运行，不需要服务器的支持。所以在早期程序员比较青睐于JavaScript以减少对服务器的负担，而与此同时也带来另一个问题：安全性。\r\n而随着服务器的强壮，虽然程序员更喜欢运行于服务端的脚本以保证安全，但JavaScript仍然以其跨平台、容易上手等优势大行其道。同时，有些特殊功能（如AJAX）必须依赖Javascript在客户端进行支持。随着引擎如V8和框架如Node.js的发展，及其事件驱动及异步IO等特性，JavaScript逐渐被用来编写服务器端程序。','JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，最早是在HTML（标准通用标记语言下的一个应用）网页上使用，用来给HTML网页增加动态功能。\r\n在1995年时，由Netscape公司的Brendan Eich，在网景导航者浏览器上首次设计实现而成。因为Netscape与Sun合作，Netscape管理层希望它外观看起来像Java，因此取名为JavaScript。但实际上它的语法风格与Self及Scheme较为接近。 [1] \r\n为了取得技术优势，微软推出了JScript，CEnvi推出ScriptEase，与JavaScript同样可在浏览器上运行。为了统一规格，因为JavaScript兼容于ECMA标准，因此也称为ECMAScript。','2018-12-08 20:44:54','\0','\0',8),(67,'dddddddd',1,1,1,'dddddddddddddddd','ddddddd','2018-12-09 19:35:51','\0','',3),(71,'ddddddddddd',1,1,1,'dddddddddddddd','dddddddd','2018-12-09 19:47:09','\0','',70),(93,'d',1,1,3,'	                    0000000000\r\n	                    ','	                    0000000\r\n	                    ','2018-12-11 09:26:43','\0','',0),(94,'fg',1,1,3,'	                    0000000000\r\n	                    ','	                    0000000\r\n	                    ','2018-12-11 09:28:19','\0','',0),(95,'ccccccccccccccccccc',1,1,3,'	                    0000000000\r\n	                    ','	                    0000000\r\n	                    ','2018-12-11 09:30:29','\0','',0),(96,'33333333333',1,1,3,'	                    0000000000\r\n	                    ','	                    0000000\r\n	                    ','2018-12-11 09:37:05','\0','',1),(97,'spring MVC',1,4,12,'	                    	                    MVC已经是现代Web开发中的一个很重要的部分，下面介绍一下Spring MVC的一些使用心得。\r\n之前的项目比较简单，多是用JSP 、Servlet + JDBC 直接搞定，在项目中尝试用 Struts(Struts MVC)+Spring+Hibernate, 严格按照分层概念驱动项目开发，因项目需求一直不断变化，功能不断扩充、增强，技术构建也几经改变到目前有个稳定的应用，体会了很多感受，这次先对 Spring MVC 层进行一些个人总结。\r\nMVC作为WEB项目开发的核心环节，正如三个单词的分解那样，C（控制器）将V（视图、用户客户端）与M（javaBean:封装数据）分开构成了MVC ，这边不去讨论项目中是否应用MVC ，也不针对MVC的实现原理进行讲解，而是探讨实践中如何从应用SSH, 到Struts(Struts MVC)+Spring+Hibernate的演化过程。\r\n先看 Struts 如何与 Spring 结合处理一次简单的请求响应代码，前台可以设为用 AJAX 调用：\r\n1. 在 struts-config.xml 文件中加入\r\n<!--用于声明GetPersonList。do请求委托Spring处理--><action path=\"/GetPersonList\" scope=\"request\"type=\"org.springframework.web.struts.DelegatingActionProxy\"></action>\r\n2.在 applicationContext.xml 文件中加入\r\n<!-- 指定GetPersonList处理的代码，和注入实现业务的代码 --><bean name=\"/GetPersonList\" class=\"cn.base.GetPersonListAction\"><property name=\"getPersonList\" ref=\" getPersonListServices\"></property></bean>\r\n3.cn.base.GetPersonListAction 实现请求响应代码\r\n可以看出一次请求需求如此多的步骤，在加上一个项目下来有很多这样的请求响应，将给配置文件管理带来很大的麻烦。\r\n经过对 Spring 的深入应用， Spring 本身提供的 URL 请求控制，对其天然支持可以让我们不需要 applicationContext.xml 再次声明一次 URL 请求 Bean ，即减少了 Struts 的声明 URL ，达到减少些繁琐的配置。但只是少了一些而已，同样也会面临着配置文件的管理问题。	                    	                    \r\n	                    f\r\n	                    \r\n	                    \r\n	                    ','	                    	                    Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。Spring 框架提供了构建 Web 应用程序的全功能 MVC 模块。使用 Spring 可插入的 MVC 架构，从而在使用Spring进行WEB开发时，可以选择使用Spring的SpringMVC框架或集成其他MVC开发框架，如Struts1(现在一般不用)，Struts2(一般老项目使用)等。	   \r\n通过策略接口，Spring 框架是高度可配置的，而且包含多种视图技术，例如 JavaServer Pages（JSP）技术、Velocity、Tiles、iText和POI。Spring MVC 框架并不知道使用的视图，所以不会强迫开发者只使用 JSP 技术。Spring MVC 分离了控制器、模型对象、过滤器以及处理程序对象的角色，这种分离让它们更容易进行定制。                 	                    f\r\n	                    \r\n	                    \r\n	                    \r\n	                    ','2018-12-11 11:08:06','\0','',121),(98,'jQuery',5,5,1,'jQuery的模块可以分为3部分：入口模块、底层支持模块和功能模块。\r\n在构造jQuery对象模块中，如果在调用构造函数jQuery()创建jQuery对象时传入了选择器表达式，则会调用选择器Sizzle（一款纯JavaScript实现的CSS选择器引擎，用于查找与选择器表达式匹配的元素集合）遍历文档，查找与之匹配的DOM元素，并创建一个包含了这些DOM元素引用的jQuery对象。\r\n浏览器功能测试模块提供了针对不同浏览器功能和bug的测试结果，其他模块则基于这些测试结果来解决浏览器之间的兼容性问题。\r\n在底层支持模块中，回调函数列表模块用于增强对回调函数的管理，支持添加、移除、触发、锁定、禁用回调函数等功能；异步队列模块用于解耦异步任务和回调函数，它在回调函数列表的基础上为回调函数增加了状态，并提供了多个回调函数列表，支持传播任意同步或异步回调函数的成功或失败状态；数据缓存模块用于为DOM元素和Javascript对象附加任意类型的数据；队列模块用于管理一组函数，支持函数的入队和出队操作，并确保函数按顺序执行，它基于数据缓存模块实现。\r\n在功能模块中，事件系统提供了统一的事件绑定、响应、手动触发和移除机制，它并没有将事件直接绑定到DOM元素上，而是基于数据缓存模块来管理事件；Ajax模块允许从服务器上加载数据，而不用刷新页面，它基于异步队列模块来管理和触发回调函数；动画模块用于向网页中添加动画效果，它基于队列模块来管理和执行动画函数；属性操作模块用于对HTML属性和DOM属性进行读取、设置和移除操作；DOM遍历模块用于在DoM树中遍历父元素、子元素和兄弟元素；DOM操作模块用于插入、移除、复制和替换DOM元素；样式操作模块用于获取计算样式或设置内联样式；坐标模块用于读取或设置DOM元素的文档坐标；尺寸模块用于获取DOM元素的高度和宽度。 [8-9] 	                    	                    \r\n	                    \r\n	                    ','jQuery是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。它封装JavaScript常用的功能代码，提供一种简便的JavaScript设计模式，优化HTML文档操作、事件处理、动画设计和Ajax交互。\r\njQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展；拥有便捷的插件扩展机制和丰富的插件。jQuery兼容各种主流浏览器，如IE 6.0+、FF 1.5+、Safari 2.0+、Opera 9.0+等。 [1] 	                    	                    \r\n	                    \r\n	                    ','2018-12-11 11:08:37','\0','\0',555),(100,'MySQL',5,5,12,'与其他的大型数据库\r\nLAMP\r\nLAMP\r\n例如 Oracle、DB2、SQL Server等相比，MySQL [1]  自有它的不足之处，但是这丝毫也没有减少它受欢迎的程度。对于一般的个人使用者和中小型企业来说，MySQL提供的功能已经绰绰有余，而且由于 MySQL是开放源码软件，因此可以大大降低总体拥有成本。\r\nLinux作为操作系统，Apache 或Nginx作为 Web 服务器，MySQL 作为数据库，PHP/Perl/Python作为服务器端脚本解释器。由于这四个软件都是免费或开放源码软件（FLOSS)，因此使用这种方式不用花一分钱（除开人工成本）就可以建立起一个稳定、免费的网站系统，被业界称为“LAMP“或“LNMP”组合。\r\n系统特性编辑\r\n1． [2]  使用 C和 C++编写，并使用了多种编译器进行测试，保证了源代码的可移植性。\r\n2．支持 AIX、FreeBSD、HP-UX、Linux、Mac OS、NovellNetware、OpenBSD、OS/2 Wrap、Solaris、Windows等多种操作系统。\r\n3．为多种编程语言提供了 API。这些编程语言包括 C、C++、Python、Java、Perl、PHP、Eiffel、Ruby,.NET和 Tcl 等。\r\n4．支持多线程，充分利用 CPU 资源。\r\n5．优化的 SQL查询算法，有效地提高查询速度。\r\n6．既能够作为一个单独的应用程序应用在客户端服务器网络环境中，也能够作为一个库而嵌入到其他的软件中。\r\n7．提供多语言支持，常见的编码如中文的 GB 2312、BIG5，日文的 Shift_JIS等都可以用作数据表名和数据列名。\r\n8．提供 TCP/IP、ODBC 和 JDBC等多种数据库连接途径。\r\n9．提供用于管理、检查、优化数据库操作的管理工具。\r\n10．支持大型的数据库。可以处理拥有上千万条记录的大型数据库。\r\n11．支持多种存储引擎。\r\n12.MySQL 是开源的，所以你不需要支付额外的费用。\r\n13.MySQL 使用标准的 SQL数据语言形式。\r\n14.MySQL 对 PHP 有很好的支持，PHP是比较流行的 Web 开发语言。\r\n15.MySQL是可以定制的，采用了 GPL协议，你可以修改源码来开发自己的 MySQL 系统。\r\n16.在线 DDL/更改功能，数据架构支持动态应用程序和开发人员灵活性（5.6新增）\r\n17.复制全局事务标识，可支持自我修复式集群（5.6新增）\r\n18.复制无崩溃从机，可提高可用性（5.6新增）\r\n19.复制多线程从机，可提高性能（5.6新增）\r\n20.3倍更快的性能（5.7 [3]  新增）\r\n21.新的优化器（5.7新增）\r\n22.原生JSON支持（5.7新增）\r\n23.多源复制（5.7新增）\r\n24.GIS的空间扩展 [4]  （5.7新增）\r\n存储引擎编辑\r\nMyISAMMySQL 5.0 之前的默认数据库引擎，最为常用。拥有较高的插入，查询速度，但不支持事务\r\nInnoDB事务型数据库的首选引擎，支持ACID事务，支持行级锁定, MySQL 5.5 起成为默认数据库引擎\r\nBDB源 自 Berkeley DB，事务型数据库的另一种选择，支持Commit 和Rollback 等其他事务特性\r\nMemory所有数据置于内存的存储引擎，拥有极高的插入，更新和查询效率。但是会占用和数据量成正比的内存空间。并且其内容会在 MySQL 重新启动时丢失\r\nMerge将一定数量的 MyISAM 表联合而成一个整体，在超大规模数据存储时很有用\r\nArchive非常适合存储大量的独立的，作为历史记录的数据。因为它们不经常被读取。Archive 拥有高效的插入速度，但其对查询的支持相对较差\r\nFederated将不同的 MySQL 服务器联合起来，逻辑上组成一个完整的数据库。非常适合分布式应用\r\nCluster/NDB高冗余的存储引擎，用多台数据机器联合提供服务以提高整体性能和安全性。适合数据量大，安全和性能要求高的应用\r\nCSV： 逻辑上由逗号分割数据的存储引擎。它会在数据库子目录里为每个数据表创建一个 .csv 文件。这是一种普通文本文件，每个数据行占用一个文本行。CSV 存储引擎不支持索引。\r\nBlackHole：黑洞引擎，写入的任何数据都会消失，一般用于记录 binlog 做复制的中继\r\nEXAMPLE 存储引擎是一个不做任何事情的存根引擎。它的目的是作为 MySQL 源代码中的一个例子，用来演示如何开始编写一个新存储引擎。同样，它的主要兴趣是对开发者。EXAMPLE 存储引擎不支持编索引。\r\n另外，MySQL 的存储引擎接口定义良好。有兴趣的开发者可以通过阅读文档编写自己的存储引擎 [5]  。','MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件。\r\nMySQL是一种关系数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。\r\nMySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择 MySQL 作为网站数据库。\r\n由于其社区版的性能卓越，搭配 PHP 和 Apache 可组成良好的开发环境。	','2018-12-11 11:10:19','\0','\0',8),(102,'MyBatis',1,5,3,'MyBatis [2]  是支持普通 SQL查询，存储过程和高级映射的优秀持久层框架。MyBatis 消除了几乎所有的JDBC代码和参数的手工设置以及结果集的检索。MyBatis 使用简单的 XML或注解用于配置和原始映射，将接口和 Java 的POJOs（Plain Ordinary Java Objects，普通的 Java对象）映射成数据库中的记录。\r\n每个MyBatis应用程序主要都是使用SqlSessionFactory实例的，一个SqlSessionFactory实例可以通过SqlSessionFactoryBuilder获得。SqlSessionFactoryBuilder可以从一个xml配置文件或者一个预定义的配置类的实例获得。\r\n用xml文件构建SqlSessionFactory实例是非常简单的事情。推荐在这个配置中使用类路径资源（classpath resource)，但你可以使用任何Reader实例，包括用文件路径或file://开头的url创建的实例。MyBatis有一个实用类----Resources，它有很多方法，可以方便地从类路径及其它位置加载资源。\r\n特点编辑\r\n简单易学：本身就很小且简单。没有任何第三方依赖，最简单安装只要两个jar文件+配置几个sql映射文件易于学习，易于使用，通过文档和源代码，可以比较完全的掌握它的设计思路和实现。\r\n灵活：mybatis不会对应用程序或者数据库的现有设计强加任何影响。 sql写在xml里，便于统一管理和优化。通过sql语句可以满足操作数据库的所有需求。\r\n解除sql与程序代码的耦合：通过提供DAO层，将业务逻辑和数据访问逻辑分离，使系统的设计更清晰，更易维护，更易单元测试。sql和代码的分离，提高了可维护性。\r\n提供映射标签，支持对象与数据库的orm字段关系映射\r\n提供对象关系映射标签，支持对象关系组建维护\r\n提供xml标签，支持编写动态sql。 [3] ','MyBatis 是一款优秀的持久层框架，它支持定制化 SQL、存储过程以及高级映射。MyBatis 避免了几乎所有的 JDBC 代码和手动设置参数以及获取结果集。MyBatis 可以使用简单的 XML 或注解来配置和映射原生信息，将接口和 Java 的 POJOs(Plain Ordinary Java Object,普通的 Java对象)映射成数据库中的记录。','2018-12-11 11:11:57','\0','',102),(103,'Spring',1,5,3,'轻量——从大小与开销两方面而言Spring都是轻量的。完整的Spring框架可以在一个大小只有1MB多的JAR文件里发布。并且Spring所需的处理开销也是微不足道的。此外，Spring是非侵入式的：典型地，Spring应用中的对象不依赖于Spring的特定类。\r\n控制反转——Spring通过一种称作控制反转（IoC）的技术促进了低耦合。当应用了IoC，一个对象依赖的其它对象会通过被动的方式传递进来，而不是这个对象自己创建或者查找依赖对象。你可以认为IoC与JNDI相反——不是对象从容器中查找依赖，而是容器在对象初始化时不等对象请求就主动将依赖传递给它。\r\n面向切面——Spring提供了面向切面编程的丰富支持，允许通过分离应用的业务逻辑与系统级服务（例如审计（auditing）和事务（transaction）管理）进行内聚性的开发。应用对象只实现它们应该做的——完成业务逻辑——仅此而已。它们并不负责（甚至是意识）其它的系统级关注点，例如日志或事务支持。\r\n容器——Spring包含并管理应用对象的配置和生命周期，在这个意义上它是一种容器，你可以配置你的每个bean如何被创建——基于一个可配置原型（prototype），你的bean可以创建一个单独的实例或者每次需要时都生成一个新的实例——以及它们是如何相互关联的。然而，Spring不应该被混同于传统的重量级的EJB容器，它们经常是庞大与笨重的，难以使用。\r\n框架——Spring可以将简单的组件配置、组合成为复杂的应用。在Spring中，应用对象被声明式地组合，典型地是在一个XML文件里。Spring也提供了很多基础功能（事务管理、持久化框架集成等等），将应用逻辑的开发留给了你。\r\nMVC——Spring的作用是整合，但不仅仅限于整合，Spring 框架可以被看做是一个企业解决方案级别的框架。客户端发送请求，服务器控制器（由DispatcherServlet实现的)完成请求的转发，控制器调用一个用于映射的类HandlerMapping，该类用于将请求映射到对应的处理器来处理请求。HandlerMapping 将请求映射到对应的处理器Controller（相当于Action）在Spring 当中如果写一些处理器组件，一般实现Controller 接口，在Controller 中就可以调用一些Service 或DAO 来进行数据操作 ModelAndView 用于存放从DAO 中取出的数据，还可以存放响应视图的一些数据。 如果想将处理结果返回给用户，那么在Spring 框架中还提供一个视图组件ViewResolver，该组件根据Controller 返回的标示，找到对应的视图，将响应response 返回给用户。\r\n所有Spring的这些特征使你能够编写更干净、更可管理、并且更易于测试的代码。它们也为Spring中的各种模块提供了基础支持。\r\n             ','Spring是一个开放源代码的设计层面框架，他解决的是业务逻辑层和其他各层的松耦合问题，因此它将面向接口的编程思想贯穿整个系统应用。Spring是于2003 年兴起的一个轻量级的Java 开发框架，由Rod Johnson创建。简单来说，Spring是一个分层的JavaSE/EE full-stack(一站式) 轻量级开源框架。\r\n','2018-12-11 11:17:14','\0','',238),(104,'Bootstrap',2,5,1,'版本形态编辑\r\n目前使用较广的是版本2和3，其中2的最新版本的是2.3.2，3的最新版本是3.3.7。\r\n在2017年8月下旬，Bootstrap四周岁之际，Bootstrap团队发布了Bootstrap 4 alpha版，4的最主要变化包括以下方面：\r\n从 Less 迁移到 Sass\r\n改进网格系统\r\n缺省弹性框支持\r\nDropped wells, thumbnails, and panels for cards\r\n合并所有 HTML resets 到一个新的模块中：Reboot\r\n全新自定义选项\r\n不再支持 IE8\r\n重写所有的 JavaScript 插件\r\n改进工具提示和 popovers 的自动定位\r\n改进文档\r\n其他大量改进 [5] \r\n包含内容编辑\r\n基本结构：Bootstrap 提供了一个带有网格系统、链接样式、背景的基本结构。这将在Bootstrap 基本结构部分详细讲解。\r\nCSS：Bootstrap 自带以下特性：全局的 CSS设置、定义基本的 HTML 元素样式、可扩展的 class，以及一个先进的网格系统。这将在Bootstrap CSS部分详细讲解。\r\n组件：Bootstrap 包含了十几个可重用的组件，用于创建图像、下拉菜单、导航、警告框、弹出框等等。这将在布局组件部分详细讲解。\r\nJavaScript 插件：Bootstrap包含了十几个自定义的jQuery 插件。您可以直接包含所有的插件，也可以逐个包含这些插件。这将在Bootstrap插件部分详细讲解。\r\n定制：您可以定制Bootstrap的组件、LESS 变量和jQuery 插件来得到您自己的版本。 [6] \r\n支持组件编辑\r\nBootstrap中包含了丰富的Web组件，根据这些组件，可以快速的搭建一个漂亮、功能完备的网站。其中包括以下组件：\r\n下拉菜单、按钮组、按钮下拉菜单、导航、导航条、路径导航、分页、排版、缩略图、警告对话框、进度条、媒体对象等 [7] \r\n支持插件编辑\r\nBootstrap自带了13个jQuery插件，这些插件为Bootstrap中的组件赋予了“生命”。其中包括：\r\n模式对话框、标签页、滚动条、弹出框等。\r\n框架代码编辑\r\n可以对Bootstrap中所有的CSS变量进行修改，依据自己的需求裁剪代码	                    	                    \r\n	                    \r\n	                    ','Bootstrap是美国Twitter公司的设计师Mark Otto和Jacob Thornton合作基于HTML、CSS、JavaScript 开发的简洁、直观、强悍的前端开发框架，使得 Web 开发更加快捷。 [1]  Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。 [2]  国内一些移动开发者较为熟悉的框架，如WeX5前端开源框架等，也是基于Bootstrap源码进行性能优化而来。 [3] 	                    	                    \r\n	                    \r\n	                    ','2018-12-11 11:17:43','\0','\0',20),(105,'Spring Boot',1,5,3,'特点编辑\r\n1. 创建独立的Spring应用程序\r\n2. 嵌入的Tomcat，无需部署WAR文件\r\n3. 简化Maven配置\r\n4. 自动配置Spring\r\n5. 提供生产就绪型功能，如指标，健康检查和外部配置\r\n6. 绝对没有代码生成并且对XML也没有配置要求 [1] \r\n安装步骤编辑\r\n从最根本上来讲，Spring Boot就是一些库的集合，它能够被任意项目的构建系统所使用。简便起见，该框架也提供了命令行界面，它可以用来运行和测试Boot应用。框架的发布版本，包括集成的CLI（命令行界面），可以在Spring仓库中手动下载和安装。一种更为简便的方式是使用Groovy环境管理器（Groovy enVironment Manager，GVM），它会处理Boot版本的安装和管理。Boot及其CLI可以通过GVM的命令行gvm install springboot进行安装。在OS X上安装Boot可以使用Homebrew包管理器。为了完成安装，首先要使用brew tap pivotal/tap切换到Pivotal仓库中，然后执行brew install springboot命令。\r\n要进行打包和分发的工程会依赖于像Maven或Gradle这样的构建系统。为了简化依赖图，Boot的功能是模块化的，通过导入Boot所谓的“starter”模块，可以将许多的依赖添加到工程之中。为了更容易地管理依赖版本和使用默认配置，框架提供了一个parent POM，工程可以继承它。	                    \r\n	                    ','Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Spring Boot致力于在蓬勃发展的快速应用开发领域(rapid application development)成为领导者。\r\n	                    ','2018-12-12 09:37:01','\0','',27),(107,'MySQL',1,1,12,'	                    \r\n	      系统特性编辑\r\n1． [2]  使用 C和 C++编写，并使用了多种编译器进行测试，保证了源代码的可移植性。\r\n2．支持 AIX、FreeBSD、HP-UX、Linux、Mac OS、NovellNetware、OpenBSD、OS/2 Wrap、Solaris、Windows等多种操作系统。\r\n3．为多种编程语言提供了 API。这些编程语言包括 C、C++、Python、Java、Perl、PHP、Eiffel、Ruby,.NET和 Tcl 等。\r\n4．支持多线程，充分利用 CPU 资源。\r\n5．优化的 SQL查询算法，有效地提高查询速度。\r\n6．既能够作为一个单独的应用程序应用在客户端服务器网络环境中，也能够作为一个库而嵌入到其他的软件中。\r\n7．提供多语言支持，常见的编码如中文的 GB 2312、BIG5，日文的 Shift_JIS等都可以用作数据表名和数据列名。\r\n8．提供 TCP/IP、ODBC 和 JDBC等多种数据库连接途径。\r\n9．提供用于管理、检查、优化数据库操作的管理工具。\r\n10．支持大型的数据库。可以处理拥有上千万条记录的大型数据库。\r\n11．支持多种存储引擎。\r\n12.MySQL 是开源的，所以你不需要支付额外的费用。\r\n13.MySQL 使用标准的 SQL数据语言形式。\r\n14.MySQL 对 PHP 有很好的支持，PHP是比较流行的 Web 开发语言。\r\n15.MySQL是可以定制的，采用了 GPL协议，你可以修改源码来开发自己的 MySQL 系统。\r\n16.在线 DDL/更改功能，数据架构支持动态应用程序和开发人员灵活性（5.6新增）\r\n17.复制全局事务标识，可支持自我修复式集群（5.6新增）\r\n18.复制无崩溃从机，可提高可用性（5.6新增）\r\n19.复制多线程从机，可提高性能（5.6新增）\r\n20.3倍更快的性能（5.7 [3]  新增）\r\n21.新的优化器（5.7新增）\r\n22.原生JSON支持（5.7新增）\r\n23.多源复制（5.7新增）\r\n24.GIS的空间扩展 [4]  （5.7新增）\r\n存储引擎编辑\r\nMyISAMMySQL 5.0 之前的默认数据库引擎，最为常用。拥有较高的插入，查询速度，但不支持事务\r\nInnoDB事务型数据库的首选引擎，支持ACID事务，支持行级锁定, MySQL 5.5 起成为默认数据库引擎\r\nBDB源 自 Berkeley DB，事务型数据库的另一种选择，支持Commit 和Rollback 等其他事务特性\r\nMemory所有数据置于内存的存储引擎，拥有极高的插入，更新和查询效率。但是会占用和数据量成正比的内存空间。并且其内容会在 MySQL 重新启动时丢失\r\nMerge将一定数量的 MyISAM 表联合而成一个整体，在超大规模数据存储时很有用\r\nArchive非常适合存储大量的独立的，作为历史记录的数据。因为它们不经常被读取。Archive 拥有高效的插入速度，但其对查询的支持相对较差\r\nFederated将不同的 MySQL 服务器联合起来，逻辑上组成一个完整的数据库。非常适合分布式应用\r\nCluster/NDB高冗余的存储引擎，用多台数据机器联合提供服务以提高整体性能和安全性。适合数据量大，安全和性能要求高的应用\r\nCSV： 逻辑上由逗号分割数据的存储引擎。它会在数据库子目录里为每个数据表创建一个 .csv 文件。这是一种普通文本文件，每个数据行占用一个文本行。CSV 存储引擎不支持索引。\r\nBlackHole：黑洞引擎，写入的任何数据都会消失，一般用于记录 binlog 做复制的中继\r\nEXAMPLE 存储引擎是一个不做任何事情的存根引擎。它的目的是作为 MySQL 源代码中的一个例子，用来演示如何开始编写一个新存储引擎。同样，它的主要兴趣是对开发者。EXAMPLE 存储引擎不支持编索引。\r\n另外，MySQL 的存储引擎接口定义良好。有兴趣的开发者可以通过阅读文档编写自己的存储引擎 [5]  。              ','	                    \r\n	   MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件。\r\nMySQL是一种关系数据库管理系统，关系数据库将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。\r\nMySQL所使用的 SQL 语言是用于访问数据库的最常用标准化语言。MySQL 软件采用了双授权政策，分为社区版和商业版，由于其体积小、速度快、总体拥有成本低，尤其是开放源码这一特点，一般中小型网站的开发都选择 MySQL 作为网站数据库。\r\n由于其社区版的性能卓越，搭配 PHP 和 Apache 可组成良好的开发环境。                 ','2018-12-12 17:28:22','\0','',3),(108,'好好学习',1,1,3,'	                    \r\n	      土土土土土土土土土ff              ','土土土土土土土土土ff                    ','2018-12-12 19:25:08','\0','',7),(109,'LayUI前端框架的学习',1,2,58,'	                    内容	                    \r\n	                    \r\n	                    ','	                    摘要	                    \r\n	                    \r\n	                    ','2018-12-12 20:07:19','\0','',5),(110,'新文章',1,2,60,'内容	                    \r\n	                    ','摘要	                    \r\n	                    ','2018-12-12 20:49:27','\0','',1);

/*Table structure for table `blog_info` */

DROP TABLE IF EXISTS `blog_info`;

CREATE TABLE `blog_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `blogName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `description` text,
  `annoucement` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_bloginfo` (`userId`),
  CONSTRAINT `fk_bloginfo` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `blog_info` */

insert  into `blog_info`(`id`,`userId`,`blogName`,`description`,`annoucement`) values (7,1,'流沙—天行',' 好好学习','07878\r\n'),(8,2,'流沙—无双','窥探我的内心是非常危险的事情','百越五人杀手团体成员，韩国第一力士'),(9,3,'流沙—黑麒麟','很多人被命运安排，而我安排命运。','韩将姬无夜原近卫，“夜幕”杀手团“百鸟”叛员'),(12,4,'流沙—卫庄','“和我战斗的代价，就是会失去你想要保护的东西。”','纵横家·鬼谷横剑术传人\r\n'),(35,5,'流沙—张良','“如果不把人都踩在脚下，他又怎么会抬头看你，承认你是强者？。”','韩相张开地之孙，少年谋士，家族“五代为相'),(36,32,'名称','描述','公告'),(37,33,'名称','描述','公0000');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `categoryName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `articles` int(11) NOT NULL DEFAULT '0',
  `isDelete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_category` (`userId`),
  CONSTRAINT `fk_category` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`userId`,`categoryName`,`articles`,`isDelete`) values (1,1,'javascript的学习和使用',8,''),(3,1,'java',10,''),(12,1,'数据库',2,''),(58,1,'前端框架',1,''),(59,1,'python',0,''),(60,1,'PHP',1,''),(61,1,'web',0,'');

/*Table structure for table `com` */

DROP TABLE IF EXISTS `com`;

CREATE TABLE `com` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `articalId` int(11) NOT NULL DEFAULT '0',
  `content` varchar(128) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDelete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_comment1` (`userId`),
  KEY `fk_comment2` (`articalId`),
  CONSTRAINT `fk_comment1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_comment2` FOREIGN KEY (`articalId`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `com` */

insert  into `com`(`id`,`userId`,`articalId`,`content`,`time`,`isDelete`) values (40,1,40,'蒹葭苍苍，白露为霜。所谓伊人，在水一方。','2018-12-05 12:50:34','\0'),(44,1,40,'浮世三千吾爱有三，日月与卿，日为朝，月为暮，卿为朝朝暮暮','2018-12-06 10:46:01','\0'),(45,1,67,'九百里吾道，终归诗酒田园','2018-12-06 14:22:12','\0'),(59,1,103,'浮世三千吾爱有三，日月与卿','2018-12-12 10:13:44','\0'),(60,1,103,'天下之大\r\n','2018-12-12 10:15:44','\0'),(61,1,105,'评论加转发，双击666','2018-12-12 10:20:43','\0'),(62,2,105,'评论加转发，双击666','2018-12-12 10:21:13','\0'),(63,1,108,'好好学习','2018-12-12 19:25:21','\0'),(64,2,108,'好评','2018-12-12 19:59:46','\0'),(65,2,108,'好评','2018-12-12 20:01:07','\0'),(66,1,109,'评论','2018-12-12 20:07:33','\0'),(67,1,109,'6666666666666666','2018-12-12 20:11:02','\0'),(68,1,97,'学习','2018-12-12 20:35:31','\0'),(71,1,105,'666\r\n','2018-12-12 20:46:54','\0');

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `counter` */

insert  into `counter`(`id`,`count`) values (1,327);

/*Table structure for table `girl` */

DROP TABLE IF EXISTS `girl`;

CREATE TABLE `girl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `girl` */

insert  into `girl`(`id`,`image`) values (1,'99999'),(2,'/9.jsp'),(3,'/images/ec574667a7734432b2f64562f6b6cf48.jpeg'),(4,'/images/611f25fc40284cd0ba2460c86e5feb1b.jpeg'),(5,'/images/fca5e140c13745dda169f2d5809c1918.jpeg'),(6,'/images/60d992200d0e43b9b477103e77091c80.jpeg'),(7,'/images/08396da1c9b346cf8d5e047c2d1ed6fa.jpeg'),(8,'/images/27e4315d577f40948aae8d3d14bc749c.jpeg'),(9,'/images/75403829610c41fc85b06f4d54590f40.jpeg'),(10,'/images/2b401994a4c84dcdaaac0d5e8b234d20.jpeg'),(11,'/images/bd740b61dee04b5b8fb229b75443b1f2.jpeg'),(12,'/images/6639933de96f4463bdfa6bd97439e8a5.jpeg'),(13,'/images/fef4c0dac59b48a797816fad9d9e983d.jpeg'),(14,'/img/ed559d9884124b478c5e18955c388084.jpeg'),(15,'/img/a40ef446138d4c66ad40d9f6ea7d49b1.jpeg'),(16,'/img/e0df9400c47b46d2b38b14e91678feb6.jpeg'),(17,'/img/f37e6dd9ef234138b817a90599a8da45.jpeg'),(18,'/img/540f6e4590ea481897f089c75b85e649.jpeg'),(19,'/img/f403f9959fde44b4baff969149371e61.jpeg'),(20,'/img/116f7b2bb775495ea0cd72cd69e04a47.jpeg');

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT '0',
  `firstName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `lastName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `gender` bit(1) NOT NULL DEFAULT b'0',
  `telephone` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profile` (`id`) USING BTREE,
  KEY `fk_profile` (`userId`),
  CONSTRAINT `fk_profile` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `profile` */

insert  into `profile`(`id`,`userId`,`firstName`,`lastName`,`gender`,`telephone`) values (11,9,'test_name','test_last_name','','12345'),(14,1,'潘','炳稳','\0','119');

/*Table structure for table `syscategory` */

DROP TABLE IF EXISTS `syscategory`;

CREATE TABLE `syscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `articals` int(11) DEFAULT '0',
  `isDelete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `syscategory` */

insert  into `syscategory`(`id`,`categoryName`,`articals`,`isDelete`) values (1,'教育频道',120,'\0'),(2,'娱乐频道',345,'\0'),(4,'体育频道',0,'\0'),(5,'电影频道',1,'\0');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `pass` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `email` varchar(32) NOT NULL DEFAULT '0',
  `isApplied` bit(1) NOT NULL DEFAULT b'0',
  `isDelete` bit(1) NOT NULL DEFAULT b'0',
  `isProfile` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `index_user` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userName`,`pass`,`email`,`isApplied`,`isDelete`,`isProfile`) values (1,'潘炳稳','javajava','1303996779@qq.com','','\0',''),(2,'叶斯力','java','admin@chinadota2.com','','\0',''),(3,'宋云','java','chuanjian.huan@wbkit.com','','\0',''),(4,'裴雁飞','java','xunhua.zhang@wbkit.com','','\0','\0'),(5,'阿布杜拉','java','chuan@chuan.com','','\0','\0'),(9,'javaa','java','test@test.com','','\0',''),(10,'starlee2008','java','starlee2008@163.com','','\0','\0'),(15,'admin2008','java','starlee2008@yeah.com','','\0','\0'),(22,'99','java','00','\0','\0','\0'),(28,'ad','java','ad','','\0','\0'),(29,'java','java','java@a','','\0','\0'),(32,'用户名','java','0000000','','\0','\0'),(33,'王萍','java','000000000','','\0','\0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
