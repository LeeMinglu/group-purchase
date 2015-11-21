//
//  MLFooterView.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLFooterView.h"

@interface MLFooterView ()

@property (weak, nonatomic) IBOutlet UIButton *loadMore;


@property (weak, nonatomic) IBOutlet UIView *loading;

- (IBAction)clickLoadMore:(id)sender;
@end

@implementation MLFooterView

+ (instancetype)footerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MLFooterView" owner:nil options:nil] lastObject];
}

- (IBAction)clickLoadMore:(id)sender {
    
    //隐藏加载更多按钮
    self.loadMore.hidden = YES;
    self.loading.hidden = NO;
    
    //判断代理中是否实现了协议中的方法
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(footerViewDidClickLoadMoreBtn:)]) {
            [self.delegate footerViewDidClickLoadMoreBtn:self];
        }
        
        //隐藏正在加载
        //显示加载更多
        
        self.loading.hidden = YES;
        self.loadMore.hidden = NO;

    });
    
    
}
@end
