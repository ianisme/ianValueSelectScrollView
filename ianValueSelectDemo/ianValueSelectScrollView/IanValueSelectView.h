//
//  IanValueSelectView.h
//  chow
//
//  Created by ian on 15/4/27.
//  Copyright (c) 2015年 eallcn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ianScrollViewSelectBlock)(NSInteger);
typedef UIView * (^ianScrollViewCustomView)(BOOL, NSInteger);

@interface IanValueSelectView : UIView

@property (nonatomic) NSInteger selectorRow; // 选择块的数量

@property (nonatomic) CGFloat viewWidth; // 选项间隔
@property (nonatomic, copy) ianScrollViewSelectBlock ianScrollViewSelectAction; // 选择之后响应的事件
@property (nonatomic, copy) ianScrollViewCustomView ianScrollViewCustomView;

- (void)startLoading; // 加载初始化（必须实现）
// 或者
- (void)startLoadingByIndex:(NSInteger)index; // 加载初始化并制定初始位置

- (void)appointIndex:(NSInteger)index; // 指定位置

@end
