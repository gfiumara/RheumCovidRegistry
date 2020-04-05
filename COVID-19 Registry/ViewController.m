// SPDX-License-Identifier: CC0-1.0

@import SafariServices;
@import ResearchKit;

#import "RCRRegistryEntryTask.h"

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

typedef NS_ENUM(NSInteger, RCRMainScreenTableViewSection)
{
	RCRMainScreenTableViewSectionRegistry,
	RCRMainScreenTableViewSectionOther,

	RCRMainScreenTableViewNumberOfSections
};

typedef NS_ENUM(NSInteger, RCRMainScreenTableViewRegistrySectionItems)
{
	RCRMainScreenTableViewRegistrySectionItemAdult,
	RCRMainScreenTableViewRegistrySectionItemPediatric,

	RCRMainScreenTableViewRegistrySectionNumberOfItems
};

typedef NS_ENUM(NSInteger, RCRMainScreenTableViewOtherSectionItems)
{
	RCRMainScreenTableViewOtherSectionItemIRB,
	RCRMainScreenTableViewOtherSectionItemAboutGRA,
	RCRMainScreenTableViewOtherSectionItemAcknowledgements,

	RCRMainScreenTableViewOtherSectionNumberOfItems
};

@end

@implementation ViewController

#pragma mark - Survey Delegate

- (void)taskViewController:(nonnull ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(nullable NSError *)error
{
	[taskViewController dismissViewControllerAnimated:YES completion:nil];
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - Actions

- (void)startNewAdultEntry
{
	ORKTaskViewController *taskViewController = [[ORKTaskViewController alloc] initWithTask:[RCRRegistryEntryTask new] taskRunUUID:nil];
	taskViewController.delegate = self;
	[self presentViewController:taskViewController animated:YES completion:nil];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	switch ((RCRMainScreenTableViewSection)section) {
		case RCRMainScreenTableViewSectionRegistry:
			return (RCRMainScreenTableViewRegistrySectionNumberOfItems);
		case RCRMainScreenTableViewSectionOther:
			return (RCRMainScreenTableViewOtherSectionNumberOfItems);
		case RCRMainScreenTableViewNumberOfSections:
			return (0);
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return (RCRMainScreenTableViewNumberOfSections);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	switch ((RCRMainScreenTableViewSection)section) {
		case RCRMainScreenTableViewSectionRegistry:
			return (NSLocalizedString(@"Registries", @""));
		case RCRMainScreenTableViewSectionOther:
			return (NSLocalizedString(@"Information", @""));
		case RCRMainScreenTableViewNumberOfSections:
			return (nil);
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *defaultCellReuseIdentifier = @"defaultCellReuseIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:defaultCellReuseIdentifier];
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:defaultCellReuseIdentifier];

	// Reset all
	cell.textLabel.text = nil;
	cell.textLabel.numberOfLines = 1;
	cell.detailTextLabel.text = nil;
	cell.accessoryType = UITableViewCellAccessoryNone;

	switch ((RCRMainScreenTableViewSection)indexPath.section) {
		case RCRMainScreenTableViewSectionRegistry:
			switch ((RCRMainScreenTableViewRegistrySectionItems)indexPath.row) {
				case RCRMainScreenTableViewRegistrySectionItemAdult:
					cell.textLabel.text = NSLocalizedString(@"New Adult Registry Entry", nil);
					cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
					break;
				case RCRMainScreenTableViewRegistrySectionItemPediatric:
					cell.textLabel.text = NSLocalizedString(@"New Pediatric Registry Entry", nil);
					cell.detailTextLabel.text = @"Coming soon";
					break;
				case RCRMainScreenTableViewRegistrySectionNumberOfItems:
					break;
			}
			break;
		case RCRMainScreenTableViewSectionOther:
			switch ((RCRMainScreenTableViewOtherSectionItems)indexPath.row) {
				case RCRMainScreenTableViewOtherSectionItemIRB:
					cell.textLabel.text = NSLocalizedString(@"IRB Information", nil);
					cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
					break;
				case RCRMainScreenTableViewOtherSectionItemAboutGRA:
					cell.textLabel.text = NSLocalizedString(@"About the Global Rheumatology Alliance", nil);
					cell.textLabel.numberOfLines = 0;
					cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

					break;
				case RCRMainScreenTableViewOtherSectionItemAcknowledgements:
					cell.textLabel.text = NSLocalizedString(@"About C-19 Registry App", nil);
					cell.detailTextLabel.text = @"Coming soon";
					break;
				case RCRMainScreenTableViewOtherSectionNumberOfItems:
					break;
			}
			break;
		case RCRMainScreenTableViewNumberOfSections:
			break;
	}

	return (cell);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch ((RCRMainScreenTableViewSection)indexPath.section) {
		case RCRMainScreenTableViewSectionRegistry:
			switch ((RCRMainScreenTableViewRegistrySectionItems)indexPath.row) {
				case RCRMainScreenTableViewRegistrySectionItemAdult:
					[self startNewAdultEntry];
					break;
				case RCRMainScreenTableViewRegistrySectionItemPediatric: {
					UIAlertController *notYetImplementedAlert = [UIAlertController alertControllerWithTitle:@"Not Implemented" message:@"This feature has not yet been implemented." preferredStyle:UIAlertControllerStyleAlert];
					[notYetImplementedAlert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Okay", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {[tableView deselectRowAtIndexPath:indexPath animated:YES];}]];
					[self presentViewController:notYetImplementedAlert animated:YES completion:nil];
					break;
				}
				case RCRMainScreenTableViewRegistrySectionNumberOfItems:
					break;
			}
			break;
		case RCRMainScreenTableViewSectionOther:
			switch ((RCRMainScreenTableViewOtherSectionItems)indexPath.row) {
				case RCRMainScreenTableViewOtherSectionItemIRB: {
					SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://rheum-covid.org/irb/"]];
					svc.delegate = self;
					[self presentViewController:svc animated:YES completion:nil];
					break;
				}
				case RCRMainScreenTableViewOtherSectionItemAboutGRA: {
					SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://rheum-covid.org/about/"]];
					svc.delegate = self;
					[self presentViewController:svc animated:YES completion:nil];
					break;
				}
				case RCRMainScreenTableViewOtherSectionItemAcknowledgements: {
					UIAlertController *notYetImplementedAlert = [UIAlertController alertControllerWithTitle:@"Not Implemented" message:@"This feature has not yet been implemented." preferredStyle:UIAlertControllerStyleAlert];
					[notYetImplementedAlert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Okay", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {[tableView deselectRowAtIndexPath:indexPath animated:YES];}]];
					[self presentViewController:notYetImplementedAlert animated:YES completion:nil];
					break;
				}
				case RCRMainScreenTableViewOtherSectionNumberOfItems:
					break;
			}
			break;
		case RCRMainScreenTableViewNumberOfSections:
			break;
	}
}

#pragma mark - SFSafariViewControllerDelegate

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

@end
