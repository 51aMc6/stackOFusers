//
//  NetworkServices.h
//  StackOFusers
//
//  Created by Siamac6 on 10/27/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkServices : NSObject

+(void)fetchUserDataWithUri:(NSString*)uri withCompletion:(void (^) (NSDictionary*))completion;

@end



