//
//  WebViewController.h
//  WebViewDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *forwardButton;
@property (nonatomic, copy) NSString *url;

@end
