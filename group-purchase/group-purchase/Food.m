//
//  Food.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "Food.h"

@implementation Food

- (instancetype)initWidthDict:(NSDictionary *)dict {
    
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)foodWithDict:(NSDictionary *)dict {
    return [[self alloc] initWidthDict:dict];
}

@end
