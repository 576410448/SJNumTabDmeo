//
//  ViewController.m
//  SJNumTabButton
//
//  Created by shenj on 16/11/2.
//  Copyright © 2016年 shenj. All rights reserved.
//

#import "ViewController.h"
#import "SumViewController.h"
#import "UIView+SJTab.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"item1";
    
    [self createRightBarButton];
    
    [self createTabView];
}

- (void)createRightBarButton{
    
    UIBarButtonItem * nextItem = [[UIBarButtonItem alloc] initWithTitle:@"翻页" style:noErr target:self action:@selector(nextPush)];
    
    self.navigationItem.rightBarButtonItem = nextItem;
    
}

- (void)nextPush{
    
    SumViewController *web = [[SumViewController alloc] init];
    web.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:web animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}

- (void)createTabView{
    
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 80)];
    [self.view addSubview:tabView];
    
    tabView.layer.borderWidth = 1;
    
    // 添加角标
    tabView.sj_tabNum = 12;
    tabView.sj_rightOfSet = 20;
    tabView.sj_topOfSet = 32;
    tabView.sj_backColor = [UIColor lightGrayColor];
    tabView.sj_numColor = [UIColor blackColor];
    tabView.sj_tabUserInteractionEnabled = YES;
    
}

@end
