//
//  finshblockViewController.h
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface finshblockViewController : PostViewController
@property(nonatomic,strong)CALayer * colorLayer;
@end
/*- UIView关联的图层禁用了隐式动画，对这种图层做动画的唯一办法就是使用UIView的动画函数（而不是依赖CATransaction），或者继承UIView，并覆盖-actionForLayer:forKey:方法，或者直接创建一个显式动画（具体细节见第八章）。
 - 对于单独存在的图层，我们可以通过实现图层的-actionForLayer:forKey:委托方法，或者提供一个actions字典来控制隐式动画。
 
 我们来对颜色渐变的例子使用一个不同的行为，通过给colorLayer设置一个自定义的actions字典。我们也可以使用委托来实现，但是actions字典可以写更少的代码。那么到底改如何创建一个合适的行为对象呢？
 
 行为通常是一个被Core Animation隐式调用的显式动画对象。这里我们使用的是一个实现了CATransaction的实例，叫做推进过渡。*/