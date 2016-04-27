//
//  CATextLayerViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/14.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CATextLayerViewController.h"

@interface CATextLayerViewController ()

@end

@implementation CATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
    
    
    
}

-(void)makeUI
{
    CATextLayer *textLayer =[CATextLayer layer];
    textLayer.frame =CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64);
    
    [self.view.layer addSublayer:textLayer];
    
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    
    
    CFStringRef fontName =(__bridge CFStringRef )font.fontName;
    CGFontRef  fontRef =CGFontCreateWithFontName(fontName);
    
    textLayer.font=fontRef;
    textLayer.fontSize=font.pointSize;
    CGFontRelease(fontRef);
     //NSString * text1=@"";
    NSString * text =@"用户界面是无法从一个单独的图片里面构建的。一个设计良好的图标能够很好地表现一个按钮或控件的意图，不过你迟早都要需要一个不错的老式风格的文本标签。如果你想在一个图层里面显示文字，完全可以借助图层代理直接将字符串使用Core Graphics写入图层的内容（这就是UILabel的精髓）。如果越过寄宿于图层的视图，直接在图层上操作，那其实相当繁琐。你要为每一个显示文字的图层创建一个能像图层代理一样工作的类，还要逻辑上判断哪个图层需要显示哪个字符串，更别提还要记录不同的字体，颜色等一系列乱七八糟的东西。万幸的是这些都是不必要的，Core Animation提供了一个CALayer的子类CATextLayer，它以图层的形式包含了UILabel几乎所有的绘制特性，并且额外提供了一些新的特性。同样，CATextLayer也要比UILabel渲染得快得多。很少有人知道在iOS 6及之前的版本，UILabel其实是通过WebKit来实现绘制的，这样就造成了当有很多文字的时候就会有极大的性能压力。而CATextLayer使用了Core text，并且渲染得非常快。让我们来尝试用CATextLayer来显示一些文字";
    
    textLayer.string = text;
    
    //避免像素化 view.layer.magnificationFilter = kCAFilterNearest;？过滤
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
