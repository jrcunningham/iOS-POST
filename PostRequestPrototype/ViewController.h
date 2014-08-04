//
//  ViewController.h
//  PostRequestPrototype
//
//  Created by jake Cunningham on 31/07/2014.
//  Copyright (c) 2014 jake Cunningham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate, NSURLConnectionDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (nonatomic, weak) id <UITextFieldDelegate>delegate;


@end
