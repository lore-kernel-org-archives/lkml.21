Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781932;
	b=TZR3CXtWItx16PLS2ZI8w7tJbnFaaF51z1uH62pwn/H849x4dq5XRaJysfbkflbR/z3B
	 Sb89s7A428A1FVUL+GoIvpArtaiZ2sbFuKo+zUS2bYBm0SwqBrBnQonyNMqxD2/rx9bPA
	 53guQ60LxjhGnutVyVnbilDO0PhKFzUyrdKlThIZYhsY4ahoJjbH0ze0JdUCxduIWa2Lv
	 9o6luCKbzANpR6o39PjVCR6Q/fSxCOrLf+6ZO1uzQHx+HmRO7VuZhcSgRQ1fFXh6tv63Z
	 OqMXyQoBGGD9krMpsl42/0nSvM27zhy82yy1Nanl1h8aN3Wif4Ba6uvaKyAFAU/daMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
	b=UgWRhBlWpknGnyqbK5QwNZaKKXokCebop4X0fENlgw2rHgc/Cnoa7azgtEHRW79zMwUK
	 FG8DBTImkXTGNnQdu+A9h5tMWsFWrut9iIjWMtFMsD2EW/0BXUHChwPP+zXv9gLEVxZjn
	 St+3eF3l+WpxbAU62M0dovjGYDJj2VhCmCsYvJ57EfysJ7LBCtfHUAPlmCjBkECvSVxhJ
	 yBjakK667zpUBLR08sp3IM9gdG5620Fx8cfAwnOFR7QpcsgIczCbpVdmtBUkeM25hEfgE
	 X+aRaBb+u7tTEawOF5hztnLC6zMFZmDHFQqlKEjO45S315Kaes7rmfSZjS4coh7Sdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bk+dQz1R;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459860A261C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5459860A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bk+dQz1R
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6256784f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781931; x=1796386731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=Bk+dQz1RJPEOaU8C7jk7QY1K0V4efd1qfGIPw9Av/4rR4y7jiJ4BLwJP8RiG1psv1E
         WXOf8wVGNFLuU9gB4R2mIP9iwyYHCU4hkKwDgXn3JwZRjZJW6uC/zpHPkt8dfs9vY+/1
         riz6B56rTXoKQdqamDsJL0xTemfdXo552kxQ4bhVhCLCP3ZEepkpMwPI76wFFBQh1c3i
         vqbrzbcN82w82Kf6b3E4Fk1leYxZ1D1FCJKDFlIs+3Du1RAldh4nstao3hq/gW6k+eTH
         1FNgVUn7CDCkiDWZXwMQcBFLULXcZ6b+R4smw7Ca7+lTHi7w7t7U9uSc+j1+4KczAmDL
         YxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781931; x=1796386731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOyuBOF8a8yZZPK9VBtSqGhwfFQMXh8N+abb8hJTCiQ=;
        b=r1U//5yMdn/pVQs55QFjGe7fviDAtIkMgOmE3tf2+P40iexFjE8+8qOf/bv0T4rHDT
         h1riSV7FBPyNk/a1h52dh4u/NIk55iV4wBxR0EsxhwKaqCDIUI4fgWoscRcq0wd9cGvh
         y4SpqQ/qvqZH95EB6FIgFFB6MRVXlHpdMbV1ZkyNQG76IMNz9Yw6by2NIT+4KKyS5okx
         WDeExh/R1DYEagBgnI7GiauBZmhrCNl3S2F12e01WcPWpO/1bhLKTYbU9rd1x89V49xR
         CNf1Hi1OhIEjoT+cW+SMwTlC3hj0sGnVsqirCr3sQllrJu34h8N/ZkFrx1vouKDrdafr
         YcTQ==
X-Forwarded-Encrypted: i=1; AL+hErGiGqtF7m7aDLcIQylYc8/n/CFJt5cGhjHCAT+9LtaxPdYcahE24ypMSj8w+EO+5S4YQ78MHVfmSM5c15E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Odjd0DoJo4x5epXANu7hnDstWKk3HeBgiUDSxB1lBsq1YeupY
	046PBMvMTnlliNeHH9uiIHvg7Q7cUkNfDiDF5PEniXmCX7s30PJpKfmUMN6iyFc0EFw=
X-Gm-Gg: AZFdTZeLjUgGTVTrrpgjo23seksQAg9WEKmDcDcX1erxm+/iWhonUAMc6oVLo+Ux3h0
	BXiLeB6jbnkLjwRHFJcc7z+jDfVGjpTQs37Xwy1fV6BnVjdux1OXRSrHn+vJil9ArPZl07YDDNe
	c9WEuZZXgcSxJ3tp3RCPFSqhPRorkE1g78XhAb4WNSteLhJjZN4ee7+Q6a6tqCd6qJr2NbADKLq
	D4AbjzGSRr362rU7+fFG0AwcVNLWgh8gkN5E6hGH+/HGrqBRily5tyqWqUamGI+QM+5tzrlzjSB
	PQzkXtNj5v+H/fQjYNttcHESoBf6dfP4EWf2gE2vfgjiEwZIX8ziDeuMTQ5QzCzADH2eugg3uwe
	jjQ533j+Qn0bVYtIgPnrr6DbWhaB/GItc+CAogL/K7+FulmqMP+SA9LQipzofpZG0hA2J+h0Dv0
	UMA8fuY7ar4DmjNoI4OttosvJQ6KMhg7+2Zx9zOyuETCGTmpNzl4UqMZ/dgWDjYu1z/RVQbrXn8
	y0gT0exOWMEVnbEgK+KrBzTBSnWDk9JFT45IcbaIrNPqy5CxKC+uMhKwkD6Y0QOyAlRVmJJinjo
	t/cFMTY4xD39BazJ+szmV22CcdSm
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr47199743f8f.4.1795781930826;
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3453019f8f.53.2026.11.27.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:50 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 07/28] dmaengine: bcm2835: Support common dma-channel-mask
Date: Fri, 27 Nov 2026 13:21:57 +0100
Message-ID: <20261127122236.4976-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

Nowadays there is a generic property for dma-channel-mask in the DMA
controller binding. So prefer this one instead of the old vendor specific
one. Print a warning in case the old one is used. Btw use the result of
of_property_read_u32() as return code in error case.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d65a93be5fa1..d2e000e94347 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -982,12 +982,20 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Request DMA channel mask from device tree */
-	if (of_property_read_u32(pdev->dev.of_node,
-				 "brcm,dma-channel-mask",
-				 &chans_available)) {
-		dev_err(&pdev->dev, "Failed to get channel mask\n");
-		rc = -EINVAL;
-		goto err_no_dma;
+	rc = of_property_read_u32(pdev->dev.of_node, "dma-channel-mask",
+				  &chans_available);
+
+	if (rc) {
+		/* Try deprecated property */
+		if (of_property_read_u32(pdev->dev.of_node,
+					 "brcm,dma-channel-mask",
+					 &chans_available)) {
+			dev_err(&pdev->dev, "Failed to get channel mask\n");
+			goto err_no_dma;
+		}
+
+		dev_warn(&pdev->dev,
+			 "Please update the DT, replacing brcm,dma-channel-mask with dma-channel-mask\n");
 	}
 
 	/* get irqs for each channel that we support */
-- 
2.51.0

