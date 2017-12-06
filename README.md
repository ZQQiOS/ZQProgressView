# ZQProgressView
一个模拟进度条加载进度显示的库
使用方法：
webview加载进度条为例：
1、导入头文件#import "ZQProgressView.h"
声明ZQProgressView进度条view
2、将view添加到self.view
3、设置frame和颜色
4、webview加载完成和加载失败的方法里调用  [self.progressView endLoadingAnimation];
5、webViewDidStartLoad方法调用[self.progressView startLoadingAnimation];
