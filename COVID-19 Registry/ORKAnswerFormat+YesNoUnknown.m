// SPDX-License-Identifier: CC0-1.0

#import "ORKAnswerFormat+YesNoUnknown.h"

@implementation ORKAnswerFormat (YesNoUnknown)

+ (ORKAnswerFormat *)yesNoUnknown
{
	NSMutableArray<ORKTextChoice *> *choices = [NSMutableArray new];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Yes", @"") value:@"Yes"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"No", @"") value:@"No"]];
	[choices addObject:[ORKTextChoice choiceWithText:NSLocalizedString(@"Unknown", @"") value:@"Unknown"]];

	return ([ORKAnswerFormat choiceAnswerFormatWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:choices]);
}

@end
