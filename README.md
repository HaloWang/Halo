# Halo

Halo 是我使用 Swift 开发 iOS 应用一年下来所积累的一个工具库

Halo 帮助我快速书写简洁的代码

Halo 的名字取自一款叫做 [HALO](https://www.halowaypoint.com/en-us) 的游戏

Halo 使用 Swift 编写，目前仅支持 iOS 平台

你还可以在我的[博客](http://halowang.github.io/)上找到关于 Halo 的[较早期的介绍](http://halowang.github.io/2016/03/09/introduction-of-Halo/)

## 集成 Halo

在 `Podfile` 中

```
use_frameworks!
pod 'Halo'
```

## 链式语法

Halo 中很多方法都是为了实现链式语法

非链式语法：

	object.propertyA = valueA
	object.propertyB = valueB
	object.propertyC = valueC
	object.propertyD = valueD

链式语法：

	object
		.propertyA(valueA)
		.propertyB(valueB)
		.propertyC(valueC)
		.propertyD(valueD)
		
效果图：

![](./imageRes/ChainableMethods.png)
		
我这样作的主要原因有：

- 不喜欢在设置 object 的若干属性时每次都要多写一个 object
- 可以在 map 等函数中设置属性的同时返回结果


这种方法的基本实现为：

```
extension Class {
	//	Chainable method of property
	func property(property: propertyType) -> Self {
		self.property = property
		return self
	}
}
```

## 要处理的事情

### Chainable Method Generator（链式方法生成器）

通过上面的基本实现，大家也可以发现，完成实现链式方法是一个很机械的工作，我觉得可以通过 shell 脚本或者 objc-runtime 来自动生成链式方法

### 链式方法调用起来有点麻烦

比如下面

```
UILabel()
	.superView(view)
	.text("YOUR_TEXT")
```

虽说 `superView` 方法返回的是 `Self`，但是有时候调用 `text(:)` 的时候就是没有自动补全（智能提示）
