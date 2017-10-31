//
//  NetworkServices.m
//  StackOFusers
//
//  Created by Siamac6 on 10/27/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import "NetworkServices.h"

NSString *domainUrl = @"https://api.stackexchange.com/";
NSString *userUri = @"2.2/users?site=stackoverflow";


@implementation NetworkServices



+(void)fetchUserDataWithUri:(NSString*)uri withCompletion:(void (^)(NSDictionary *))completion {
    NSURL *url;
    if (uri) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",domainUrl,uri]];
    }
    else
       url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",domainUrl,userUri]];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                                     
                                                                     if (error != nil) {
                                                                         NSLog(@"%@",error.description);
                                                                     }
                                                                     else {
                                                                         
                                                                         if ([(NSHTTPURLResponse*)response statusCode] == 200) {
                                                                             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                                                                                                                          
                                                                              completion(json);
                                                                         }
                                                                         else {
                                                                             NSLog(@"Error status_code: %ld",[(NSHTTPURLResponse*)response statusCode]);
                                                                             completion(nil);
                                                                        }

                                                                         
                                                                     }
                                                                     
                                                                     
                                                                     
                                                                     
        
    }];
    [dataTask resume];
}

@end
