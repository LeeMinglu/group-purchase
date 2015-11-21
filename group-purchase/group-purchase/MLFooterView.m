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
    
}
@end
