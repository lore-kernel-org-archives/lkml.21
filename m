Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615567;
	b=2ME1fVV2AV6E8W9zm9L/7Pc9CJ36oURHQJRyjxhylN3WdrSasdrXwsR6vt4ULKzHZTJ8
	 uHMMi96UtZrtzrG+UnrtY5yxLiXUor5FqaQK5PEyk354W+UxLUjIVkRtNtYTOqRfxptVF
	 6es0SDmAVu5GWCFsNb327fabx2DmSQs6dEn2iMiSnuu/217vkkiO9eNz6q4jU3QPvGRGZ
	 hhzTJPbhkxTjbdU5VrD/dSYiMul/SWbNfSVLJYLpcyJ0bp4ukp4RUjFUHSXCkN5ZL9T6J
	 9yhCzex0lKp/byprMmvfEWme98dfNBQbN7Du0xkcokrz7Xj5Xftud8gWEGAiRvvHEzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615567;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1hSbeFnc8+d5Z0x/UFRVTe10rpzfLBfRbN4gPTIS9fk=;
	b=hmXTzikG+GAC+EwZdQ3XxoteWXfI1yZcKxG+r4x5fqRGZJo/hTs0zrp8IaSrz/GoRK8C
	 TOkKjP46dm8s/poOzmgNI3zSxm6PccG1RuD0Ur4YljNwkz93IDpi5Ubio5aVVZ/U9l6OM
	 Ga0wFhBVMs7CO1WQOssM+RUN/TIL+RTKPlzaGY6mKtv+Z+LWi/JRI0y6ui0HWRHigJ/qp
	 nmp1k7sKJvpI2WKnW1DClqKixQaqU7WlA0R7YYlxjsyLi1uV9hbUIDVdGQGbi8Ylh08M1
	 Y1PgnjBTP7+wzpVMm8Q8CW9yd6PeJN3nCeQ9P3nssrmmmuaaJnv5pBDa2wTAZFX4Z0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SToEQ51p;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7792606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7792606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SToEQ51p
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E032F;
	Wed, 25 Nov 2026 06:06:02 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C886B3F763;
	Wed, 25 Nov 2026 06:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615565; bh=SgBEXWU+2TsD5MMV11iwbgnJvcaWxOvL9xfPyuT/IAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SToEQ51p66zfIRihYfE3jYc9D6azHmLvk4e67s3BY3vktfKKqPdomhcowPqZj4+4H
	 HI5epbHGt4D/5k/bI2q0DcVamTAPe27+gXWb4N4RtdlDQtnkVv+jZ9DKL1ifZMAqNK
	 FAUDUdm0+JQma+qWx8BX+H+ZGIi10gbhY/8urd6E=
Message-ID: <89423d04-7201-413c-974d-a98db3a0e460@arm.com>
Date: Wed, 25 Nov 2026 14:06:02 +0000
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
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/11/2026 12:32, Fuad Tabba wrote:
> On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
>>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> [...]
>>> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
>>> +                                         u32 device_id)
>>> +{
>>> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
>>
>> I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
>> let's explicitly say so).
> 
> With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
> the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.

Yup, that's what my new comment now says :)

> 
> nit: this helper has a single caller, so could you call
> __gicv5_its_device_cache_inv() directly from
> gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?

Done.

> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad

Thanks,
Sascha
