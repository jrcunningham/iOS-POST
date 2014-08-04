//
//  ViewController.m
//  PostRequestPrototype
//
//  Created by jake Cunningham on 31/07/2014.
//  Copyright (c) 2014 jake Cunningham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //sets the textField delegate to self so that when it can handel events -- in this case hideing the keyboard upon 'Return' press.
    [_txtAddress setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSend:(id)sender {
    
    //TODO:validate that the IP address is correct and that it is reachable.

    //send post request to the server.
    
    //creates a mutable request object, using the URL from the textField.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_txtAddress.text]];
    //Sets the request tipe, in this case POST, but could also be set to GET etc.
    [request setHTTPMethod:@"POST"];
    
    //A basic string containg the data to be sent. This is then wrapped up into data ready to be sent in the body.
    //NB this step may be slightly diferent for other VERBS i.e GET passes data via the URL.
    NSString *stringData = @"lineNumber=86";
    NSData *bodyData = [stringData dataUsingEncoding:NSASCIIStringEncoding];
    [request setHTTPBody:bodyData];
    
    //Creates a connection, in this case simple HTTP NOT SECURE!
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
    
}

//****************************************************************//
//                          Delegate Methods                      //
//                      -----------------------                   //
//   The following methods are overriden delegate methods         //
//   from NSURLConnectionDataSourceDelegate,                      //
//        NSURLConnectionDelegate and                             //
//        UITextFieldDelegate respectively.                       //
//****************************************************************//

#pragma mark - NSURLConnectionDataSourceDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data %@", string);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}

#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
