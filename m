Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015929;
	b=NffLcEq2gdp+WMSWNRSK9iT1xIgAyHTuvZLxyf90bMSK+kUJb9ylVSra1RoLYvAttrqo
	 xcJuOFeLQR4EYvU3Az39zpms33JjCWDkFO0WMjw7LxTemHoI1YXmgW5FRNyh7UpnGPXfu
	 SxbE2rd5FV2G1xWu8zWWdcKA7noLlGdcFInlC82URgPT+riJQJUF6bLWlv2Pg4cISwdv7
	 OKvF22Skk8bNyp9GLq6AyitajJmI0Uqh0uJpNhedFiPKVtz7g+3vvAmqWBkMUhbmIxsK7
	 KxfqknY1AZjyRc/Cf+88itxAXuquBtfHULL4NvdUQPrtF+p6m+bVHQxvoNUbtzWrAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015929;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oBaZhfIZKNZSnkGezQQoQRmFPWDP0xuSJkratO6Q5Fc=;
	b=Og/cHs2qtVgR2z0/Qe4pkhVElvaq5898+rtxchsZrL6CLLNj8ELYzdbEVEH9jJ8vWsOM
	 drPjh2vaGVIccpmK3s7tI7Fpv87ekRvM0wYAtrfELFKFq6sM2dYDYR/0kZdy529I9NndE
	 uG2eEm3hoWPta8Semch5ki7SOdl9GLVf0NXwjNPN1j90soXel0v5qlapJo5LpYYQgmWLo
	 uCqEx3EbzH7KM6bwnoLjgv8UrdzNGo+/j+SkdU5NCBE9yslbc7oUBNcq5OUmsGDXoU0Mm
	 ubZNlAxaIlhp//4wBlGzfcNPpDFzujTSfA6sglpEA47e1+/IYrhBddObSvSnvSGtArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mDcMBZ6u;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5FC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mDcMBZ6u
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EE631477;
	Wed, 18 Nov 2026 07:32:05 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29803F632;
	Wed, 18 Nov 2026 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795015928; bh=qqsOJXhjc7KGseviJFfoBepAbNPKz5HEgBQK3Rxo5CI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mDcMBZ6uIzblwoex4pmjAZkPte64ymXkD/W8nELo8+8vdiyb5Afcpq9ipXs0zL6Sz
	 aWtPYmrYZAu23cuZjjfdDaEDkrUkYBBPmc2XPmNmu/Vl2fH/JOKTCs6DEc9CWBmgod
	 wOkgTE2G2wYt/nDpukuvtwK5jD8Z3Irp79BzIO8Q=
Message-ID: <5a92090f-cf42-4767-a089-29969aad0a13@arm.com>
Date: Wed, 18 Nov 2026 15:32:05 +0000
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
Subject: Re: [PATCH v2 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>
 <auwxtSfBOeKXC6w_@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auwxtSfBOeKXC6w_@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2026 07:35, Lorenzo Pieralisi wrote:
> On Wed, Nov 04, 2026 at 05:47:55PM +0000, Sascha Bischoff wrote:
>> It is possible to build a multi-IRS GICv5 system where there are gaps
>> in the global SPI range that are not backed by any IRS. In the current
>> incarnation, this results in dereferencing a null pointer.
>>
>> Reject cases where the firmware attempts to use those SPIs during IRQ
>> allocation by catching the case where there is no chip_data associated
>> with the irq (meaning that there is no IRS to back it). Spit out a
>> warning about broken firmware when this is encountered as it shouldn't
>> be using non-existent SPIs in the first place.
>>
>> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
>> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> https://docs.kernel.org/process/maintainer-tip.html
> 
> "Ordering of commit tags", if there is a v3.

Have fixed this. I hadn't caught the fact that b4 (re)ordered tags 
differently by default! Thanks for catching it.

> 
> Lorenzo

Thanks,
Sascha

> 
>> ---
>>   drivers/irqchip/irq-gic-v5.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
>> index 8c0303af71e7d..f3cce2bd28cc3 100644
>> --- a/drivers/irqchip/irq-gic-v5.c
>> +++ b/drivers/irqchip/irq-gic-v5.c
>> @@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
>>   
>>   	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
>>   	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
>> +	/*
>> +	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
>> +	 * may have gaps, in which case there is no IRS to back the SPI. Catch
>> +	 * broken firmware trying to use any of those SPIs.
>> +	 */
>> +	if (!chip_data) {
>> +		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
>> +		return -EINVAL;
>> +	}
>>   
>>   	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
>>   			    handle_fasteoi_irq, NULL, NULL);
>>
>> -- 
>> 2.34.1
>>

