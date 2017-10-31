//
//  ViewController.h
//  StackOFusers
//
//  Created by Siamac6 on 10/26/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVProgressHUD.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *userArray;

-(void)loadUsersData;

@end

