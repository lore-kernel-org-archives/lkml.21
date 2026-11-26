Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700044;
	b=WPd8yEc8Ern+EHTJE/qKFGbwlkcce2NXjpn3IsHHjJ2ghEvlONPxeIPkrv3Pu2fHYMAN
	 A0wpwnlFaqpaUbjfA82IN7It1hFp3pnnCD1mMpSPNeezKYG7l1IMJ0VnBPe06ODSycBKF
	 VO4v0IKIG8z2Vgtbv4/SEn6ZMzn+gzj6OyXiPFUvVV4BOIAE3DGsC9kMSYexy0YB8byPD
	 1P9hm7XJUO9Ov9zWc3JBeIiR+uWTZ4zBRhwlHXU1Lg3F0aa31SuJjaWOel53IYph6Oifr
	 zY2FWACBqu8mvKWUhmsirN1Rt3aYXD4yFBBM8jhQNX28yfFj4TlocfbdcN9x8Igrxng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
	b=bR/LjGNLdNTG9ACRI6lvi6t047Vb0u3yAfXs/FZ7CgWNnPBXQYviXn3bKXdZn/hOcTAN
	 aNNfTbEjMpE1govg8fmkRxMM5F6NuiKigA3KlfJr/pI/cQkPbyccXBG1MqkdVljEtCbuW
	 lkktfbwt/HnbvLfADp2hzcfEfnSlgNFunOniR4Vty0bvfLRLMxJJTqx98pG7iGhYLHeLO
	 70nvJ79gxtV/p0g9VxTCZGbwrb+vlP2HZRlYLeaSIIlnNTBPEggNvyHNENVcyFaPDmJ1C
	 TGIusNZqvrg+TaUsKtTVSPJ5Rad/wKbxBxCzVD2DWRPxVtbw8aR8AG8KeOLf0wOnPcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BybWKAQp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE15606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE15606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BybWKAQp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38431138772so9094210eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700043; x=1796304843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
        b=BybWKAQpzbwGMglWcCTMTQQ4vU6GZudVuWNEatYN+jnwhHbw8KIeR3ODi/AhPsEBJZ
         kFBI8wNNo8qzBHrkFZsQXGowFERZbg1ofsltj+W45ivSDHhU7qDGV0NaolHJVHBaxORw
         5BEe/N8R/JVsdkHDrdRKm8lG9r3qL4g8aZD1S+N2WH2vUOX7hjpyyBHzzbul6EjukMZ0
         OCSvB2rUMMSYC1JVaQ8AI9nyMXJlXdm+9i/YgjCx39+0BOTrBhw+yziLS56UEE+Nfe5M
         kXBb8hru7sdUnfwannE5wYgd57A1Fx6K3gRcCE8JgmntQBoiQOXXuy5ZyUjZJhaxX0d/
         xtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700043; x=1796304843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FsJRBNzOkF5OXCFiCSDbvRkuVUqKiha6GeXyCdWO5k=;
        b=wfSTa2frAwSIV7rYf6BPgm/lrhtvNDeMfZrCcaIbYB2Q2H6O7poS2ZWrq3L1S0LmVO
         3Im0Z6S59wbRHjccjEqqWNLScJHSdkAVYi0WJV7Znfs/J61rvXJaKXbhE2qC2wlg8m/G
         yJzIPhWpOgjpZoPa1TPxCUMyWMg+jfEFBwJmAc25AejtfwExa/RW9rLf8HpPBya03eoF
         jaoraZSbxKMsyYjUfERHop3eJO68eTEV/DLH6o0yn521EASQJnfwKxRmkg/wYbamJFHQ
         IvtBdX+eolBrsFKBmfT1saCp0x249xbwTcvj2PxD0sxGVmpVrIxtrVDI00sXBYqe7GSX
         EGcA==
X-Forwarded-Encrypted: i=1; AL+hErHi1x2nFEQW1DinzGayR7OV+kPACj4hlmpyTssGFd22ZN4ethHlB+DU71Sj6Ddg7BhB1HY04DlndF4teQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z85pAPkIgM5rhnIPEswJofb16oNMuRQhlteFd68S76fl6KTX1ZB
	WmP2TzseOOVDHoGAeIr2wKS0X6jJnO7/DpsdtSeh/cWWRRQivPGSC6M=
