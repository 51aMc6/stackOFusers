//
//  UsersData.h
//  StackOFusers
//
//  Created by Siamac6 on 10/28/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsersData : NSObject

//@property (strong, nonatomic) NSArray *allUsers;

+ (void)getAllusersDataWithCallback:(void (^)(NSArray*))completion;


@end
