//
//  UIView+SJTab.h
//  SJNumTabDemo
//
//  Created by shenj on 16/11/6.
//  Copyright © 2016年 shenj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTabButton.h"

@interface UIView (SJTab)

@property (nonatomic ,strong ,readonly) SJTabButton *numTab;

/** 标签是否支持操作 */
@property (nonatomic ,readwrite) BOOL sj_tabUserInteractionEnabled;

/** 标签显示数 */
@property (nonatomic ,assign) NSInteger sj_tabNum;

/** 标签右边距 */
@property (nonatomic ,assign) CGFloat   sj_rightOfSet;

/** 标签上边距 */
@property (nonatomic ,assign) CGFloat   sj_topOfSet;

/** 标签背景色 */
@property (nonatomic ,retain) UIColor * sj_backColor;

/** 标签字体色 */
@property (nonatomic ,retain) UIColor * sj_numColor;

@end