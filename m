Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085372;
	b=M2XfxQzuS/f9qSx48JWP02SAuJIRDutWdWTyjdrroP8OT6nob/7y6DZBRTClyvsacF1J
	 6IJpV4AJzDFZ6XOTGzCygQZ8abfQtZFSCzNZdIImZNwcpfedFDJRH97/+Ep0Ov+VENk4O
	 Kh1S0UgpEkOTOxYX1pSbTOx7ddjt0FhO/9nheFCFzsUBU7Y5jqlTPvs1yVH8NuidfReqG
	 r6ozH0xd5NCgGCbvwIpb/oSqRR2SjyqnBJe54ignVcMWj7erNc24iJchD47k8WGsIT3Fg
	 VwzVL5NjUHG7bFsMk1ZP8wj1r0jnxPqS58uFPq6hBFlqfHiqC6sbr4dK0xOTiZAIBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=24Y0W+1MZQdnlIcGizra0bUgfZU6rBAE53rV3xCkuHg=;
	b=A1BDIXSLOifukc5faFstDEzNyAiaim0VuiZ8Ffhscf4yKC5XCbJx+DSwGlE5Ote2+2Iv
	 Vm/Zk0ovoSuPeza1biaC8UNrPXxlUiQ8MLyhbj80DLUK14Oj8RRx4mU5EmO7FKyOFVR8S
	 xKP4GztG5h6kRlH12IBF0uBEIS5VypC86ZCN9xIWeb+d4AhXM6qcMSXiHBcRLF4UZJUUD
	 YLsJKpo6Omx2SzYMNlqumvZWH9CFSnud2ZCXj0XIwF4wWx2X3/5Yv61nk/uz0ZGfjUp+S
	 gLEMQw/Nh8uO/Ub4BrSMRM0kusLMPI+icW12RMaeHRuBlnj4OO4s8hIfg5TriZrb2Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9FZsBaM;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AAB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9FZsBaM
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4761663eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795085371; x=1795690171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24Y0W+1MZQdnlIcGizra0bUgfZU6rBAE53rV3xCkuHg=;
        b=t9FZsBaMc5Sd6Y08wP824jpFmypi7QSvbierNeyCVfUa/13gPEHLF+qWkDIJV7gr+x
         LlHYwA3GNJ5CZWBFU5huqPxyrDkqgG7WWSwy/lH9cPgH1Q2OstsZd9n6ryCXGpULERl7
         5FpwzHMTiiCwhpj/BG4EirPuXkluh/yuIYb9ti2GkeCyTCu44OVRHBa3d6xPyqeAjpmJ
         Ga3BKN80tzbCpWiQ+j8DYhiBAQCM0aF5lVTVNmK/ssb7xJIHt5Jffonq+K4IXNE/G5PL
         loShQWlk3bShjV8oBtEfK2+rU5RNDACspALFsBuagHI2795MwmFeWT1VFWsZJGWamJl9
         mPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085371; x=1795690171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24Y0W+1MZQdnlIcGizra0bUgfZU6rBAE53rV3xCkuHg=;
        b=ZgXlvLGac9zN6ttiAQR9HsCk5GtTWZPKlTBNlsm6vi5bHEERnsqhKDEVsXTksun+ss
         IMznNOB2iyJo51X0TfZjqX7CYMfvnzmJlw5WzvAHuQmK8BRW6s86LdCSQeEmLEsbcYCR
         vFVg+wrXbReFLUTotxOCw/ekzojGDEDvGVEvDEWDqpBybJWd6Eoa8EUOiaoAA2qLXPqg
         4ZvNGXznG1ToEQaWeDrHvXaf6Ja4o7xv+xNfN+Z4RejywzRrMY4OF47jthNuqXFyuY8l
         GOg/zhJyU2tjYzW/g0cF6mnPN2JGoNBLEpWrpoamI4hQtCng2grpMVZtiRal7FDYJGi4
         oTaw==
