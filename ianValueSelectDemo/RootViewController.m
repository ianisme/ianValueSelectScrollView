//
//  RootViewController.m
//  ianValueSelectDemo
//
//  Created by ian on 15/5/12.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "RootViewController.h"
#import "IanValueSelectView.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTestView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addTestView
{
    IanValueSelectView *view = [[IanValueSelectView alloc] initWithFrame:CGRectMake(5, 100, self.view.bounds.size.width - 10, 45)];
    view.selectorRow = 20;
    view.viewWidth = 50;
    __weak typeof(view) weakView = view;
    view.ianScrollViewCustomView = ^(BOOL selected, NSInteger index){
        __strong typeof(weakView) strongView = weakView;
        UILabel * label = nil;
        label = [[UILabel alloc] initWithFrame:CGRectMake(1, 0, strongView.viewWidth, strongView.frame.size.height)];
        if(index == 0){
            label.text = @"-";
        }else if(index == strongView.selectorRow-1){
            label.text = [NSString stringWithFormat:@"%ld+",strongView.selectorRow-2];
        }else{
            label.text = [NSString stringWithFormat:@"%ld",(long)index];
        }
        label.textAlignment =  NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14.0f];
        label.backgroundColor = [UIColor clearColor];
        if (selected) {
            label.textColor = [UIColor whiteColor];
        } else {
            label.textColor = [UIColor blackColor];
        }
        return label;
    };
    view.ianScrollViewSelectAction = ^(NSInteger index){
        NSLog(@"点击了第%ld个选择块",index);
    };
    [self.view addSubview:view];
    [view startLoadingByIndex:3];
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