X-Gm-Gg: AZFdTZdnCP42bAf+Rka3LyD7P160JUJuxl+CS+0NUWSDAPfUGQDLQA3GgDxENsKJsD8
	9DGwXfhtRae1oGFbKzdQxHA24bYGb5Y1Z05Hu86iNeyXy7KLIasbKbFeHsFFjR49XhlaFU2ht9H
	GtbnLdDd0xp9qqE5fXH4n2xxYndQ7qPhPsqk/8iyUExiZg+cKBIg95SHmJA4WD4UUiTNBhZfwl9
	emKsP8rLUQYL2xHW8oCTS/CbcT8DSQPE8RC9je2nFY3yQ/zfyvTBO/S2S76jroDRl7f2qvyaRqn
	9pCSjMJjSj1sg7fY41TBx/b8IqQVjmfWYRJ+YVxVt7Z++gBhi09ASZoagRYE3UOdWLdj5bUUN9z
	/Ackn+8au9wm085Q4sVC8WHTxazNjsCm39RGUXle6eeg7L2qJGjd/JgcMJpD2GWwBEUIod9vXHI
	TqDY43gwxEYmVqj+TcJ7LFxrYYAg9hBW0VrQCOTgb0XtlMuUOWAS/2gU2Bs+A+FreUIBhjYAy82
	0IVswB7sVeUqeUhbPxjFJa3xixZkdL2ypZ8qxIURLVA0qL7IZfjFHKqOO3ohYM56qspQS092qrl
	XO2udlBJ1rPYe+4U0bb9f5t4kT2anoEDthWYibnNqwUzyKxvnZ5fn8nrbqMhONzS+kE=
X-Received: by 2002:a05:693c:6010:b0:382:105f:e7e with SMTP id 5a478bee46e88-3857170e441mr26340102eec.36.1795700043018;
        Thu, 26 Nov 2026 05:34:03 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm70967222eec.21.2026.11.26.05.34.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:34:02 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Maarten Zanders <maarten@zanders.be>,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: gpmi: fix probe error path when CONFIG_PM=N
Date: Thu, 26 Nov 2026 21:32:39 +0800
Message-ID: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
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

With CONFIG_PM disabled, gpmi_nand_probe() enables the clocks by hand
and gpmi_nand_remove() disables them again, but the probe error path
was not updated to match:

- if gpmi_init() or gpmi_nand_init() fails, exit_nfc_init releases the
  DMA channel but leaves the clocks prepared and enabled, so every
  failed probe attempt adds another enable count;
- if gpmi_enable_clk() fails, the jump to exit_acquire_resources skips
  release_resources(), so the DMA channel taken by acquire_resources()
  is never released.

Disable the clocks in the error path when CONFIG_PM is disabled, and
let a clock enable failure fall through to the runtime PM and DMA
cleanup. Builds with CONFIG_PM=y are unchanged.

Fixes: 1001cc117124 ("mtd: nand: raw: gpmi: fix clocks when CONFIG_PM=N")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_MTD_NAND_GPMI_NAND with CONFIG_PM=y (defconfig, =m) and CONFIG_PM=n (allnoconfig, =y), CONFIG_COMPILE_TEST=y (object only; no new warnings in either).
No hardware or runtime test was performed.
Needs a CONFIG_PM=n kernel on i.MX and a gpmi_init()/gpmi_nand_init() failure (e.g. no NAND chip found) or a clk_prepare_enable() failure in probe.

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 019df54c4bb0..fdfe11439a6c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2806,7 +2806,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	ret = gpmi_enable_clk(this);
 	if (ret)
-		goto exit_acquire_resources;
+		goto exit_disable_pm;
 #endif
 
 	ret = gpmi_init(this);
@@ -2822,6 +2822,10 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	return 0;
 
 exit_nfc_init:
+#ifndef CONFIG_PM
+	gpmi_disable_clk(this);
+exit_disable_pm:
+#endif
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	release_resources(this);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
