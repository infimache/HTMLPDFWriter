//
//  ViewController.m
//  HTMLPDFWriter
//
//  Created by Vaňo Jakub on 30/04/15.
//
//

#import "ViewController.h"
#import <ResearchKit/ResearchKit.h>

@interface ViewController ()
@property(strong, nonatomic) ORKConsentDocument* document;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableString* html = [NSMutableString string];
    [html appendString:@"<html><body>"];
    for (int i=0; i<200; i++) {
        [html appendString:@"<div align=\"right\">line</div>"];
    }
    [html appendString:@"</body></html>"];
    
    self.document = [[ORKConsentDocument alloc] init];
    self.document.htmlReviewContent = html;
    
    __weak typeof(self) weakSelf = self;
    [self.document makePDFWithCompletionHandler:^(NSData *pdfData, NSError *error) {
        [weakSelf.webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
