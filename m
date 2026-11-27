Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781205;
	b=3i+ruCTDKMmW7IrLxWgWljkaXC0kLmr10RsVvT3fdEDE7eLv4cqmgIabDjyXlWXVgdLy
	 R6pReYYvWKu4HeGoq7gNmCV0xCMZJspQacL2fqR5gBC+tDJ8DKzcOeDTg/0CqNE4AcRKS
	 3g5BJE2NUGMia9dSa5XEfhn7D2K7UrdndOKhusqWKOmBgBjWf3XvxjQBN0dG6WT26dr8a
	 Cc9slSJW7ZDgJdhtHUITXcoQDQU3YYWALUHKJzO+B03IH7AkLg5PXVN/Mc9JeopbJcXrb
	 9r4ZPMAx1ZY0RLfrgzTKZK9TQ4NyrUxsT6M38ObYrxX9Ed643kr9byZIZPSxCvyTmow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781205;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gsBQUtxgAOdXNM6+hYX+FjucLoCWCFZx1UKl5XWecsE=;
	b=MygGEFRRyfxODqiIvkUDnGQYfxPF7ftoOn97EiOeXQd83QdtOx7VDD/je1QHd7yss+W4
	 VQvZxPHSKRDv3yKc98+jHajzBePIWH0lrOFKa0PbUJYdnyutzitoUhG/zPaLL5/0Rww61
	 XxAEBlKkcXmDR8rVxzuZI5zFFVtScLyey8HTP/7Z+Clc8HGG1La3GK+Z6r70AoD5u0oE+
	 Ri/mTHgbyYdgr3+TpQIAVGmIoOK8uuy/St5G8I+6uJeAr9USkncaSE36ExZB0tfjJBxXD
	 owr+jCrzn2vFmozy1EgCfKiav8ov0rqmEZPwNCDzX73JZ/prxpPY1V5n6xl3xO+gfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoEqQhQf;
	arc=none smtp.remote-ip=91.218.175.19
Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E646606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E646606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoEqQhQf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ckIsWJI8b5glm/Oy2u52CdLm/UmNwIJw53MyJRcmQtk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781202; v=1; x=1796386002;
 b=GoEqQhQf2ghocMm33nHa2HR+K8WrQFUrS0ETIgq8sYZsHgx9fjA0WTSviOFRFLaqgOiE1Osp
 BzT94gHWUFcpUyM9OSgzWHVnWM8xwhQnU1oXjmw5yoefSZcWm5jcE+eTbHd+g3i28OL/HBMla9+
 c5DtdMihtkowT4XLFY59uVc0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2e2d766782ee690;
	Fri, 27 Nov 2026 12:06:42 +0000
X-Mizu-Trace-ID: a2e2d766782ee690
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] irqchip/gic-v3-its: Free the page when gen_pool_add() fails
Date: Fri, 27 Nov 2026 12:06:23 +0000
Message-ID: <20261127120623.891129-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120623.891129-1-fuad.tabba@linux.dev>
References: <20261127120623.891129-1-fuad.tabba@linux.dev>
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

When the ITT pool has no room, itt_alloc_pool() grows it by a page and
retries. gen_pool_add() fails when it cannot allocate its chunk
descriptor, but its return is ignored, so the page is leaked and the
retry allocates another page to leak, until an add succeeds or a page
allocation fails.

Free the page and fail the allocation instead.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6eb2dbec5f0ed..cb352ce69147d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -279,7 +279,10 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
+			its_free_pages(page_address(page), 0);
+			break;
+		}
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.47.3

