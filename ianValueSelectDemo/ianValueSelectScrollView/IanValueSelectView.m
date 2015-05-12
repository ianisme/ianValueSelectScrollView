//
//  IanValueSelectView.m
//  chow
//
//  Created by ian on 15/4/27.
//  Copyright (c) 2015年 eallcn. All rights reserved.
//

#import "IanValueSelectView.h"
#import "IZValueSelectorView.h"

@interface IanValueSelectView()<IZValueSelectorViewDataSource,IZValueSelectorViewDelegate>

@property (nonatomic, strong) IZValueSelectorView *selectorView;

@end

@implementation IanValueSelectView

- (void)startLoading
{
    [self initValueSelectView];
}

- (void)startLoadingByIndex:(NSInteger)index
{
    [self initValueSelectView];
    [self performSelector:@selector(RowIndex:) withObject:[NSNumber numberWithInteger:index] afterDelay:0.1f];
}

- (void)appointIndex:(NSInteger)index
{
    [_selectorView selectRowAtIndex:index animated:YES];
}

- (void)RowIndex:(NSNumber *)number
{
    [_selectorView selectRowAtIndex:[number integerValue]];
}

#pragma mark - Private Methods -
- (void)initValueSelectView
{
    if (_selectorView) {
        return;
    }
    _selectorView = ({
        IZValueSelectorView *selectorView = [[IZValueSelectorView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        selectorView.backgroundColor = [UIColor clearColor];
        
        UIImageView *nameSelectorImage = [[UIImageView alloc] initWithFrame:CGRectMake(selectorView.frame.size.width/2-45/2, selectorView.frame.origin.y, 45, 45)];
        nameSelectorImage.image = [UIImage imageNamed:@"value_redPoint"];
        
        
        selectorView.dataSource = self;
        selectorView.delegate = self;
        selectorView.shouldBeTransparent = YES;
        selectorView.horizontalScrolling = YES;
        selectorView.debugEnabled = NO;
        [selectorView setDecelerates:YES];
        
        [self addSubview:nameSelectorImage];
        [self addSubview:selectorView];
        selectorView;
    });
}

#pragma IZValueSelector dataSource
- (NSInteger)numberOfRowsInSelector:(IZValueSelectorView *)valueSelector
{
    return self.selectorRow;
}


- (CGFloat)rowHeightInSelector:(IZValueSelectorView *)valueSelector
{
    return _selectorView.frame.size.height;
}

- (CGFloat)rowWidthInSelector:(IZValueSelectorView *)valueSelector
{
    return self.viewWidth ? self.viewWidth : 60;
}

- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index
{
    return [self selector:valueSelector viewForRowAtIndex:index selected:NO];
}

- (UIView *)selector:(IZValueSelectorView *)valueSelector viewForRowAtIndex:(NSInteger)index selected:(BOOL)selected {
    return self.ianScrollViewCustomView ? self.ianScrollViewCustomView(selected, index) : [[UIView alloc] init];
}

- (CGRect)rectForSelectionInSelector:(IZValueSelectorView *)valueSelector
{
    return CGRectMake(_selectorView.frame.size.width/2 - (self.viewWidth ? self.viewWidth : 60)/2, 0.0, self.viewWidth ? self.viewWidth : 60, _selectorView.frame.size.height);
}

#pragma IZValueSelector delegate
- (void)selector:(IZValueSelectorView *)valueSelector didSelectRowAtIndex:(NSInteger)index {
    if (self.ianScrollViewSelectAction) {
        self.ianScrollViewSelectAction(index);
    }
}


@end
