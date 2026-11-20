Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203818;
	b=yBueY1IpKXPdDA62yGcLpsrNpmJTQaZAf/f5KVRbclXWsXuOQ9GpKJUSVZA3LH4bfJQX
	 LjolZZJRTOZ1lLHBfCFsZoMNKKeewDfFyH/QiPWkAn5IUV4Jk0Fsj2tpAhTt5Dj1LAWHW
	 HS6rGYsysCBcWhX1rg9uuIO4X2NUOwJF8Ay/JFp4c3GwAlfeVmTxxuUk7nasgHDl9BlZP
	 p19vqwKJLVK3uBz5hojxR/E4G0lsnpRYz4F3HvdUkucvJVUAQ8C8/6UYFFOmnZoGx69ue
	 iIfaZXdkvi88j5h7P1JNgacSPEnPsxYBEBAGHCOyDaaTp5XQmcIVjpcNryC8zYLFqqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203818;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=CHr9YBLFEbJQRpXhGNQYJL7Pnp44znqgNNqw0lccqLkZ4suxlUTSJ5i5h/0sqGW6ehye
	 WhJS8nKL+VmQJXxHToe9TF9j5kAdCFd9e/Ka3jEnOuJ9VlVajxQ1m2jxS/MnwnCCnYdhT
	 Gg7O+e14ugBS5ZpwGnNnem3+N3Flyhmg4kQaso9LFgQ9nGuN+IbORmMxpHU2Omq7iHIlm
	 OIrcGiYUqggT73OxVhPPd4lzDm0p2erzm0u5Z0pgpPV7PYGZWFrq8g/eMhRWkv4njOF27
	 cLC6T8yL+sn2ed3qLoHqg/WCeqdKGzR0M3lwz8H7wgx6F0S+qoJYEy/RlT15cXuSoEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hiG4EAHO;
	arc=none smtp.remote-ip=209.85.210.226
Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F32B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hiG4EAHO
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1005305b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203815; x=1795808615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=E8EETVIGa5gdxgckx2Hht0ruCVYhZihfba/2hsjshWBzVI1Yor23f3AmlqOQYQxIi3
         cuYAPqdFH5nbx/gDl8GdJlwhjYcjeKfNyoHdAzTqyUlwhVhX5yeEaqow+8iqa1RO+85N
         dQTKRQ4LsI4ADwC0YBnBei78FZ7r4WxS8LUy0vWyeEKWOHneQsjXt8jyfB+OwbbzI/kz
         ii50YcjjJLmWQOFiEEJOssr+uTdJPZKvKdaOHbvbtYV/W1axsVtqw1DYOCfuPo6eG40N
         W2n1MW7otSY0KrexGgB8Fv8C+AQ9OalXXQyHKKYjtrJuslqHdUho6Th+al4HjiZUaYf+
         +43g==
X-Forwarded-Encrypted: i=1; AL+hErFQcx32EcXcDifgCKkp+EmBfEP/ri9leJmPaFOO4hatGPlnYFKAjB1mXcUTlJEvbrsinXoJyYLptiDMkWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YKxItOseN+4buoPEvlGcsEmf1qdpfd4P9s869f1CneU8lCTZ3
	mhqfw/pRNE6fZlZ/yvI0iCVcXX82DfhQFSKN3s6apfOwaoS1H4IbqyumgrOwKnCB0uJ5T97XkjF
	dzoqTwuvgQ3k3tprPcjcV+kLbDdl1YVd60UlGI+HcnWvwLtHPdTbQ9+wtLWxT5AcSdtO3stkhgs
	dhuLT65q9KgJEtcvYiCLD1km90aVZUtMKZtLNWEThV8SmYlBgEiYz2YbEAGUITrCMDrqNk4CxOx
	RFAUZRS1U356oTMd/uGcpZB
X-Gm-Gg: AZFdTZeheUg4HpZvFFfNThEhW7t1Ag0I019iC4FBvcxOh0Qj2qmuqqHvOpiYk59SWt8
	L86lbdYAE2scmxP4pcCkbaWUhLeX5MXamZhiAjxXN6KKm6F5bVPTFZXXoZc+Q+tppTDKykRZ3Ck
	hhr2r56GnInVtQi03Hdi7WmfM1MrDX0HzqraZKju8yfmIX2crpEDbpLFA+oP6EvFy0Zv8Q69jPT
	bMVvHY8BOAOP3AnxrF/FR85B6Bc3lcULaG3UoG0ctWA17cTzUZay8FPGrmh9cwSrpfWsNDBCEkY
	dN6Fmmiej2A0irSpG6Tyht15ZlcGvRRk/cNOQFwMIXvn7AL50ultiEun+PDHpsWA7/HnQ1oq++T
	yLxba/ifzIgGatxjRuAnxs63YLA87L2wUzr5fvvAmz8TsaCYcMJqpCVDE44k1MjRkWKt9Ccu3Xj
	EYfhE8KicjVBfNfn2Pn1SLdPLWYqVkZ+8y5KQ2er5S1bY=
X-Received: by 2002:a05:6a00:17aa:b0:8b7:aac6:d9b8 with SMTP id d2e1a72fcca58-8c87ca51d7cmr3951600b3a.46.1795203814803;
        Fri, 20 Nov 2026 11:43:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8c872a59257sm28151b3a.10.2026.11.20.11.43.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92104826f9bso26300026d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203813; x=1795808613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=hiG4EAHO9WU1L4guBLhCOyi9rdq3TkzdEW3I1MPc0x+tmjZR/H4WauLDhcD9+xZ+H2
         9xmEF2ekcavRbyc98dbuvxa+9bdYeVEf8Xxpp9ZEBmCQRbsTrv4zvwtvUiOP+3LGORow
         cu31objLdzp98nCrzng/sjplvv7H6y6wo1hdI=
X-Forwarded-Encrypted: i=1; AL+hErGXjjdkzAaAxoWcgF6fSDDTHiomOVm8XO0eL+76bRkxcXURrxSP3W2iNwfUhSNfe5vhphu3txdPwYeXCQw=@vger.kernel.org
X-Received: by 2002:a05:6214:27e3:b0:91e:747c:f82b with SMTP id 6a1803df08f44-92134bac696mr64470246d6.52.1795203813337;
        Fri, 20 Nov 2026 11:43:33 -0800 (PST)
X-Received: by 2002:a05:6214:27e3:b0:91e:747c:f82b with SMTP id 6a1803df08f44-92134bac696mr64469936d6.52.1795203812928;
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
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
Subject: [PATCH net-next v5 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Fri, 20 Nov 2026 11:43:17 -0800
Message-Id: <20261120194318.3952487-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
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

