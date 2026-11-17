Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958344;
	b=vbnmVbugNvWitVbMdT39h9dqKhQ/3/3FAPW8CfE1jrqSpV7t0eglmJQYBtqcuCMLvvsV
	 SLQR6Q8zbNqs7qKfFte2teWKMYgzNyr1lUqR4WKhPebc4W2pYCNkHcyC3mU8MS4WyVl9m
	 kRabSp0GpJ6VDzFatSF5TxA8YXTDCcyNPv96Jq7VpMj/irkQLVj2a39/fy4d54ggvDjIZ
	 1IyBvlrUuIenc6r5mD9ja/ywnXNKwOovcMtTfzWnlz2VkNt8UIq+ttzl5unwhal7Hrjzw
	 FPWNoZAcAMe/+E9s1ZGP/qD/wyAomfTIQ+ASU8ppTmrMzZpPQUnqtObHKSCBGoJj3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958344;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
	b=ozmqyCs8qL2FiZ8afKz0e/3ebmrT7Wsp7U3eIYAnh9JbHyP4P2kzCrFlRCMmiLoqCBG1
	 Wb6wgk4Zxjp2vQGlKb49sjsjLOLDjI79WOfGovr9+9E3LD4SPl2grrawwSMIBMxLcrCDY
	 e4EMehVwHUgFuY4aq3JBlOlsOG1VC2BH5s6dy3rvfKZA83HUB/+/6IXaA1KNjK+7NmkC4
	 jcyc6gt22M4adyvTKOhh/bbiwNA/7rrh8w8P53lmVGTCObue/7Q089Xnk3/uOncL6lsHl
	 0rhH6cwUvpR6aScLJNFSCz4KKrFj5TM8MCc8+SCCvfFoSbSEtoHMLlSM4U5AOLbohog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hxa0y2jA;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B621606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B621606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hxa0y2jA
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb628232d2so242508a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958344; x=1795563144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=nSjdKB9KetV84BaLElf0StgKlEOvObKO6KMg548DJ+5Y5d6cvnNTSRVSX22QKDwBeW
         z5evBrU/WgUnRkA2ynSNGu3F3+URYLS3NqypjHFWpquIxf7t8Zsq+Yp93pjRS/cz+6AG
         7LInU8HAornN6xAdVpOL6VH0dxDv6EKmXvfcj9KjZ6UuT/3HvZvRfCPfuTnaQa63x191
         nH9NqFfNknP2elEX6AX9iSFeLw7FfovbIJSrHEvnUsGDTysorR19+uEecl+YnFgSFSd/
         5nhqlM7ih4jzLnqqlmLdyQWgNaq1F0/i9mxcCukHfN0NUGk51AJ/3lYENXJ5xzIWwX8A
         YdJA==
X-Forwarded-Encrypted: i=1; AL+hErGsY//0oAdc3DJDRn+1YXXAu8hLDyCnaK0e2KL5behG1JxxdOwe7ebHjLfPhfeZqbkQKlJ3M681frszHp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tDV2tD8OQ45GyGIEnIb6BwCp8psYu6Na0yb2YNYh0NMfHGDLU
	aZzOBbvnSzkcFDF6FCK0YcvzpNVpi/vqKwikHt4hnZ3hUV4/hnpruDcwriJyX6V4Vz1efg0/vIA
	7/rWj96K7zhnjbloyTw/RvKHmha7Gl5Ei0D+ZYkNLeEKGz4tsavTJ4uIyK97bUqJyx8nZEy4msS
	UisECpXIiLsUrDWq+5Gq5J0YVSugrpI8IOjKdHBN2PU51xbHivTFVma4CVpuX3P3X5NWjAm7n9+
	jC2vuWtE3aOWeKBglsewMYg
X-Gm-Gg: AZFdTZdyb39axvfHYZWxrYQXf8c2fvR7wtEI8voXQ44/uzLEeaihigEXh7KFVlOUVdP
	L6yQrzqy0ZusJQT1uQsiQZk9Gc4bogS4wIbGQucsme7PmtFZjtFZD1NHLZGwJAuKUCCOMrDXCaZ
	j++W+CItth4Q68lWjuPTdoJ4aYl4zIJGgokRRYNIySTnBOg45LJif2NC0SaPLhiL/lom8UZ3XJ5
	/kejLqef52fuUs9KXPQpf02R5396Ddfk559H9RgoN78uqsva7udpmh+4p0/uPO1FhrpkGiX8znI
	Y4Htc+1KL74a7RU+OPfJOB3tENpyzNkQJW3WG/yxWhhv15sR2OMfbV9cNrazrjME7RNdgQ6kwVz
	XhJtowbGM+eCXUNl0a/yzFC8giaTF9t2tQ6cTGccqhLEcw/cnYcIiNI2bA2Id6koyx/mNIxEEGN
	nAwSttHDx0MhKtn/lJmpo4krUibw==
X-Received: by 2002:a17:90b:1e4f:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b3d07e0fc3mr984253a91.55.1794958343638;
        Tue, 17 Nov 2026 15:32:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d0987ac9sm650859a91.0.2026.11.17.15.32.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso1484339eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958342; x=1795563142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=hxa0y2jAh4TJ64ZhERp6igPkgTN2Skl7jPtgcTZBL3wWCHANTkU/CSBNCIB65GmVRA
         yZRWEx6B5re1RHGc8lMT+CybBI2v48UsR+Gntk7iDtgAOeB2ethANzi4cyZ7MDFjIX9Q
         fZdas2kz6I90xEXWAgyNpG6rTd7/GtmiIoLI4=
X-Forwarded-Encrypted: i=1; AL+hErExH6DJ/muogaXUfCFeX85N3Pt+5onPVzoSIguZMEJo37d1JN2GsLUH/8ryAPLtJfkchWdW3otx0NiVqCw=@vger.kernel.org
X-Received: by 2002:a05:7022:7f02:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b543c38731mr1072363c88.1.1794958341957;
        Tue, 17 Nov 2026 15:32:21 -0800 (PST)
X-Received: by 2002:a05:7022:7f02:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b543c38731mr1072340c88.1.1794958341271;
        Tue, 17 Nov 2026 15:32:21 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:20 -0800 (PST)
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
Subject: [PATCH net-next v3 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Tue, 17 Nov 2026 15:31:48 -0800
Message-Id: <20261117233149.1693881-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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
 drivers/net/mdio/mdio-bcm-unimac.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 5f79f31220f2..df267bb82696 100644
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
+ * clock the driver can program from a 250MHz reference clock. A C45 access is
+ * two frames, so a 1ms timeout leaves a wide margin.
+ */
+#define MDIO_POLL_DELAY_US	1
+#define MDIO_POLL_TIMEOUT_US	1000
+
 struct unimac_mdio_priv {
 	struct mii_bus		*mii_bus;
 	void __iomem		*base;
@@ -79,14 +86,14 @@ static int unimac_mdio_poll(void *wait_func_data)
 	struct unimac_mdio_priv *priv = wait_func_data;
 	u32 val;
 
-	/*
-	 * C22 transactions should take ~25 usec, will need to adjust
-	 * if C45 support is added.
+	/* C22 transactions should take ~25 usec, C45 transactions take about
+	 * twice as long since they need an address and a data cycle.
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

