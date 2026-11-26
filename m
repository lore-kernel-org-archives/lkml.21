Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670130;
	b=togXI0/+NHwZB6+9d7XUn3s/Y13kHhkI6vzsJVZBol4VMuF7RYxzAaKXkVps5Ab8G6mZ
	 SRW1vvpyqVfuuWMgrsgn13biSnu8ElBsmL1wRZ0A8fKMUkF40kXu27jz4L/RDUkR15D5F
	 arEc68rUN0980yPpUtr4lTPAP3TgL8wL7kCFFHVdWp3bk9+uist+/Ko+zrldTPJMj3bdx
	 6xIFbah0niWz0ifcyc6Lt98lV5UYD2zEmOEt7UCi1MBBhHZQkjdDvcIRghl+uc6DnXpJ7
	 h7boq128FrqbYBuDUfjlh2fN/E0jroVKYCtf64HnRSSBiGWRt9SX2/JyV2U1HPBvs9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sfUbONIJRZzSkeN35/5DeaV5OhOzoNFoPR2PNqWhlkI=;
	b=P87gGsrDZPgTzrpklMUo+RPiYEzTAK5AFKlMuE9Qg41Wf//lJERE+hFfEuS6VtGPKPRF
	 m3LD8nnYP4SUVt51xSglptIciCKsNW8jF0yJoQdMUA2gKAUZdKnuwYNuI6nGcEmy61Mn+
	 fcT6XunWfT9spPy1sGrPiz6sT6O0FQa7BR5IzJ89ldCDIZDUZFvUXurWCp66tVOt1HRg+
	 5NN6R9/7X9dzl+RMfSkp/sXg92OgvjXDb+xfLI4E2grAePN+VVxNK8Zl6rWWt8J1NWne9
	 csbk6fbJvTisOJjmzoQ3BvpN+SfZhtf3RbRT7gUGVGGn1FYr3m6sXv7jaOCDQ67vqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIP2iHs0;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66038606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66038606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TIP2iHs0
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso3165910a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670129; x=1796274929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfUbONIJRZzSkeN35/5DeaV5OhOzoNFoPR2PNqWhlkI=;
        b=TIP2iHs05QKdqbnsR8NUnCmlDN0vR0Jfs8j2dRxfBvrIUXtj1L71cPXJ/qR/UcOi46
         I+xw6w18BMP5oqUYGlEAVddRAROFQmCbAlBhZX9JcbyvKyQEsoW9yQTosrvukl6q4ezA
         5hmchn8hUcbp36m0xf5YiteVCRHX+umC1H6fvVk/5KHYAi4mud+JLRPMOJQHkUvYwCLh
         tkyosnQCFMi+Cf2qr2X+HE0ZsjrzxFE0cuXukwkr79vdIzjre8Pv1/XFoSuH4V/k/gkl
         3AdcLQck57ALoux15zK+Axbkjz1J7NKCoiyXjRctWGluWTjdghXbFxrkfsGvwEf0I5zh
         k5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670129; x=1796274929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfUbONIJRZzSkeN35/5DeaV5OhOzoNFoPR2PNqWhlkI=;
        b=TBbboowWrFzvweiEn25+XVyrvhwssuqCj8rBk/TFB0CdpECeOi7iFSIUqWlISbNYXO
         WHjQOndh3z5/pwR1mfdLCpEQbrLXw7W4II7MpziWoK4I1vYLxEGf4AZQsvZkQqz1TL1e
         e25GyPl5et1Q7ZkpeQwI8TzUziTSCYoVdZdq1znMA1TsqH+zUeCMA6hYw/eFD1Ftwh1n
         Q8/DGkPl4jqlQX34uJo5NP/nXrS7Is5ZNSeLKs4yL9UeeKHCy+91z2m/38qsXS5h9rbi
         MElChSQ0Yorl7ekJT+ybfhEJNKCv2Gn6ueVXy5XCgwOfFND/Ub2EyObP+SSPJV4fvVtf
         bF1A==
