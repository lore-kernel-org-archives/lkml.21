Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615199;
	b=bcXQ3NvbDw4g+7Ui9BtFqhoMGXZspWq8hMtjrsX5iT1kc/nLFKfaNM+sCenUU5N5qSDO
	 bcVELgQDbf6O3J3iZamaNTjD45kjpw/56paHLT0/8uCQyIkC7PURQwRbtREOpWPQVKdS2
	 nmDoaTA/vkVpnEjXpT0PAh+Pzn5+/je+ucEaQ2DOLK5/a1E1z3CRNNSWgeeKZPaApmhAn
	 WOMHWSyTerxKjogD7NM8M1TGq3wqvOo5LYKu1T3WALFAdNNfNTS9GQYkd/IPXVIei4Rc8
	 KRb/1m4MYlAURvMvcxjLmMXqb4g/cr8WD0Tf9lFCe/vgG6DzM9XA3xh9ZqXUkvh4Nyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615199;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0zUWahZr0YdCEVMjMfy4fsnGVmWimdEhGip8c1MJYpI=;
	b=J/cUQuIfYCImhUDY+Eh4gX45W3bYQeIbFgg1J8A6zC3qm5H5Ee6OWkSsYUOuaF2U1lol
	 Q43ECuLylLXLAXvmL1kB3aQGXeXllPi2wOA/+qKvrD72sZ/wsAAT/wOK0ugzBw6JooXs+
	 prn4opeNfpO4TLy6Ds/Q1wuCssJaUL0YZvlvOsMVYPQsB21t8JPfCf+96Ht037lxns2uc
	 i/jRNdr42jJYBPVIXfD5TKktWB1ijC4nmL+99Rj5UbBiZ7+3aIwfl9whklFyF/8MuzzKN
	 XUFBW8vQgeU4Zfu/GENrbMcQ3eaUzYiXbnlSd00J7AK83t5BaozvF8l61IRNxuwA3NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ET4I9JGJ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAC4606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAC4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ET4I9JGJ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FB841762;
	Wed, 25 Nov 2026 05:59:55 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE6103F86F;
	Wed, 25 Nov 2026 05:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615198; bh=bsLN2zzvymscrQHAuMrvXPUOAQSGsQuczkfJ5hFWo9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ET4I9JGJD337mnXpzb5wfJxyJRF+o3Kb66rSUf3nGDH94OAu4LVIDmMUYQ8Djy9mU
	 43V16/0lZ81btAF6WVLQKSCbwm8Ch3yP+fDWRJzktEaXM4axvXFK0YbQNPFdrfLnji
	 r3QyQ2m03c8JtEB0lSS7/0eLJH+IijFcPUtHr/w8=
Message-ID: <5170b051-769e-4822-bb92-3739530c5f2a@arm.com>
Date: Wed, 25 Nov 2026 13:59:55 +0000
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
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
 <awXH-Is5s6eqx8mT@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <awXH-Is5s6eqx8mT@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lorenzo,

On 24/11/2026 17:23, Lorenzo Pieralisi wrote:
> On Thu, Nov 19, 2026 at 12:00:15PM +0000, Fuad Tabba wrote:
>> Hi Sascha,
>>
>> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
>> <sascha.bischoff@arm.com> wrote:
>> [...]
>>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
>> [...]
>>> @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>>>           if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
>>>                   return 0;
>>>
>>> +        /* A previous map timed out; do not overwrite its pending L1 entry. */
>>> +        if (READ_ONCE(l1ist[index]))
>>> +                return -EBUSY;
>>
>> Sashiko's review [1] didn't go on the list, in case you missed it.
>> Sashiko found that l1ist[index] is read twice, and that on a
>> non-coherent IRS a map completing after the timeout leaves a stale
>> copy of the L1 entry in the cache for later allocations. Invalidating
>> the entry before it's first read would fix the latter. Invalidating it
>> on the timeout path wouldn't, since a later read can refill the line
>> before the map completes.
>>
>> With those fixed:
>> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
>>
>> Cheers,
>> /fuad
>>
>> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com
> 
> Hi Sascha,
> 
> I am taking some time to revamp the current approach because as a fix
> it is getting complicated and there are corner cases that I don't think
> are fully covered.

Yeah, this is a bit of an awkward one to get right.

> 
> I suggest we drop this patch from this series for now so that it does
> not hold off the other patches that I believe are ready to be merged
> with very minor tweaks.

OK, noted. I've dropped this from the next version, so hopefully the 
rest can be merged in.

> 
> Thanks,
> Lorenzo

Thanks,
Sascha
