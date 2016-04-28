//
//  RootViewController.m
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/9.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "RootViewController.h"
#import "Layer01ViewController.h"
#import "contentsViewController.h"
#import "CustomDrawingViewController.h"
#import "anchorPointViewController.h"
#import "visualeffectViewController.h"
#import "MaskViewController.h"
#import "TransformViewController.h"
#import "CAShapeLayerViewController.h"
#import "CATextLayerViewController.h"
#import "CATransformLayerViewController.h"
#import "CATransformLayer2ViewController.h"
#import "CAGradientLayerViewController.h"
#import "CAEmitterLayerViewController.h"
#import "CAReplicatorLayerViewController.h"
#import "CAEAGLLayerViewController.h"
#import "AffairsViewController.h"
#import "finshblockViewController.h"
#import "CAKeyframeAnimationViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"核心动画知识点";
    [self.navigationController.navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
    
    NSForegroundColorAttributeName:[UIColor blueColor]}];
    [self makrUI];
    
}
-(void)makrUI
{
    
    
    _dataArray =[[NSArray alloc]initWithObjects:@"使用图层",@"contents属性",@"Custom Drawing",@"anchorPoint",@"visualeffect",@"mask",@"Transform",@"CAShapeLayer",@"CATextLayer",@"scollview",@"CATransformLayer",@"CAGradientLayer",@"CAEmitterLayer",@"CAReplicatorLayer",@"CAEAGLLayer",@"事务",@"完成块",@"关键帧" ,nil];
    _tabelview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT)];
    _tabelview.delegate=self;
    _tabelview.dataSource=self;
    [self.view addSubview:_tabelview];
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-----%@",(long)indexPath.row,[_dataArray objectAtIndex:indexPath.row ]];
    //cell.textColor
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row==0)
    {
        Layer01ViewController * layer01 =[[Layer01ViewController alloc]init];
        [self.navigationController pushViewController:layer01 animated:YES];
    }
    
    if(indexPath.row==1)
    {
        contentsViewController * layer02 =[[contentsViewController alloc]init];
        [self.navigationController pushViewController:layer02 animated:YES];
    }
    if (indexPath.row ==2) {
        CustomDrawingViewController * layer03=[[CustomDrawingViewController alloc]init];
        [self.navigationController pushViewController:layer03 animated:YES];
        
    }
    if (indexPath.row ==3) {
        anchorPointViewController * layer04 =[[anchorPointViewController alloc]init];
        [self.navigationController pushViewController:layer04 animated:YES];
        
    }
    
    if (indexPath.row ==4) {
        visualeffectViewController * layer05 =[[visualeffectViewController alloc]init];
        [self.navigationController pushViewController:layer05 animated:YES];
        
    }
    if (indexPath.row ==5) {
        MaskViewController * layer06 =[[MaskViewController alloc]init];
        [self.navigationController pushViewController:layer06 animated:YES];
        
    }
    if (indexPath.row ==6) {
        TransformViewController * layer07 =[[TransformViewController alloc]init];
        [self.navigationController pushViewController:layer07 animated:YES];
        
    }
    if (indexPath.row ==7) {
        CAShapeLayerViewController * layer0701 =[[CAShapeLayerViewController alloc]init];
        [self.navigationController pushViewController:layer0701 animated:YES];
        
    }
    if (indexPath.row ==8) {
        CATextLayerViewController * layer08 =[[CATextLayerViewController alloc]init];
        [self.navigationController pushViewController:layer08 animated:YES];
        
    }
    
    if (indexPath.row ==9) {
        CATransformLayerViewController * layer09 =[[CATransformLayerViewController alloc]init];
        [self.navigationController pushViewController:layer09 animated:YES];
        
    }
    if (indexPath.row ==10) {
        CATransformLayer2ViewController * layer09 =[[CATransformLayer2ViewController alloc]init];
        [self.navigationController pushViewController:layer09 animated:YES];
        
    }
    if (indexPath.row ==11) {
        CAGradientLayerViewController * layer10 =[[CAGradientLayerViewController alloc]init];
        [self.navigationController pushViewController:layer10 animated:YES];
        
    }
    
    if (indexPath.row ==12) {
        CAEmitterLayerViewController * layer11 =[[CAEmitterLayerViewController alloc]init];
        [self.navigationController pushViewController:layer11 animated:YES];
        
    }
    if (indexPath.row ==13) {
        CAReplicatorLayerViewController * layer12 =[[CAReplicatorLayerViewController alloc]init];
        [self.navigationController pushViewController:layer12 animated:YES];
        
    }
    if (indexPath.row ==14) {
        CAEAGLLayerViewController * layer13 =[[CAEAGLLayerViewController alloc]init];
        [self.navigationController pushViewController:layer13 animated:YES];
        
    }
    if (indexPath.row ==15) {
        AffairsViewController * layer15 =[[AffairsViewController alloc]init];
        [self.navigationController pushViewController:layer15 animated:YES];
        
    }
    if (indexPath.row ==16) {
        finshblockViewController * layer16 =[[finshblockViewController alloc]init];
        [self.navigationController pushViewController:layer16 animated:YES];
        
    }
    if (indexPath.row ==17) {
        CAKeyframeAnimationViewController * layer17 =[[CAKeyframeAnimationViewController alloc]init];
        [self.navigationController pushViewController:layer17 animated:YES];
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
