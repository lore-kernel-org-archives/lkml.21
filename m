Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203822;
	b=NM0RwKDKGKwELhEBiK5A3B83bzlctc6Z+eUH8o0zL8fdGFKb3nhHm3uLt1E6fiLkjiZm
	 Hz3P2CSUxAWxPKIWuachtTIoCyCLu8uBa0NAEb1DRrSYu36hdwhpqs6gQxo7C6Zzg2AcG
	 /kuzoC5U/7w+yXKJdkNux9RsnRuUHGrbnsty+J/dphS5alQ87rC8NI7VTLCtjGSfpOIm7
	 1IPX78g94siFYbjiIaktk+uwkJonfy1AE31+c+hph80wwUgMQB+LIl07fMhwdjxHmhB6A
	 yhTKCqB7kfDhgBRgxbIvd1QMFqXD+k7MnQqAm9SAfstQLb5CznV61utEYjRAhXgy35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203822;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=KEO1k4V/YGUD4+sXJ0PVjmu455eopuAoPUWUCP45QFH2tX9sNH7D8X0fWJhH/FIatrhT
	 V5VgbZGdqNOdR1xXNfprjiPTkQWLagMHrIH44BGROsa9f0Iyf0P9kMA8VvJccn5r1nYQX
	 mKX/j9gHng7QqvBs9+/HkAZkyUohmc8GkBTenWfoIo8GIdL4qtVgBFmqM2YHgniI/MdtF
	 ee50aLhdgHtZYTJDh8zIlp99s3m6hmqf3ljwW01ReK+onbLNwIrlrha7nt4sYwpntQlgT
	 lcHEksX7LISN8T0xmsZbHssCxhJqMkVUPtgOywAfTgx35a5avUEKnP8Ilw56HvmSAJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mqs+jacr;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F073606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F073606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mqs+jacr
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so831640a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203813; x=1795808613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=YpHC92QJ6mva/Q5dcxp45+oJoNThS/EbRMqS8eb2LB41jkiWoTDF0/lmI3nhk2Wsvf
         BZCxdulm3MtCAAiBTxXzlZr382yXMAlW7N1t7iHV4y0BUy2e7u4bROP87JJdJJOomQLZ
         czlCIPr8OszMdqH6WbRrO3HtcLe5wxsbobRm28188a09mfSV7PwUTpPkz82lbpc7rgBi
         pSRxXFUQhfY4vJXJKcABeTCLGh7p/nMl2iDT0JOtjBFzlgOB2NFy5pcpn2RnHAYgh7+d
         McIWp+MIzw/BZkHYJtzFvMRXchKtJK39t8ZzOJon+zS0YIHVJBeJMZvMnIbMKN8OngWl
         GtcA==
X-Forwarded-Encrypted: i=1; AL+hErF+26JpFGovqiGOP+tbxfDXbBm5iLBL4topu5RHrjclCFRIJFEHqHFrp2TBmUqGOACj+zjHxzz3tsICwkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZadcjULxqrd5CCOn5ezOCjGG5fogIkzktQlDofgp8rcOyNU5H
	7rneSkiA5yk6OR7Ip2wGxoio+VP9tf8xtbuP898+UOOPIXrSpJ3tybjdQnjjiAj0hFlYfnqYJvW
	7SIlhbLFiXX4zuxSOQDnuxU5XhRt5DCnEyCUtrXKWhND8okwOUWWjIRB7rEERw+mLzZwKM+JNIN
	9ADvj4f5Evy+GzYuHX5hIQwDnptaMVtpbKv+VMPuUwGBjxQM0F3nl7jbg02Cc/yG1jLAWh5Hq13
	Z1ugndivZP62T2HS8wOXqjN
X-Gm-Gg: AZFdTZfnbejmJMkDt2NFLx8z0PgY3aCR+ciRyPPD1FYRuqZ+TcC9RiyyHwkuhna6ir6
	JUyYCwET66F4d3oFUc4rWp9sEudvFS+jeR+7mEsubiXOjAXkDLtdRJwmEndaOWh1c56E3X9HHtH
	UmT1HEyGdYOGPpzk1rbT9Pl6In0nPM1IbID/dAdHP3kHXMti5V19psfpQhgjaOCDNp7PLcktqJt
	TTgLsLanRKm04Y171hmpAAMd2M7YrpAReOoinvN7CZmcHrFmfR8+4a2zJjowd9IqFM0geT2CVY9
	1wSYwBcSnT5/j9Ceyh+sLOqVJtnAUdEE0Cc7VRKztmOlZQ9engcyqgEx1NUocmtXTbec/Z/CB0C
	s5POGbUnbAdkEjsadCCZLTofrl9nAkOel5GxVc3OGKqh9CEkj6DgXF1GD23R/aD3l2g9NNK30uu
	NWpkpZp8O94qGk+5tqwV8LFkt92TmLGaZTVlkAow4D
X-Received: by 2002:a17:90b:3f10:b0:3b4:1982:45b4 with SMTP id 98e67ed59e1d1-3b41cb212d5mr3639784a91.57.1795203812626;
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffad038sm1016696a91.3.2026.11.20.11.43.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211d51dd37so30433196d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203811; x=1795808611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=Mqs+jacrMiJxgeQL9ab6M16kCpUuVttz6QXvpjX0DorUfwVdVLAoKUv9mWrukxL4dp
         BE7UU9PjEKUSAZyyIaC4lPk7GNaKRiVQeP2j3nLvs4E9jfjfHIObJlhF7a8HC7pacilF
         4JR93lo8QC+UIwvnk70Q9nxjezB4S0DX90uVs=
X-Forwarded-Encrypted: i=1; AL+hErEjPWXOxscBgu6S3LxRUIGcB9FH2RESTffrF0QH/uUL9FE+DnvVds/cWjJVOT7hzvK8Kgh+vEM/CgxZ+DA=@vger.kernel.org
X-Received: by 2002:a05:6214:5541:b0:921:31cb:5af with SMTP id 6a1803df08f44-92134b7c46amr70632266d6.47.1795203811182;
        Fri, 20 Nov 2026 11:43:31 -0800 (PST)
X-Received: by 2002:a05:6214:5541:b0:921:31cb:5af with SMTP id 6a1803df08f44-92134b7c46amr70631936d6.47.1795203810762;
        Fri, 20 Nov 2026 11:43:30 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:29 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
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
Subject: [PATCH net-next v5 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Fri, 20 Nov 2026 11:43:16 -0800
Message-Id: <20261120194318.3952487-3-florian.fainelli@broadcom.com>
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

The MDIO_CMD operation code field starts at bit 26. Define
MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
coding the shift.

While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 to
make it clear that these are the Clause 22 opcodes, in preparation for
adding the Clause 45 ones.

No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 80fb3b5b52ab..5f79f31220f2 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -21,8 +21,9 @@
 #define MDIO_CMD		0x00
 #define  MDIO_START_BUSY	(1 << 29)
 #define  MDIO_READ_FAIL		(1 << 28)
-#define  MDIO_RD		(2 << 26)
-#define  MDIO_WR		(1 << 26)
+#define  MDIO_OP_SHIFT		26
+#define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
@@ -99,7 +100,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD | (phy_id << MDIO_PMD_SHIFT) | (reg << MDIO_REG_SHIFT);
+	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -139,7 +141,7 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
 		(reg << MDIO_REG_SHIFT) | (0xffff & val);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
-- 
2.34.1

