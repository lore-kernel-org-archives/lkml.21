Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729685;
	b=gUshF68SN/sQK2T2xg2igd4XH36r2YNB+k/euZA9/xVrTmKd5jNOTK4dTz5IvtZt6vw8
	 SbYJmIkIfcn78DqIH5DNM1q+g7nIcVvTnT+puOvemB2E4Qef2bs05/CiEanwrGsebT+1F
	 lzHCkZ0svPzOG1PxjlQlB0hgSF36t1VAgp0DqWfd8rdOFhIN/L3iAY37CosH3m8uME0mX
	 W1EJR1zmT16gm14mGE0gnNY1G8Dv9PXtSs4SYgJbkFUGz0vgTXX0Xbq1DvZ4lML5Rq94r
	 NNiG+y46vrk9k9Fl1NZ/R6qq88M7A7za05a/GoCyvaFtP8/0ofJ+hNY5QqB+95qP0qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jYp66D5Imzo0CzQJ1wEzlIF7yj6HUJmIaReA3hk0gfM=;
	b=uf1w3RRCaH7X+0KqEDjLjZ60mjrHdTsjhOhi6IDlUV0m99cHF+wFBof3N0rw8x8Y3aNi
	 liTUw3otFs0bS5jcyhxgaakGjoemxJrZzxc3aS2rHza6KKDDada7kmwwmouM8s9mVokgx
	 osreFeijAI/FHXEJ7ybILgU6FQnrbWcCSoVqJM3CmoEUS7D0gOPKH0SzWpYD+2gvvOY35
	 6ECiVtktYNnlB7+uPpTRf7z2Ork4g7M8LqbdjaxBQIwP4EPUJpTuJt39IpQL4Cb3PDEhe
	 m2HaV/YdzDjUT1J3ia8Sk7lJHNi15Z4hAugA5Ok5jA9+25t4at1mgSFt1ULk+Bb6Lhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLN4sSUa;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98D606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E98D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLN4sSUa
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso3689903a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729685; x=1796334485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYp66D5Imzo0CzQJ1wEzlIF7yj6HUJmIaReA3hk0gfM=;
        b=jLN4sSUatSCzBBWPw8S+gbPgh3SJN9qEQGzwB3Yyyy44tRiDCd0TLy50ccgl1X0Kog
         r+PEXyTCmo2L/jdxQsAwf2KWzUD7Rzv0krr6TMfCBJyPNrqgymyz5+70kKIDfD48AsqC
         lvARTVIUHo43JiHDi/rC1cLBljZc8xmkxs5hNfi9U7dG46W0RW8UPiNkwhtq+tJsldPb
         0EbIwjer6h48MWFo3EGKRrW1QkhOdD+n8yEQBM1yLbNi6aBt5zQriVcg8PPLvEP3RQQT
         mPZBFzmILLAeSsYugpEtqeCzwHJlptiPBLY86qyfvVm+N0+c9Ekofp/ug/4NomceA3te
         XiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729685; x=1796334485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYp66D5Imzo0CzQJ1wEzlIF7yj6HUJmIaReA3hk0gfM=;
        b=YtwP3NfGzJe1AxeJadzTCQL84lfb+ULt0wlmQYbgzsJRljPFqWyyRABkvRqyiFg3sF
         y19svnU8z7eQHxKcFd3zj1TkWD57fIqFdY3gYXoRsCajxraaNJygbFEXeUuQ4fBKh2Zc
         6LpbTKVWUkibU3cOEQdFh8BRJxXrTUeU5kfoEHhjPwZ46pJ1yqbU7PCEn5PGE80kxpnD
         BGEMpetqQ4WpnIZtyEQFwr78E0M0+acHkgB0Nse2/Eksvp82tVFanUv1JJuYsQxhelWg
         r3VEQj92uCVZ+07NuyLlfVHlhb26hM3NTVhH2QEVdUZPfeXbIanuxm5pYImN2LtVt667
         e8Bw==
X-Forwarded-Encrypted: i=1; AL+hErFfLGJIfwF2ORQ/lE2PbrEDg06bq7Yllo/fob2ABvkBSoSdCkv6aFxg5FpgqHRxPivKqOqsNYqf0AqNyoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g3hsVNDMhheMcQL+4ocV7GmUqGfy9Ezw8Qs6KnXtair/3mtJ2
	BVFoJqY02upLLZwPhn9bmGivtsZARzOzoSYGjrbE0iusaLsYQrE1t2mC
X-Gm-Gg: AZFdTZcf1R6rRUIu5J3PH4klFrqxttDi6oZONsEa/dYl66mW0CIile6VRuPukYhboRA
	oc2vhFP1GJhkkSoNT+N0afeCDKnbr8KblYiUfgzPIB30eZAU18MVlZ8Xm60QE6YARj2UvEzjXpn
	Ka3thSgCMHnISjpr2x055+/7rr46m/E+UUPZ+p1Lr0YbbS2r6lz28VZTUTfTm9rV7+t4F7tL78m
	EZ/wM+DPd8rO1eezA3Jzt/pT8qJ9Ak3/xv8XJdQCbddxyi3Tl+d0I++IE5V8znaoK9gNeC9F+cb
	sxuNNZLYEFiNIbQUeXBCYhfQncjMZCwHrJfVBGXOi9sbfuhbAdD/VPIlnPvxF+yFhNE4oGBkvjV
	FUYQIhSXaZtYxpMNFr0GnvDqv4Fp9caZGUKmp9bOqhdi0w44uMNr5Ui3EJUJpr5PijaGafvFvjx
	UMpSkb5tOyxhy8KASZQd478Xy9BUcSfDVCnH9ToOLniq90ZEVCOQRz7pFGZuEzdI4y7SMb/MV1/
	eOGnk28GKPM/NuSzZk3ITRRKpyJI0QjqoQhZlltT11FQZ2Cw5kreaszHmwgjVRAloU7HQb85CXV
	x8d8Jh0H1PcsFmqSMhVkIak8rB5j3eu7DoZDdLmk9RvkfKmAag==
X-Received: by 2002:a17:90b:4cd0:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3b41c92a56cmr21044124a91.38.1795729684865;
        Thu, 26 Nov 2026 13:48:04 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm34636414a91.8.2026.11.26.13.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:48:04 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 3/4] ata: sata_dwc_460ex: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:47:55 -0600
Message-ID: <20261126214756.39027-4-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214756.39027-1-artem122novak@gmail.com>
References: <20261126214756.39027-1-artem122novak@gmail.com>
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

