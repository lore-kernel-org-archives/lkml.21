Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781189;
	b=XTu2egUyWhMDJBmiXIUBg04crAOYWl0qgvVkxlFe4GDE+1+zNXiZFInhWpKEyGpRBow6
	 IBQZ81fAgOTxrl8uayB9pH87Pf9/yCfw1xBKYN3kYQaPT01LiuTPiTPJqLiQBCGaWN3IP
	 sDOdkXgVn56ZRYQyK+i2OpKrXcXktlOTHqIy1pzdzmEUpX+RK5NsDK9dfks/qsK2fOEDl
	 Y5T+Ruo/3n+Ts9pE9Qndm0TP6boD0nDpCNcHeTtzHGvIG/lkrwOcjHYxns2ETepZUxaBn
	 6pSNdwF47Eshh8iIY9PL3CM4wcDxpVH/17LS8qqU6CG4Vq3/LvB/6dbTwxh5qXb724Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781189;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z9q9jd84jaCoqubeBxx+V5v17+usCJpPuunEpG0X0oM=;
	b=cODILNXNt6CPepKwC4XM0sPJ3/l433eYR+l3XfCM5mD/jjTyl7SLrzzMe9FblnGJlhNs
	 MLY/76UPIsCA9dQejCs1kd084KS67oYjh79sIGuG0yTJhXH1cam9Qq5fts9uECylsd49B
	 sLFs1SuBxgQaA68MwipVxemOCeZ2tTIYTAWAmdzh+ygX9Ao/pmoWXw60/mJpESxG8axRZ
	 68FAF8OOiTte7Gfwym+R+HhnYhSJet0xMfehGdMPNOws6Lz/By+lfLtTrybHtel4upWQF
	 4yQBpRShfvb7kX9zB61iPpUli8ORPZGg46YebLc7jtsVtIx9cLVbN2V1hAtH0JhQtBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W1Bj1kr4;
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B402F606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B402F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W1Bj1kr4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AS4+6+Tmk61XKYNBv6v+q6L2pUXMMn4YwtmRUcOY5Qg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781186; v=1; x=1796385986;
 b=W1Bj1kr4EK17mSfOzevq1hG9e2FXSvK7Rw0xD9VDUX2A+rzBkTbSHjyy07LbePIVld8nBu2N
 mO/KGUbi79OqNyqw4St34q8cLNlse565HHXbelVxLFyhrjRHpGUjUmrt3xE2f/uffyu42kY6ezT
 qhn/wDneQYbPaSjPPBPUINh8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bda9cba14b9677bb;
	Fri, 27 Nov 2026 12:06:26 +0000
X-Mizu-Trace-ID: bda9cba14b9677bb
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
Subject: [PATCH v3 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
Date: Fri, 27 Nov 2026 12:06:22 +0000
Message-ID: <20261127120623.891129-5-fuad.tabba@linux.dev>
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

Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
genpool. An ITT freed back to the pool goes to the next device as the
previous one left it. MAPD is then UNPREDICTABLE: "When V == 1, the
specified ITT does not contain all zeros" (IHI 0069H.b, 5.3.10).

Zero every ITT that comes from the pool. The ITS then no longer needs
the pages added to the pool zeroed, so drop __GFP_ZERO from their
allocation. A pKVM guest shares each new pool page with the host,
though, and pkvm_set_memory_decrypted() doesn't zero what it shares, so
the host now sees that page's old contents.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5756ffe4ec13e..6eb2dbec5f0ed 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -270,10 +270,12 @@ static void *itt_alloc_pool(int node, int size)
 
 	do {
 		addr = gen_pool_alloc(itt_pool, size);
-		if (addr)
+		if (addr) {
+			memset((void *)addr, 0, size);
 			break;
+		}
 
-		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
+		page = its_alloc_pages_node(node, GFP_KERNEL, 0);
 		if (!page)
 			break;
 
-- 
2.47.3

