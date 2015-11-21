//
//  MLFoodCell.m
//  group-purchase
//
//  Created by 李明禄 on 15/11/20.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLFoodCell.h"
#import "Food.h"

@interface MLFoodCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UILabel *buyCount;




@end

@implementation MLFoodCell


+ (instancetype)foodCellWithTableView:(UITableView *)tableView {
    
    static NSString * const ID = @"food";
    MLFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MLFoodCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setFood:(Food *)food {
    _food = food;
    self.icon.image = [UIImage imageNamed:food.icon];
    self.title.text = food.title;
    self.price.text = [NSString stringWithFormat:@"价格:%@",food.price];
    self.buyCount.text = [NSString stringWithFormat:@"已经有%@人购买",food.buyCount];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
