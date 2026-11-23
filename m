Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437677;
	b=o7dY5F/gqM8OwpcoBfI361wzJLA8txbZ6hof3cHg1aczHkFDT345rUAEt1AMz3DLxx2L
	 hr6tw2HNtyGGFRN63ZUeaIk69xxrXtsemuojQomJQ/Zmt92+vwMUslBeZ09htzXVhH+Bq
	 AJoHZormRW7c6AqBe3UKPL9hHvznVMjXWEavOMn0pq4Xugvg9/zzJsYq+jDWla/W6NRLr
	 jTCUM4D6p+hk5kOousjdjGuYq6ihpNN5bnlc2w09vHacF7Y6kgDHPOAQWeQaoqXj5ONZ8
	 BvFqEjkHT6jWAq1MrSkct0vIqH0W4+qSjaFZqbcVPaBI0hVywZq59bGaPO7Nh0ObQvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437677;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=wm2Fsy+TKIityrh2JXEQ0Ts9qBX3XxcJiLg6biIUS5c=;
	b=IM0sOp/N67CFuHZP7VKWmy0Flv5r44VvXc30Uto+qXsJoBJFJW+IOSgcwR2NFqIyD/fY
	 +m30/12SsUQadjnScugxJo4HSobvBuJkPrH0G5hF4dOVe8YrIDLq7cRn9/TYfdkMuIlud
	 7SqJYfmf0pIoaNNtYuSSSHdaYis1m+qtbnE0BJ8kZuf33ek40xYq7wUpB9XsYV5Kkt43l
	 k9+VEBAutD2Xg/KjhE804plx964n5TMo2e1jb/OVcCXl5SFAm+mR7oj9CWWyZBz9AtViU
	 hM7WzrPAoRmVsiPXUpkZxKVE0pcJfDtYW9RnpdpQ4IwIX+ch80RS0j8sbksxFGbXmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QMGIMbHU;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FE606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QMGIMbHU
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wm2Fsy+TKIityrh2JXEQ0Ts9qBX3XxcJiLg6biIUS5c=;
	b=QMGIMbHUUBaEZukbT/1NDn7x1aByQmU6K6xOcmifA/0k301nClEmeyKJZJSJFj2n7EZs6YOuk
	B9fOEocll4eT5GOx3C3CnynwuqpRusJUHX7m4r+S/mMVMNoS7J8l8nuCtwA42J8aQVInuvK8Sw0
	666euVDHWm9DnHtB5564Nf4=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jY5BW5NtkznTbP;
	Mon, 23 Nov 2026 20:40:19 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id D599C4057C;
	Mon, 23 Nov 2026 20:41:09 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 20:41:08 +0800
Subject: Re: [PATCH v2 3/5] irqchip/gic-v3-its: Align sub-page ITTs to 256
 bytes
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-4-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <d92a7560-d1de-c243-584d-87cf10af21ab@huawei.com>
Date: Mon, 23 Nov 2026 20:41:07 +0800
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
In-Reply-To: <20261116192933.3266502-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200006.china.huawei.com (7.152.185.252)

On 2026/11/17 3:29, Fuad Tabba wrote:
> Commit e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
> dropped the ALIGN() of the ITT address in MAPD, on the premise that the
> ITT pool returns 256-byte aligned blocks. However, the pool's minimum
> allocation order is get_order(ITS_ITT_ALIGN), which is 0, so its
> granule is a single byte. An ITT whose size is not a multiple of 256
> leaves the next device's ITT misaligned. MAPD drops the low bits of its
> address, so that device's ITEs land on the previous device's ITT.
> QEMU's emulated ITS has 12-byte ITEs, so two devices with 32 vectors
> each are enough to hit it.
> 
> Create the pool with a granule of ITS_ITT_ALIGN.
> 
> Fixes: e36d4165f0796 ("irqchip/gic-v3-its: Rely on genpool alignment")
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
