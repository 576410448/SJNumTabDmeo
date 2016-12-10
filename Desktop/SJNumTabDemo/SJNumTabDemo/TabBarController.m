//
//  TabBarController.m
//  SJNumTabButton
//
//  Created by shenj on 16/11/2.
//  Copyright © 2016年 shenj. All rights reserved.
//

# define MAIN_HEIGHT [[UIScreen mainScreen]bounds].size.height
# define MAIN_WIDTH [[UIScreen mainScreen]bounds].size.width
# define kTabBtnTag 100

#import "TabBarController.h"
#import "ViewController.h"
#import "SubViewController.h"
#import "TabBarBtn.h"
#import "UIButton+SJTab.h"

@interface TabBarController ()

@property (nonatomic ,strong) UIButton *tabBarHome;

@property (nonatomic ,strong) UIButton *tabBarOther;

@property (nonatomic ,strong) UIView *tabBarView;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 快速创建标签栏 方法一 */
    //    [self tabBarConfig];
    
    
    
    /** 自定义多样化标签栏 方法二 */
    
    // 创建视图
    [self createViewController];
    
    // 创建标签栏
    [self createTableBar];
    
    // 创建标签
    [self createTabs];
    
    
    // 添加角标
    [self addNumTab];
}

#pragma mark 方法一
- (void)tabBarConfig{
    
    NSArray *titleArr = @[@"item1",@"item2"];
    
    NSArray *imgs = @[@"tabbar_home_normal",@"tabbar_romeo_normal"];
    
    ViewController *item1 = [[ViewController alloc] init];
    UINavigationController *naviItem1 = [[UINavigationController alloc] initWithRootViewController:item1];
    naviItem1.title = titleArr[0];
    naviItem1.tabBarItem.image = [UIImage imageNamed:imgs[0]];
    
    SubViewController *item2 = [[SubViewController alloc] init];
    UINavigationController *naviItem2 = [[UINavigationController alloc] initWithRootViewController:item2];
    naviItem2.title = titleArr[1];
    naviItem2.tabBarItem.image = [UIImage imageNamed:imgs[1]];
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor blueColor]];
    
    self.viewControllers = @[naviItem1,naviItem2];
    
}

#pragma mark 方法二
-(void)createViewController{
    
    
    
    NSArray *viewConts = @[@"ViewController",
                           @"SubViewController"];
    
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < viewConts.count; i ++) {
        UIViewController *vc = [[NSClassFromString(viewConts[i]) alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcs addObject:navi];
    }
    self.viewControllers = vcs;
    
}


-(void)createTableBar{
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, 49)];
    
    _tabBarView.backgroundColor = [UIColor whiteColor];
    _tabBarView.userInteractionEnabled = YES;
    [self.tabBar addSubview:_tabBarView];
    
}


-(void)createTabs{
    
    NSArray *titleArr = @[@"item1",@"item2"];
    
    NSArray *imgs = @[@"tabbar_home_normal",@"tabbar_romeo_normal"];
    
    for (int i = 0; i < imgs.count; i ++) {
        
        TabBarBtn *btn = [TabBarBtn buttonWithType:UIButtonTypeCustom];
        
        __weak typeof(btn) weakBtn = btn;
        [weakBtn setSj_tabRemoveEventBlock:^{
            weakBtn.sj_tabNum = 0;
        }];
        
        CGFloat weight = MAIN_WIDTH/2;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        btn.frame = CGRectMake(i * weight, 0, weight, 49);
        btn.tag = i + kTabBtnTag;
        
        
        if (i == 0) {
            btn.selected = YES;
        }
        [_tabBarView addSubview:btn];
        
        [btn addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}


-(void)tapAction:(UIButton *)btn{
    
    NSInteger index = btn.tag - kTabBtnTag;
    self.selectedIndex = index;
    
    for (UIButton *btn in _tabBarView.subviews) {
        btn.selected = NO;
    }
    
    //设置selected属性
    btn.selected = YES;
}

- (void)addNumTab{
    
    TabBarBtn *btn0 = (TabBarBtn *)[self.view viewWithTag:kTabBtnTag];
    TabBarBtn *btn1 = (TabBarBtn *)[self.view viewWithTag:kTabBtnTag + 1];
    
    // 添加角标
    btn0.sj_tabNum = 12;
    btn0.sj_rightOfSet = 40;
    btn0.sj_topOfSet = 0;
    btn0.sj_backColor = [UIColor lightGrayColor];
    btn0.sj_numColor = [UIColor blackColor];
    btn0.sj_tabUserInteractionEnabled = YES;
    
    // 添加角标
    btn1.sj_tabNum = 9;
    btn1.sj_rightOfSet = 40;
    btn1.sj_topOfSet = 0;
    btn1.sj_tabUserInteractionEnabled = YES;
}

@end
