Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438670;
	b=YXJ/OG4bWU2RJdzCVn/jWToBApnhQELAZiIn1ApQAnN5rJvzbYg5M/VWa905dscysoIQ
	 dG/D/AWSsI0euyc4gLpf2Ck1JHUR91m5BGYlycEJC4KsehPzTB+VveVfwmt005gFZxT35
	 Q63uUbWJndTlX6rstkqC7LqtyYqizuPX7xZKW0WxX41UjrlbQhZGFTAN393PVIuzGfcdd
	 1SxGScJzHBefFwdUXxy2UVM7d4XogrKUpZhgi2hUGAhCAb2vr7P8E/LF6JKihhVShoh86
	 km0KVbyeoq6mxBvZgwRKe7AOUbZ9bNwJ3P5sTNA5SBj+wGPVdM8/DT7XPUCsjDfMjgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438670;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=PoHSByiLzGdhwKCPkw7GydNSvKREW6xhEq690uMockc=;
	b=cxv3Jdyghza7rWD1fqfbzUfqH5ULJDUuI1gqPMtbOcfswyTu6TR1G4kFQNivS6d9FLt8
	 QDl47KyEv4aEvSyOpos//QtWmJlybKQcQJPFSh91NiEGkvJybOCDO4hAA5q3+6wG00JcN
	 tigv/NsDq9y/bRdVnExd43TXVOZsOmTBNtjBWJt83HVd7u1VJlpHcSg0Phlu+yuBYWSrW
	 WpgsTWCb0gtYOIgv5ZFedJAiZGjUlg5yUitI6qiXFVr4x7tZ0UI8Fausq8CaixB2jMUA6
	 EhBFu/D8bZZ5nN7+qQir/USMHWEXh9up+tpYqNpt1RY8DvWaIzcx3K5Ermalm5kLOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fLJ0giQ0;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2F0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fLJ0giQ0
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PoHSByiLzGdhwKCPkw7GydNSvKREW6xhEq690uMockc=;
	b=fLJ0giQ0zHqLiWnay8Nnms5EjCOiVmAb8a2R8Qp+2GS63AA/IpG/31Ba1wKQVTbFs421PaHz9
	Xn8yrpVRQdVlQ807vP1e4Jb3ILrcaEtH13wJcMlFNJcRiOF2BeApQfuCrijXU2MvHOdeHycuoNQ
	tKnTlGYpovN2d8ihlo1IpnE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jY5Yj4rSQz1T4Fs;
	Mon, 23 Nov 2026 20:56:57 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id B874540537;
	Mon, 23 Nov 2026 20:57:44 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 20:57:42 +0800
Subject: Re: [PATCH v2 1/5] irqchip/gic-v3-its: Order table zeroing before the
 GIC can see it
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-2-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <59e9fad1-1f11-afb9-e1dd-e68da335eca6@huawei.com>
Date: Mon, 23 Nov 2026 20:57:42 +0800
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
In-Reply-To: <20261116192933.3266502-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200006.china.huawei.com (7.152.185.252)

On 2026/11/17 3:29, Fuad Tabba wrote:
> The ITS driver allocates the ITS tables and the vPE tables as zeroed
> pages. It exposes each table with a single store: a relaxed
> GICR_VPROPBASER write with Valid set, the relaxed GITS_CTLR write that
> enables the ITS, or a valid level-1 entry for a level-2 page.
> However, on a shareable table the zeroing isn't ordered before that
> store, so the GIC can read the page's previous contents as table
> entries, which the spec makes UNPREDICTABLE (IHI 0069H.b 5.2.1, and
> GICR_VPROPBASER.Z in 12.11.39). A level-2 page is exposed at runtime,
> when the GIC may already be walking the level-1 table for other IDs.
> 
> Add a dsb(ishst) at the end of its_alloc_pages_node(), as
> its_flush_cmd() does for a command. The allocator doesn't take a
> shareability argument, so the barrier is unconditional. On a
> non-shareable table it doesn't hurt.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
