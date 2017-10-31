//
//  User.h
//  StackOFusers
//
//  Created by Siamac6 on 10/27/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSNumber *account_id;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSNumber *reputation;
@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSString *profile_img_url;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSDictionary *badgeDict;
@property (strong, nonatomic) NSString *user_link;

-(id)initWithUserData:(NSDictionary*)userDict;

@end



