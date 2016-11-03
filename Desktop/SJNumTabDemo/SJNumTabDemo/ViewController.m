//
//  ViewController.m
//  SJNumTabButton
//
//  Created by shenj on 16/11/2.
//  Copyright © 2016年 shenj. All rights reserved.
//

#import "ViewController.h"
#import "SumViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"item1";
    
    [self createRightBarButton];
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


@end
