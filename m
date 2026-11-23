Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425439;
	b=yN7Wupy9O5INXiYak+2RSxG4hg1MgJbH6ghde4bjHH0YMq7VTwYWnltcEOsFwl7242+A
	 XoTHKY6lm2wAgflx/h/pgWim+uET2ajR+gkO7CY3olM1YTMSuPmrxgPwKrQv8SUjGB3Hg
	 Cc35IJeaR6OzhfOUHH7S8Sr1uGVxqIjISsssAQA//VeC19beH9UPb+37L+sEa/bDvY+l9
	 FPkS7PSE7z+9mWPUSksw8G+6Zs/WBrgXr1U077ToLDkyqxd9yR+0eWzYrnYHMtrh3fSMX
	 qq8QImJwMZ3O6L+60RvvX2IrFWGjEaAt//JEc+VWywWHoTxFZ3zbSUejKrizVef8CQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425439;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=y9mi2w1yYno+RnF/J2tW0TKKj3lEXumAEJFgp3ZhgyM=;
	b=YzGbS6CObmIis0DUmd1jywZyIRw9uXuKSZZnQ95D/LwQMUsYbJOXa2wGb6KcgQGupxVL
	 WZTbt+vKhpdmKwEYfTC8eu2rnSfKC5Am0jzs8QklVeNHpG7oqnsHJ98aRPew+vl/aqrjq
	 QU8eYdh0JURerDN/Hj4DMTD5PRPf5KjgTdgoSFnfrh6rsxiQvxKSdyawWFC13+FHW7RDg
	 ckNg8NplmTIQMKYPhQC/pVWRXoXFtilBmiu3eP6RjmB/vyAFoU1m0lDJj0XCzInDc5SJp
	 ydc+5hXJQyYsu2k8yzEi/6KsVDwkpYGj5fNpJz3Hvoa3NaUiNdJ0KJoytE9nc1RNgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=R3rx3qcN;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341FF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=R3rx3qcN
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=y9mi2w1yYno+RnF/J2tW0TKKj3lEXumAEJFgp3ZhgyM=;
	b=R3rx3qcNWp3kFV8z+oHiKzoynzp9KJFxVhRPeM8hbM0FMngX0tDHIlQjuKUlmsgusqe5+Gs6N
	kxT7JxgLoeQKnA9C9RSUhV16JWofRBxqrCqDLHvsXT+EkcHlzqlfuYQWVzsAa19vOtkhiC+qWH9
	u17bhnt7Qyipn3bh5+fdxgc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jY0gt3X0vz1prmN;
	Mon, 23 Nov 2026 17:16:58 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 5478140538;
	Mon, 23 Nov 2026 17:17:14 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 17:17:12 +0800
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3-its: Clean the GICv4.1 vPE table to
 PoC
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-3-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <a8d84ea8-c095-e444-dea2-23b92866f970@huawei.com>
Date: Mon, 23 Nov 2026 17:17:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261116192933.3266502-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200006.china.huawei.com (7.152.185.252)

Hi Fuad,

Thanks for Cc'ing me on the GIC stuff. I'm happy to read them ;-)

On 2026/11/17 3:29, Fuad Tabba wrote:
> On a GICv4.1 system, allocate_vpe_l1_table() sets Z and Valid in
> GICR_VPROPBASER and points it at a freshly zeroed vPE table, but leaves
> the zeroes in the CPU's cache. A redistributor that accesses the table
> as non-shareable reads it from memory, where it might not be zero, and
> the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z, IHI 0069H.b
> 12.11.39).
> 
> Clean the table to PoC unconditionally, as the driver does for the
> pending table. Testing rdists_support_shareable() isn't enough, since
> GICR_VPROPBASER can read back as non-shareable even when the helper
> returns true. allocate_vpe_l2_table() already cleans the level-2 pages
> in that case. A vPE table inherited from an ITS is cleaned by
> its_setup_baser() when the ITS is non-shareable.
> 
> Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allocation")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 9900c6a53526e..6932dd0a02c42 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3007,6 +3007,9 @@ static int allocate_vpe_l1_table(void)
>  	pa = virt_to_phys(page_address(page));
>  	WARN_ON(!IS_ALIGNED(pa, psz));
>  
> +	/* Make sure the GIC will observe the zeroed table */
> +	gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
> +
>  	val |= FIELD_PREP(GICR_VPROPBASER_4_1_ADDR, pa >> 12);
>  	if (rdists_support_shareable()) {
>  		val |= GICR_VPROPBASER_RaWb;

Nitpick: would "irqchip/gic-v4.1:" be a better prefix for this patch?

Otherwise looks good,

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui
