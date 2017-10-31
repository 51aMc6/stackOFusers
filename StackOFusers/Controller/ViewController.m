//
//  ViewController.m
//  StackOFusers
//
//  Created by Siamac6 on 10/26/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "UsersData.h"
#import "User.h"
#import "UserDetailsVC.h"


@interface ViewController (){
    NSInteger selectedRow;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (NSString*)appDocumentDirectory;

@end

@implementation ViewController
@synthesize userArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadUsersData];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
}


//MARK: - Load Users data from UsersData Model;
-(void)loadUsersData {
    
    [SVProgressHUD showWithStatus:@"Loading..."];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [UsersData getAllusersDataWithCallback:^(NSArray *itemsArr) {
        if (itemsArr.count > 0) {
            self.userArray = itemsArr;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [self.tableView reloadData];
            });
        }
        else {
            NSLog(@"no data");
            [SVProgressHUD showWithStatus:@"There is no data or unable to load!"];
            [SVProgressHUD dismissWithDelay:2.5];
            
        }
    }];

}

- (IBAction)refreshTableData:(UIBarButtonItem *)sender {
    
    self.userArray = nil;
    [self.tableView reloadData];
    [self loadUsersData];
}

//MARK: - UITableView Delegate & DataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    User *userObj = [userArray objectAtIndex:indexPath.row];
    
    cell.nameLbl.text = userObj.userName;
    cell.nameLbl.adjustsFontSizeToFitWidth = YES;
    cell.repCountLbl.text = [userObj.reputation stringValue];
    cell.goldBadgeLbl.text = [[userObj.badgeDict valueForKey:@"gold"] stringValue];
    cell.silverBadgeLbl.text = [[userObj.badgeDict valueForKey:@"silver"] stringValue];
    cell.bronzeBadgeLbl.text = [[userObj.badgeDict valueForKey:@"bronze"] stringValue];

    CGPoint imgPoint = cell.imgView.center;
    UIActivityIndicatorView *actIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    actIndicator.frame = CGRectMake(imgPoint.x - 20, imgPoint.y - 20, 40, 40);
    [actIndicator startAnimating];
    [cell.imgView addSubview:actIndicator];
    
    NSString *imgPath = [[self appDocumentDirectory] stringByAppendingPathComponent:userObj.userId.stringValue];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imgPath]) {
        [actIndicator stopAnimating];
//        [actIndicator setHidden:YES];
        cell.imgView.image = [UIImage imageWithContentsOfFile:imgPath];
    }
    else {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self downloadUserProfileImageToDocumentDir];
        });
    }

    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return userArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"goToUserDetails" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//MARK: - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToUserDetails"]) {
        UserDetailsVC *vc = [segue destinationViewController];
        vc.linkStr = [(User*)[self.userArray objectAtIndex:selectedRow] user_link];
        self.navigationItem.title =  @"";//[(User*)[self.userArray objectAtIndex:selectedRow] userName];
    }
}

//MARK: - Download user_profile image from remote server
-(void)downloadUserProfileImageToDocumentDir {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (User* user in userArray) {
            NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:user.profile_img_url]];
            UIImage *image = [UIImage imageWithData:imgData];
            NSString *imgPath = [[self appDocumentDirectory] stringByAppendingPathComponent:user.userId.stringValue];
            [UIImageJPEGRepresentation(image, 1.0) writeToFile:imgPath atomically:YES];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

//MARK: - Document dir/
- (NSString*)appDocumentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

@end
