Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615319;
	b=zkB0EYMO3e1vqjZWlg+F1RiAAIWzckUR57cXIrNk7RebsWP+YKE82zl2itCxjjpRJp5E
	 HfwG6DxkGCYPzI2IMj/0qW2W5RCDupfxA+yxDgFGtkF3EIG7D8neQN1XSLxaX/n8Wr090
	 3GwkqjkB7clftHi6wSXrV2I6VWur6hezXNB5ZgWzW+Ujrmh/3Ld6C1jdPlOY6pbwUxyH0
	 DdoRW81xGGSp+OrTfOXkMYRqojyNidq784vjB3QkAK1O3W7rYdbYUeF/JqtU2OSVRItMH
	 8WGEYVBtyNqBoW1UfGohSK+loHvi+cvqWBf1KsZTGZIrS+mKugzOrgOsxChqtqGS9zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615319;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fJM+8VYiKunDlqrEgZNiUmhDi25LVlsUi9ngP7vcUpE=;
	b=MR2fHNesncZJoRMbdKxwF8Vnah7BWpq1ljpRVmap/VI3/7PNuEZBPt4n8YNeO2dGfHe8
	 Xuv9d7NULmjk4ilTQExo2YL/X2Z1lrNgypwDnPuApVOssemfFhioN5GVDbjoDI6ZtYsyT
	 rfX1PALAmZAQtAvcbmp+//9xpv33FFrUgB/NUCE3l6b2cVry30uynZUkNLrYaEnATIhUd
	 dPkJo3TRNi0ei45eqZasD+uwTqG0pPLPtmEYMGmFX/NwSgE0W62FKtiWtWMLXVzbxUJoO
	 OAZKQHeNLKBZiHSoTAuzYiBu+yibdtOJGaMBi3gg7ZaBJMSkFokCZkbZ1hzcOY/FBvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mmw3a4X8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C4B606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C4B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mmw3a4X8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17B431762;
	Wed, 25 Nov 2026 06:01:55 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AC373F86F;
	Wed, 25 Nov 2026 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615317; bh=QXNjIvjxmoOqxBNbeshCfrCK90NGNd17TBaU3oKqyns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mmw3a4X8n1OOB+tRfnOGaB0Pg8jLA6Gk5cgrgdSuF+upYhLmf8HbTTBkC1HK5WrnO
	 0ve8KylB00bgcXt0fIjpUjrdRbVPVP3F22AZzFfO73g2FPIc6BKTmMUAKXV7bnmfWy
	 Bu45MO8uOOdPoSRBFZJkdULlazwbMclnBIeYoiz4=
Message-ID: <aa7d7e97-c0b1-42d4-b885-694195edf46e@arm.com>
Date: Wed, 25 Nov 2026 14:01:55 +0000
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
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
 <av7PQ4iniwWC9goF@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <av7PQ4iniwWC9goF@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 10:28, Lorenzo Pieralisi wrote:
> On Wed, Nov 18, 2026 at 05:35:41PM +0000, Sascha Bischoff wrote:
>> Device registration publishes a DTE pointing to the new ITT before
>> invalidating the ITS device cache. If invalidation times out, clearing
>> the DTE in memory does not guarantee that the ITS has discarded a
>> cached reference to the ITT, and hence the hardware could still try
>> and access the memory. Freeing the ITT on that path can therefore
>> leave the ITS accessing memory that has been reallocated.
>>
>> Device teardown has the same problem: it frees the ITT even when the
>> invalidation issued after clearing the DTE fails to complete in the
>> specified timeout.
>>
>> Retain the ITT on either failure path. Continue returning the
>> invalidation error, and free the ITT during teardown only after
>> successful completion. This deliberately retains memory on hardware
>> failure because a timeout does not cancel the operation or establish
>> that cached references are gone.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index db13011ef6d93..cfa86aa68bf3c 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -540,8 +540,8 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
>>   
>>   	ret = gicv5_its_device_cache_inv(its, its_dev);
>>   	if (ret) {
>> +		/* The ITS may still have a cached reference to the ITT. */
>>   		its_write_table_entry(its, dte, 0);
>> -		gicv5_its_free_itt(its_dev);
>>   		return ret;
>>   	}
>>   
>> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>>   	its_write_table_entry(its, dte, 0);
>>   
>>   	ret = gicv5_its_device_cache_inv(its, its_dev);
>> -	gicv5_its_free_itt(its_dev);
>> +	/* Only release the ITT once the ITS has discarded its references. */
>> +	if (!ret)
>> +		gicv5_its_free_itt(its_dev);
> 
> 	if (ret)
> 		return ret;
> 	
> 	gicv5_its_free_itt(its_dev);
> 
> 	return 0;

Done, thanks! Definitely neater.

> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
>>   
>>   	return ret;
>>   }
>>
>> -- 
>> 2.34.1
>>

