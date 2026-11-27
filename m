Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803386;
	b=lS2CeNGIYtUyNWlST08IKQaxB5dHrv7h9Q5+xvEiAL2PSa8ypMqAvCfxNrjGtR71fT16
	 1U8pRdrUMqBGwHQ8Z01sPOI+KJmVtp9e+FT8xdDHAcWjt1THaYdRB5rhcZYZPNUz6o2ws
	 RBg8aY8Iqu9Qh9pueTrp2W0x42Myp/Je8AoC6ToWNNdg5CngnSGja0Ogfwp1cCcO87GXx
	 s2jJiiQ5TmYWx+SAeL7MCTu4x72YYhBBSs/RFvzzI22Oy13xxJE3zNjcqtsHZjQ8oV9fG
	 14BcLFxXoJ7cZcCjY8qxCItNkGtHptLT4/DZ+CjgpniolgxcPISneODKXZO6ST06dEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1iSCYIDLtB0LsuikUchSv5LqXfsReYNoVcB26J33mOQ=;
	b=vDoJGc1Nlci5VXgK16uOSg/a3fPUx+CKnqhxsR+vS982JrzB+Elta/QYGlnzUBtYepqm
	 sA1cJ/kHH+17QqZdUKW7IqMUZJz22mQ+lX5/jnXs6lIrZE3azj56CsUAoRwBBRkFyQusa
	 fjBlh8/nnY+WD6dzUQPlNphDAsi9jnCABVVSiBaV8CDPa8CRIEc5GdXw26D3wyDuI1YE7
	 RLJjGc0tE7TIkYcJFbAWr+m/cC3MCo5YqiuGz+X8NnYQUUPWPd8LEXubWXMYn2CDgQZbq
	 grV8a7QDRVqJvtMYuv4522Lk7+7VTJaAZfKOkNxqNr2pAXL+Z5osRv3tL534r5NjdpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh1ezFPt;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B8606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh1ezFPt
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4327110a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803385; x=1796408185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iSCYIDLtB0LsuikUchSv5LqXfsReYNoVcB26J33mOQ=;
        b=Lh1ezFPtZhtn5aP+sOYvb9GIW7wrAyPQ93CufnodhSZN66N73uHWzG82e/IngQQCL2
         O1VomnajxlqCV207dfnazfpgfd7I6HLPiSrwnwQ4MZITZSeWaUjyt6Ecwmg+djfqrtWr
         7JHDrfxOJEoxH3i/fCd9ojwj/7MuMkTO65g/UYqh+BIrQF3u/og0RI+f8JU1OubbieJi
         lc0u7T2tj8f6KpcDg4bEu/W2o83Zu3qh/eAT1iyvikF9Q5hFEwA8R6ayTERqoUYRj+4s
         McFT9CgafAyGe/ln1VNXBHw5a82rxXaaYkMO01NKBTTCxwLjMTtyh5pDCLBAswfSarx6
         XMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803385; x=1796408185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iSCYIDLtB0LsuikUchSv5LqXfsReYNoVcB26J33mOQ=;
        b=VdECf3QgmlFyrQSL3GyTD8lv5s/kclXgnnuRNhFIAfUbAnvM7dxJvsliExa65PteSg
         VSHmKwZXTlt0IYnmkV8XEMfm87RS7a4YCn459fnuji8PPsS4Ty7qJUZPFMEsyB0QvlIi
         mynsi71YdM8JuT70fFziKjPg/A3AerXXQzwMa9DaPOdzir3D7z1F98einC9Csq0Qbw13
         YhqXsqtW8mDqkQTunG5rJlyDHWiQ3iL/wOmZCu8cvD73YS0YZ+2oJrwPKMe5RS3LWipn
         UV7BNZkezXUQMBWsf8ObJ5hQwcHrQmBUChmEws2KocA0xpU5edea5iHrA8mjBYB5J2NN
         czzg==
X-Forwarded-Encrypted: i=1; AL+hErHubAB0VEruapeFmPfJoIOn0jX7oPd80usY3jL7HAutIrE+Wy7TONZP/am6YvMWXH5w3tbCWxj7FCL918k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mXKZkxVCMFJj8/5+Hw6X9561aY2xPWKMHw5k0/73Yy32WmX1Q
	rMbFHwz1GhRyWMEHm7xhXoorJhRSMzDk/sLqDjzl/piBzIZrUpy6DaXq
X-Gm-Gg: AZFdTZcwvGC+xHGSrnQ4Vr3vlZaTf2ZsOwpeby/2o9SVMi8Jg7xCixaAW1wWddb0PPo
	NudMZHxbT4hfYj2Iqf4g4azcH3Grw/khMZ5/2sKGGqQAL+ltjsrhwsHsozylGPNDQSAgqTopme9
	fQX324RoAS25HJ80mg8tmfAQjf6P+jFfuqOZB8JSCaGkGhwGO4se/P/hRaIiUqzdAJXVyGJnuYd
	birvAzf0SNooHxFXJSM+zDm25uIjTvccxuSrSwqwoX8JDxwrxYbS2UikizHuL5rGdd5qOq39vK9
	RZuVlefaTqoR4Gheku7BhNzYsQHimFrfDUmnP+aidx0JGLMU99Xhoj5dZOPGvt12T8255FvzyuQ
	H2amFevSWHlgWFGGivW2Z4y6U9qFyItTwvKH6fHSAWoaJ6aWws6UVMz9/QPVTrOmHKnnn0eqAvY
	mCUQ635ySH0Rn4hjB83IdsHizNk5J9Sas28XZwtBxWGGozdaGR4WGFg86GGDT80pjZ9OOET75Jm
	TcfqDxLDvw3w+2tSQSFLhfZVlwhsPaaRs8o0uG3oQfZFqEQmXFh+z+xI2wtDgKxDHDIS19szUNm
	1BCX7Di1O90kw3H3krr5PB7vsBRlWZfoIdGtfvgOY9EfqtOn7w==
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr24421974a91.26.1795803385345;
        Fri, 27 Nov 2026 10:16:25 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm39867121a91.13.2026.11.27.10.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:16:25 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	vireshk@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 3/4] ata: sata_dwc_460ex: add missing newlines to error messages
Date: Fri, 27 Nov 2026 12:16:18 -0600
Message-ID: <20261127181619.183139-4-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127181619.183139-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
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

Terminate the error messages with newlines so that subsequent
kernel log messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/sata_dwc_460ex.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 4ab378d2c26f..df711a802c53 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -497,7 +497,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -611,7 +611,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 		tag_mask &= ~(1U << tag);
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -706,7 +706,7 @@ static void sata_dwc_dma_xfer_complete(struct ata_port *ap)
 	tag = ap->link.active_tag;
 	qc = ata_qc_from_tag(ap, tag);
 	if (!qc) {
-		dev_err(ap->dev, "failed to get qc");
+		dev_err(ap->dev, "failed to get qc\n");
 		return;
 	}
 
@@ -1187,7 +1187,7 @@ static int sata_dwc_probe(struct platform_device *ofdev)
 	 */
 	err = ata_host_activate(host, irq, sata_dwc_isr, 0, &sata_dwc_sht);
 	if (err) {
-		dev_err(dev, "failed to activate host");
+		dev_err(dev, "failed to activate host\n");
 		goto error_out;
 	}
 
-- 
2.56.1

