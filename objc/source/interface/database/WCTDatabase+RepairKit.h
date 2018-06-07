/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <WCDB/WCTDatabase.h>

typedef BOOL (^WCTBackupFilterBlock)(NSString *_Nonnull);
typedef BOOL (^WCTRetrieveProgressUpdateBlock)(double, double);

@interface WCTDatabase (RepairKit)

NS_ASSUME_NONNULL_BEGIN

- (void)filterBackup:(WCTBackupFilterBlock)tableShouldBeBackedUp;

- (BOOL)deposit;

- (BOOL)backup;

- (double)retrieve:(WCTRetrieveProgressUpdateBlock)onProgressUpdate;

- (BOOL)removeFactory;

@end

NS_ASSUME_NONNULL_END