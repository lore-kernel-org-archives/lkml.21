Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452538;
	b=hnbe15mVOnRRZqxE4sZZJJQhcnajxINSwwv8vCfbXprAif4kBrJcAfehM41yZhe/7upd
	 DCR/L+lP4snAcRm5mLospY/cxFKNNoTcQ3FOREU+VbwaPJ7dHINgbfs5M4+P/DqdcgwBB
	 CIrPUSLgtt90hzrSCMRLcFWFm9QJrQoO7NDykv4i+ygm4bFRLCOzlNaEJ81W6US+7GZSF
	 kIYWvFyCgcS8T8SDcvuGCnYDZjfQmoXcseae0A6ziL9bFzKCiFGQc334RNcriX8/S+D45
	 6gSWlgsWVbAVK96kfoZn6zqLANvAaHVsGgxm3KyOYsidVKDHog48PYRnnQfVyPvg2Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452538;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
	b=1WjIcsMIOrMS67GZWYaicxWtLFTX61FZoumJp2/5Dd+SuJ+e6+63m3EB7rDQOyNZCEOo
	 e/lMbZuaFXZvf3fBSFSaLiuSweQQbKNjho/B5vlmhN8NWA25uDR6eacs09lA+GcILV1/v
	 uIjWRcnmva18ebSinv1Brjvfubiou0jRPPPrT7DBD4ECz9VyLKSDtVYTpzeruOFCu03/E
	 hhqZlGeyPL+tGx4id7dJZM+4T/+7+Z0jpy2jY5Gu7GLrYsCtXPAuJ5L/OmGUhtNhMf1oK
	 Egzq1RalJs2UxeDLLddEn6k+sfIuEERI7V7VlB5u/RJbqu0HovjV5wIrrl5Xwop+MdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LPLMKhE4;
	arc=none smtp.remote-ip=74.125.82.98
Received: from mail-dl1-f98.google.com (mail-dl1-f98.google.com [74.125.82.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB60606A688
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB60606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LPLMKhE4
Received: by mail-dl1-f98.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3333184c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452532; x=1796057332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=vsoHss9z1WRMnrKcFL62/62AtOMOO5zin7IGL/JOb/c8JynuIaZSLYFdqEOonbgPaH
         ihTWDhkSYUOxk2wGVYXNmcvF3jObJo+xWKmlG4RV+fkbkA0v4oWRoRnNZhZ974VFu1Vf
         +Jpw/SwnekNzgDOUqaoLN/M85wvOUDgy4hlhC/tveugCnA8EBU71qyi4rtz7RHX++AAy
         f0GXkj75SR+8nZFd2j1weO08ptLTy/UuXuGYrgpE5q0iWmnhcqj88Tsbof7RjeCWsgO7
         nUYsMCc8VDBQ0pyPnUKieqdoRScGtduh0bXjlpQJ8gy1QxmrSY5EbPlFSA9y4sd1e5Hi
         aLpg==
X-Forwarded-Encrypted: i=1; AL+hErEPaYvUvHqKplQuBlKiBfsd2ODlNAkVuIArZ8r6aZuMuzIS3SjNDay5k4F6iAMKeHAC3aYpHqIzBrlO9p0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WP5hOad9iJif1gpYBSWOBT7gJMsGxz/lT4ecsptukPn/leoRa
	NOsZPjw3aqZZ4Vw48CmGVl0P5jhJV5I+6gt2W8TvNwZNAJxVXModR63wtq3ZB3Lw6X229w6e7gK
	iBLT12+NUnVG7Gw3rzjbJ/q+r+zzp8ey2GDvXN8spj1Ap3nn2DSn5pXEbvEpP6FcfPGH3NznqG4
	of/OtfvQst8Wo9um2mDGgaae5u2SwmAZaNkyRqEBc0dMua9fYoAOwvnGFy9wIE7bdcMr+orHiSc
	TJ9yFvH2LjAQYIHqPYfXlX4
X-Gm-Gg: AZFdTZcmuIzSrU/+gyWjinDhB3TN04/o2yNdEIms4UTebkyyFByINO/SXdI+CaH2pBG
	QhQ8Aucz6ZkXLzBguoL566nxF9z3q2RULVkkjbUGIpmhkW+4GcGD7TIx2Ij407pwtUM/t7r7bDm
	vxYM7Zc0cFJtz6XrBbL+/bRtEhXo5dVVMzYeheumQS10fsGNRyKhRs+PkxaJPvCLB2J91yF6bk0
	yNENu/LgD7Hy4ANd/L9Ip9+1w+1Zkl31b90lDc1vGZ9ceXVjW2GJul3myg7/CuQ/Zva8E37l7QV
	fGRr/i8n9jK/47YhBvVtpQI9Pu4/9QRN4mmstkTnuYUam/AUbcxBwveDI2lwWnTpLYK1N1L3sm3
	wEC6CSLshltz9qyCBjXpoqq914buGE76EKvz0jLrkKjnhohgsTImusJ6rxTIxRYa5IZnyWcskq+
	I5qz8p44p5Sj6H4ieZcKZrOX/783A0v0H8+gt4mlCg
X-Received: by 2002:a05:7300:1486:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-38570e24c35mr16097454eec.25.1795452531273;
        Mon, 23 Nov 2026 08:48:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386a58bd934sm932593eec.29.2026.11.23.08.48.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so574400785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452530; x=1796057330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQj4jlDcQV4Kx+PZkwi5r21miBHCD6VTb5zxRYuV7w=;
        b=LPLMKhE42YlrVnDLAImInWbebd52o02M+8FS0ljzbHcHYm0RlMQ25XnMOHPuqTekzg
         Q6J9c12W/5ozF0vXqAznst43/zUqsEEt3BYWcaY4zFhGUYzaYKHl2R6H6iUyhRuaxNzL
         JA2EFiCZHDPK6sX85M1t7Uq7B1X9QTC3Obj3g=
X-Forwarded-Encrypted: i=1; AL+hErHPmfKJl3bmk9AQOhLCi3WVZPm7kH8vRu0/IGC8qTLnFHrrpCn8vYRaU9Ne5b7d4Xe+AZIh6WiYT6dUfMY=@vger.kernel.org
X-Received: by 2002:a05:620a:2a05:b0:93e:942f:b8b1 with SMTP id af79cd13be357-949bab0eb61mr2148250385a.64.1795452529982;
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:93e:942f:b8b1 with SMTP id af79cd13be357-949bab0eb61mr2148247285a.64.1795452529527;
        Mon, 23 Nov 2026 08:48:49 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:48 -0800 (PST)
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
Subject: [PATCH net-next v6 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Mon, 23 Nov 2026 08:48:34 -0800
Message-Id: <20261123164835.1733304-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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

