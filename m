Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050003;
	b=kEwCuJF5QajPvYue4+qt6heDVgH+7q+n4ZTA6+eyXznNX/vx2gWOLUle97GM5ZX4Dn1d
	 7QpxkPHUKLk4RQ7eLMGOfE/CpMPTGjB5ainoTjZNh1c1bUnIGDwT6/Waf/MP17ik/cRun
	 t9CKMqgN90NlcKyjwHWx7oSaKj5pcCgP4DHquQe/mqZl8xTj2j6L/kPpjX7f6Qe/Rxdrl
	 MFJR3GmZ6Gt5HQBzpVn6qjgSD4n2BID60yDbn8Z5y4Vt0yB48ANz3GV8e8ZFFfNz7imt2
	 r8bSPaazyr9NbCezbSA4MOIPSYuPVKG/YBhoWFSgfDCaI9YN8zf/WIe4WZMaeyHbFrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050003;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=T70vX7SaSYIK5lp70LuOxV4Irg9LG/4AaYy0oIMAYCE2qSxV3SVGIsA26VZSsrze06pb
	 In/3g9OwxH8pKZeECRptX8y9FMslJAnuMVMAFh8u0PI8pCxU78TYOBzJXKHIFuFQT5ZPH
	 RT0NHjr07kfsbizNuTtY23kD9JIWovbbRZyVfyrRAWKqZzLnMjE2eT2YWV8ocVJoXor4N
	 DGSl7JGUIIf1Gvw9RF5VSXsfb0kOpCgSbELqlTBDt1MBAixmOKKAvKHp3itnc+Qq/IPPN
	 /rQ8JVrj+QISyQEMt3/eNd7hGddLKjKNgfrsNFetl7mSrs4h7iunpIskORxlOpRUKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YVBgw8y3;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCC60A262C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BCC60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YVBgw8y3
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-9497a167a6aso50089385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050002; x=1795654802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=L7aMwoGxJDz5+uLQk9QcQSVARF5nH3GNjm9qQBuCQ99yg5pEiHTKsk/hekBC4M3FZr
         GXwrybtTRtBlwRhEgG90FbjX8oThEUayrTrolgCJK4Kkdh3WlDIzKaLN49j+rqBSm22g
         JGHDXhav23D9VEPGPtMSi2urQL/P2gRqU/Oj2N/GevevTnQqaMuTWv9d1wAWnSSkuvoj
         uXPNB07JsiWeE6vnUiSZEq0AkrZhRneIT+e7JJ4dHUnrIwdGbLLCFfIyoOafDlt715/Z
         2aUu1S3ZkdXkWxOfMK3FRttaFt91dBMPaeG6hn4jNl848G5+bpTJ5C/XY2ud/+he3H71
         JyUw==
X-Forwarded-Encrypted: i=1; AL+hErH7spNZ1y6uD5A3zCyFu/4lfWaLUvzm786y1X/JqW0iv+qRLZXyOc9SjiNcZdm1Q+3inxlK0K0Dr1kPe6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fob/gzvJuk2d1drVM19vddZsKqogXRdgo6y7rcz3yq86H/yFs
	Kcm5xayZiu6aENaWT5ocQ9QJ3eZ2aQtDPonYdKWKAWHqz5fbCDN6h9LkIn1y3hCESmzic32rROK
	DWJauNjRuyPLwWhsnyQ+CbHHyqkqlznJY1AJsgU8rDy5WrB61/KS19eQn5Bb2Z1UrK0NVPgB9ZP
	Hn7vvLkORRjJo634HU/CkLvqogUTUaI0oDUkfS3SbzWN+bpyKRoSv1aV+d7zVw89GZ+ROo32rjV
	nwgo8jTaH4UIw+j2P367K7t
X-Gm-Gg: AYBFou1UuJ9PfdpE5KBzhSS0H9WJplh82t1yecX4ry7ji7c6VCHxSt91lz4iEF8BiE1
	sH8Es/yG3zCN7797W5C64BYlY0lmQmfUntbfASOb0Jncsl5E1bKFVVMzWqmiBOurI2r3N8KZs3+
	pi6Rz6IP71gjNfHp0PqVZKM5OZR+511rCqDmrd5hVd6UGV5B4AAyaPS5j4mL9rvutc99Mk5WIwd
	ExwgTMZQlqfJ02V7nM9PFKEGXCcGO887wtfzabT/msxY8lyelIBrrPv5cEMzmkuuhEqmKAtZ7A+
	JCDbej/t3Bfly8vgTpIdVY/KR/Pqg+ycdhQK++tUVg7srj9JtIitcw9sc+RWADJLS1Qfu0abnid
	yZb7wTuS2+OrubQ3vLGJyQa6zwone5x5QmX4/DHPV4OaKWKBvzPgAMnMhr6IHlxRZkFlJCZeoox
	yZntOhabz5FN0hyPs5PNxCiml8FlB08I/cTWySSG4d
X-Received: by 2002:a05:620a:7118:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949ad93190emr43729685a.29.1795050001930;
        Wed, 18 Nov 2026 17:00:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9499b3d549dsm29110485a.1.2026.11.18.17.00.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:00:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92125693bc6so8635596d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795050001; x=1795654801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=YVBgw8y3R4iU4YbOIqrRky0tN6DM2G+JbDehq9AXARRKcOooRnZ3g7Xzz8t/qNay01
         aN7NZOz4C8m6JzhAUtxgRAUEXqYtXeTXRSNFq/CGUJl3Jq3keRH0wnbByvwveP/RhP4N
         6YzNtebcknvn+JK2M8mJfMi0ByKU+upfoDG/8=
X-Forwarded-Encrypted: i=1; AL+hErH8IMPwATd1CzxDHSTLdJ2w+qwU1vRSoM9h2BJyvBuzRnTMCdIOKaF9oahzQaE0rYNtRVZFkHA5QWKo3Vg=@vger.kernel.org
X-Received: by 2002:a05:6214:418d:b0:91e:883b:cb2c with SMTP id 6a1803df08f44-9212a276df8mr2620366d6.26.1795050000998;
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
X-Received: by 2002:a05:6214:418d:b0:91e:883b:cb2c with SMTP id 6a1803df08f44-9212a276df8mr2620186d6.26.1795050000529;
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:59 -0800 (PST)
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
Date: Wed, 18 Nov 2026 16:59:42 -0800
Message-Id: <20261119005943.999981-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119005943.999981-1-florian.fainelli@broadcom.com>
References: <20261119005943.999981-1-florian.fainelli@broadcom.com>
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

