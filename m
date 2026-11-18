Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013944;
	b=JUNvQfCWzhVZgb2Wjfx7G3jdWUWUJX1l2oGZWp1s3kwp+j7h/RcIhJrtDYNPX9HrWKuZ
	 2rxmcOxM4++0cIvoSPRq+gmmVfvT9nhq2du4CxldUfWca23jtvmVHIYaS6KAIK0D/l3E/
	 UYQF6e7IVk+y4C+GEDI1fnaa3mQMFYoZCEZW/j5kbFOLfVsQ/JypmXDoScFYe8Uz7eh4O
	 goNuof+jrBHHrY0Az2YxbNY2W/AQ/0Xd+YyiqxsgdvLD2BCvBWp7LsScXl9O8SoYcMRBf
	 SFYW92ueQaBn4YOi12FzMcNhwxOFPUs0KJIqTujQwEk5shOP62Cig/RN1ZVDFeae4Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013944;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LxfGlX3yA/Us3CDMzz+HpVvK1bqzSpTaL9BUfwzylfY=;
	b=uoxAJSyqpzS3E5/e8DLUmRuvVhQEg+eqvXDyNFnFLHtT341yvtFM9OH8EfE9Tm05RC+S
	 CtYlYO93lNEBVP5NckxrXHgGZihMj3+Pici+2nmdykhKi8Jeli6hxCah5Ok6w6suIToGB
	 eBTFk4u5wNjzs+mJT9tyLPVa3B5Z0QD591YVni59bhQGZFrFtjVpwha69Rjd1axO0kYmq
	 SKs+SqHeX8NRqOvGFcqF2SKBRVLcAnAMOy61hQetWQ9r/alyh+gf96Yc/IuG1fZHUM40P
	 9zJnFb5+5F8rw5FVEbFvcoFp5LhkUYSCRGFuFutQHk6D9MhnmLIhhvjCf2GHKzDSHzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Gc/ngW12";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EAF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59EAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Gc/ngW12
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A901477;
	Wed, 18 Nov 2026 06:59:00 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CBE73F632;
	Wed, 18 Nov 2026 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795013943; bh=v8Zs0Zl1Hmpij2wJiNRNAEeU8j1Gx65Fpf1iqz5KS3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc/ngW12UV+79e1Q1NEoDMmgu0KtigomIpkWBDoAfGMcGepHfEIKq4YCNghlTJnMk
	 bbofUV5//MaXf2G7IDVMFwl5+XhCjdbOSVrPeLDWMdV8+WmR60eJJoNcg6Tz1/4F9u
	 Z2b4awSxSD7z9FXr9QgOKX73s85FVm8UDuRwyrNg=
Message-ID: <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
Date: Wed, 18 Nov 2026 14:58:59 +0000
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
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
 <avsN0E-6_7kU3pTk@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <avsN0E-6_7kU3pTk@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 16/11/2026 14:06, Lorenzo Pieralisi wrote:
> On Mon, Nov 16, 2026 at 01:28:56PM +0000, Fuad Tabba wrote:
>> Hi Lorenzo,
>>
>> On Mon, 16 Nov 2026 12:14:50 +0000, Lorenzo Pieralisi
>> <lpieralisi@kernel.org> wrote:
>> [...]
>>>> invalidate have the same shape. The question is, can an IRS miss the
>>>> poll, or is a timeout here only ever a dead IRS?
>>>
>>> Thank you for your patches Fuad.

Seconded. Thanks a lot.

I'm more than happy to include "irqchip/gic-v5: Clean a level 2 device 
table before making it valid" in v3!

>>>
>>> The latter, though freeing memory on timeout wasn't a good idea given
>>> that there is no way to cancel the respective, pending, mapping.
>>
>> Thanks, that answers it. If you'd like a patch that doesn't free the
>> memory on a timeout, let me know and I'll send one.
> 
> Thanks. Again, if that timeout expires I think we have more serious
> problems than the IST mapping but I do agree that freeing memory
> is not the answer; not urgent - please send a patch given that
> you spotted it, can obviously do it too.

I've got some patches addressing the ITT and IST mapping issues in the 
host driver, which I can include in v3 if you haven't already started 
working on these. I'll make sure to include the appropriate Reported-by 
tags, of course!

I'll post a fix for the VMT separately as it doesn't belong in this series.

> 
>>
>> [...]
>>>> Notes:
>>>>      Setting L1 on every invalidation turns each registration and
>>>>      teardown into a range invalidate, both rare paths, and keeps the
>>>>      function simple. Setting it only when registration allocates the
>>>>      level 2 table would miss a registration that fails after the
>>>>      allocation, which leaves the level 1 DTE valid.
>>>
>>> I can't follow. I agree that we have to invalidate the L1 DTE on
>>> L2 allocation but that's a one-off, I don't understand what issues
>>> you are pointing out in the Notes above, if you can point out please
>>> the code paths it refers to that'd help.
>>
>> gicv5_its_device_register() can fail after
>> gicv5_its_devtab_get_dte_ref() has made the L1 DTE valid, and before
>> the gicv5_its_device_cache_inv() at the end. That happens if the
>> EventID bits check fails, or the ITT allocation does. The L1 DTE is
>> then already valid for the next device registered under it, so that
>> registration doesn't allocate a level 2 table.
>>
>> The patch Notes were about setting ITS_INV_DEVICER.L1 in that
>> gicv5_its_device_cache_inv() call only when the registration allocated
>> the table. In that case the failed registration never reaches that
>> call and the next one reaches it with L1 clear, so this L1 DTE is
>> never invalidated. Invalidating in gicv5_its_alloc_l2_devtab(), right
>> after the L1 DTE write, is the one-off you describe. I'll rework the
>> patch to do that instead.
> 
> Yes, I think that's what we should do - invalidating in
> gicv5_its_alloc_l2_devtab() once for all and leave everything else as-is
> matches architecture guidelines.

Agreed. I've got a reworked fix for this too, which I can include in v3.

> 
> Thanks again.
> 
> Lorenzo

Thanks,
Sascha
