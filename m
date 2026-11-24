Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546716;
	b=CqdrLhF1qAtf2H9GlO5ZMQUOldz6kyGeJQyTsrz5KJTeUKh71k8JrFTkRrTMlkgiidjk
	 Z46t8UWba7x5oQQTfuN0kxE3UVc91FV9Wx3eZtp+l6tEdwhZGoEAdUQkRq612cZFe1ujr
	 fjfLlGcP0cmwtprep3KImQfK4rcCmvaX/1jEhi7EmRtwYxbw1kLR9hOMFR0ADMwNmIeZ2
	 T5gw4RhIJ5QUFSNKHTt0KU1ClxccWT5Ootxpv91zR45Liw++KDrZ3A3dDsU6HcL8TJjWu
	 Z15s9XVnReVxeW4NyA0ALEquxFWl606hwonLPAL3YJdMEu7kkZ31naiowaXFquhoNUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546716;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=snWIlGCZFqOb2VRSHTS3U05JVatpErvQydbzdMRGpnomiPxn9bAgLpL/JyKbqmx29Z9w
	 pCgDGoDCZNyCWjPmyOe3g424SdaCjQIo3XpLZKV4C/PoyH2/hjax2cFVKpu9KCqok71lm
	 MOTLRsxQ4N/IRNQa90hh4/59OkRsMgttCzX5q/8lQSHcfltTwA+inM2jP1MrDvHmoEWTn
	 0fSOSt7gjcaxEMyFUx/DIoShbqL2KOm9i+IxvSv8so2hh6dBZ+QfYqE2Kap4y/k0kecVT
	 DxL/IHpRskBxHHmSmpblwezdz07ldM8sCkngZ1KYXiXxOuuptHFsRrrAat7MdMW2O7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ONq65drB;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38BE606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ONq65drB
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3433708a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546714; x=1796151514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=jlFt8MA0dYcr+pPA2nevZTUebWCGfBVXgKd08bdJ/aQ7Dxi7KPg69yWcUAcUSc7zWB
         h7lPBYab6SVtI75NvDLct8QX1inF6pimhe5D7qaEeM9/lIARmcKiDktFsyQ+4WKPXkrn
         NGybTKTE8dSAMu9NIYqzq08riBqrRgwZhBkPJ0By9XORssLNaZuLKqoK9AnIaqI/nwU6
         tA6vMrQsdJWlK0EQU6Jj/zgX1sS8BouVKeO8C5Yss/QGt2D0cFsDYtT2r82RS863FMmg
         muUUnI/fo/C1Kv996dFaY8x10QhOzSyYHti6+G4wSPE9KDiSIzNR3fXhKz1NKST5B2nA
         8uLQ==
X-Forwarded-Encrypted: i=1; AL+hErEkP4o9BztZucDYLKEbudTIwiA/vVECu/uEODERJQE5KBHNbFoBg/oEahpNFVzFXMdWeBGUyIxhIj+QU1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z85IwaK79scmwOrSm1heL7LGeJxoZ7tzv2oxR0OxV/TSxsrMGHx
	BcWaER0yVs8Q0LgI2+8KruAAQ0ySO9R8Alvu0OfGJMfvuMxHtSF1p9vI54jBBlxnjoU7rGd+o/g
	7WfpV0bz734aPvbVs7e8/fzVUoubPGpY3bWDG5ev1urFpvlJNXYMOAOmU3Te34nfwfVXQnHMyW6
	W0nipcLYB3IDY7uTWSrmXjRk8VV0ipPxZOvenabwKgtB1/FpIskiIefpiNCgFL2WwCEiCSIOlFK
	lqbg6Q9mwpJDeawJSZITXtI
X-Gm-Gg: AZFdTZesA6uUAorHN3EnOSxYt47RTsOzy2t9WPapUL61ZMpWMx+WQLYCWKfB+5kfXzg
	RPSo6uw/nM8r3byIfNGIATCK/5OtJwo5xs50Rw4RoEtu817kfpI0QxXGeufSdy2SdHp6VcXwYmB
	M1JZpyN+W18P8JXACGsZx85IwEbyuZ1QRVIhhIK7cJn4GWY24CP5salFNbtTTICGvhJZfIumCYP
	bVEKiqB9bzRt1vdHQnOTkzTKRPj3ubd55fbkErMwAclmtmJdCaSXYty2MG6unkLnhzFXBby1B+d
	4PM0/MI1JVsxkSF4sIppbFIM4fBEYqHyQsh+RmQhSy71MjBHcGBgEeyhRVa3abtVRS6ZQsPNpep
	0qU6Y8MQjiu3pOIE1AFJaT4d3446gt/Eu63Ngu6Dq/huvZIdmiFde5OnyZLLEbVAdGI4ktNGo1D
	tzemQd/2Mclh3hu2HiLUqfIHVexpYK1hhmitrMi2mO
X-Received: by 2002:a17:90b:278c:b0:3b1:bdc8:c32b with SMTP id 98e67ed59e1d1-3b41c97ac78mr15541953a91.53.1795546714161;
        Tue, 24 Nov 2026 10:58:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm11760071a91.8.2026.11.24.10.58.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so5039038eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546712; x=1796151512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=ONq65drBFlW92qG6gvctt2Xq0C7JXeJqHX/4rw2NkPWPnv9KANebEypEXQbHMZjehG
         Tqr+pdgx2AUdlNrO1mIh8Gc3LmLALwWzKL3NHrVKTHxg9x2OrfgDNs00GjXJ3ceLZVPt
         ClfYMhlzedIUXh2g64s9fzWHOPlELXUiVgEZ4=
X-Forwarded-Encrypted: i=1; AL+hErF2JXlHb5qNTpvgefrJ9phw5m1bMag+qyOsBWMMJEnHABjupNjdKTpiDmDEgh+A8PejivwlI/udblx9Yhg=@vger.kernel.org
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr15312920c88.10.1795546712058;
        Tue, 24 Nov 2026 10:58:32 -0800 (PST)
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr15312881c88.10.1795546711177;
        Tue, 24 Nov 2026 10:58:31 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:30 -0800 (PST)
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
Subject: [PATCH net-next v7 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Tue, 24 Nov 2026 10:58:19 -0800
Message-Id: <20261124185820.3954716-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
References: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
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

