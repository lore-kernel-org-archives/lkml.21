Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054373;
	b=JE+UUYd1H0WfjVzZ/eOt0yLX9pIn5SHXHP1XW/EY0dZzr9kusDwZmAE6jqeaGhUYsdkU
	 IcPr1hMrGLEYxZzTuLu5uFa26NT9JEzz04LKrIfAb0m4mWrTsa18AoM6kXnrdelLXsNxA
	 vtd6FxqpyBKw8bd0iuW8AqvzDWiGkoLtjGd2udYSefJtQtXbrJ642zgF0DDgfHFyV0nsr
	 sLfViIaEgiU+dQqPHeOMAhmwe2BJXBWpNAkkPBLKOxpa82cGMwfg1kG3sHLocq3Otjdo/
	 a88l0b8KuEUJQXFezbMSYn7oP/92U4ZHg5B7MlrMsrjzD4DPJvc5NxxmUgqJZVT7DQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054373;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=LdwEIwLifh+sAIGjLJdI1Wj6PaOuPDMg1EG7g0SXMS0=;
	b=sSfiPvBOhebt0qFEtfdHf5CqC+5ZLSNjy84R+6qu7F+Rt1KhNFz00N7isHe8dhZyBWXr
	 li0/l8wQZh0KKGQq6G9pqRjk3O/nF5Nt80c2oqlQKXOpj3MmJXtNQmEVKTHmrmOt4lw4e
	 jAGarCeNih+2509uupZV8ROSH7N7E/y83tHI0u8RihNnIydfUR65/tPsbbBR2Vx9DTiMM
	 uBTxUHLtkuBTLXivuUS4U2BpNC+CehnxJre5V9YPXh9QZ0jyom83Bg7ha05rWE19eKiFy
	 8G+OlvGMEZIIVVAMY3EmjK5r2m9SiHxEjwx7KoUXWZ91+OhH3Luvurvof5oSJcIJ8pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qYzcfOL8;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D2606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 010D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qYzcfOL8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LdwEIwLifh+sAIGjLJdI1Wj6PaOuPDMg1EG7g0SXMS0=;
	b=qYzcfOL8cS+9wEBP5gFBKaokzUNWumW0LIO97cSlqaKaEae/71x3mYYBsS9nxjWg6yA8PbgsR
	wbaYHMvp6kD6r4FJZsMjPdqDQnpX7WX3X+CgqWK4hZKr5xRWYRmc2k5LxfEm6L2X2dEH9bwy9Ir
	oqdzQjkc/j+y9gd8i/GbyZ0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jVMRw5nhnz1K97K;
	Thu, 19 Nov 2026 10:12:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DAAB24056C;
	Thu, 19 Nov 2026 10:12:42 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 10:12:41 +0800
Message-ID: <a39016a0-4b0a-498c-980f-27e98fcd9725@huawei.com>
Date: Thu, 19 Nov 2026 10:12:41 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs/resctrl: Give a monitor domain the counters the
 groups already use
To: Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	<james.morse@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <will@kernel.org>,
	<jic23@kernel.org>, <gshan@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-3-ruanjinjie@huawei.com>
 <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
 <bba48893-f71f-4168-8948-1d37cf59b3d5@huawei.com>
 <0e3716c3-c537-4f5c-a6a9-3272908b8e86@amd.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0e3716c3-c537-4f5c-a6a9-3272908b8e86@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/18 23:57, Babu Moger 写道:
> Hi Jinjie,

Hi Babu,

> 
> On 11/15/26 22:02, Jinjie Ruan wrote:
>>
>>
>> 在 2026/11/14 0:14, Ben Horgan 写道:
>>> Hi Jinjie,
>>
>> Hi Ben,
>>
>>>
>>> On 13/11/2026 08:35, tizi4590 wrote:
>>>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>
>>>> With assignable MBM counters, resctrl can be mounted while all CPUs of
>>>> a monitor domain go offline and one of them comes back, either through
>>>> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
>>>> domain is destroyed and re-created, and the new domain starts with no
>>>> counters assigned. Counters are otherwise only assigned when a group is
>>>> created, when rdtgroup_assign_cntrs() takes a free counter in each
>>>> monitor domain for each MBM event, so no code revisits the groups that
>>>> already exist.
>>>>
>>>> Those groups read "Unassigned" on the new domain, on any system with
>>>> assignable MBM counters. A counter assigned to them later through
>>>> mbm_L3_assignments is the lowest free one in that domain, so the same
>>>> group can end up with a different counter ID on different domains. For
>>>> example, with the counter ID each group uses for mbm_total_bytes and
>>>> "_" for none:
>>>>
>>>>                                 domain 0         domain 1
>>>>    mount, mkdir g1              default=0 g1=1   default=0 g1=1
>>>>    all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>>>>    one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>>>>    assign g1 on domain 1        default=0 g1=1   default=_ g1=0
>>>>
>>>> Each domain has its own counters, so g1 can use counter 0 on domain 1
>>>> and counter 1 on domain 0 without affecting the other domain, but until
>>>> it is assigned on domain 1 it reads Unassigned there.
>>>
>>> I brought this up before and it was assessed that no change was
>>> required:
>>> https://lore.kernel.org/lkml/171f92a3-fa2e-44fb-
>>> b0d1-1250c72e31d1@amd.com/
>>>
>>> Do you have any particular reason for wanting this behaviour?
>>
>> I discovered this issue during the testing process and feel it is not
>> very reasonable.
>>
>> This patch doesn't assign anything new - it only restores the counter ID
>> the group already uses on a domain that stayed online.
>>
>> So with the patch, Babu's two cases (`2=e;3=e` and `2=_;3=e`) both come
>> back exactly as they were. The only case it can't know is a group that
>> used a different ID on the domain that went away, and there it leaves
>> the event unassigned rather than guessing.
> 
> I see this patch is trying to address two separate issues:
> 
> 1. Automatically assigning counters when a domain comes online
> 
> I understand the motivation here. It is reasonable to expect counters to
> be assigned when a monitor domain comes online and counters are
> available. However, monitor domain online/offline events are typically

Yes, there was originally a counter available, and after the domain
going offline and coming back online, users still expect it to be available.

> driven by CPU hotplug, hibernation, or other user-initiated actions. In

I agree

> these cases, the user is generally aware of the state transition and can
> explicitly assign counters after the domain is online if monitoring is
> required.

If the power management daemon triggers the sleep mode and no process
with the resctrl permission is involved, the existing monitoring group
in the newly created domain will remain in the unassigned state, causing
the monitoring data to be interrupted.

> 
> 2. Retaining the same counter ID across domains
> 
> I do not see why this is necessary. The design of assignable MBM
> counters intentionally treats counters as domain-local resources and
> provides flexibility to maximize counter availability across groups.
> Counter IDs are an implementation detail and are not visible to users. A

While fixing the issues related to mpam (the first patch), I also
realized that counters are in-domain resources. I believe this point was
intended to address the mpam issues in the first patch, but it is indeed
unnecessary.

> group using a different counter ID in another domain does not affect
> functionality or monitoring results. Therefore, I do not see a strong
> justification for preserving the same counter ID when a domain is
> recreated. Given the above, I am not convinced the added complexity is
> justified.
> 
> Thanks,
> 
> Babu

