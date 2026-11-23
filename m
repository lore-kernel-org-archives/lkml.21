Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437683;
	b=pULEfxkygIJBBlUUGj4lczK+92t6Hfhm818W+QcEVDAWmY1mzlsxzJc+Z0EpBiR980MZ
	 KmlXNYn3adBoqTfsaBnCiFxflBKgRFe0FSFcHzWqHO5jy/fFZ0pAJ5pC3QOstYpPKHujS
	 YcQ8FL16rJXaTqKT0SSMHHzomjADVG4283n27AEuCK6eZWyTOxwKisAx0QbLPDdm1e3HT
	 moFkBANXTM6CDkKl6SiAQfv+YepcVCsur52Js/XXrs0CDMERjEwErIY3BgXcvygtvOsNF
	 w33RjZlKiFmNftEJaBsTUxfZCm7oUMQ1FRuQzmV/DjDmdTmUNiAymhx3NbndubYJ2/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437683;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=a69ga5LLSiyBCNZhefjJPir9RoZN+HRVRIB9fbGVQXE=;
	b=a7gmqOK5AacJJDYYt9INPKQYD3HvzHV93t2xPrr/HwA4byZDnZRuXTw4VCyTUHmp0h/E
	 0RjHF6wJ9V4AtXoqiNEvHn6K1NQCVLiJACBH+bgiTDloVHhzzrgYo/kYKhRE/9wwiR6cf
	 rQxdpK3T/x2YS0DRK4rkdgGXOydjFeuYoQPu3sDyk5/rZ08DSAVDt6lWiSl7C0Geu2rel
	 OkLSpktfT/ILbRAXM8PnOtF/aXmAeA0qv2ib3p1wnSV+P3ST0XuiuvqKXfAEWbhyFRTVe
	 aJgQshHnY8hxPWJyDQL1ka7TWkSHAKMkvTmkounbh7p8ICbyMGTrvG6RMBe6e3QdCEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mgtjrai2;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50186606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50186606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mgtjrai2
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=a69ga5LLSiyBCNZhefjJPir9RoZN+HRVRIB9fbGVQXE=;
	b=mgtjrai2mB0FJ6yLrEEfKmRFOGEXP9ZnidbBXtLETZrHw7cWpP7tkoDwMyakeIxM3agAlZvwb
	uFyj0/lfNJLtohOyf7r1BC5iLgV/g9SvWz4yWmnIZblmnX4XTZrGiMLIxNbR3wEsBqX6UZA/jGS
	E7kvstk5DTqhrsRB2LAK3YI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jY5CK6qb6z1K9Cx;
	Mon, 23 Nov 2026 20:41:01 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id C023A40586;
	Mon, 23 Nov 2026 20:41:18 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 20:41:17 +0800
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Free the page when
 gen_pool_add() fails
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-6-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <3f9a4b43-f9e1-5b58-95c1-0efbdd76654b@huawei.com>
Date: Mon, 23 Nov 2026 20:41:16 +0800
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
In-Reply-To: <20261116192933.3266502-6-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200006.china.huawei.com (7.152.185.252)

On 2026/11/17 3:29, Fuad Tabba wrote:
> When the ITT pool has no room, itt_alloc_pool() grows it by a page and
> retries. gen_pool_add() fails when it cannot allocate its chunk
> descriptor, but its return is ignored, so the page is leaked and the
> retry allocates another page to leak, until an add succeeds or a page
> allocation fails.
> 
> Free the page and fail the allocation instead.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
