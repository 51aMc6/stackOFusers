//
//  UsersData.m
//  StackOFusers
//
//  Created by Siamac6 on 10/28/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import "UsersData.h"
#import "NetworkServices.h"
#import "User.h"


@implementation UsersData
//@synthesize allUsers;

-(id)init {
    self = [super init];
    return self;
}

+ (void)getAllusersDataWithCallback:(void (^)(NSArray *))completion {
    [NetworkServices fetchUserDataWithUri:nil withCompletion:^(NSDictionary* result){
        if (result) {
            NSMutableArray *tmpArr = [NSMutableArray new];
            NSArray *items = [result valueForKey:@"items"];
            for (NSDictionary* item in items) {
                User *usr = [[User alloc]initWithUserData:item];
                [tmpArr addObject:usr];
            }
            completion([tmpArr copy]);
        }
        else {
            completion(nil);
        }
    }];
    

}

@end
