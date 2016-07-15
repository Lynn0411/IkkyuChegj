//
//  HttpRequestManager.m
//  IkkyuChegj
//
//  Created by 石家庄盛航 on 16/7/11.
//  Copyright © 2016年 sjzshtx. All rights reserved.
//

#import "HttpRequestManager.h"

@implementation HttpRequestManager
+ (instancetype)shareInstance
{
    static  HttpRequestManager   *manager = nil;
    static  dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        manager =[[HttpRequestManager alloc]init];
    });
    
    return manager;
}
// post 请求
+ (void)HttpPostCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    [manager POST:Url parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success (responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        failure (error);
    }];
}
// get  请求
+ (void)HttpGetCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    [manager GET:Url parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];

}
+ (void)HttpGetCallack:(NSString *)Url Parameters:(NSDictionary *)dict headers:(NSDictionary *)headDict success:(httpSuccess)success failure:(httpFailure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    [manager GET:Url parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        failure(error);
    }];
   /* [manager GET:Url parameters:dict headers:headDict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    */
}

@end
