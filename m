Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413041;
	b=2S3CNHLasqvW2wlI/fRWNESba5FyX0t99eNL4lYUwEUpaN4MhH1tOFwukVWqL5Vpj611
	 ufDaVnnrVESGRJM6mJ5rk1K69+8ESYaTzu81JcDHXrE9Z1MPhBYIGYnV24dR1aiPGAijO
	 p1IdfhlH1JLk5GUvwS+UdZyJjZgXial54+Mh0ERPclV3RmZe2Ba9ytFbkTbpbEz6YmbOG
	 x6ExCl3hctEESjXnZJemHYKffwcq/yMdjZCFA7J4tC6t6Xj+eH7ehFbkohKmT8TYfhWBb
	 L9kfn14LoISYK4e4tqO0B3iCMT9XkI169xRBRih49z3x0LoQl87ChqRf4Ig+rZZhueQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HR0Dd+TxnAvS5t/91qDunpc4NaqeZo8qOOp6rPSIZkU=;
	b=eqHQoubApQlH+QnAbvOjC8CuuZ8ScUEn3pPLWx2N5uM4u0OrkG+Pu60mJFX7yNrE8R+W
	 3yLitspfN2Ezi6l+2AdIGh7KJHcE2jFRAvOKLob+miqEgc0981OG7Asre+LfE8d72+i5V
	 A4DQMHjPZzEQ14RlcQDCoMF78qOY2IH8oYHoHXze4uv1O3vcF7wozkdIZ+i1jehhLIUdX
	 Zrn9jh8CxQXEBOuuPxB7AFESdUcGJCKuhBoiNSk6SL/uNR075vhNf2DOSSxLeAlp9LGge
	 wzi1R17ROYw/Nj1F6tF3V/k9yJfADDLfWnubEt2lfP7iqc1zlkNbfJleQvhsfZ+H2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGXNz9SZ;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D1606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3D1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGXNz9SZ
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0918f9e6cso2014085ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413041; x=1796017841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR0Dd+TxnAvS5t/91qDunpc4NaqeZo8qOOp6rPSIZkU=;
        b=PGXNz9SZZyAI46FDniVAHw0xpNrSbQIW1r+a7EUEYmIofN1ojYSVjWulMft0YedNiF
         Afmbex1Ax+TS/3yb++3PiySsbD13Z/ie7bRwD6180c76s6bRryBTSYCGySTmHV8qEg3x
         kM3XZ9I8rpwLIrKODsmhq9WDCxSsnPJH0Vy51JqbDEGq+LHq6acerCDcD4V7FO93B20l
         ie4e7qH/R3P2pzK3zLEq7MnHLSyasmymN/4Ix3LtfrV320VWMS2YhVRHm5q9BL5K43J2
         E8Hd/bgVocZCqE6BNdY3O1+91tQjbw3qmRgv74cqACRK5jD/Wka9OZRpoyjGwcuPNlQt
         hREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413041; x=1796017841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HR0Dd+TxnAvS5t/91qDunpc4NaqeZo8qOOp6rPSIZkU=;
        b=YJABOvmUA0O1Rxx5z/HySr07d9pJTc7PebZOOlPN6GLrsCBwJz4Rqgzm1cxJJltGhi
         X/DuTrdE3BOzkpHEnNxR2u/JgouaJzfA+wpD4TLmIYjJevyj3iGjr1sJXEEZkqcONOl8
         9lwI+MHTejdaq2M1QYWL9l4c4F2mKFNnKX+lYIEU7E3pVtcAI29LpJfOvaMd8ByhP5zF
         4WKEsmaPSZSU8PuGwVAY+omvT0eAC4v63OKKvNNq2ASHrUBXvFcSmmtEBnQ2HbkU5BFX
         TiV6NJzSWpT7E+ryjIE78k9XMmKJLjdlwnKqqNPTc+/W5mSK46DRe72GWaomxNDXKZpN
         ungw==
X-Forwarded-Encrypted: i=1; AL+hErHrnu9RGJNPn0fE/QR4r8gVtuOOlnfs8VplkejhzsQot+8cLo9Mw6G5KF0x/EZi7qlo+AClz2uDVIiEnCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EireiMpqarBKOEo9AOzRVn+PcpHQnc6fmT5MdM2bD9mV/WpNT
	9tbf8RsUnh3qIVCd3WCfMlqjZM6M9tHTGs8iGMLXAIKt6QrSsv4RH7Xs
X-Gm-Gg: AZFdTZemWlevkmA5NxFJj7nCchiKqAyGvyap4lSminrpfNE5IdgQLW6+yY12qgYl4cc
	Hiwb7TLDldSTsidaKeGKGEjWDyvWDy6kMyyRa6AbeFuWj7y3ewxu4FzmKWEpYgu79FZ+tJS7hrz
	Gvtzk4GB1dpD3rZVii24xoh3iy2wqt8i4xojuC5bzzCfQLgTXPrhqguieV9AXCjSsAkRw2LLcHW
	NYPI7j+AQanWErM/jTTFPG43Zyfd7T+1Srj5ZkLQwekxNGNcVRIzlXNjm+wxoOZvwgjv2gdmsNq
	cjEGc7zmAn8026LQdkZ0nOm8N+W2l2NIDAE7E6rfRu+5vp7tLhST42caaT1VN37YDXhMv1mOTFr
	njkT8ZJDkbHmF9CsCITUShVHvfGfHpjlWYjZ1/hINhbhn5GcjUB3Pzst9lOkQ6uEd0fiZrd3Vjk
	tElPYLSl8OVmv1PjD+h18LcovzRUTmG/rnPWUvXcKdvWhvq0EEPNpiq8G9curMKaHHEMkMKtMGE
	XHD8Z0l9owbLeB9bCoaygqpozBHaY5Aymbp1R5TEvpv33bjqM7M9laK9UzwDSPEZ1a0DcmBSpPR
	BDI3xvmKncyPV0cH4HP/Yi6KmOe39Q==
X-Received: by 2002:a17:902:fc84:b0:2f0:3c38:914f with SMTP id d9443c01a7336-2f03f2363aemr95111405ad.45.1795413040663;
        Sun, 22 Nov 2026 21:50:40 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:40 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
Date: Mon, 23 Nov 2026 13:50:20 +0800
Message-Id: <20261123055020.1995251-4-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
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

From: Ping Li <leeonion.muyu@gmail.com>

r852_do_dma() only bounces buffers that are not R852_DMA_LEN
aligned.  An aligned vmalloc'd buffer passes this check and gets
fed to dma_map_single(), which is only valid for linear-map
addresses.  Since the mtdchar MEMREAD/MEMWRITE ioctls allocate
their buffers with kvmalloc(), a heavily fragmented system can
already hand such a buffer to the reader.

Extend the bounce condition with a virt_addr_valid() check so
that non-linear-map buffers go through the existing internal
bounce buffer instead.

Fixes: 83208e106a8e8 ("mtdchar: use kvmalloc() for potentially large allocations")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..4dbfc053fb21 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -188,8 +188,8 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	  from device, for writes first fill the buffer  from memory*/
 	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
 
-	/* if incoming buffer is not page aligned, we should do bounce */
-	if ((unsigned long)buf & (R852_DMA_LEN-1))
+	/* if incoming buffer is not usable for DMA, we should do bounce */
+	if (!virt_addr_valid(buf) || (unsigned long)buf & (R852_DMA_LEN - 1))
 		bounce = 1;
 
 	if (!bounce) {
-- 
2.34.1

