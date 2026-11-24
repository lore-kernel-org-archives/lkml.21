Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538719;
	b=W2y3GT+i/yqFcmVdPFcoTMbjTC7JZfgxUy7UUfY9UdrQ8b+d14Fph7NFQ5fv12SeFZ6n
	 4doZSoHKfSp/ucMZMQZOKnhdZIMaZz5+rVWANqhjwt78GuRE6HjSjVjlLFFzZSR6RyGfl
	 pas1lIhpx3HIng1eJTa5iWKNvQ854AmHbB/fWn+Pu7by6OLPnIGLGwY04GyGGLXh4ty8B
	 Y8C0y/lQKPWm8YuBJ/NGsSLxQLfPimiIoav3YV/iRtRW2LcCbjd1fgz/5s2vdrYDZo9pU
	 n7sZkdwEtrw9HhydTV3yEXkFB9dCdG0gX9k8bq7FDfwVdre/jr45XG3p9yORfcKk/eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=;
	b=zy6suxm5BTWjIaYw3F/lQYfhgjDe3a5oMgXXFKVF5EPg6WvCp3UIPf2nwcUYCfR+R2QH
	 ItS3tef9NbanMJ+8XSzQ9OxBK9kE9J6867oesOUQouN1MAJZsDAyu1tZoSSwlG5hOO3N6
	 qhppdZ520/C+pdMHydYsnk1E7CAr5xJjilJuqomcQs8HuyMbjvKteui9qPY4StEsNVYF8
	 zxuzICT8Ke93Y+0cgzCGWLL0MU0e7Dvn9Wx+LXHstcI9TOLxewAwwEG0mqPHqvPop33AM
	 CG0eT+ySZXVqmbmzGUtQw4PQ+iJxCx3xJvlozYDeVXrGn5jI/yFouXQ77RMUMYYJOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JyNVTbks;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14BE606A686
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14BE606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JyNVTbks
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so38920825e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538717; x=1796143517; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=;
        b=JyNVTbksGEK6VPiK6WNH2Ld1ZjjzrW5w0MqygzF4rRQTJ1O6T60nGXvKNTLTeG6y6w
         98sMbbQrJBgs1cp85SIOoU0Pp2zTvUr29hU/2JDDHBqP9AQ94iGebdi7MbUwTQdaFmmu
         EQiAmGvmQQ802skEGc5F0anPaZgOzJJpxxI8anvX8LSe6chnansbDu98g6Hsksz9ok/i
         4H8VG4iywhohDCPSxI9Nu2Rtqivm2FRVyRmhZEto2CYVGpkjDtp1LxKhShjlJCXkcYZA
         K3jnQ7fIqD6Fclnk001FXdSS8zOWfXNEQ4EqWQWKQeo0v/UQ9xbsQ990FzXxg8Z9lDh7
         JDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538717; x=1796143517;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEQsJFX0RjAEIhkOhgWbTrA87lS1Xyb5WdXAbKYHdxs=;
        b=ninl08trKWkDKg9bZB40TAiaLPoTTdvXxlK59CZJ34B2FSKyEf9m+ekXds0yZ2/C4F
         jz8XgfM/X53X/48yOGTHDEtq38FTkChE917h8mHxw+NR1OrTUHG+IY0M98S2OzPVq58T
         Bz43HmPtfwZrF/kIrWjYO31M4T5yeskJJPZBstQiwyo7Z0B//urVLo5y9NmkQ2gWVli5
         jLtJTSjjdtwWUZQikP54DL5gKLm0R33GnFyRJg70PAE3P1vHoLNs8Yl75hh1YDekDArt
         vpY1ydj1XrPx4/diXm5UmOfR4A1zz+Ry3ZlzGUYzfDuLh7eBH1X+z4M5YbGHqQduWviG
         GNrA==
X-Forwarded-Encrypted: i=1; AL+hErEgE4A5pABX1mxFLUHIkkxMm2hr5roRJPhmG3ijwd6czmO3zD1J/9JyPeqH4etjJIuEgEgdk9bwevgY5pA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TbmPTthOKFqv+qugW3trS9z3fCKVnR+f/5REzXqvkZKobXRKU
	py7s2YQjSQBdm7SOrSmZbAF8bB3oaHmJdnBYYbR0behp4q50Y09cOXXIXMvqCF4ZRxh0xGopTYI
	6EvtygFhNWqMH9aetU52Jwg==
X-Received: from wmhc15.prod.google.com ([2002:a05:600c:148f:b0:4a2:1459:4ee8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c0e:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4bb88824f38mr361240235e9.15.1795538716856;
 Tue, 24 Nov 2026 08:45:16 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:46 +0000
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
Message-ID: <20261124164446.2371939-6-vdonnefort@google.com>
Subject: [PATCH v2 5/5] drivers/virt: pkvm: Allow granule larger than PAGE_SIZE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Both MEM_SHARE and MMIO_GUARD now support a PAGE_SIZE smaller than the
hypervisor granule. Drop the res.a0 > PAGE_SIZE check in
pkvm_init_hyp_services().

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 3852be6bd16b..e3363a69a7eb 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -135,7 +135,7 @@ void __init pkvm_init_hyp_services(void)
 
 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID,
 			     0, 0, 0, &res);
-	if (res.a0 > PAGE_SIZE) /* Includes error codes */
+	if ((long)res.a0 <= 0)
 		return;
 
 	pkvm_granule = res.a0;
-- 
2.56.1.809.ga0b61035b5-goog

