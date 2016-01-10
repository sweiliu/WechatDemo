//
//  AppDelegate.m
//  WeChat
//
//  Created by apple on 12/20/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "AppDelegate.h"
#import "MeViewController.h"
#import "DiscoverViewContriller.h"
#import "ChatsViewController.h"
#import "ContacksViewContriller.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:16.f]
                           };
    [[UINavigationBar appearance] setTitleTextAttributes:dict];
    [[UINavigationBar appearance] setBarTintColor:
    [UIColor colorWithRed:0x36 / 255.0f green:0x36 / 255.0f blue:0x3b / 255.0f alpha:1.0f]
     ];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    Me *me = [[Me alloc]init];
    me.title = @"Me";
    me.tabBarItem.title = @"Me";
    me.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_meHL"];
    UINavigationController *meVC = [[UINavigationController alloc]initWithRootViewController:me];
    
    Discover *discover = [[Discover alloc]init];
    discover.title = @"Discover";
    discover.tabBarItem.title = @"Discover";
    discover.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discoverHL-1"];
    discover.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    UINavigationController *discoverVC = [[UINavigationController alloc]initWithRootViewController:discover];
    
    
    Chats *chats = [[Chats alloc]init];
    chats.title = @"WeChat";
    chats.tabBarItem.title = @"Chats";
    chats.tabBarItem.image = [UIImage imageNamed:@"chats"];
    chats.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];
    UINavigationController *chatsVC = [[UINavigationController alloc]initWithRootViewController:chats];
    
    ContacksViewContriller *contacks = [[ContacksViewContriller alloc]init];
    contacks.title = @"Contacks";
    contacks.tabBarItem.title = @"Contacks";
    contacks.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    contacks.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_contactsHL"];
    UINavigationController *contacksVC = [[UINavigationController alloc]initWithRootViewController:contacks];
    
    
    
    UITabBarController *weChats = [[UITabBarController alloc]init];
    weChats.viewControllers = @[chatsVC,contacksVC,discoverVC,meVC];
    
    weChats.selectedIndex = 0;
    
    self.window.rootViewController = weChats;
    
    [self.window makeKeyAndVisible];
    
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
