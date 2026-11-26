Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728335;
	b=5ngA4elLP3gTd9jqdNq9nrj6nIVGV68//MuYAwXEgiXFLb0wuRrwcwWSzZxhrRl6txzc
	 Cs7jhwG3jSLLcNMD217JZVeZmha5VcabXuvtfHmmkamz5ka6h63ofohg+b5DMid9HNQot
	 NkV0p6TbtpcAR6IOqLIteUvLlCpNDKiMj+mdcgXjukoZ5UQanKNq97KUWdIhpWFlUMpWQ
	 /ZcP3BWFqcIRQUDd2HUoL7eJ9KDT059qNm4U0jc/A+ySVUFkq+3aotnS5iMcl/WNPdEZ6
	 EupqgWQxQLVbpZS3Of6o/+Whk+hHd7gq4kbqKf4MXX9aWyIuA2Iz9vFh8T2oJlgOWAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c5eeda9qiC62nEeMHC+7zZ2MMcAFNCCGVAvY//zFjIY=;
	b=H6VDlmaOCOs7tEuBmbU2Ev8zcVL3wLDUdxvx/K7sdhjLqWGPU+nSOi0Ct+T3BcbHr7l8
	 i74dqpy4pgrde1E/dLqh+eEcrRiThoVBBIOz6NXV0sb1dvsWXgtZlgupD+t1GX/4i07Sg
	 y2iOAQf7VjqeCw+7+nZrY1llX1d/GqibaY2P2soOtDKVXotOBvz3ZUM95fEUWkySwgEuj
	 TRhW+iPASDv9fOuisw+YrK/T6HbB+PwLvzm9nomFTnEvm9nrkv2+Ut5DmST7WwjZZIkP3
	 slHjs5/GRGeryMXg/legDL+r75TyMQT2ZCuXbK6qJ6TtHVXxOcQ6P2M0gL7XJdjiH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cVHut988;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E67606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E67606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cVHut988
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso4600342a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728335; x=1796333135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5eeda9qiC62nEeMHC+7zZ2MMcAFNCCGVAvY//zFjIY=;
        b=cVHut988tmb8bptPnF4kHEwqu3fFCgzOThkzmWdKCvv+1Ax8ef08zxZ23riaYUWU8t
         2AEMfYHUH+9mzoRqTcavk2ii6U60jZym0lfxZe4E56St/EMjRv0CWrf4N3mWLVCLNZhh
         4uW/nBxH6BhLV6J8tbI3sW6/HDW/HVxdFd00yZvtbeKQivhhbg0Id8AL4hwEo4sq3ONS
         ucicIXN5T4dG+ChN/iuBe2p/5EbXWduj6YoaVmnd+kTvrjPSCP+rQunII0fLRMDcyuii
         d+4MDkqhPgLYj3MWErTJHbzFe6WVlHis/LXoLpEWqRavUeCuDLcyBcNC7pomaNeylG7y
         Q+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728335; x=1796333135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5eeda9qiC62nEeMHC+7zZ2MMcAFNCCGVAvY//zFjIY=;
        b=q/L/wLF88t7OD476aP84nDEhT8aU8ZhGGXvdQiTyO1dc3/yO1BDkH3Hyy2VHS/2Dsl
         Pf+S9jBpl2STVkRZ6I9JkEEZzHzLjFLVpqpJILh0a+Ax6Ox3TySi7QoPN2i8DxW9OOGZ
         IgrqnlCyLE+pwoA5T1mix8y3tfYTS2/BbptzRMRJiaCvofPzX4xE4DzBQpeHnfQ7QMgV
         hUvxbCo2Fd8RuOR1bNghVwVenMk0thDEXtgte393t8dR/2nW3mSsi87eD9cme8P5aWE0
         ak1ZZ/GhfpTjmRrrxXzEIQw4WgN+ATE4IPCcK+YWyT7T5EnGU8SalJicP05DdNlgLaRQ
         lXsA==
X-Forwarded-Encrypted: i=1; AL+hErGPeq/GdZMmEADm6xPFATylZ1WgvIpQfQM8mROjAUhkueBxWkGoIb0jgWcfQ7/L20QFg9ARMgWK8735wV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hoqt7d4lKIy61pLnjgGN/JFPFwrYWQHhYKA7VUWPiaKg63y/Q
	bCj08omo+yqax5ootd7T72Lw4+VFQvVWGZy+n73W1HpVvGF5Ze+elOG0
X-Gm-Gg: AZFdTZdsjBVJtN2t/RDeLimWKgsvTMFGcSq8gqdbyLeKkX2wELRltMwzS8V3NP2hh0I
	72iaYM8p4C3yis4Rz3aRZBn3beqPUeZccGpQU8sVCmNi0kf02iFcXon6slMLtQqZT0TCmzld9BX
	MZ7ANmOCFB6NVVG9vnFZCuD5VOyKJTD7A6QYLVMk3hRznC56C8gRa9TbeT2FkCuBafIHHAEaQtp
	AfgDYrcLduKXXV0LGk0d4QZVj585eHJ/lCDDVEzsMKhSVa/Y4kZc0gc0pUP4rNKeL7LIehTneVR
	ew3Gr4S9IgI0dsks4yF0EnJk1hFy8KZevtWIxBtV4+x9ogfMxjcSGUX+5uKOdsw09hjvomREwnF
	emNGqrr5aNb85bx4RbQfjheTS/fD7Kxl4AT+ojy9VLFJrl5z12P2wZWbv54+ofLdwlGdySTEngO
	ImCn9lGYmj1b71U5imvQc6fxIlf+f/t2EyXm7yJuD4/qdIFDyrzewRsoRj8+uwI+/54fn7EXInS
	1aL09yuqoLqJFR/38qHuzOMOPsHNURBpMc2aykjx5tkDdjQbNMCgnWqVHeR0SY3vOMW4aA6tU28
	KA/BLRmqJwFmdCnNWBk6Dz99uTj1bqgRQfqsvH34DrgmRlDj4g==
X-Received: by 2002:a17:90b:5888:b0:3b5:a3:442a with SMTP id 98e67ed59e1d1-3b500a34677mr6071730a91.40.1795728334841;
        Thu, 26 Nov 2026 13:25:34 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm33482401a91.7.2026.11.26.13.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:25:34 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linusw@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vireshk@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] ata: sata_dwc_460ex: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:25:31 -0600
Message-ID: <20261126212531.28154-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126051523.14431-4-artem122novak@gmail.com>
References: <20261126051523.14431-4-artem122novak@gmail.com>
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
 drivers/ata/sata_dwc_460ex.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 486ea94a0184..c2bbd991a460 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -421,7 +421,7 @@ static void sata_dwc_error_intr(struct ata_port *ap,
 	tag = ap->link.active_tag;
 
 	dev_err(ap->dev,
-		"%s SCR_ERROR=0x%08x intpr=0x%08x status=0x%08x dma_intp=%d pending=%d issued=%d",
+		"%s SCR_ERROR=0x%08x intpr=0x%08x status=0x%08x dma_intp=%d pending=%d issued=%d\n",
 		__func__, serror, intpr, status, hsdevp->dma_interrupt_count,
 		hsdevp->dma_pending[tag], hsdevp->cmd_issued[tag]);
 
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

