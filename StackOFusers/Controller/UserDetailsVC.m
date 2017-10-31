//
//  UserDetailsVC.m
//  StackOFusers
//
//  Created by Siamac6 on 10/30/17.
//  Copyright © 2017 Siamac6. All rights reserved.
//

#import "UserDetailsVC.h"

@interface UserDetailsVC ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation UserDetailsVC 
@synthesize linkStr;

- (void)viewDidLoad {
    [super viewDidLoad];

    if (linkStr.length) {
        
        self.webView = [[WKWebView alloc]initWithFrame:self.view.frame];
        self.webView.navigationDelegate = self;
        self.webView.UIDelegate = self;
        [self.view addSubview:self.webView];
        NSURL *url = [NSURL URLWithString:linkStr];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:req];

    }
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Couldn't open the link"
                                                                preferredStyle:UIAlertControllerStyleAlert
                                    ];
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:act];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)barButtonPressed:(UIBarButtonItem *)sender {
    switch (sender.tag) {
        case 10:
            [self.webView goForward];
            break;
        case 11:
            [self.webView reload];
            break;
        case 12:
            [self.webView goBack];
            break;
            
        default:
            break;
    }
}


@end
