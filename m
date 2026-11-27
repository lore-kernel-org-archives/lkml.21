Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781188;
	b=CmFu/qDsq4wJ6rcxYtoAAhO0RwvRALot3NHxGfbCtBcFEG0ybkVR1R/+OdjfjNuDT7Ke
	 cSotoSK2veKTu/fDT27ViJ/wf7bo4XWnvq+QsmKxqfOzCRwjMRxFfdR7CBpeIuFBKDX0T
	 sogml1coTJw0u6TOGwYxxmyD89SDAa9xex9fk7qT+AE4YPXTktr3LGFpXqkPO+TJMvWht
	 DR11jkiC1kIakMN01d8W7JYC2kycp6q+0fpgkrj198BQjFRpqNb6UKY5WngMpZdEPadbq
	 GAVRjkh4FfxlnHRH/qELkrcBxUwuUPOlULRCbDNOVChuuJAdVZxHfxhimc7Kvqf78OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781188;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T2bCjECa1u4pdZVtPe555q3XaHwui0u6s9nFTO9GxZ4=;
	b=azsHKHdgewW+c3PufyXaibtB6zIh2VgpmgYVvzBNy/AWPB8l9wu2Ud4fL4lJoXsy5qlg
	 LTVwy2V7puvEK/8fVOGFBA6upg0MD9htHIkFeKscFnc0nyN90hTb0rG7fcB6a0VV9nsux
	 zEVhBmnD3DdfwboSBYJEpsfTJoG+s9uyu90AnqkqE8E5bJAwbi85IcCZ4TratVUxh4oCb
	 A1I6Vd7mn+04kZkbqvQOXgQ5Dm7ARBd1S/t2rqLVb7UrQpZvnZfbY27Zf/OH+oA4UfHWG
	 y4Fr6pFCw+CAjvSpSWOEmvZnzspXs8qLY0Pmo0p0XeROfNh0tUMZXoUfDFQUvYHG7Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yetf21mU;
	arc=none smtp.remote-ip=95.215.58.230
Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1F6606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yetf21mU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QcWWByewpEJMJeeUiQ7pExsRgynUVMZElP1xyHkt8XM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781185; v=1; x=1796385985;
 b=Yetf21mUrQs7UuH4zOJ+YR63/d71jitj6JqXWQJdD5kYK/aFQ1f0sKOgAjrW2zwdo0G7IgEX
 Vg0Qyr9ZUk3CnwWFeDlxm3Ars9IMkP86X4yt2QJXfd7kAngWlYc+kFCvkjfQRXsUUgDFmg8hMfD
 kiZ7bcwSeyU7pfj9RTLj1nkQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26ae72810054a870;
	Fri, 27 Nov 2026 12:06:25 +0000
X-Mizu-Trace-ID: 26ae72810054a870
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
Subject: [PATCH v3 2/5] irqchip/gic-v4.1: Clean the vPE table to PoC
Date: Fri, 27 Nov 2026 12:06:20 +0000
Message-ID: <20261127120623.891129-3-fuad.tabba@linux.dev>
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

On a GICv4.1 system, allocate_vpe_l1_table() sets Z and Valid in
GICR_VPROPBASER and points it at a freshly zeroed vPE table, but leaves
the zeroes in the CPU's cache. A redistributor that accesses the table
as non-shareable reads it from memory, where it might not be zero, and
the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z, IHI 0069H.b
12.11.39).

Clean the table to PoC unconditionally, as the driver does for the
pending table. Testing rdists_support_shareable() isn't enough, since
GICR_VPROPBASER can read back as non-shareable even when the helper
returns true. allocate_vpe_l2_table() already cleans the level-2 pages
in that case. A vPE table inherited from an ITS is cleaned by
its_setup_baser() when the ITS is non-shareable.

Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allocation")
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 9900c6a53526e..6932dd0a02c42 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3007,6 +3007,9 @@ static int allocate_vpe_l1_table(void)
 	pa = virt_to_phys(page_address(page));
 	WARN_ON(!IS_ALIGNED(pa, psz));
 
+	/* Make sure the GIC will observe the zeroed table */
+	gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
+
 	val |= FIELD_PREP(GICR_VPROPBASER_4_1_ADDR, pa >> 12);
 	if (rdists_support_shareable()) {
 		val |= GICR_VPROPBASER_RaWb;
-- 
2.47.3

