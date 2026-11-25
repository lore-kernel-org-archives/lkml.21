Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609309;
	b=Atho2hIPpVY5j0atIK9qjNExGhuCgXH3cjIU8MITYSmpoJPuMZREvrrIlO3sSOC5wG5n
	 RdvmqlQj0wKm6lKAv6gwMRYefRPC69ZshvhYtW2nLT0fHxcbDO5+NU9X9L7F7S4ZjQ6lA
	 i5CuMk90OQgBqg86iFB9C6tEjEGjA7m9K9q6PO85ZHo71yWo8UMothcaFK83n5CnMBkAn
	 15T2IMQddetYyI6TwYfxX0yXCpBbrtkrWSW5FUY99hEg+ebQhLnRbzi9PCf9uivAL/QPa
	 oJHT5J/hbKS3BntNNgblna/QhKkvLlzu4k4WyRvInWjlUiGsClg8aeKHQ8927DcNaPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
	b=QGuY4OgfE5HjeMzqcsCP/WtjM3Ui3OVowARmKW7dMjiCGO7L9DzQReMjlBRe+br1QugT
	 KyZ0N26h+hvEd+vc0PCy4fLvV7QxpQrH1osudaZ6X5COT0TecOLPAuD6J/Pl4b27thdWI
	 4fPQdPxsAeouOnun19VmfDeDSaOQnJOCYYNAsedX+6uPtpW5EU8cpsbh06Yi5pGMvWgKY
	 mpmZkMnPZn8GmtqCU8hSr4eqLu3PRHt944G296bupNvjYvgnVtjzCvVgK2r2AxEUk8Awi
	 YvcbRw3KtfmX+5B31sWdGnGxrQria5YahI49qTl1IaG0B1xejTxEBc/NNzxyhq2U4GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM6xYQfQ;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D91606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D91606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM6xYQfQ
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so2458245b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609308; x=1796214108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=PM6xYQfQ2bv5S6/aUWy15pAS0YgjizNeZ2yOut8L7JnpDlx5l0uhRn8soQHRl+Kirh
         vaSen6Yf0u5+pJY0bhwfyZ1lhP+w7Wo2FgjhElJR+Z5qhomy1HSrQCxNVlig+f19KAGE
         9f0zbmVxYogXcXSOtNlAlxWlQ2xhXgh2GQTIl3PI75adOR0bKyB1SaotAb3xiOUKv4Y9
         5i+OvcRerR3GS8zTexc8LVF6pC9BtgvcjMEjPBa+rXXySYju5k+gde8jN0KeSIZPmHc1
         XgTc8wfyAZtDbOSB+hbdPVqERdmvVRPRd04jTMtDBr1hmGMp/n7ox87VzYhXC0OF49qj
         5oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609308; x=1796214108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeByhJ3BHvo/2jRdQJQGFglqWfC3P53F7bznOhuKwO4=;
        b=nAGhA1aRFqr0ELrldgfN9ADekJ2yF1l+ObaXBgFiZJxKnGEuhBHVqF0pRDFQhY8yfo
         uRfDJr1Ot7WTVAJTfNJi+AsnktI6PzREIF80SWiJt8MTOSSghA1/YutNAmmEKiTas+c/
         CxOEAbQBnx5jpVqZJcCJ58Bo2+mYwwAWdpgh1laFoN2KJ1Jm3iTT8Ycip9tmvWC8nE6a
         yr+ppNjJEngc8Qa+6O2F2aeIIRdBfeEcIj2OPyQOIaMB3DXpyH/VCawlaExUmDzW96pX
         fA2l9bX/tWOByF/qsKKQ6PleU8wtterswbqyl0OgQPucIUUPy4hicQVo+/tmF0XkA/Dy
         Mqvw==
X-Forwarded-Encrypted: i=1; AL+hErE1mmkfNbbSX0+JgpqTisN22hf0B6K/BkK6NHNCYdsakIxIoWE4DJeiDVHPGdFNNdDS6LFOHOClPLV1Aus=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TvAVsKpPRcGFIKol8N8UN6TsdzX6W1PJ+84KGLeoy8laNJutf
	KKHnyncGhF6W2bdWB31UEgU5l8AU7sBQ2gD3IZfldC8EuY5z+7maFZSd
X-Gm-Gg: AZFdTZfZZWlMZapn8/rb7Kl4GB6hHZWS+QcSaSHic0RUOUpHGWyDA7XN4AcKk71dJuF
	OX3SZOx5ErH3LhE6XRGsqzWdzaFYUtzSA11O8sspUgBG85pv9FiJzoUruw+8uSIUyPRBwQyDoKp
	mnz89DIC4h9ON6Jijgk2/mmlPes3/w1dkiB6PbrHv9qcLxjTh6NhqHME7sPSlIUP9rl6EAMzB1E
	ZOl2DVugE+FHzI3Lw/djJytptoOb0EYD8fUMm7U3UnHcHob40uPsr3RSQGfEaHmNYAGgPYgzUgo
	r86Sei1zFcCnXTcmE1bHSq3YRt+DwWpC3LPnI534ZeLoZb+pTKuFnl7iyB16WvzbSSd5m4wr/HT
	W3jTmbAUfZ1+JCY1mPQpzqhU49nUCcHPkMUIxANpaWTyKqyHaervWlf41wkmpPfC0pd6+ondjvo
	+NUGdHZv2Armlt6q4pl5vTCe8gVrQmIFLqdWi8BOEkImS6qA+zPOE0uXiSXlwEv+GiKW8RPQMw3
	yoO/9J/MV7qCuc31JzYioxC7gIhA6IvbpIzllyb2HvwDwvdDU6fW6x7SBYEDMO9qu1lvzwEL1io
	hk1BSEG8k9KJf+GCrJUNE5s52E7fbLQR6M4vm5tMDl1ti4uY/zYe2eg=
X-Received: by 2002:a05:6a00:94d8:b0:8a3:7425:9095 with SMTP id d2e1a72fcca58-8c8794b8c2bmr16410566b3a.7.1795609308579;
        Wed, 25 Nov 2026 04:21:48 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:47 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
Date: Wed, 25 Nov 2026 20:21:34 +0800
Message-Id: <20261125122135.44696-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125122135.44696-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
 <20261125122135.44696-1-leeonion.muyu@gmail.com>
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

ebu_dma_start() maps the data buffer for every page transfer but
only unmaps it on the error path.  Successful transfers thus leak
the mapping, which accumulates IOVA space on IOMMU systems and
skips any cache maintenance the unmap would perform on
non-coherent platforms.  The error path has two more problems:
when the mapping itself fails it jumps to the unmap with an
invalid dma address, and the unmap is performed with
ebu_host->dev instead of the dma_dev device the buffer was
mapped with.

Return directly when the mapping fails, and unmap with dma_dev on
both the success and the error paths.

Fixes: 0b1039f016e8a ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 1f493fb426d6..5eff8d7522d4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -312,8 +312,7 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 	buf_dma = dma_map_single(dma_dev, (void *)buf, len, dir);
 	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(ebu_host->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto err_unmap;
+		return -EIO;
 	}
 
 	tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
@@ -346,10 +345,12 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
 		goto err_unmap;
 	}
 
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
+
 	return 0;
 
 err_unmap:
-	dma_unmap_single(ebu_host->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return ret;
 }
-- 
2.34.1

