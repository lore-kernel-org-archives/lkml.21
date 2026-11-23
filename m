Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437678;
	b=yKJrCtYjFsFjhCSRacuMhpfwkwxOHbARNFxkTpcqXjiq3PTp17SUzqRSzmto3YaJUIqF
	 SnAdeAEqFGTvNU02R1311UnQ/XMYlXy4WV7Sg2MAMLDNY3MwFOdKNnPXAZimsKLqvmnzZ
	 ijJzpNcWc9csyd7E6+qFWGDznmJXzwHj8ElWCwn7KEqX6KZTu9DBWUkH1mSTt0UJ8nfc4
	 1keUADGRdJfE77BJEWOZAYCQAX16glu1MI33WnSa0ktN6+LDjDD37oBEjJQ7fo84P6zOO
	 dWg9+kYb4i60tHuHG2O7I2YOga6ySUSQLK8Oe086y6+pI9cbm20RMgI1urFq1P9S5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437678;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=K8cDEpehY39pwYhAmj/Fr2G9KoX9wy3FFr0qUbBwPZ0=;
	b=KhRKQt4EULMuSzKP5h+zn4FCnNVHjrbpg1k/nB8sPEwstD/+aR80gYHtHx2c7lMF5V49
	 dlKwN/BKYJwkA9f61fU2VznvjjS9odDNQqUBIu5FY94LKqyQQzK5Bu09ojd2syHZ+2Usi
	 +P6nz3GWuiXnD6XVNBorUiltsNqsF5Pap90FRopgq/Ewalhm0yZ4PDee786cBU34Y1SGB
	 2ZamYmKvydv5O02ILNl3g8izK8p0eIwxQ7XOJvTmeTp+y67Ka8BtUN2Dl0SKEYz7kC/RJ
	 GVlLyLfhIM/uUbPUtALaJ+1Ft39jsggoecsEG9as3KgJaKTIrdw/sV3UeZngVIHvXng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bLpUwIMc;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981B606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E981B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bLpUwIMc
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K8cDEpehY39pwYhAmj/Fr2G9KoX9wy3FFr0qUbBwPZ0=;
	b=bLpUwIMcuN8n30k7+6fDbr//8+hfXn9wxOE9HiWwwCz/GFfrqnzvwy164Azvu0CgdTDcubHoC
	y/dcNIzCa2rHySu9AR70TDT0cVM1Bu79VITSlK1UIGHObT9JYTTs2tYHv9qE4/nAuxaUmLLi3A1
	KH0qrgLNUsXmxFslpWhhP5Q=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jY5C74GC8zLlsn;
	Mon, 23 Nov 2026 20:40:51 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 5631740586;
	Mon, 23 Nov 2026 20:41:14 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 20:41:12 +0800
Subject: Re: [PATCH v2 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT
 pool
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-5-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <4d933f50-fb92-8ab8-a2eb-eda244c8ffbc@huawei.com>
Date: Mon, 23 Nov 2026 20:41:11 +0800
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
In-Reply-To: <20261116192933.3266502-5-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200006.china.huawei.com (7.152.185.252)

On 2026/11/17 3:29, Fuad Tabba wrote:
> Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
> non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
> genpool. The pages added to the pool are zeroed, but an ITT freed back
> to it goes to the next device as the previous one left it. MAPD is then
> UNPREDICTABLE: "When V == 1, the specified ITT does not contain all
> zeros" (IHI 0069H.b, 5.3.10).
> 
> Zero every ITT that comes from the pool.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
