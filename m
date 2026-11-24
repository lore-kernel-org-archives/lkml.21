Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538713;
	b=GYQqCGjJxE7twFbvfMuekv2Gb4qRJaduyQSVbyMdlL/jwaGwAVEMZ7/5ijxiooHnxqLR
	 c5papP375ReHFit2D+ImJyNZap5noFMUu4dUnKU3QhXwOUtbuk7LhrKBEs+8pXSre0gSm
	 /CMfsiSeDSE9jojKogqpElt6WnvstdhrzoL1JVooPE1+7bA/rSm47j8MJQEAd5HaLxUtt
	 5CnKhPczHJ6U94G9dx2NdAF2woI2sXDgt9OE7Im1jCXLdE2rN1+KBkj+cPHUtMZrvQddm
	 M/k/CR0zMl4HZkGHYoq+B0/hq3QSnRfIinBuOM+9cXaUaedsrlAqu4KQsf/BddqOD+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=;
	b=v27mMPzF0QrpmaOuGV0nODeTa2RRD3VBQpt7NwD+VfDgdPNpo3S0yB1DbAbG9HV1eQnZ
	 KEYu8vg97thL8nM+eOOtrN2HY5RlYXQfmnw5gZSIv26AAFoYBaN+jYsKr84eqRQTz+63+
	 qLeJqA6AWX60KPZ/dFNeBDFJc0mR0gMKiDMZeHYMVEIkPNyUOyzBocAIqD8w09ODzVlXJ
	 vy+7u2Dcxx94II3E5BnT7vuR4HEORujWrxxKUVy9fIXrVo8ybEsfTZNC6ci5IBM/8fnC9
	 LyHbCkw2+vVV00pG2E+nNri9LzpGOcrfvai6IlKOCk049MBmV+I1zrUR7pjDGUUyxHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AbXoR335;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9CC606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9CC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AbXoR335
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso39595165e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538711; x=1796143511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=;
        b=AbXoR3351JoqWsXxmHRQxGIB5RLcuQIijz/lCaqVWRN3wZhkkJKkNIPny8/HtqSsR5
         jfT4fKIPbxPY222dM5GoyvHXhdUx9tutcG9eFWfqUPYFnD7HYyHiOPl6IpX2xVUANZBE
         JZd0DFCdTpALkdRfcZ2jhWnOkDVFGeUs4rnDn9inS6hR0B+xgJUDcD8rIccb/40vIQ1O
         4IWO+Z/NQywxs9Fi1zdaJY/sjZk22fYPZQsr9lkPzjaKcpWVEgqAXI5ZS2Z1MUz7qhMs
         HJUiOEjivBwM/0m7cRqxKTZ8WqOUZy6jkUEX9gzta2xPQ8SAQ5GjTqsJPX5Ui4WhsGrh
         osCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538711; x=1796143511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMv8ZWUVXzq+zwbayp1J26VPh+dF0lx+vlAOD4N7gYo=;
        b=yPpmFbvgHi3joVwd8YE3yA/+BOPaKDpmaf7xaPSdwmK8KHK8nOAafTNdE/gSTqVjOL
         yW1cv4kiC4GPa9pi9D1STI+5rvi2ZkXWmPoK0PsbB9Pb3wt7WsCgiZLVqelSpDduFHYW
         tOBXWAuKraghiHgDjZbVIe8EdTtfj/68LWm0oUpQHBa+jh13Ql4VcnwavhKAsmKCkAEp
         //Cd7uM3EBILm0PqbEYWcZh0ZyTDHUyRi9d0fkwbn8fATGNsJWL18R6xC8C1duusCIzS
         doOxN+3Lj/FyigsuPlncEYNWnr0/oC2ZT/WtYf4eymMP/YUtxD5AvfP5601QmM6l6DmW
         H31A==
X-Forwarded-Encrypted: i=1; AL+hErE8tom2coon+7SCHzuCWyRkYjKuPZC+TvgCugScrl0YUD3R7G/Mbwe/4VSP4EG4qxQeJtrhLijexotxL0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OmLrytUUcJhL2c48U/IKm/p9HEl3k94K6Oe1kpUIpBuk6w2QS
	SJXUkuJzetS8VlKbtRRgNY0RJOgNooum0c/mjL85LrucSrxtYBV2yJMU5zqhocq5ysDeocKEFV1
	Ur0P4Vrak+Cz889u92ratTA==
X-Received: from wmcn22.prod.google.com ([2002:a05:600c:c0d6:b0:4a1:f1e1:c6d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr302032595e9.26.1795538711112;
 Tue, 24 Nov 2026 08:45:11 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:42 +0000
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
Message-ID: <20261124164446.2371939-2-vdonnefort@google.com>
Subject: [PATCH v2 1/5] drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

pkvm_init_hyp_services() is only called from kvm_init_hyp_services(),
which is already marked __init. Mark pkvm_init_hyp_services() as __init
too.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 26fe9c3f22e3..e7d7cedf7f6f 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,6 +9,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
 #include <linux/mm.h>
@@ -96,7 +97,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	return 0;
 }
 
-void pkvm_init_hyp_services(void)
+void __init pkvm_init_hyp_services(void)
 {
 	int i;
 	struct arm_smccc_res res;
-- 
2.56.1.809.ga0b61035b5-goog

