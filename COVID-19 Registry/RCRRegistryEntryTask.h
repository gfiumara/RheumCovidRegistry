//
//  RCRRegistryEntryTask.h
//  COVID-19 Registry
//
//  Created by Fiumara, Gregory (Fed) on 4/2/20.
//

@import ResearchKit;

#import "RCRSteps.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCRRegistryEntryTask : ORKOrderedTask

+ (instancetype)new;
- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
