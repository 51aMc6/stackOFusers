//
//  CustomCell.h
//  StackOFusers
//
//  Created by Siamac6 on 10/26/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *repCountLbl;
@property (weak, nonatomic) IBOutlet UILabel *goldBadgeLbl;
@property (weak, nonatomic) IBOutlet UILabel *silverBadgeLbl;
@property (weak, nonatomic) IBOutlet UILabel *bronzeBadgeLbl;


@end
