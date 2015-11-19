//
//  Food.h
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWidthDict:(NSDictionary *)dict;
+ (instancetype)foodWithDict:(NSDictionary *)dict;

@end
