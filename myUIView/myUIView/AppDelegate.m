//
//  AppDelegate.m
//  myUIView
//
//  Created by 王金金 on 15/9/25.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 建画框
    UIWindow *window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // UIWindow *window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] aplicationFrame]] autorelease];
    
    //自己测试一下 bounds与aplicationFrame的区别
    CGRect bound = [[UIScreen mainScreen]bounds];
    NSLog(@"boundwidth:%f    boundheight:%f ",bound.size.width, bound.size.height);
    NSLog(@"boundx:%f    boundy:%f ",bound.origin.x, bound.origin.y);
    
    CGRect appBound = [[UIScreen mainScreen]applicationFrame];
    NSLog(@"appBoundwidth:%f appBoundheight:%f " ,appBound.size.width,appBound.size.height);
    NSLog(@"appBoundx:%f    appBoundy:%f ",appBound.origin.x, appBound.origin.y);
    
    //画第一块画布然涂成蓝色，大小是320 X 100
    CGRect CGone = CGRectMake(0.0, 0.0, 320, 100);//画个矩形，初始化位置与大小
    
    UIView *v_one = [[UIView alloc]initWithFrame:CGone];//初始化view
    
    v_one.backgroundColor = [UIColor blueColor];// 涂成蓝色
    
    [self.window addSubview:v_one];//直接加到画框上
    
    //第二块注意它的位置
    CGRect CGtwo = CGRectMake(0.0, 100, 160, 100);//画个矩形、初始化位置与大小
    
    UIView *v_two = [[UIView alloc]initWithFrame:CGtwo];//初始化view
    v_two.backgroundColor = [UIColor redColor];//涂成红色
    
    [self.window addSubview:v_two];//叠加到画框
    
    //第三块注意他的位置
    CGRect CGthree = CGRectMake(160, 100, 160, 100);
    UIView *v_three = [[UIView alloc]initWithFrame:CGthree];
    v_three.backgroundColor = [UIColor greenColor];
    [self.window addSubview:v_three];
    
    //第四块注意它的位置
    CGRect CGfour = CGRectMake(0.0, 260, 320, 200);
    UIView *v_four = [[UIView alloc]initWithFrame:CGfour];
    v_four.backgroundColor = [UIColor orangeColor];
    [self.window addSubview:v_four];//
    //第五块，计算一下它的位置，看看它的效果，
    //你可以让试一下把这段代码移到第一快初始化的上面试试，会有意想不到的效果
    CGRect CGfive = CGRectMake(100, 150, 160, 200);
    UIView *v_five = [[UIView alloc]initWithFrame:CGfive];
    v_five.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:v_five];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    //最后记得release
    [v_one  release];
    [v_two  release];
    [v_three  release];
    [v_four  release];
    [v_five  release];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
