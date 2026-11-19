Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093972;
	b=eSnKsVME5vtIbbV3CNqT183ZrPS9Z3Ui4v/NaSZZ2AIy4xXouhXGnbElfB5kdRDH93MR
	 R1Ybf2Iv3f4caCPcnu7Gebbyyfybc7+LbCDn3a8Yp2K+mGBnLAFCARPwoLQOHKo3On9v7
	 CM8Fv2DVCp8EeJB9fjDc64RZHQcEE/d7ZHB3/oygibSgMdgKMuvTBziPXNeb8D3ZsGdAK
	 77neqV5YWntIZsxrrwVQpIpOHiK2JxH1tl1SgF51S7j3GE1MEpLJRh/xq/XHuVsDivAnK
	 uL3ssr+kEBt+V1oZdeElujR7s19ionN7ufvAE6FZTu0PJlQ+GqSnvb27M8OqI1XH+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
	b=Y6frIb/eBDzQplOg7Rluk5o1BtfFdkUOfwa/uPpciKwc8ucp2LY2yXQkz81hU3aMXTGi
	 9mZ5vcaZizxFHWr68MWIb5ZW/45OOIVgSIviUyUBmDnq7AKiqUw+kK1KubWpAxWtMPGGP
	 C5o0Cf2Qw+lPdnSxQkca0lEBupjA2oL05XbD7EDlWCorXREPIzikyQ+A3P3eFKwtgeMtP
	 BlxXQ52ivmQoJf8iocvLmXEQpO1qtDyPovj4BnOQrVDsjVdly9U9+/KSCHxpDPc2SX21D
	 2VewAOfB6JfTNTnQJgVTrqERoAcKJrXQA0VxWfMZZztHL2tSzhma3YDu9R8SWg/lbAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8kYBDP0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C24606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C24606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8kYBDP0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16865255e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093971; x=1795698771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=D8kYBDP00anbBIK5f/BJyhFVH28MkDXqVjA9becq/6GFmBzvtngIpmuOskxTZar4Ka
         b0wvzsQoU9WxM7SFVhoiZ9xiNOTgp1q4kQy6rqUXK/bYFjAztlUfxtRqCQlkZ79e/QBT
         kTy0f9fJTZPT08Ww83eBE3N7kA+6pmSrpgQ2XkLoELwMkijR3zfnJz20y2C8kWTcFwSp
         74O49l//ZBJaFr4a9hYJW46NtxZ/UlXKS/NupoRlUG6xrZqMepq6TR7guz1nCm/obOY3
         S0oYEetqB4ToiaaznziNKZm34IuugyHtS3H0ZGBloGfvYLXqjxt+EExxsl7rQwVJycL+
         0S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093971; x=1795698771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=at0XL+F3PasSl6Kyi8jR9XJE5oaqsYj3Op34ybzXjv7VxNX2vgHdbjjK5mjhNYFUcA
         1VuhEaswBz1jKFnuVVJZBmRaKWvPTUOk7bzSvI2SaNOSXZVNQ2oOUKMFPT0rhUam8Uis
         GSD/fj0nhVFPkuxKhq39BEoHRYuaIIQpt3pJwv7iH5BxL3ZFdHGkhmFTsvWZg5emlZNq
         7drbec2SIkLtHcznyYlsn1JFZrUCQs6r1TeVgZTc8/vAhrhxOhPF66Ef3SPaVg07Jeo+
         NrM79QH58nLCBk06D4eDnnCkwz3v2JWMF3Ww9+QVQQUzX8Lu69B3lYdJFipFD6GUxnky
         3Rvg==
X-Forwarded-Encrypted: i=1; AL+hErFxD+w4NTOSpm5E2OFeQpt+BE2X7CsjRxayQRu9CpUbBcs9i9SsKdtXq1efAkbGjL5atowK3Mhh8/8kHFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XFEPKcZeCRkaYoyNVciGwVED7ZYrWGqEslBsmPnICJwUXz0EF
	YloKksd5k8mfsyCgQcw2gDUdRogaRnHeT+Tn7y2to6EdvEx+UgJOLRaG
X-Gm-Gg: AYBFou2kHWFfcfyYc2T5+fj+gLAwR7409zh8j3qqQ+iWpVrx4bqwL0HzDAjkDgHiA8x
	5IMAXnnnGI5M4gOqb5o0X6rF5JZdv3Xi9cSU/i4GmK4ulIe49F/bGB6HE6bNcyswOQN15irvYKH
	VcFez9XEF5vB2b+aHNjagsU3Y+bXGIGRuiPm4WCsjBPwLlZO6vn79mMHSsZlvwPERkiwXFXVS/F
	zY2u/MthQOCVp48HTVDl1n3xs58bb1kn9D5cKRogcRk2lERFmgXZfyzEiLcXs6+l8FZrqlMFbco
	DsmXRt3rYcwvJYwnUvjjPoD+UtcDQUaLbhey3vMOzrQvFr1kE6710UumeKFQnuh9WZpixk126YY
	gSjtQv9aTlTcy3WU1w1xy7RQutLKvpg5IX+m+vrwCmaUpISCtfRCQH0gWhrHVrffT67M7DsQky3
	fBL+tRi8G9EZFPUhPYtW2SPRmadnmdGLyawD6jTgNSRLJ+KC1/dAnBYN8G+h2rZoLDUgCWBg1OR
	BsS8xwU8y94iG03VqK6o6H2cFfqLhMS+/POWQSm2FTVdVD7CzOt7GnM9fZ1hLFKEOlzxpA92R1B
	i1zpf5rn586txo6df2LAR6AusEouuwbOR4o=
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr124123865e9.4.1795093970512;
        Thu, 19 Nov 2026 05:12:50 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:50 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3 2/3] mtd: rawnand: vf610_nfc: keep a timed-out command from completing the next one
Date: Thu, 19 Nov 2026 14:12:45 +0100
Message-ID: <20261119131246.187406-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119131246.187406-1-mehmet.fide@gmail.com>
References: <20261119131246.187406-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A command that timed out can still finish later. Its interrupt then
completes cmd_done and leaves NFC_ISR[IDLE] set, so the next command
returns before the controller is done: the completion is already done
or, if only the completion is reinitialized, enabling the idle interrupt
raises it again at once.

On a timeout, disable the idle interrupt and wait for a running handler
to return. Before a command is started, clear the status flags and
reinitialize the completion.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
Applies as is down to 6.6.y. 6.1.y and older differ in the probe context
around platform_get_irq(), I can send a backport for those.

 drivers/mtd/nand/raw/vf610_nfc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index acc9ff282083..547eb1513893 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -154,6 +154,7 @@ struct vf610_nfc {
 	struct device *dev;
 	void __iomem *regs;
 	struct completion cmd_done;
+	int irq;
 	/* Status and ID are in alternate locations. */
 	enum vf610_nfc_variant variant;
 	struct clk *clk;
@@ -291,6 +292,9 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
 
+	vf610_nfc_clear_status(nfc);
+	reinit_completion(&nfc->cmd_done);
+
 	/*
 	 * Barrier is needed after this write. This write need
 	 * to be done before reading the next register the first
@@ -301,8 +305,11 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 	vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
 
-	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
+	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout)) {
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
+		vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
+		synchronize_irq(nfc->irq);
+	}
 
 	vf610_nfc_clear_status(nfc);
 }
@@ -885,6 +892,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(nfc->regs))
-- 
2.56.0

