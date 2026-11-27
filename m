Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781188;
	b=QEkyBRsZ5tNTXr8BmFhY5gozAKhdWOOOlkJtCcF0x5H/GX/rqyqxG0fhiyajIXH7qRiz
	 uUQWGtim25GqD4L/zr7J2H/tuo61E1maNcNNeKTy4sY8aX6q60ektgOiCrjHv1wsrx2c2
	 baKso49AhYrggTc/++QM/DKQ5BRm1Ao8dC26JklRgPH9i/4z3jzk03fsTHbWPxLqb5sZM
	 8CUvXswMXPEMzl664bjJa/gZ7UTMeCShf576X7ji7XBHwvLBdCjnU2JIztKVoD9p4HSXl
	 w8roowRlHnquZBBFpnF1cnqDSGYOTmswDlNmVP3GmYYVddspQ9H00j6F7+RvNgz6LKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781188;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BCDud0ma4gL3NvurX1mO3fYYWW6CTWqrWca8jGfBy/I=;
	b=SWFA9yedPtMgX3+ZKjeGiomCaE+EScpextHpcGHhAOtjxUDJEsvJLaY+TuhGg7KYX1ve
	 Mmbg8a7ELcYjoaqyEn1XJ1LdpWKBd81UTEw1DajBxNk/j4VS4AQdqkGs1KT1GUpbK6UyD
	 vSayPjfGrynuTIUpw7l4l/giRi5/h+M/jlEmilHWcrU8AtOVWxDQ/1FSAMNGXFWx7HyJG
	 3OXLRKOHEnFHAnoGGMWdWiAcJkDdgRJmIUHr3RcvJPCngw0mDKwssQ+znzHgr/JEZOpsZ
	 Ktq/2p2fmedebIWyBr6yFQFVoN/97cnCJ8Uqk1HlU124TjsXKwBMtSckxcyljGwgbkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="h/zQHzqw";
	arc=none smtp.remote-ip=95.215.58.224
Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944D606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E944D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h/zQHzqw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9wSce90jYtvUGi+gWq89MFzO5ynOmy1PX90qD9Hp7SM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781185; v=1; x=1796385985;
 b=h/zQHzqwxGv+m2J50HZC4HcchxvRaQjzw7MpYXydP6i0UkPafft2aiqwz9ZufikUHVXwHNLl
 XieN6KPvvr9QcGN7zGTxhWtPU2/avF5bYw3aAXoD9HBlw4GaJTTXki4QjtddHatJGVfMhMjkfSt
 atzZ0PWuLncnCZptZRfOv4qs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 648cc0375cc565d6;
	Fri, 27 Nov 2026 12:06:25 +0000
X-Mizu-Trace-ID: 648cc0375cc565d6
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
Subject: [PATCH v3 1/5] irqchip/gic-v3-its: Order table zeroing before the GIC can see it
Date: Fri, 27 Nov 2026 12:06:19 +0000
Message-ID: <20261127120623.891129-2-fuad.tabba@linux.dev>
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

The ITS driver allocates the ITS tables and the vPE tables as zeroed
pages. It exposes each table with a single store: a relaxed
GICR_VPROPBASER write with Valid set, the relaxed GITS_CTLR write that
enables the ITS, or a valid level-1 entry for a level-2 page.
However, on a shareable table the zeroing isn't ordered before that
store, so the GIC can read the page's previous contents as table
entries, which the spec makes UNPREDICTABLE (IHI 0069H.b 5.2.1, and
GICR_VPROPBASER.Z in 12.11.39). A level-2 page is exposed at runtime,
when the GIC may already be walking the level-1 table for other IDs.

Add a dsb(ishst) at the end of its_alloc_pages_node(), as
its_flush_cmd() does for a command. The allocator doesn't take a
shareability argument, so the barrier is unconditional. On a
non-shareable table it doesn't hurt.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f9373..9900c6a53526e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -233,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	/* Order the zeroing before any store that exposes the page to the GIC */
+	dsb(ishst);
+
 	return page;
 }
 
-- 
2.47.3

