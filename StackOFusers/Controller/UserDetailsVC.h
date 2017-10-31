//
//  UserDetailsVC.h
//  StackOFusers
//
//  Created by Siamac6 on 10/30/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface UserDetailsVC : UIViewController <WKUIDelegate, WKNavigationDelegate>

@property (strong, nonatomic) NSString *linkStr;

@end
