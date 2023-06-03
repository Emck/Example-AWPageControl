//
//  AppDelegate.m
//  ExampleAWPageControl
//
//  Created by Emck on 2023/6/3.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    AWPageControl *pageControl;
    @try {
        pageControl = [[AWPageControl alloc] initWithParentViewSize:self.window.contentView.frame.size Data:@[[NSNumber numberWithInt:AWPCStyleBottom], @50, [NSColor windowBackgroundColor]]];
        [pageControl customButton:AWPCButtonLeft   Button:@[@86, @22, @"Previous", [NSColor blackColor], [NSColor whiteColor]]];
        [pageControl customButton:AWPCButtonRight  Button:@[@86, @22, @"Next",     [NSColor whiteColor], [NSColor systemBrownColor]]];
        [pageControl customButton:AWPCButtonEnding Button:@[@86, @22, @"Close",    [NSColor whiteColor], [NSColor systemTealColor]]];
        [pageControl setDelegate:self];                     // receive Event
        [pageControl setTotalPages:2];                      // total pages
        [self.window.contentView addSubview:pageControl];   // add view
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        pageControl = nil;
    }
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

#pragma mark - AWPageControl Delegate

// did Will Select Page
- (void)pageControl:(AWPageControl *)pageControl didWillSelectPageAtIndex:(NSInteger)index {
    NSLog(@"didWillSelectPageAtIndex %ld",index);
}

// did Select Page
- (void)pageControl:(AWPageControl *)pageControl didSelectPageAtIndex:(NSInteger)index {
    NSLog(@"didSelectPageAtIndex %ld",index);
}

// did Click Ending Button
- (void)pageControl:(AWPageControl *)pageControl didClickEndingButton:(id)sender {
    NSLog(@"didClickEndingButton");
}

@end
