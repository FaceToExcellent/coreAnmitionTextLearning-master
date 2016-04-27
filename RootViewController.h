//
//  RootViewController.h
//  coreAnmitionTextLearning
//
//  Created by HYZ on 16/4/9.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tabelview;

@property(nonatomic,strong)NSArray * dataArray;


@end
