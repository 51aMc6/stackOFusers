//
//  User.m
//  StackOFusers
//
//  Created by Siamac6 on 10/27/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import "User.h"



@implementation User

-(id)initWithUserData:(NSDictionary*)userDict {
    if ((self = [super init])) {
        if (userDict) {
            _userName = [userDict objectForKey:@"display_name"];
            _userId = [NSNumber numberWithInt:[[userDict objectForKey:@"user_id"] intValue]];
            _account_id = [NSNumber numberWithInt:[[userDict objectForKey:@"account_id"] intValue]];
            _reputation = [NSNumber numberWithInt:[[userDict objectForKey:@"reputation"] intValue]];
            _location = [userDict objectForKey:@"location"];
            _profile_img_url = [userDict objectForKey:@"profile_image"];
            _badgeDict = [userDict objectForKey:@"badge_counts"];
            _user_link = [userDict objectForKey:@"link"];
            
        }
        else { return nil; }
    }
    return self;
}

@end
