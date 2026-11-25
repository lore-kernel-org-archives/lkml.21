Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615512;
	b=FfSI45BNCF3oE2uj7EQm1Zj3Y4UtfjsnhDnEI3ZQL9obj9wC7+oDJcrh8gp8qH4maCqG
	 zhGcgLcQnvpPRomH4vjA2BlJiKbd5AYW8URHv09pJDe7k3BnIakV+Gj+NvUZtaPluTl5B
	 WwiL4SrZa5Ohpx59J6Cr4XIc976iMALODwwwaXbfkpO/cTKHktUweLcwH2KQfl+LjG+3Y
	 Qv3yDXtBxp6EabCiCcWdAscbdn/Mh4izsCc+1LrEEq0meq7KVDVgDoSSopxC5OC5tGF59
	 j1WZh6Xel889v1AQ6/c/sXDuFzL45nQdmIdU27S0HB3go8zmFxBZ5pJaa9G9vgWNzJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615512;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3xn7XOvqRGQp062kt4SoC4bvymXGqiOd0CVhQdPQDtU=;
	b=XQjTh8RIm4Tj+y1mpCSv4cPHLwbK7JYVieaHgQkkzB1MnBMwtwNBVzIgUKvyyrzONAlx
	 PT7tGCWJyBewzSm/oLnh1k/DE1Ryv7EDb5f7PkBj9hbCE2dE15nF7F/KXz04NRmVXrQET
	 pJ+iFrAV3emp9hoM8Y2IPL+VfKXPODNSbZpRimsh39/C1YMmrLL1bsosWIhFPix0kW8ab
	 0cRfrxaX+aOw3qpFl76TNWJ8PUXP7mSEp/3lQyjf8qyez5CjFDNRjXrcj0PG04zA0CiWo
	 66YC/XxL+Ol9Aq/bV94ai7N8ekSSmo/q53rYhmiKP+elvGer1PugKdM5v2e7MY8J2Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=etNidKf3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A344E606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A344E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=etNidKf3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 123B02F;
	Wed, 25 Nov 2026 06:05:08 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C90E3F763;
	Wed, 25 Nov 2026 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615510; bh=wv4DpItoGqi0fn0gKeBnK1tjCbn6KrXhLo/HFe6emE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etNidKf3e+2SeZxfTydvlyaB/4YB31GrJ7DT3xrzlrXfFwl7oCc4zjUqrDQGzY4fo
	 Y/KfksH6E/Zn1bqIEPS515C4p4CJKlvlJ0OXGVuiENEfpxv0zjWa5QvF7fro8mrhbp
	 EIvNG2VU4lWEVriVLLPy4ST3rK39/kNGorN6zWfY=
Message-ID: <2519eeee-9d47-4d9c-8d89-0f1c38780e98@arm.com>
Date: Wed, 25 Nov 2026 14:05:08 +0000
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
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
 <av7Ly_iLyiOAXQUR@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <av7Ly_iLyiOAXQUR@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 10:13, Lorenzo Pieralisi wrote:
> On Wed, Nov 18, 2026 at 05:35:43PM +0000, Sascha Bischoff wrote:
>> Allocating an L2 device table makes its parent L1 DTE valid, but the
>> single-device invalidation performed during device registration does
>> not invalidate that L1 DTE. An ITS that cached the L1 DTE while it was
>> invalid can therefore continue dropping events for DeviceIDs in its
>> range.
>>
>> Invalidate the L1 DTE and wait for completion immediately after
>> publishing the new L2 table. This also covers a registration that
>> subsequently fails, leaving the L2 table allocated and its parent L1
>> DTE valid. Keep single-device invalidations for device registration
>> and teardown when updating individual L2 DTEs.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> Cc: stable@vger.kernel.org
>> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 26 ++++++++++++++++++++------
>>   1 file changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index 7fff2db9ae08e..a05417bdd3a19 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -365,17 +365,17 @@ static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
>>   	return &l2_itt[l2_idx];
>>   }
>>   
>> -static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>> -				      struct gicv5_its_dev *its_dev)
>> +static int __gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>> +					u32 device_id, u8 event_id_bits, bool l1)
>>   {
>>   	u32 devicer;
>>   	u64 didr;
>>   
>> -	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
>> +	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, device_id);
>>   	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
>>   		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
>> -			     its_dev->itt_cfg.event_id_bits)	|
>> -		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
>> +			     event_id_bits)			|
>> +		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, l1);
>>   
>>   	guard(raw_spinlock_irqsave)(&its->inv_lock);
>>   
>> @@ -385,6 +385,19 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>>   	return gicv5_its_cache_sync(its);
>>   }
>>   
>> +static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>> +				      struct gicv5_its_dev *its_dev)
>> +{
>> +	return __gicv5_its_device_cache_inv(its, its_dev->device_id,
>> +					    its_dev->itt_cfg.event_id_bits, false);
>> +}
>> +
>> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
>> +					 u32 device_id)
>> +{
>> +	return __gicv5_its_device_cache_inv(its, device_id, 0, true);
> 
> I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
> let's explicitly say so).

Done - I've added a comment explaining this.

> 
>> +}
>> +
>>   /*
>>    * Allocate a level 2 device table entry, update L1 parent to reference it.
>>    * Only used for 2-level device tables, and it is called on demand.
>> @@ -424,7 +437,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>>   		FIELD_PREP(GICV5_DTL1E_VALID, 0x1);
>>   	its_write_table_entry(its, &l1devtab[l1_index], l1dte);
>>   
>> -	return 0;
>> +	/* Invalidate the cached L1 DTE before using the new L2 table. */
> 
> Nit: it is not a given that it is cached.

I've reworked this comment.

> 
>> +	return gicv5_its_device_l1_cache_inv(its, l1_index << l2_bits);
> 
> Nit: this l1/l2/deviceid bits/index dance is a bit clumsy (I mean, in
> current code, without taking into account this patch) but we can rework it
> in a follow-up patch to keep this one as simple as possible.

I've left this as is for now. I think it would be good to tidy that up 
at some point, but it isn't worth dragging that into this seres.

> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
>>   }
>>   
>>   static __le64 *gicv5_its_devtab_get_dte_ref(struct gicv5_its_chip_data *its,
>>
>> -- 
>> 2.34.1
>>

Thanks,
Sascha

