Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151860;
	b=rZybY0eBRXhrjjhbmUfxdry9afaATr0+uqEAedE9fkYET0f1cYnjCiQvab8xMJEgn3vn
	 ifMA9TYWO9WVkJ5arQ6Km5Su8bJxGDMPF2u00ViCRpEJgvgSC+kHE0fmO9Kj+w91DJ1p7
	 POELEgIJ5ESfuuTuNZ3+mDC/FjeZsBryHmDf1bWrcFl+nnzb/YIEEi5uoF8Qgjvsb27UX
	 iuRhFVKFIrCfow7z9Cnu9CAa6LcqV4wSHkf+0cKP6ivU4AMNmhaCnuuQklcjVHcFj/s8a
	 7Qh71mbwD/xwssXGl97wKrvkQ0rSN6yve99ltu0LXZ79XM6ff/2uxkYtraGjq58Z1sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151860;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=L4pX6oUulJk9lCame5SmBXGQ5/xgeAn5DXx7CH7Ikn627B2M2qHAeuZ408phlSVxwmNy
	 X/Q6kY1+fJgnTwE5EN6jtV++LfAvODXd64IKxBMQ96ehbdmF4OuYXcrexddr6+huSu/85
	 nOaIHBS+Q2HxnfdHBluV9xYUpF2YoGz4U8e5gXQBr1ZDVUJYxdVEQeQ4M6zASZ8ULZhXa
	 /fN5NaKCpY3uwtZo3blr5HQvEtdq1AzC1MkzB0h/o+BNYgiYoDbE8TziisR14rVpMguzW
	 xD0470W2+9ujIS6Xtno3UX1dKZalKoDr64wcCq3m8HslI8DOcRiwJtPGfDNY9oOeJyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCRTtW5S;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831F660A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831F660A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aCRTtW5S
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso306967a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151859; x=1795756659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=Kmdyw+mV1UiFevxypCYD4uLlOZ5sRcQ6yXx+IQrd6xOuVTfM0Wxq5luUStfMmJMIP4
         KS6WTukQAMcPRnCtI7K27FTsmgpcGR26jJgjqV905UCIe8Esgv//gEl8AFlzUo9k+3GF
         RKNfsTwfkej+AwFIrVCrkv6eg0ImEApbx5mlbsZpXJyhbzfJvOGL53ZPqq493S+kw3pL
         Ow6ueM70uXM+1nI5Af4+skIgAAAvKmSi2KONXYngrWxdahIGUXlqRp7m2Ggbul1C/wNS
         pAkuSCE4zBnTcU8PPD5MbJtNIEqOGpMV4i1zne/je5bzdXmpqgMjZAeYp8wYQP0/+vcw
         XV5g==
X-Forwarded-Encrypted: i=1; AL+hErFxM19OTqWEh3RH70qgKVlrxnFuoT0nTASgqPw6i8rJN0Ys3QobhqP+z+qBIRW4R9+l+KnCnCnUncPmTDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zSGlejBWFrwiCc9RmM/1ox012JtFblZpXwQhRn9nCfxEstWJf
	tF0o/RHuMspRmpFHrYM5p7SBme2hKvifXR9mGOnQVYzifAC6M27gMjRY2FWMuDb7xSm0uWU2kir
	ljYQJSIM1W5oOF6gZ+fzxkHELFI/sXXSS5bH6LUX4j0MiPSWhRZTfvXq5113EhKE4Mk+BbzrIFT
	JA0A4TnBhfgJwcBBYMlSyVS/458KmsmAQ43psWj+j44XKWRYwU2WJCBR0o3X5T1mRxgAu06xB2Q
	zZUmtT5XOKMZ5xseWMOmXM4
X-Gm-Gg: AZFdTZd4CYSz7EUzO7TE9k5Up3QTYsbD+dOmI5UXFIAYx74ZVihnPZmnA7/QMmWcTQP
	vEjxLOQtJv3rd+2vwEd0MCe/3ZEt3UPSndMVCbk+I2TGq7vMxBMQ1P7hrmSg0BYofH1GQjsFLCX
	WtuMp3ovrZb72MUymLtwAIpGhGTj+u7t27y8Hi5E8/up/H0SkkWEwWVgNPj39qY5vxKQCIv26HW
	M5UAjQHIJ2BkD10vB3UPz4OBdisiUMSpA3GiX7O2H2OgZTZ7KZN0MWjZwxYyG0sIHE45KdqYPYS
	lT8O5dX1DmBzpJybN+t5zj/vMQG6gIfMnXOg2iAzcER+oX+IltczqJNB+HZZd8xpNYwH45vGtSw
	OD19pBufaN1F2TZ+9miu2RvNk/rR9aO7tWF88lyNqVQKZL2+vfW4g3YGl8oipS9sFzMqrYVGrMP
	TYjUslc2au6oiXjsKHEk3/nB3BSTL6sH7sPClQtO2qTf4=
