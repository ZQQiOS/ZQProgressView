//
//  ViewController.m
//  ZQProgressViewDemo
//
//  Created by ZQQ on 2017/12/5.
//  Copyright © 2017年 ZQQ. All rights reserved.
//
/**导航栏和状态栏的高度*/
#define kViewTop (([UIScreen mainScreen].bounds.size.height == 812)?88.0:64.0)
#import "ViewController.h"
#import "ZQProgressView.h"//导入库的头文件

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) ZQProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupWebView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupWebView{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.webView = webView;
    webView.backgroundColor = [UIColor whiteColor];
    
    webView.delegate = self;
    [self.view addSubview:webView];
    
    ZQProgressView *progressView = [[ZQProgressView alloc]initWithFrame:CGRectMake(0, kViewTop, self.view.frame.size.width, 3)];
    self.progressView = progressView;
    progressView.progressColor = [UIColor purpleColor];
    [self.view addSubview:progressView];

    //加载本地html
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"test"
                                                          ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
    
    
}

/**webview加载完成 要在此方法里获取title*/
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"self.title%@",self.title);
    [self.progressView endLoadingAnimation];
    
    //原生界面调用h5的方法OCAlert
    [self.webView stringByEvaluatingJavaScriptFromString:@"OCAlert()"];
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.progressView startLoadingAnimation];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.progressView endLoadingAnimation];
}

@end
