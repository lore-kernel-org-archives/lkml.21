Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615380;
	b=OOyH0OVWHanz/Acz0nlV0/Ut89y1Wz7Qu5UA983Bv6aEKmJzL9rQ9TkaVS6NUhJWhChA
	 rlu+BF8An2cvJ6CsDkXjlCX0PmG93N+IFildPzLFMjKfqJds0QJdLalgxCqH/JG2csX5c
	 b+usHYJsk+cTSkSb8qSU2SwDnt5XE8Z1/S2ChcxJCvu4WhMTwABWSm4FuG6HE6iOxeh+d
	 /qdDxh5v/e9hwEIcPHG41TcRQ87NnLv3ubzYFwiP23j5c7ZRb2i+/Mh8fF+DCx/GU8WbV
	 YQ3PD2YqtZYOjfyMOsxAgKlagH/Zi9jFJu6JJdGdQoDOY02pjBjtDcVqN7enc5ZT58g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615380;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cPVmlqwgTJ0+O2N7IsQoI4o+3+8lWMqd0l4ipgO2ro4=;
	b=3vlIZKM2F5lNuFcc+GiDLaxdXK2f0OLCNWq/7BM3zmJOGAmICCo4qALQ68z+PVppJb3S
	 wUScgzTOKbfkIdhqF2QcB1J2Zpa+yoVv0imYiYJ5DYKmffAQxPtqiZQoRs0bFZJZLtoAe
	 9ODpl998Ge+V9QChEPOJAyaeIb5wUOCvWPk8Yd3SF0yxTruJeRvGttw4fXmh9Ug2nzYgJ
	 e7OSZpJnPSnLddi7A3oIO3Vu+3yzLt9EzGFNMpIHNgqSWMguR12JUJ40AMVhSn+HzzxRe
	 B+67Ttqy7/azhTB7BZa7lYa9/eWnAEFzrE99sdH6p+Zk86svy8x7X5tMSt8KHnQUf5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O8JRYTGn;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42A4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E42A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O8JRYTGn
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68AC42F;
	Wed, 25 Nov 2026 06:02:56 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0C6E3F86F;
	Wed, 25 Nov 2026 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615379; bh=WeHxNZ3LfJfngdKcIainGtVtPJGUuJsc1UXxkRlYBss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8JRYTGnVTn/oO+6nGTmR5sMNtvJkSd2qivR77LZi7ITXReD0NSspVM0vn58xyUXV
	 NbdkJXWMO60UDqhjPBBvw+YnZoPe/17FT1Ari5LvEnK2IUT6Rsy+y8BvAtvvJqIh0Z
	 uiB2BUEPX0Cyb8ezvsVzxGpdEoWUTlmHN/zu6gSc=
Message-ID: <c92755e8-dc10-437d-b3fc-2b91be243263@arm.com>
Date: Wed, 25 Nov 2026 14:02:56 +0000
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
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
 <av7PQ4iniwWC9goF@red-moon>
 <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTwYexVk5tgHNorQVHwxLThT3nFzjYz50oYp=xhrd1LXDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 12:07, Fuad Tabba wrote:
> On Thu, 19 Nov 2026 10:28:19 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
>>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> [...]
>>> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>>>           its_write_table_entry(its, dte, 0);
>>>
>>>           ret = gicv5_its_device_cache_inv(its, its_dev);
>>> -        gicv5_its_free_itt(its_dev);
>>> +        /* Only release the ITT once the ITS has discarded its references. */
>>> +        if (!ret)
>>> +                gicv5_its_free_itt(its_dev);
>>
>>          if (ret)
>>                  return ret;
>>
>>          gicv5_its_free_itt(its_dev);
>>
>>          return 0;
> 
> In this error path and the one in gicv5_its_device_register(),
> kmemleak will report the retained ITT once the caller frees its_dev.
> Could you mark the ITT allocations with kmemleak_not_leak() on both
> paths, l2ptrs included for a two-level ITT?

I've added these, thanks.

> 
> With that added:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