X-Received: by 2002:a17:90b:35c2:b0:3b3:cf61:dc65 with SMTP id 98e67ed59e1d1-3b41c8debf5mr1617508a91.23.1795151858928;
        Thu, 19 Nov 2026 21:17:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b420017844sm362466a91.3.2026.11.19.21.17.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso130373185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151857; x=1795756657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=aCRTtW5S+y9cwBX8eq6f0CCSFv9N2Ugx5X88osdwWuc9G94Pn4zc8bZlBiKZn+MeRF
         R2EzQJf3yFtuBoP49Kx876M4bg75cP+jKFxveluqTSOis+cuXmzaKwnAJtjTM9kV7DIL
         nQ0rS2ox81k6gE+QJRgdJdnOfpYVOK7ub6bt8=
X-Forwarded-Encrypted: i=1; AL+hErHxG3mJj89Csop+RTqqy2VjrmhezhLewFf1wlveKFocNrnIOLMHQczHLxLVlvDCA7FX9bwc1bsBnFoofp8=@vger.kernel.org
X-Received: by 2002:a05:620a:469e:b0:949:71fa:5b10 with SMTP id af79cd13be357-949bab20d4bmr335158485a.45.1795151857531;
        Thu, 19 Nov 2026 21:17:37 -0800 (PST)
X-Received: by 2002:a05:620a:469e:b0:949:71fa:5b10 with SMTP id af79cd13be357-949bab20d4bmr335156185a.45.1795151857146;
        Thu, 19 Nov 2026 21:17:37 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:36 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v4 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Thu, 19 Nov 2026 21:16:52 -0800
Message-Id: <20261120051653.1433677-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The current polling code unconditionally waits 30us, which was sized for
a ~25us Clause 22 transaction, and then polls MDIO_CMD with a sleep of up
to 2ms between samples.

Adding Clause 45 support means that every access becomes two back to back
transactions (an ADDR cycle followed by a READ/WRITE cycle), so a fixed
delay sized for a single C22 transaction is no longer meaningful, and a
sleep of up to 2ms between samples can add significant latency to each
access when the transaction has not completed at the first sample.

Instead, poll the MDIO_START_BUSY bit every microsecond so that the
completion is noticed as soon as it happens, regardless of the type of
transaction. This turns the wait into a busy wait, which is bounded by a
timeout reduced from 100ms to 1ms: a 64 bit MDIO frame takes about 33us at
the lowest MDIO clock the driver can program from a 250MHz reference clock,
so even a two frame C45 access completes well within that.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 5f79f31220f2..f8e5c1811d96 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -6,8 +6,8 @@
  */
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -36,6 +36,13 @@
 #define  MDIO_CLK_DIV_MASK	0x3F
 #define  MDIO_SUPP_PREAMBLE	(1 << 12)
 
+/* A 64 bit MDIO frame takes ~25us at 2.5MHz and ~33us at the lowest MDIO
+ * clock the driver can program from a 250MHz reference clock. The timeout
+ * applies to the wait for one frame, so a 1ms timeout leaves a wide margin.
+ */
+#define MDIO_POLL_DELAY_US	1
+#define MDIO_POLL_TIMEOUT_US	1000
+
 struct unimac_mdio_priv {
 	struct mii_bus		*mii_bus;
 	void __iomem		*base;
@@ -79,14 +86,15 @@ static int unimac_mdio_poll(void *wait_func_data)
 	struct unimac_mdio_priv *priv = wait_func_data;
 	u32 val;
 
-	/*
-	 * C22 transactions should take ~25 usec, will need to adjust
-	 * if C45 support is added.
+	/* A frame should take ~25 usec. A C22 transaction is a single frame,
+	 * a C45 transaction is an address frame followed by a data frame and
+	 * each of them is waited for separately.
 	 */
-	udelay(30);
-
-	return read_poll_timeout(unimac_mdio_readl, val, !(val & MDIO_START_BUSY),
-				 2000, 100000, false, priv, MDIO_CMD);
+	return read_poll_timeout_atomic(unimac_mdio_readl, val,
+					!(val & MDIO_START_BUSY),
+					MDIO_POLL_DELAY_US,
+					MDIO_POLL_TIMEOUT_US, false, priv,
+					MDIO_CMD);
 }
 
 static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
-- 
2.34.1

