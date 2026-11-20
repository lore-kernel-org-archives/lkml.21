Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179471;
	b=rzWOtZk3E2tag9OYCnhdAFtdmj7Z3Cmn7OFBL4GrYjA7xHwjoQan/wDQQbXvnm0hI+lc
	 hkAd0OsGYBspC4pzAPyHSl3dgbCAmC3T/ON9W3Oz2mym/o+lKscvKgkYefgpNbEqj6ZAM
	 JV/tkTRXlVM7xR/xwAOhAMYPv0k73ClNbf5Ku4u165EkxXPRwsoOWatZp0pdCzRSumZsn
	 Hxyhhoeevaxr6To8B47oy/QAfdUto4yprUKsS+LVADpm82BKZYwSOz5MfxExKmaJxC+5x
	 ydDPqWn4Q51G8tK8sXoAm3UNsjw1ac5HfVFrN47L0v3fJSw9m1SW3Q7+yupzCEAaMZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179471;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=gU+N4i8XXaaCHLQytPV366YHYYBxjCiyyNiSynfO6vU=;
	b=kEmY7/D0rBFSQtgLILjDYDW3eTZMGEUV3dDXx7kQkLbnCeP7meq9fcH8EgW7w3Fn0xGH
	 Vqcke4vTTrBfbY7nzh8DQRdwBLYpUnVgteDy72N8ptIv8p8VUMqQUuHTxVKnVkUFE1ZNH
	 ksYhN4jLvyBMTIQ9lounRGvNhtqAAfam/d0mtedt3iYHRLmf0rIfVs24wisgsyMBu2ann
	 v6aPceCP3Z18BRXTWN8Zmwa8pnyytMPxlPWkN0m09eUB3xuVJrrZOvdoMezLYByOnApy8
	 QiZWMOV1IVXkoT6amoVmfb5qzux+pA1Jg8ObXZqyY/wHdSjil1mwtkbgwa++QTk09rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=K8TjtE2k;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B1606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373B1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=K8TjtE2k
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE7554E41687;
	Fri, 20 Nov 2026 12:57:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBC2C601B9;
	Fri, 20 Nov 2026 12:57:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC5FB11BC00D4;
	Fri, 20 Nov 2026 13:57:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179468; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gU+N4i8XXaaCHLQytPV366YHYYBxjCiyyNiSynfO6vU=;
	b=K8TjtE2k7nphcv59TzpTsej47eYhvzxLt4JBJkmH56cJ5plr/uYnvKLLKO1G2T2wxlS7fw
	P/vaPItZXqHYzReUHDkHiJj5H+AjCNcoxEFAQJyw08NIf0byLcGL2tKCNuIxlQWpRlRALQ
	5MWvPxFEYTyPA+xdTX+0LvmglEZw246V4C8dQWumHZIabIevjjWPkExYRXhbCtId2nmF9A
	Dj0+Dqu/m2ALl5K2FEsBDzw4ROhTOACi4AJmMx4tVipg87CsZZ+Ll9nF+xxbRM6rzjpvGz
	v8ZVOCpdyFk3iP4MM+6xLEaJfS3iWipYBUBgq/6VPJU1irpj+QmwBYhU46s4Iw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 1/2] clkdev: Improve clock discovery with clk_find()
Date: Fri, 20 Nov 2026 13:57:21 +0100
Message-ID: <20261120125722.209609-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120125722.209609-1-paul.cercueil@bootlin.com>
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

With a setup where a clock provider registers a clock with a device name
"mydev" and a clock name "myclk", calling clk_find("mydev", NULL) would
not actually return any match.

Update the code so that we can support this while maintaining the
existing behaviour:

- clk_find("dev", "con") matches in order of priority ("dev", "con"),
  ("dev", *) and (*, "con");
- clk_find(NULL, "con") matches (*, "con");
- clk_find("dev", NULL) matches the first case of ("dev", *).
  Note that in that case we don't handle wildcards for the device name
  or it would end up matching everything.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v4: No change

v3: New patch. Imported from
    https://lore.kernel.org/linux-arm-kernel/20261103084915.8405-1-paul.cercueil@bootlin.com/T/

    Originally sent separately to go through different trees, but the
    context was lost which didn't help reviewing.
---
 drivers/clk/clkdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 919fc680ae4d..ee6c0afd6ec0 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -53,7 +53,9 @@ static struct clk_lookup *clk_find(const char *dev_id, const char *con_id)
 			match += 2;
 		}
 		if (p->con_id) {
-			if (!con_id || strcmp(p->con_id, con_id))
+			if (!con_id && !p->dev_id)
+				continue;
+			if (con_id && strcmp(p->con_id, con_id))
 				continue;
 			match += 1;
 		}
-- 
2.47.3

