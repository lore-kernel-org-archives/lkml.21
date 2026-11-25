Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615590;
	b=DZSdS7Ncnn1pWoBYcRv8WibePbAGEcETCTDz06Noqw2XVqhoNtTgs1oMj1sXHCg/Wjue
	 iKu/CseoCE1lqhbV83hUpF6TUABx6ByD1CNr9+pA1CphDV+6ZwocZN+Yc5MjCZ4hASjFr
	 DuxvM357wEfLUzQk6fxucqRFhb+f4tfxEsh+djpkS6962WgrBrh3Fp3gcxKNmSERVQIlX
	 BcgElD0PtXLoLxXNXkaZAzxATHtTZxq7L6m8cqWqROty3KRpS9Dv1zeD6EfwGpPDc5cgM
	 xVyALtZaBL1rQk2hAyw22O0d0ICvAENNOTxaPohYtxjUpW52aSb9grpJE5hGgm0IqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615590;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=udX8+6efrLtSNS7M6NmNK8oMmjBqcwNuQyv9PojvCh4=;
	b=dob7L8ODo0HxRq0WscD0oe/+roSMIcYJmjs9l485u289gFUEJNjSqbkyMOW5whczWSQf
	 bdumOJq35CGBXHINb39ztOzjLU/pooJvFtToG/aRk6rjLdiscHctSZ8VP8d74Lm8JiPLp
	 w7R+aIVnJgL1UXCjVW15hQJYmvwwasi1W9b7YCus3zDtCkxCO2ANRw5Ph/FFbvOzHPKRZ
	 kftjE0yT+6ZQ7SZl5C0i+n3RzPXvJAfh6yWyoo4TMZh/PV8D0mejIlO37MixXALwdULOT
	 I3jhxvUVFRfTysP+uPPdyecKpPYRdwZXqJI9AU+w/Fc2yjFSUP8J3yZ8TVbrVYQ2U3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vhQgwU3c;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79903606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79903606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vhQgwU3c
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D642F;
	Wed, 25 Nov 2026 06:06:26 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0463C3F763;
	Wed, 25 Nov 2026 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615589; bh=sRlaaXQR0JeVzFmKrvC614bxVGzxPhzTL8Hc566Ovgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vhQgwU3chBcYz1dWEVQ+cPH8psTGIYlZRx6YmtCrFcdDC/A1dqaJ4Nm7ejmc9FGX6
	 NebtfNK7EM2SmzySskSqFujEaHp1B6IZlxpmn7r96Q3tGb57PSUJzjgyUPXFsznW5C
	 hme8951n1R0pB9fzJC1yWKVQwqmhQIXECnB9bx2E=
Message-ID: <2c5b41fd-d5b8-492f-9f16-9b88ac0ff862@arm.com>
Date: Wed, 25 Nov 2026 14:06:26 +0000
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
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
 <av7Ly_iLyiOAXQUR@red-moon>
 <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
 <av77avzIzIbk_KUD@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <av77avzIzIbk_KUD@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 13:36, Lorenzo Pieralisi wrote:
> On Thu, Nov 19, 2026 at 12:32:56PM +0000, Fuad Tabba wrote:
>> On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
>> <lpieralisi@kernel.org> wrote:
>> [...]
>>>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> [...]
>>>> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
>>>> +                                         u32 device_id)
>>>> +{
>>>> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
>>>
>>> I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
>>> let's explicitly say so).
>>
>> With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
>> the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.
> 
> Yep, that's what I meant, I don't want "0" to look like we are
> trying to optimize anything in there because there isn't anything
> to optimize; a comment would do.

Yup, done :)

> 
> Thanks,
> Lorenzo
> 
>> nit: this helper has a single caller, so could you call
>> __gicv5_its_device_cache_inv() directly from
>> gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?
>>
>> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
>>
>> Cheers,
>> /fuad

