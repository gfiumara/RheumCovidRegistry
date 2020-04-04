// SPDX-License-Identifier: CC0-1.0

@import ResearchKit;

#import "RCRRegistryEntryTask.h"

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)getStartedPressed:(id)sender
{
	ORKTaskViewController *taskViewController = [[ORKTaskViewController alloc] initWithTask:[RCRRegistryEntryTask new] taskRunUUID:nil];
	taskViewController.delegate = self;
	[self presentViewController:taskViewController animated:YES completion:nil];
}

- (void)taskViewController:(nonnull ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(nullable NSError *)error
{
	[taskViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
