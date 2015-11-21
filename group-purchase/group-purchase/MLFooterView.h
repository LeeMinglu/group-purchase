//
//  MLFooterView.h
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MLFooterView;

@protocol MLFooterViewDelegate <NSObject>

- (void)footerViewDidClickLoadMoreBtn:(MLFooterView *)footerView;

@end

@interface MLFooterView : UIView

@property (nonatomic, weak) id<MLFooterViewDelegate> delegate;

+ (instancetype)footerView;

@end
