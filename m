Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538718;
	b=tB2iSqXqbbvGnm7tOp8nRzHI+Da0m/7ozrAvOurGNHAqaD3Pbq57TaHPWC/4YwEY/xsi
	 amVoDrwCQkLdYigy5pd+4WWt5uUNwv4jOsGyChks2NKgQW4+VNeK8u5pCpHM/gshA0Dat
	 kgmPgDJ24flGD1r2nhh1+dhGWitgZh9BkrMLdDCFbT4QP9hMyJYG6cRMl2+cjZQ1x2Etf
	 DTk7IfUDHEpHE98lFX5L5GalMvG3tfNb/VUmSa67+juZrJ+dEOhePQTlg5lX9G3PF1fkE
	 yGTy8oaNLyGsy/J5YL5Ki1ZY4c1H05jCDL7kLPtyW7iR28PHnu0LUr5qFzGY5Vd17Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=x0W0lUunYQLyHPu4wXiSZmeJeLTYoziWTsHAR672YTA=;
	b=FfYJzi+FeYlWUxlZm/RtKIh/f6WiN5enBap+UMs9/QZvkQk9gG3zciri6PhGfigflEj7
	 mFGBQtACb2JPHX1H/lOFGqHT4sx96XTPMkmcZKcykEYwS5uzIqnkJVvwWzRnjH4RbHasD
	 6KL4l7y9jutK7ytjX6xwaYWUgK9fnWtPFzjtGn/ofHDPhtbuwF6+EH1CaPXNKM38zkp1x
	 gQ+ZNleGV6JEPbFktgSnT+iLekUB2PmS7TMXEJBsHhGqEnPcba2mf7SCwKJpLv8K+vbqr
	 oJkkejkh9+nHlxM4RaSaidLWkI4LZisXaIpOURoQCSIHu6YczckkHiltYy4jZoXGzQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YXzTgQ2z;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6978606A333
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6978606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YXzTgQ2z
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4915ba023d4so3008806f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538716; x=1796143516; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0W0lUunYQLyHPu4wXiSZmeJeLTYoziWTsHAR672YTA=;
        b=YXzTgQ2zkyGWm0MYqrEYBKRuwO1JbbfQba/sWrFLt0v6aNhPFc3Y5+dPru5ZupW0pJ
         Vq8Jpq4lc6OjmnBSQ8vIDwnEn6h4hd44aGuKkiRmwSnh6tRVX0IGKPFio1mQEWJeOQCZ
         0X7uuAzUjrsw7uYd+zzjHlvbn33+YeYqza2LL9a0+DlGWo8mWAyvTuWM9xoDnZxh+L3t
         yof93HlBuErO6Mrn1+JE4Sr0hRElk9qEMVMWENZPdHJ/vEwR2i2Zs4sgi+jAO6O1yu6a
         ws0Try+3KQpWe/7O0XTQIRGSsKpB9TIxrqQZZm28+8Xudox8t8gOns/Ei9f7YRYcQwOU
         RuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538716; x=1796143516;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0W0lUunYQLyHPu4wXiSZmeJeLTYoziWTsHAR672YTA=;
        b=Ix8xQ9wrC3ZWEOq4sldydoW24hllUQ5545rdTDQXzjUulsIYftufFjxhFBdK2vBF/k
         fJ/AaZHJSuKqV1eFC4RQmBBsmVEkfV7vZPJSl1ujcVYGwDJa8/v2E2qDf8QfrzpY/gus
         Sk+WeSKATZfiPHF+7gkDUe6iSQCRkLNt8n0Eq7HZGcsjHKGtcWcMU+g9xf1lyOQdT9qP
         UOAv5PQtyEe2qoLWfsMrnwCp7LgBg4srUeXlFscozhkAz3kBLGOdNuw2/P69AXJUN56D
         opWXsvY8JqhfMdO2mxmPnxl22M00qZHg0/HDlbmYlSOhZXbL/FT3y9+vMmknmANcrHO0
         byBg==
X-Forwarded-Encrypted: i=1; AL+hErGpXPItpNqGDj2xQ+ryEk3wBLTRjAHONz16fAAgTccf0g6ZX8qzstTBslUtP6kYYlPWQDieSMYvYh27Zb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8chYrYLCPZ0slVQ2adJ1KiNBYTIonPPuLqeGqVr0SwGM7m4WBj
	Qrbw6ecu2poLwE15rEFTwlRCUaLrvK4nYH5v4cArzWuEvY+e7cyg3FLOfTZmueFvdDG5wYIYizS
	lH3SP/zZLwUwQJcP5VP/6hQ==
X-Received: from wrme1.prod.google.com ([2002:adf:e381:0:b0:48e:5d2f:1d09])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1841:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-4abb4c7ac1dmr34108812f8f.46.1795538715741;
 Tue, 24 Nov 2026 08:45:15 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:45 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-5-vdonnefort@google.com>
Subject: [PATCH v2 4/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MMIO_GUARD
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow MMIO_GUARD requests to
overshoot.

Validate the memory regions are aligned with the hypervisor granule
before enabling the MMIO_GUARD support. If aligned, then the MMIO
regions are aligned and overshooting is safe as MMIO_GUARD is solely
here to indicate to the hypervisor where the MMIO regions are.

It is possible to add new memory regions with memory hotplug later.
However the alignment requirement is way more conservative than the
maximum granule size of 64K. Nonetheless, add a check to document the
limitation.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 51 ++++++++++++++++---
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 98b1026cf68b..3852be6bd16b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
+#include <linux/memblock.h>
+#include <linux/memory.h>
 #include <linux/mm.h>
 #include <linux/pgtable.h>
 
@@ -70,17 +72,50 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
 		return 0;
 
-	end = PAGE_ALIGN(phys + size);
-	phys = PAGE_ALIGN_DOWN(phys);
+	/*
+	 * It is fine to overshoot MMIO_GUARD requests. Its sole purpose is to
+	 * indicate to the hypervisor where the MMIO regions are and we have
+	 * validated the alignment of the memory regions beforehand.
+	 */
+	end = ALIGN(phys + size, max(pkvm_granule, PAGE_SIZE));
+	phys = ALIGN_DOWN(phys, max(pkvm_granule, PAGE_SIZE));
 
-	while (phys < end) {
-		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
+	WARN_ON_ONCE(arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID,
+					phys, end - phys));
+	return 0;
+}
 
-		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
-		phys += PAGE_SIZE;
+/*
+ * Return true if the MMIO_GUARD service is available and if overshooting is
+ * safe, which it is if the memory regions are aligned with pkvm_granule.
+ */
+static bool __init mmio_guard_available(void)
+{
+	struct memblock_region *region;
+	phys_addr_t prev_end = 0;
+
+	if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+		return false;
+
+	if (pkvm_granule <= PAGE_SIZE)
+		return true;
+
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG) &&
+	    pkvm_granule > memory_block_size_bytes())
+		return false;
+
+	for_each_mem_region(region) {
+		if (prev_end == region->base)
+			goto contiguous;
+
+		if (!IS_ALIGNED(prev_end | region->base, pkvm_granule))
+			return false;
+
+contiguous:
+		prev_end = region->base + region->size;
 	}
 
-	return 0;
+	return IS_ALIGNED(prev_end, pkvm_granule);
 }
 
 void __init pkvm_init_hyp_services(void)
@@ -108,7 +143,7 @@ void __init pkvm_init_hyp_services(void)
 		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
-	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+	if (mmio_guard_available())
 		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
 
 	static_branch_enable(&pkvm_guest);
-- 
2.56.1.809.ga0b61035b5-goog

