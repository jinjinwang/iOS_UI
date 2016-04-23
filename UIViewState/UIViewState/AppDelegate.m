//
//  AppDelegate.m
//  UIViewState
//
//  Created by 王金金 on 15/10/9.
//  Copyright (c) 2015年 王金金. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"did finish launching...");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"did enter background...");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"will enter foreground...");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"did become active...");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"will terminate...");
}

/**
 *  该方法在应用退出时调用, 负责控制是否允许保存状态
 *
 *  @param application <#application description#>
 *  @param coder       <#coder description#>
 *
 *  @return <#return value description#>
 */
- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder{
    NSLog(@"save state...");
    return YES;
}

/**
 *  该方法在应用启动时调用, 负责控制是否恢复上次退出时的状态
 *
 *  @param application <#application description#>
 *  @param coder       <#coder description#>
 *
 *  @return <#return value description#>
 */
- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder{
    NSLog(@"restore state...");
    return YES;
}

/**
 *  该方法在保存时调用, 实现UI状态或数据的保存
 *
 *  @param application <#application description#>
 *  @param coder       <#coder description#>
 */
- (void) application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder{
    NSLog(@"will encode restorable state...");
    [coder encodeFloat:2.0 forKey:@"version"];
}

/**
 *  该方法在恢复时调用, 实现UI状态或数据的恢复
 *
 *  @param application <#application description#>
 *  @param coder       <#coder description#>
 */
- (void) application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder{
    NSLog(@"did decode restorable state...");
    float lastVersion = [coder decodeFloatForKey:@"version"];
    NSLog(@"lastVersion: %f", lastVersion);
}


@end
