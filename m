Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455514;
	b=d1q2OcRMsbXtovGlN8n0VcRrlRGSb+a3xR5yLzOcNTCs96eIC7N5fqHLrNO31ezg64d/
	 L7fI9rcF8k1HtgCztnVrO3tPOlFoF/nrXZPY0Itq0SCmXV9NA4So4H6uCT4xObMv7dnLn
	 PUklbM+Mmzj0D2x7nlGtuAnF9qPbO0JZjtj3UyvS+N1jAhA44iJr85e9TvhxkCwhRqluq
	 krowaNJbjOWQ/w8VCbPOhrV+0MAUxVPFinuvqrctacvucPV1qXetARIk5FC5CPe9dNwsb
	 vVIhaYVBSPTepsb62WtjZCq86FRKcLrPZxZVCyeNt2wYdRMb181a3hZVN6KQo+xYLxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BJZ+KLFwQKJORUEnL7olp7+hUEKSDgbtWPcHzvhSW48=;
	b=FTbqxBjlkszYHZm3/dwGxkVuoUZkkJnBAnkIMGxP5/JU2a9L49UeXRQ7bA9b4SD+Ymhi
	 8JUoLGGUWPJYXopd4YccAZ4tY5RNbmDl0w9Mxqsxvzspl8TaQv+/K+oPGgCoeVLf1JjwO
	 h8+9MAqgwDE4yBJRSm8zvtAr3AoTozMVY7LBmJR+vH0H9SmigIpErQ8XrFJPuukkhJydP
	 x/pByWHs84rUGC4jyfh5epYJzTwOp9Qw1Rs7e7YBsqrHvyjE8KbXESnHaQeG8cj/axDwC
	 TrbaDBg/l24VK9P/DjAdpiNWL3oEZe875FWABn+10pDKBUo86KvAXAh95o4uZmCa+zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIJ2KkFR;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4262D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIJ2KkFR
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6083258c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455513; x=1796060313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJZ+KLFwQKJORUEnL7olp7+hUEKSDgbtWPcHzvhSW48=;
        b=rIJ2KkFRI3Ppa/Fl5E0B/Vbvy5EZyv/AI3BINdEoM0fbCloD+1jEU/D+Hly8km6Gec
         hslLACvSLtxHFTngZTSwIGZ/GJE5tolZTGqWkW8aXw0Ol4Rl1hrj857BtdNPoSV0tzcG
         pNj+JFHb7QTgiMy1ibHRVh/bN4S5xqYyPuHVvp6D3IfRKMHOpGTExR8ml4PAcFWXGBkS
         2tHYs0QPJEvdLn8uyzc226LghlAz/Lt9ZkbXBXaRTm/P4+gHOGJ3bJc48a2YcK/qFHm8
         pw/Hov7zp5ZCXKVJ62NQdANHHzb495PUtANbBs8lFdwzYCfOae4i+QLWs5GF1zvW7mPm
         yaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455513; x=1796060313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJZ+KLFwQKJORUEnL7olp7+hUEKSDgbtWPcHzvhSW48=;
        b=IoWHb2pMag0fR+W3cBXDaHtbWzRFiFjuJMJsspi7IJnNJ7sqT9QnxGtLRsVp/MP12S
         DLN/y3qXRxnnB2V7XDHsOiZ38CbGGaIK+YkyN6OBgPEvyIkZcqgNZOYapjok9UuDfvDX
         YpNM+QeADVydAD4JE23D6Sd+kG+Dk4oVkajPbPXAesPoR/FBQJlgqzYHnLp8CYQpUNoU
         QPzlOhQXAoykOMqjNnLtTPk/feRPf+v5SGiaytBVXizumhxNtvJUbZTTPwZqiDvu18I6
         9gNI0swnElvdELOZ6eqGtsoxpA4FtHsJh9d9IpJdLM0GKq0VWmDp5kQQ6tLbUUQhTp+P
         h2Zw==
