Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966622;
	b=ou3mVAEfU5ZiF8YIFKwn7UuCoUeZGfRAf5PUOB5E8oTBvJclXlJLsF2FoZ1DgIhZHLUR
	 7Hp4fsylkvmgGL1GdJdehxJpUSFoDJwzng6rLjUv2Rq+A1VtiV7WxiYguu3Cu39h+3MeM
	 0ELpLX2qqlEN0N8kQSVEyaml5nSMIKX0Y893fG1GrTMSZodgiasskqlY91rMYhpVXTYgz
	 PM2mEKYLGjuuEqsr08uymgh98cZXlpuhKqIHsxQwT4eVL5WjAoPTzs+Sw8GX8c45n4mKt
	 dWjvXrpLyd4KTv9pUT048QcfGnt6cYCdtrJYF2wHdRjHQyEXoZUGpIK5Vukhm6OeE4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966622;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=cQguqHcFqbJjXdDBuagz/NFuuGbr9y9vn96617/mc4g=;
	b=kp4DHA7qO/phW26QUi6Ev7YHBBsUNoBcbEOEdMlgEeev9gVjeE1LumfiBQKJI4s2pfAV
	 nayH1G5yy2TaTR5frHbF2ttG9fMN8aN8DMrredjLo2/KNjIYs1vZ2cmZvKELyJcZ9VP0o
	 vZQ0VID6Dtm1FnIo3ioxJr7axzMU/RHZNIvRVoYl5frZBJYt+6rD2hmkrJKxX8fTt0vRX
	 XOFnQ+omvCEiFVfTp4/cTH9TAw/wYY5WsYyBhEQMqT6jRLqgVyn4tKb/f1f4ewBZYnmr/
	 IxMZq7i65U7OjAJaOynVrt/5o+/CsYlD4NssuKcXY4jmgva24jpQj3oBqBFpqdAVHHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="u/7ACChE";
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4224D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4224D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u/7ACChE
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cQguqHcFqbJjXdDBuagz/NFuuGbr9y9vn96617/mc4g=;
	b=u/7ACChETRGwAhDf2FaS4Izh8qCH4Un+7b2fW9WWOAut94XYhiWrCqfi5cLPosztCmTRpU79w
	fyQKkTyaaBwZ4LzmK2koByCCdD23Jul/qkQKh55PQ5kgTjKCJH3IalRqZ8OiKkhT4Gv6n6aPf+d
	pKOTHebOJwPueXpErlbDZGY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jTl0W0qSpz1K97r;
	Wed, 18 Nov 2026 09:50:03 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EFB64055B;
	Wed, 18 Nov 2026 09:50:16 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 09:50:16 +0800
Message-ID: <f3ccfbc9-c84b-4eb0-b8d3-e281ebceafe9@huawei.com>
Date: Wed, 18 Nov 2026 09:50:15 +0800
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
Subject: Re: [PATCH v2] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261117123116.591621-1-ruanjinjie@huawei.com>
 <87fqwz8amh.wl-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87fqwz8amh.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Marc,

在 2026/11/18 4:29, Marc Zyngier 写道:
> On Tue, 17 Nov 2026 12:31:16 +0000,
> Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> The collection table is currently sized at a single ITS page size,
>> and the driver's allocation policy is to allocate a single collection
>> per CPU. On systems with more CPUs that the ITS can fit in a single
>> page, no LPI can be routed to the CPUs that don't have an allocated
>> collection, and the system grinds to a halt.
>>
>> Change the allocation policy to allow two-level tables, similarly to
>> the other tables.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v1 -> v2:
>> - Cleanup the similar calls of its_parse_indirect_baser() (Marc).
>> - Simplfy the commit message (Marc).
>> - Drop fix tag and comment (Marc).
>> - Give nr_ids a default for unrecognised BASER types.
> 
> At this stage, and given that this is my commit message and my code
> (plus an additional bug of your own doing), you may as well put:
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>

Very happy to do so.

> 
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index c952c069f937..41cd359e52a7 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -2682,7 +2682,7 @@ static int its_alloc_tables(struct its_node *its)
>>  		u64 val = its_read_baser(its, baser);
>>  		u64 type = GITS_BASER_TYPE(val);
>>  		bool indirect = false;
>> -		u32 order;
>> +		u32 order, nr_ids;
>>  
>>  		if (type == GITS_BASER_TYPE_NONE)
>>  			continue;
>> @@ -2696,8 +2696,7 @@ static int its_alloc_tables(struct its_node *its)
>>  
>>  		switch (type) {
>>  		case GITS_BASER_TYPE_DEVICE:
>> -			indirect = its_parse_indirect_baser(its, baser, &order,
>> -							    device_ids(its));
>> +			nr_ids = device_ids(its);
>>  			break;
>>  
>>  		case GITS_BASER_TYPE_VCPU:
>> @@ -2713,11 +2712,19 @@ static int its_alloc_tables(struct its_node *its)
>>  				}
>>  			}
>>  
>> -			indirect = its_parse_indirect_baser(its, baser, &order,
>> -							    ITS_MAX_VPEID_BITS);
>> +			nr_ids = ITS_MAX_VPEID_BITS;
>> +			break;
>> +
>> +		case GITS_BASER_TYPE_COLLECTION:
>> +			nr_ids = order_base_2(num_possible_cpus());
>> +			break;
>> +
>> +		default:
>> +			nr_ids = 0;
> 
> Absolutely not. The above four BASER types are the only ones that are
> allowed by the architecture. Anything else is a HW bug. So no, we're

Yes, according to the GIC architecture specification, a value of 0
indicates Unimplemented, and other values are reserved.

> not silently accepting this. We scream and *abort*.

Thank you for the suggestion, will add an appropriate pr_err info and
then return the error directly.

Best regards,
Jinjie

> 
> 	M.
> 

