Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970289;
	b=sfUsbGVv46r+/uULzF4LKnWcwe1mZF79QVkSunJOiXg015ZjYVVWX2L/ilYsgDxY/2Dz
	 9D+FNWK09CJr3REHTToy/ka8fPfilCLVA92SqfOj0c2/Tu/w+RA3nW06sX62XDv1il+q0
	 Na6lplsz/XuOBg7FRuY6MQV7wZKkSJaYZCGDYkci3ukctx05iem+GMfNKzMs0jZEjQ2P1
	 hmrEAHnVsl5cJeEsg1wQHUhD8vPkcfa6sfOvNJmz/mTXsreP9ApYuxKyejld0zd2XyNam
	 1zxiQiPqDJnT/uE8nkz+97sf7MF9tEgqr+ngGnShGqrFhJiATXffCTamwiUXyaHWNBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970289;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3CZyrOmhc89sv0CEQ5bjPHCe3RbhzJaUwkxiKpylggM=;
	b=Uz+87CI/KnylGlFW2wLAq69OMXrxuqyIVVXAxsuJUjcOj8SVzlYOnu0t3qFpLZbtnQ8P
	 brx8KYMmcJniEF5AbxA3XbBoNt01lowBYCLlf4vnP83DnTehcpGVCbXW1gUjDekbDIznr
	 r8UxVv26NxUIDULJtDApC8yVrtzDoFqT7bbLhInl0yxEv+X/hFk3YevSgS8n/i2MInYI6
	 y+nlqUeqNAefRPGEpUm12AnhPL5VIpyEweYNJX/Hk+bJpPFycuia32RKG0Gzl//0peXdw
	 AUb4It9shF16WvOtH+ERfUn+/V9RS5XcVeuwnpRGthpemcRby8zQj63ldpsvQyYLWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TTJtQRyS;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TTJtQRyS
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3CZyrOmhc89sv0CEQ5bjPHCe3RbhzJaUwkxiKpylggM=;
	b=TTJtQRyS6Ibh+P8UFwk3uV8ej6oZNbYv6CXw0d9f3y113gtZBARrf+38jZDvoE//eAJ0FgRjV
	bR8IKUTNh95I3ETPYndhi8Y7GnaZV2ECyjUnOS9zyKUSk1XfGevEOxObWUtrgshuPfn2j28Q/cB
	aNChhud/0atevZsC36HepJo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jTmLz24PYz1prMj;
	Wed, 18 Nov 2026 10:51:07 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C9BE40684;
	Wed, 18 Nov 2026 10:51:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 10:51:19 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3] irqchip/gic-v3-its: Size the collection table for all possible CPUs
Date: Wed, 18 Nov 2026 10:51:06 +0800
Message-ID: <20261118025106.623070-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The collection table is currently sized at a single ITS page size,
and the driver's allocation policy is to allocate a single collection
per CPU. On systems with more CPUs that the ITS can fit in a single
page, no LPI can be routed to the CPUs that don't have an allocated
collection, and the system grinds to a halt.

Change the allocation policy to allow two-level tables, similarly to
the other tables.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Bail out on a BASER type the architecture does not define.
- Add Suggested-by.
- Link to v2: https://lore.kernel.org/all/20261117123116.591621-1-ruanjinjie@huawei.com/
v2:
- Cleanup the similar calls of its_parse_indirect_baser() (Marc).
- Simplfy the commit message (Marc).
- Drop fix tag and comment (Marc).
- Link to v1: https://lore.kernel.org/all/20261116022330.273840-1-ruanjinjie@huawei.com/
---
 drivers/irqchip/irq-gic-v3-its.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..9f7616c46c7d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2682,7 +2682,7 @@ static int its_alloc_tables(struct its_node *its)
 		u64 val = its_read_baser(its, baser);
 		u64 type = GITS_BASER_TYPE(val);
 		bool indirect = false;
-		u32 order;
+		u32 order, nr_ids;
 
 		if (type == GITS_BASER_TYPE_NONE)
 			continue;
@@ -2696,8 +2696,7 @@ static int its_alloc_tables(struct its_node *its)
 
 		switch (type) {
 		case GITS_BASER_TYPE_DEVICE:
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    device_ids(its));
+			nr_ids = device_ids(its);
 			break;
 
 		case GITS_BASER_TYPE_VCPU:
@@ -2713,11 +2712,21 @@ static int its_alloc_tables(struct its_node *its)
 				}
 			}
 
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    ITS_MAX_VPEID_BITS);
+			nr_ids = ITS_MAX_VPEID_BITS;
 			break;
+
+		case GITS_BASER_TYPE_COLLECTION:
+			nr_ids = order_base_2(num_possible_cpus());
+			break;
+
+		default:
+			pr_err("ITS@%pa: BASER%d has invalid type 0x%llx\n",
+			       &its->phys_base, i, type);
+			its_free_tables(its);
+			return -ENXIO;
 		}
 
+		indirect = its_parse_indirect_baser(its, baser, &order, nr_ids);
 		err = its_setup_baser(its, baser, cache, shr, order, indirect);
 		if (err < 0) {
 			its_free_tables(its);
-- 
2.34.1

