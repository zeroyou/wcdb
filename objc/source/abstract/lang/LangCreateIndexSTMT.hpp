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

#ifndef LangCreateIndexSTMT_hpp
#define LangCreateIndexSTMT_hpp

#include <WCDB/LangCommon.h>

namespace WCDB {

namespace Lang {

class CreateIndexSTMT : public STMT {
public:
    CreateIndexSTMT();

    bool unique;
    bool ifNotExists;
    CopyOnWriteString schemaName;
    CopyOnWriteString indexName;
    CopyOnWriteString tableName;
    CopyOnWriteLazyLangList<IndexedColumn> indexedColumns;
    CopyOnWriteLazyLang<Expr> expr;

    CopyOnWriteString SQL() const override;

    STMT::Type getSTMTType() const override;
    static STMT::Type getType();
};

} // namespace Lang

} // namespace WCDB

#endif /* LangCreateIndexSTMT_hpp */