X-Forwarded-Encrypted: i=1; AL+hErHTJzQPQ8Roj6YtgUIPlseNyPtyOAy8IKG0j+n9OzxXsMY2EJXoWSlhslDIKkcNU/5NABX5v+E+9uWvCrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vQQbYHRAZviU/MR6JqQCyWiMw6hTqs6yqkSXGN/Jfxrw45Zpq
	KpryQhsOx9nbmIRX+wC78PEnUjoDx5UD053SX+jzBI5j4aC2QZMqSQQ=
X-Gm-Gg: AZFdTZfeArdmfr87q+/CrotE/nwsJqV1P1Bnx+LymeeqHYdogw8MqwFohgSyCLpV3sm
	HwZns9nwrZ8hsJRBVnI+9OxBDRAVIUY+S9hF3/g60M4EiYjZuJHckZ99G2V6iJ+TyUb/BpGBcAg
	RI6ktZjmvFHxauVK2PbeNeIexpiXFBq5F7TVbKWdtk5PlJGG6qSUTaTWP/CWYP/M867ocFBLt+U
	etZMPq9WUsh/gpyDDTsfDWPI60ok70BKF8Ak38EQf2BhyAl3Bw6ndN+CSQbqi2WExhHzzKSfG2o
	EY8ta3xfp8QMy/ggbZJlNKtBvJfOgWR6tGufFpPDRruvQ7RtyLvfIZDyTz2EjBtrEvZHKSnLGU7
	i5E9C6VzAlxCwUK/FUsYbaS90vYv4w6ogCBA3Pt2wr3fiDqPMSnDq94YzrTK1KGfcpRuTcmn2Ay
	/tld6eKAhm3Qr5XzlLbgRTKeyQaX8iSQ9Mi0W171TTs0+xSYYpUCUC6Rj9irPC/JfS7dH4NdYKm
	RccAA0iskZep9/cU/SMs3U2OFhiQXkYkp5tbvccwrX2LRmHbDqrsjLVjGHLtza2zagNEW52YG6U
	PF+4MwHS8YM/k42MyBc1P4BW9OUm88cJ6KYflgGUSXTM3s4CpeN0QRpYlMHbZvzkPCfZ
X-Received: by 2002:a05:701b:4512:10b0:1a6:7a2:cfc3 with SMTP id a92af1059eb24-1b558384c4fmr12399774c88.13.1795455513392;
        Mon, 23 Nov 2026 09:38:33 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:7883:5066:4773:c572])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm30788357c88.5.2026.11.23.09.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 09:38:33 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-kernel@vger.kernel.org,
	Miles Krause <mileskrause5200@gmail.com>
Subject: [PATCH] memory: emif: Put the DDR node on probe failure
Date: Tue, 24 Nov 2026 01:38:28 +0800
Message-ID: <confirmed-20261105-11-5d830ffabcd8@gmail.com>
X-Mailer: git-send-email 2.50.1
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

of_get_memory_device_details() returns an emif_data holding a reference
to the DDR device node. Although the helper's failures and emif_remove()
now release that reference, emif_probe() still leaks it when mapping the
registers, obtaining the IRQ, or setting up the interrupts fails.

Route those three failures through an of_node_put() before returning.
Keep the existing path for failures to obtain the device details, which
have already handled their node reference. The non-DT path is safe too,
since its zero-initialized np_ddr remains NULL.

Fixes: e6b42eb6a66c ("memory: emif: add device tree support to emif driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/memory/emif.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/memory/emif.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 886c2ca0dc19d4388feb6f8670aa6cd579e426b0..68b12528968fd1b8db310d51a008f6abdfd75718 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -1106,18 +1106,18 @@ static int emif_probe(struct platform_device *pdev)
 
 	emif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(emif->base))
-		goto error;
+		goto put_node;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		goto error;
+		goto put_node;
 
 	emif_onetime_settings(emif);
 	emif_debugfs_init(emif);
 	disable_and_clear_all_interrupts(emif);
 	ret = setup_interrupts(emif, irq);
 	if (ret)
-		goto error;
+		goto put_node;
 
 	/* One-time actions taken on probing the first device */
 	if (!emif1) {
@@ -1134,6 +1134,8 @@ static int emif_probe(struct platform_device *pdev)
 		__func__, emif->base, irq);
 
 	return 0;
+put_node:
+	of_node_put(emif->np_ddr);
 error:
 	return -ENODEV;
 }

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
