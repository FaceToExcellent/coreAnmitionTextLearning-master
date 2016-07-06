//
//  DrawingView.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/7/6.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView




//-(instancetype)init
//{
//    if (self= [super init]) {
//        self.path = [[UIBezierPath alloc] init];
//        self.path.lineJoinStyle = kCGLineJoinRound;
//        self.path.lineCapStyle = kCGLineCapRound;
//        self.path.lineWidth = 5;
//    }
//    
//    return self;
//}
//- (void)awakeFromNib
//{
//    //create a mutable path
// 
//}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the starting point
//    CGPoint point = [[touches anyObject] locationInView:self];
//    
//    //move the path drawing cursor to the starting point
//    [self.path moveToPoint:point];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //get the current point
//    CGPoint point = [[touches anyObject] locationInView:self];
//    
//    //add a new line segment to our path
//    [self.path addLineToPoint:point];
//    
//    //redraw the view
//    [self setNeedsDisplay];
//}
//
//- (void)drawRect:(CGRect)rect
//{
//    //draw path
//    [[UIColor clearColor] setFill];
//    [[UIColor redColor] setStroke];
//    [self.path stroke];
//}
/* 这样实现的问题在于，我们画得越多，程序就会越慢。因为每次移动手指的时候都会重绘整个贝塞尔路径（UIBezierPath），随着路径越来越复杂，每次重绘的工作就会增加，直接导致了帧数的下降。看来我们需要一个更好的方法了。
 
 Core Animation为这些图形类型的绘制提供了专门的类，并给他们提供硬件支持（第六章『专有图层』有详细提到）。CAShapeLayer可以绘制多边形，直线和曲线。CATextLayer可以绘制文本。CAGradientLayer用来绘制渐变。这些总体上都比Core Graphics更快，同时他们也避免了创造一个寄宿图。
 
 如果稍微将之前的代码变动一下，用CAShapeLayer替代Core Graphics，性能就会得到提高（见清单13.2）.虽然随着路径复杂性的增加，绘制性能依然会下降，但是只有当非常非常浮躁的绘制时才会感到明显的帧率差异。*/
+ (Class)layerClass
{
    //this makes our view create a CAShapeLayer
    //instead of a CALayer for its backing layer
    return [CAShapeLayer class];
}

-(instancetype)init
{
    if (self = [super init]) {
        self.path = [[UIBezierPath alloc] init];
        
        //configure the layer
        _shapeLayer = (CAShapeLayer *)self.layer;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineJoin = kCALineJoinRound;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineWidth = 5;
    }
    
    return self;
}

- (void)awakeFromNib
{
    //create a mutable path
  
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //move the path drawing cursor to the starting point
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the current point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add a new line segment to our path
    [self.path addLineToPoint:point];
    
    //update the layer with a copy of the path
    ((CAShapeLayer *)self.layer).path = self.path.CGPath;
}

@end
