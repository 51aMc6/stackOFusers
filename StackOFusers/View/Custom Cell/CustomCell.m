//
//  CustomCell.m
//  StackOFusers
//
//  Created by Siamac6 on 10/26/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize imgView, nameLbl, repCountLbl, goldBadgeLbl, silverBadgeLbl, bronzeBadgeLbl;

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
