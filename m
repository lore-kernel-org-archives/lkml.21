Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418998;
	b=Zozeo2gEkOAGKgBxHzqLyklju+95O0oZYeYeRXFZjX+NPpx6Wa2TJCNPnttXnRv1EdaP
	 d4DObXjUdlZ1h1yXDfkI6E9YfyltTbqNF+LSNWyMzUxXRZiKDx0sJpF7n3FSvcQnSLbLV
	 aGUDCGqfBpMBKxUMV3Tr19Yk0Ra1MM7GbC+irqgG0LZwoqNXEqg4tkw8AuIMTWJQPQPfv
	 KACS4xYH003F4dXCJkKd9cGMnqVkEDMs8N+4wBaKgSWWqyF4kFJXmK9AxkBR4TAhNCefx
	 aiCyfX9wgMkZ/v3piAuhwHSWcTXQ4Ff3D7aEYm8eBASPSRPT2SkyBqP86lZn+WcGRyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
	b=4fgMesiwjWFXOnZhdCHxP2CEYhtQuX7xqlIagrfl5/1aacNAFzOusVs/167uGbln+qYE
	 x0aHCix86WF7ZllLraX1PatPazJCz/Ar/hrdOjt0oB6ddz70M/HpRYeIF1qmxczWKdUIp
	 TRK8MUelp9bIO6kOMgnMGNDLKkAhBEe1EoI8nhTWeYws/gCCBxzl7BkjmCOJsF04o7iL8
	 gtfRaSUUa+GqOUuHPeLAwJl7VL3QHA7WR/hMx0SwKb8JC8VIe222ga6Enufyxc4yAjtfN
	 Sw7ro+4pTw4okubLE0G6R5atU47oaE1LuzrxiuEzKnhK9LtI6KlnbrjfrDth2vs39qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WL4kP6bM;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA9E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WL4kP6bM
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so2356547a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795418997; x=1796023797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
        b=WL4kP6bM2raCQljHU/wXFMSLVTBfGCh04rRukYmX4M2OUmGUw66pqbEdwgY5RX9YIs
         z+I57ja0QCaZ+QirZilREJEWN5Ed1YEGZp33Rmsb35AEzvXDAUr3/9aiAFMdXSrvREnH
         1GcZchA0DLN2j1/FS2Bd6AgIBqsPUC4eX+ryw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418997; x=1796023797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
        b=T8Po6Mxkhl1/aBx95ghjDa8StH9BD9b4kUU7uuJwaLHWU/QGojAWs7xsvCjNN8aHpE
         ZOXOxmvpz4Pvg/7japQ1SUJVzYeKw5FoSE4ohppHoKsfoWnLokbC+s4Z8k79re3sYIC0
         uRU9jE9skrtjGD2dYN0nYKk2le4Qqu0+8Dwhpq9S5eS6vrjSI1jwihLF32d+x5Y4q2iq
         h6W8pVHSKBJWkI0Wdx6JT1U8hrzDU3v3UBoNlVZ7J8UjX1mh24Ok9NxU3OTkRQGgEZWt
         wVGXIs3McGM+sFIljR7iZkraYq6vx7NfsS1JYKn5pq4ggL75IB8os/KxWTYoVghuM7uc
         vFuA==
X-Forwarded-Encrypted: i=1; AL+hErHS35OP1qQpHvDTAcbByuVFWtjIMzbMsCoIoN9sPpYYXRcdZQT/HYmsO7HF5JO7l2yw4p5sC7IZRnK9xAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bZe6Dujui3+Y47elJQes36sw1xnTX5oHId8EayHbwKtYAiT/a
	SxXxDXYGyY9JtzIc8k9iZvLWkDQhN9vNR4Cr4JndGZ5u3LMB3lSDHpAQeJ2oBfwYOQ==
X-Gm-Gg: AZFdTZfhKcC1Ji13QjRfhXvCKnjs9xl+AQXO9TLkyIcVTSxWbrISmaqI5mVHbZuIMxl
	zGKnDPgmHUXmx2Z/5A75woM7fUmqjhAerAze+2fSXVUx7bCpahLq6bH9ezFxZohF2Jp8pUN4JJD
	3AjSAqifZ9S7MG/lqXPsoRFNhUenJzm2AatzCWurFSZCWKG5/OA4zRvwv+1Uc3qu955hPfjnAWY
	VX1p6Wk+RgibyKfnHToPPQ5P1LthYkJcFlORLM5eX00d7Eq2tzbi9uS9jnyLMFAEEQIIINiHyDe
	9rCzKCXkRjXKbzRxjaODQp54cOchewUGFL/TWIYaCNl6wzK6pqCsL7WMa34CLJM+38T6jI9s2n9
	n1YZL5Yv7kzIEXSWaywK6t4o6vIEO2K/3Hd4qy2JrwvZ09pN1D91AUYGYZhWhK8T4kWDCYf9eY5
	56U0ZjmW8XxvzH5p7Q0Sx0mGuGF2XvZcPXCF4r7rQlLVV/DOovOq4Nam9CJxoJvaANIpDITfZ1B
	qqhOYOfVMqX82MSKWORBBSQoXUjy2sP6Cvj0lx4UTxFyId8dgr84LNsuFQJHeqfkCs5ofDUN0IB
	2/jOJWA0/s9l+rRQPDXBP1wT9cg7rxPdPrXCsiDqeWlGN1cYn8vWTkoUjMau3g==
X-Received: by 2002:a17:90b:4b:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b41c9ba0e4mr9010636a91.64.1795418996993;
        Sun, 22 Nov 2026 23:29:56 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:ceb5:5e59:832f:d16b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41adcafe0sm17780221a91.16.2026.11.22.23.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:29:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH RESEND] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
Date: Mon, 23 Nov 2026 15:29:50 +0800
Message-ID: <20261123072951.2239442-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
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

The recent size_t format string fix for exynos DRM driver left the "0x"
prefix in front of "%pad" format around. Since the pointer format output
already provides "0x" prefix, this ends up adding an extra prefix.

Drop the redundant "0x" prefix".

Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 0208c9259572..acb8def747de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
 			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
-- 
2.56.1.831.g720f3f5937-goog

