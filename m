Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053298;
	b=VcrUXc2rIjU5QI6nlqPrnCULfRpnC/QCHYkiqAkhptf91qT4+Z7Z6K9zzQYOhlGqyDWm
	 vwyadJXiZjuNBUnLP6n3GkYfkbwnjkHcdrC5Sxj84V8J3oCDEjcqPyWlEKeHnkX2FOwwH
	 SO3jujgf/ndG2OL0xfqHNhVcz2zctSVxV7MljYv5Pg3Q61xDjRqO0kXx+nAhk2wFsWrsj
	 Hrk/TZ1mLhd8GDY0mbihRett4EpG02lgtjQYKZpjq80nL8zcD4/GIP10c6d6HFMxD/ZKs
	 R1/1GYTjaA5IOM1y3u4k3MfEITermUb3gMWfJFm5D8QS7PeO7gjJGG9sIJAEcjCfiBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
	b=SmmodfQVcSM9LlCqRvdyggjmBEYtinmxYar8EB8dhLbw5yq1QMHJ+t431/zpfQalrIYm
	 9/4NW7Rv2am6LZtxy78iX0gJShbHqgE0RXkW82VSy2NBBahN980vrZR8Pekc6Gx3l8W43
	 PZmw/0sd3b883Agr/2am/l5KQdwSXg8OhY4OnKsXsRIQPp0Qc6v/JZfE2DvC+ngTs+HZY
	 ATd1f8XqSwJ04ZRExjAE4cPDCrq8oJWcQJLhx+fJwYNrmIxuaDdKREV54MaAQJ/wm9uqV
	 GZItD2fACvmR1PJHIu0Kd4oaPZq3zPiHVG9/YOCma8ALZnAdZQZMuIJJFPDVDuJusRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nltqhrd0;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57EB60A2607
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E57EB60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nltqhrd0
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cddff772fffso587438a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053296; x=1795658096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=nltqhrd0MMDZ7546deiSsw2uwq42t4c3i4uOD0uXOHy2rm2POJCcz0TxFstDHvoHpM
         /7crJUPoUAefBTJsrcZgBfnDlE7lNpDD/qTTwId33wMljgUFI61lnGlVDcLB1YofRILd
         FQUNgnLEgmL3uaUgOIGiu24veyJztsWw/OMqkQbHz8X5G+bHP8OojWbSlR/cjnoU1va1
         4cXxRINSVIrjwcRrrdxFNK2+yD0MrGLpdL6QMQ4MqtQO6GuTvicIdWLHmnun1fGBX/b1
         aQHourZFOB3X7BBJZbioOFbRdaH/AxGZg7lUk+4G+UF4GQxmu5WqJa1nDWRqIOXzCj7q
         qcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053296; x=1795658096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDoAWY11ZCr0ihHoFalCpChIz8Et8oFGy4RrYPRx3SQ=;
        b=J/mutHzaQjMy7+80njxrfX3NHvWkigAj9HeGWnQ5TerBmu35WTdvwMvO2C3OQjHE1+
         Da5PbdgXAR+Yj3S/c6uEut3V2Ah64KkpJBo+OaPWDcO6n8pqS+TyPHwmlX8BRWZM1dR2
         9KuNME+OM/Hc7asJ4HC8pdWFKZMLUmxmTjfnSPXuDL2N1uNvmbp+5l7K7WqlNdg0atY8
         eNRd0ObiSyRx+H3FMg8dqPlojsHT8C7GFiMOhjfSJSHNu46KMheBOatdHlhQ/VBx93Gn
         fkGBNPbuKNXtY7s9VV7zouey5FA+YfMAvYUC8RCyXS6WDmTpRXAIRAaJUGFTHXGt8/5q
         slUg==
X-Forwarded-Encrypted: i=1; AL+hErHA0uwPTTULIfSYB2vXxDKrqDuo/zzA1iA6apauWfNhsPR5dVnNCuIISEfeWnfPiAZotPdWviTouAikyKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/yBpC2ff3nMbHJIp0YtEe/ZrkTvy2lsREz6ERcnEvv5cQfNji
	VWSA1yrkSq+LJXPE9lgX9mYcc5oY083ev0OtVUFpmX7McUN0mT6DxG5m