X-Forwarded-Encrypted: i=1; AL+hErEAXe9JtzOTzjvCCW9W5gfo6sBr2W7maaktEraUxp+NCL2kpiAn4IX3T8SNbcBwq0Tjg7d4/Tc3BipR/ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ntUrOaIdNIi8dRt8/fXfrhtRtuJ1PWqp3Yn3alxAomCnxgyp
	4P7CUV6+NUrkqMrokaD/1Vng0G7e6YEsrhTgRKY65vRlvLyy8KX2Ryo0
X-Gm-Gg: AZFdTZcMl+gU2LIQuyb0F3wTWtdtX15i3seBgSeE0OOT4e+LMHtT5jKeCDPbDCWs2kz
	cQje7UC9u0x8zhXmZbE+DKSghCXe4qPEqc1Ik/8/Qi5iJlGwDU5c6v1YlULj2z4OMj6rsGMglKC
	5ht1ULiWyEUL26gVn/3uxWWU6fv6tM/uZ6cs8UFB4+5dWSrbUtmhcBtdqsqkfrFHvSjZ//iOh7Y
	Ty5tb157tzght6294cWpFAcyxTrCUi1w/8rjGdEfRgmVNx4p60QWuPQ936F5MZ9jWyLXVmV8LoT
	MqCtwF+TpXkeUB6NAEtBsOgJBALT4Hw8by8C0V9jFPs3SbWpN00/ccJlUUgFm/HtuL9bUakDpaM
	jgXldNu2haCa5wHmM77wnRUG9gvyEjMgZn7x2EjrGm/lXXj4p6I2+aKQncps1VzWZ7/wNL/1Q2r
	/XCMzdmL4UUJwuR1/hq5Lpv1nicQO2gLFItv03ho0u7IHUB0bE4WRzW2LMtEluWILi1iZLHpNtA
	4zCB6D5E5gQL8TjUojulJgEIwoY77kQrxptwPqZkCc+GHNyKcYB4t+CoZ11KD8r7IzrIafMM2VR
	8VArvVMfgZv/qdy7gc5khOoC5G82gtRyxDoEgaZRJFqC71Xkn1g=
X-Received: by 2002:a05:6a21:8197:b0:402:9f7a:141 with SMTP id adf61e73a8af0-4029f7a01cfmr12921594637.11.1795670128755;
        Wed, 25 Nov 2026 21:15:28 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10179820b3a.8.2026.11.25.21.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:15:28 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: vireshk@kernel.org,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linusw@kernel.org
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 3/4] ata: sata_dwc_460ex: add missing newlines to error messages
Date: Wed, 25 Nov 2026 23:15:22 -0600
Message-ID: <20261126051523.14431-4-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126051523.14431-1-artem122novak@gmail.com>
References: <20261126051523.14431-1-artem122novak@gmail.com>
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
---
 drivers/ata/sata_dwc_460ex.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 486ea94a0184..f1237bb20a4a 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -498,7 +498,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -612,7 +612,7 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 		tag_mask &= ~(1U << tag);
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
+			dev_err(ap->dev, "failed to get qc\n");
 			handled = 1;
 			goto DONE;
 		}
@@ -707,7 +707,7 @@ static void sata_dwc_dma_xfer_complete(struct ata_port *ap)
 	tag = ap->link.active_tag;
 	qc = ata_qc_from_tag(ap, tag);
 	if (!qc) {
-		dev_err(ap->dev, "failed to get qc");
+		dev_err(ap->dev, "failed to get qc\n");
 		return;
 	}
 
@@ -1186,7 +1186,7 @@ static int sata_dwc_probe(struct platform_device *ofdev)
 	 */
 	err = ata_host_activate(host, irq, sata_dwc_isr, 0, &sata_dwc_sht);
 	if (err) {
-		dev_err(dev, "failed to activate host");
+		dev_err(dev, "failed to activate host\n");
 		goto error_out;
 	}
 
-- 
2.56.1

