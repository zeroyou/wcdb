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

#include <WCDB/Core.h>

namespace WCDB {

std::shared_ptr<ConfiguredHandle>
ConfiguredHandle::configuredHandle(const std::shared_ptr<Handle> &handle)
{
    if (handle) {
        return std::shared_ptr<ConfiguredHandle>(new ConfiguredHandle(handle));
    }
    return nullptr;
}

ConfiguredHandle::ConfiguredHandle(const std::shared_ptr<Handle> &handle)
    : m_handle(handle)
{
}

bool ConfiguredHandle::configured(
    const std::shared_ptr<const Configs> &configs) const
{
    return m_configs->equal(configs);
}

bool ConfiguredHandle::configure(const std::shared_ptr<const Configs> &configs)
{
    if (configs->invoke(m_handle.get())) {
        m_configs = configs;
        return true;
    }
    return false;
}

Handle *ConfiguredHandle::getHandle() const
{
    return m_handle.get();
}

} //namespace WCDB