X-Gm-Gg: AZFdTZc2Drmk/cxl/+CwjTu4aUPZZXTLhX7nAQXCW6V7rEb+94NpLdJZztNu7vYDfkY
	qEZT+S2zjJtPQ2CAGzZ1uH3oEkZMvxcnyDDmYvP0K+++q7fQXRy65MCnwHGF0ObkRk0dCWQeR7F
	P9ThAp3CDh4iyfG+0JiJH1ZILl4kRHX/v6UXoozVrPSAP2oSxxLBuEasJGXFAjDsQM0viZzifkb
	ePuqtEKZFFcfWQptY5qFMryDdptQxz9NbWmGNwUKNAYbghHPBxleY/AIY1e3LA+5d+JkqeqDiMc
	8tFsixxuSvC9rKU0MWvx96M8ytQzJHlfAfoW3JnbKyrJKAKkcp2lSX88rcmt3rCYa0FzlcMAeku
	N2lgwCGGL/ITs6Icr5ulxz9UFOiO6HCBkWvjcCMWagablJiBeqql1wHqKPPo5xwJRhexbbddTVT
	1cpg0BPMWeBeXYWLb/HI7bn41x7XI1zn8UGadZ9Fjb7hfX5RwF+w2zhSUwS62EvSk82R6pndGxj
	/5j04OPYLr8zBBHK2J/WXwzBvua1qA+samO7gY7aqxvCvSKF4aaMaTNy1PfPZ/MAOh99OfARnwH
	PEZ5Z/NWNvvaPIwHRXB2LgGnxNZPtDLzuOtHNscjH+sBTDQ0pA3X6arLgBq8Kvfn5yNR9/4CFEg
	DLtwM67j/8gVnS/SRGDG5Hh/PB01WMnyNSNo0
X-Received: by 2002:a17:90b:2ec7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b3d07a85e6mr4560280a91.29.1795053296137;
        Wed, 18 Nov 2026 17:54:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe03c3d4sm773081a91.14.2026.11.18.17.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:54:55 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Date: Thu, 19 Nov 2026 09:54:45 +0800
Message-Id: <20261119015447.160470-1-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series adds the PDMA controller driver and DT binding for the
Nuvoton MA35D1 SoC.

The driver supports memory-to-memory, slave scatter-gather and cyclic
transfers.

Tested on the MA35D1 SOM board with Linux v7.4-rc3:
 - memory-to-memory with dmatest (2000 iterations of 1MB buffers, no failures)
 - slave scatter-gather with a local (not yet submitted) QSPI patch
 - cyclic slave with a local (not yet submitted) I2S patch

Changes in v3:
 - Use dma_alloc_coherent() for the hardware SG table instead of
   kzalloc() + dma_map_single(); defer descriptor free in terminate_all().
 - Rename ma35d1_desc_submit() to ma35d1_desc_prep_done(); prep() only
   prepares the descriptor.
 - Rewrite the IRQ handler: read and ack TDSTS/ABTSTS once, then iterate
   the set bits.
 - Address issue identified by Sashiko AI review:
   - Terminate the descriptor with vchan_terminate_vdesc() when a cyclic
     transfer is aborted, avoiding a use-after-free in vchan_complete().
 - Request the IRQ after the DMA device is registered.
 - Use devm_of_dma_controller_register() and
   dmaenginem_async_device_register(), and drop remove(); a devm action
   stops the hardware and kills the tasklets.

Changes in v2:
 - Address issues identified by Sashiko AI review:
   - Program registers on descriptor start instead of prep.
   - Fix interrupt completion handling and return IRQ_NONE when idle.
   - Set PDMA_TBINTDIS on intermediate memcpy chunks.
   - Validate scatter-gather lengths and bus width alignment.
   - Fix channel request assignment in of_xlate().
   - Safe controller teardown order in remove().
   - Drop peripheral timeout support to simplify driver.
 - binding: describe the hardware in the description, and drop
   dma-channels and the dt-bindings header.
 - Use a fixed number of 10 channels and trim the includes.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>

Shan-Chun Hung (2):
  dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
  dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver

 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  71 ++
 drivers/dma/Kconfig                           |  12 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/ma35d1-pdma.c                     | 662 ++++++++++++++++++
 4 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 drivers/dma/ma35d1-pdma.c

-- 
2.25.1

