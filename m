Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223487;
	b=QSMDvec2I69JT2VGFbtuuCvZBrOZcYjjO4aYP7STsddRmXy3NwCDybncJYq8Ub+wYMSR
	 hjkhNPDepp/UWWTIUwAIgmyFrbq6cBrGcIpKTyOps7Ojtffx08VqHEUX+y4Zn239D4hBi
	 FDNqO4crCoBrPHbEEb1xgYWi09Qd/xro9fvQ5f6xEOivnte0Gd4ED0NWTEGPyjLZSB2ep
	 49U9UJBWXpCHsTHG0enOCpZNdrSC3wENAqMPlRXNLfPOeGSLwVu6KunUYZobl8Tmwh1XZ
	 Yjh6r3FJs83Zbnw3XPZsIFsns53TmZ5IqHiNOZyxTo7OJCHmwgnHzOt4d6quT09/cgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
	b=mPwuSpTnnMBGnLmt83Mt0R27phU7Ohyp8iTuyFjXnbdbDA4zbuvz8yK7zlMrCeIxugco
	 GRGG1pFblmhx8fsFiw0Wx12/v1yqAc19mIWjVj25f+qniUZwSqpwRe+o0TI64/dGu1ZLQ
	 hCpTJ1ZRHhYIo5P9hHfVsivPn03TyC/HXnk4JqA/IKhJMBiT+lgG6GpGawnprbAfaRxoL
	 CrXS2JV/9ntk8JbRpcSnM4fGc7kxim+JsMQdiETzepwvTC5RMp6gpP+TWqjhpGsPwDxAs
	 SRE051YbWQpmpA96c4ZIYI/4K/8nxNY8gILvdCk1CAFEsOMgmPk2wjUXRWqLwwhvN9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVHIq2XC;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA54606ACF0
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA54606ACF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVHIq2XC
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4c5d8c7f326so664233b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223485; x=1795828285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=mVHIq2XCT3WjrztVHPg8vVCUXUbHdEH/1VKb6z41SGdHKRI/p7AoWxyd4YNFXbmB9h
         Ay3uBvXx13gcG22PjCEtn+T2KwPRFMyvSa1upNHBvd1br+dgNTyhghWEg4pUe48upORR
         zavCPtmvytHTLnrhlUiITak/ZligpZJE7TGkm5DeIMsG3Xugn/VublR8Q0Nx2gW05l+3
         tF34RajjMtUi/DdRHD/wm/QS57f8qsLnBZKZEVX6wKsB+s0g6pzmQ54IW9A/Tmr/8ZiM
         /Zv30Ad11tzAn2GAumq902v2ZT0WPdPWxnzAgjhJYxZY/1ZmGrVaIYR2AvEqM/puYtkv
         VKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223485; x=1795828285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=LtWM+ZNyA6o7ANRCblIVe2hPOM0Tjo690ow6WqqJUOTFFnrGMMZ2QqNG6KLAtsmOte
         DdoaXhelq0meb7WsN/26GsvCOVgQB3zhyTWRjNJeMI/Z01sgxmMzFAp7geus34lif0nl
         HfCKGLOko7g29e9ij2BPlJVTfNeOewu8cqRuAahDzdEZd8+JFCzFcIaOO8KXY8nalXd5
         rpx9B/PplxlIv25g8Ux1aHpHGPvf+nB+ymHfuBIa2iFcCP81C6V3FQuPGNvJeAizBzng
         lZShQtBGF5QluwnIeL1RWX3vMPFDRDxVMHt5BQJHFzKO4w/ibciTOjBs9mzdRveUCFKg
         pdnA==
X-Forwarded-Encrypted: i=1; AL+hErEMmH6ArgrpKMkKW8LGZdf4qCruD/nZ/VqlGO0ho0kqvN/SGVN+ZcNAXz7EC4qK5Hqf2oLkS1fJYnZ+3uI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8erR06ViZQ08cjiOQe0nliE/3N2KsBq7P7BhnIbN4joH8mQsSi
	W3hQY94SBTQjyNTVXfHq/nhsgMfMskzS5I5/CzgbrZaTrs34SlehvOqf
X-Gm-Gg: AYBFou24qV6vf55WPChaZmnq/RDuoo4Je6GwTBR4APhEAi/khS906R3zo75cRwqKUm8
	vHwQGxnUU7sDO9VoZwo9xKm7f/K0vnBHEL4q3e3/aYq3LqngJCrVh0KRIY7S6B1H8hc9BoyvKix
	QTam1NpAWVT3ITT9lqyB8XloaQNWaiCnJ4g9o4b73dPZoh4stpfcaZe75CSo9kxPTILsYyYPRdx
	oRH/1kyUwOI59YbVCG26r+l57gYcgV96tfiQtvBAhP5Bmec9VfH2TzPVpP1UukszaLwP7zGZQpg
	w9juJZq+WmS8ctxyVlf8ppY8GiVlsjbEsIn6lU25sFbAl5exl/z+ePNSYugLSrlq5SwZW2Fp7En
	6AtzwuqNjBPAqZFsP4vbMn4QveNkOGIpf1wkNmbjIOZBDky3yI0ZZQrjuFTMkNUbESd7gt7Ozuv
	VTLrSTTpXz5dXUtriqSpFMOFEkXB5YgQRMxPGoRNf6KNc9gfUfCqNIowr80ihB4mQ2p/9dStOnI
	43Z1PWuHTxacWZiyhrwvpB9Lyn18AXedepZClSKRfEEchWNrqNDTkIY0ylNN3tdYxVFG+2Siupy
	t5GzcdRePf+FaHLSOEA4oCdpYTlK6CIkNHFwtF2FSSHHkV5PqK+Yxz+w4+bBGfRnArrf+fiA7VX
	V0+Top/or1PzceBNUXl1BhACps1k4o/wvG/bpMBp53PtcZEGLKrB6nyRObsZEI0bGyCzuqyrpHd
	cMZECAcWN36y6BvI/iAJbmqVwQoVtRXQ0BT6JkYCmQ3hxmgE1EdOxl
X-Received: by 2002:a05:6808:1915:b0:4f7:867a:1136 with SMTP id 5614622812f47-57a0c7bef2emr6229820b6e.64.1795223484984;
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:44 -0700
Subject: [PATCH v11 21/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-21-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

A disabled NAND child can prevent usable chips on the same controller
from appearing if there is no chip at its address. The driver scans
every child, even those marked disabled or reserved, and aborts probe
on a scan failure. If the chip does respond, it is registered despite
being marked unavailable.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4478189bf920..73d6cd89ca19 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2661,7 +2661,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0