X-Gm-Message-State: APuU4Z/5kNcEfkuWqzRwpcPkzVTaa3/JZgkz8/qxtJlBpBOGdoqt3fsX
	pSpNLZ13kfV6tGNVAWxztucPfblZr2xjTDX43oQBwgmYHN7eSvs8h9m2
X-Gm-Gg: AZFdTZcMIIrALqglJybANgvaaxwQbzO5nhrsYq6joci33DxVS2unBZyV53KjBsttn/W
	CvQeunge4GAEyWU+l6ptPMJ190ZAfAoOy9ERtBTtDZrOsa2GaDR3Jk4+qOXML72lG82LEg1x43Z
	lFmE4bUQP05EbPTUBbWmCz4zrkm3f99dFaJnv/OQNOcTEfuLnSbrIBiOqwfYxmKZMztOfcv2YIY
	yBqno6uqL4n80El/9tHYzQbp4VtT7xn03XzPTCjZnvtJJ6U9gyBwP1HqW6X+8EdjKPLXwOhQhFp
	BujrY/6Vck6g9pS6EWZK/l6dSUMJt11cOs00RV6ey5jNYTCo3IGCVhjy/WVG8OXSCM2pT2236wX
	GgzjcY0LP6vLWn4H89PKMB1EGvGZu1CgqxpTjnVDlLZ4d4eThsYxU0SmkD/41OuK39PjBhvoYP1
	XnJlNXAstHwvM5yeVo2H7/mrvQHUxZlXSMj4jGkm2WczmZ2bLcVfHOlvdzMOgs7ywL6N1vI7j97
	mPA5w2czaxjbm7VAB+0rdHBoFkaJGxQANOIP2WweSLyMcMlCQdw5RNoiBVYHMgHFuet9W33gVF6
	RVAx0gzlV5wQLHMpVcx60Hjdejal20jiBc3YhGAVc7G6gRRWbTq+
X-Received: by 2002:a05:7300:ccb0:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3828140905dmr5025675eec.32.1795085370697;
        Thu, 19 Nov 2026 02:49:30 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm17242712eec.14.2026.11.19.02.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:49:30 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: memalloc: Fix DMA allocation retry cleanup
Date: Thu, 19 Nov 2026 10:48:59 +0000
Message-ID: <20261119104859.2807-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
References: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
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

do_alloc_pages() retries allocation with lower DMA zones when the
allocated address exceeds the device's coherent DMA mask.

However, the previous allocation is not freed before retrying,
leaking the allocated pages.

Also, if no suitable DMA zone is available, the function can return
an allocation outside the device's DMA mask.

Avoid retrying GFP_DMA32 after GFP_DMA has been selected, and skip
the DMA mask check when the coherent DMA mask is unset.

Free the allocated pages before retrying and return NULL when no
suitable allocation can be obtained.

Fixes: dd164fbfdc20 ("ALSA: memalloc: Drop special handling of GFP for CONTINUOUS allocation")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Avoid retrying with GFP_DMA32 after GFP_DMA has been selected.
 - Skip DMA mask validation when coherent_dma_mask is unset.
 - Add Fixes trailer.

 sound/core/memalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 5986e9b84ac0..8fec4a8fd219 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -294,17 +294,21 @@ static void *do_alloc_pages(struct device *dev, size_t size, dma_addr_t *addr,
 	if (!p)
 		return NULL;
 	*addr = page_to_phys(virt_to_page(p));
-	if (!dev)
+	if (!dev || !dev->coherent_dma_mask)
 		return p;
 	if ((*addr + size - 1) & ~dev->coherent_dma_mask) {
-		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
+		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & (GFP_DMA32 | GFP_DMA))) {
+			free_pages_exact(p, size);
 			gfp |= GFP_DMA32;
 			goto again;
 		}
 		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
+			free_pages_exact(p, size);
 			gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
 			goto again;
 		}
+		free_pages_exact(p, size);
+		return NULL;
 	}
 #ifdef CONFIG_X86
 	if (wc)
-- 
2.55.0

