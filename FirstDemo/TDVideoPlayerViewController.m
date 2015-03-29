//
//  TDVideoPlayerViewController.m
//  FirstDemo
//
//  Created by 王世坚 on 15/3/29.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import "TDVideoPlayerViewController.h"

@interface TDVideoPlayerViewController ()

@end

@implementation TDVideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView * playerView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    playerView.delegate = self;
    [self.view addSubview:playerView];
    NSString * resourcePath = [[NSBundle mainBundle]pathForResource:@"player" ofType:@"html"];
    NSString * htmlStr = [[NSString alloc] initWithContentsOfFile:resourcePath encoding:NSUTF8StringEncoding error:nil];
    
    [playerView loadHTMLString:htmlStr baseURL:[NSURL URLWithString:resourcePath]];
    // Do any additional setup after loading the view.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString * str = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('video'.src)"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
