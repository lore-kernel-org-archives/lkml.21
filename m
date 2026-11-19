Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050002;
	b=jTkWM7yiQXyfp3ftgZ2YCHvNwEhe+jnOMacPzsjL8d8AFmuIaEnZ9tzRV2rnIvi5lBBc
	 PI4wDWbCcdct/Ti4/GDiedH4FIiTJnC2ElL0EEgKoZdMw7fOUrxk6SCHJa/uqDUQ0qtuJ
	 txxpNhZsdCXw4SnPElANAZWFXKD0/eMU6wSOs4rtTd1IVUuSXWgt02BUjh+FsuJInjVrr
	 6d8f3S0o+24b1bfcimjdhpaU73jRaKEGg4RE8MCvjz+kUd3Bu1t7sFhRe8NhoBsYirMBQ
	 T0jSDD7qBY9jsuDNItcwANVMNT9nAs+Tn2pI73MBg5rf7I6taXfvdPxpSBj2NJBRrtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=Dq56Rk4fFvioV1yxzYfXLf/1jyRLt41Q3XXj4YzPjOYz1PQGtd78OZE59Vahj2axc3l+
	 kYJ1159QaJOxw2uSThbyPW+SN1aXrZmym0ZWCXZ4kagO7FXMGbsU0EWBylkcEGkz03Ixp
	 T3uBhmdAjpP4vKY9v3Ysr8HLXmeIyKb8+/G4FgeQHG+SVh2muB38Q4EGl29hx7QWiB1yW
	 3QoATbpXLoU40kKfOr8pPEnEUG0Ca0MdAC1ZLkEzNUT8eX5fQSmLjlC/VFZrYCdooAs00
	 ukR4PAMq6Zbc5Nj1MlVrU3hxO7bQrlTDQIxUkqdnCdw5Xfsgi/AyRurdayvs2n7YMtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XpPGTWL4;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA360A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BA360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XpPGTWL4
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso203236a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050001; x=1795654801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=BdtBD98MetK/7ae95DJg/yJHgvlQu/4ND005ao0XCkXpifH6FRPzv8otn6LGJwWNTr
         vemspNVBk8q2cBPjpFltmCBcsVmm+DjDjEULfGA9mrT2mRgHKuOk9VY6bXkOuQFvlzUw
         dMoKjVbzBExNHVj7il1k3yztO2ZauAVP7Gy69p3OKBhxtsFVH0ufZGeSKA3wVMh5UA6a
         Z10NzhWtK2cFK/ndELHkEPU/YudJBR86jbm+6gs0mIJGU5cfhawUk7SxL2Fud9vPVRRv
         Ry7RKqruPvj7ALC7lUAtBXXU/ehOrWQcUdm8wIOsKe6HM5/AZp49+LI1jg6Hz5vFYclm
         MdLw==
X-Forwarded-Encrypted: i=1; AL+hErHpOaGjY+/rbDszbrFEUI2pFtivX7gqLjMbb2JS4LBbvnM1LgmelyHZ3U2j17agm60WfWQIQv+qzOCUvwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AcEy5Nr6ibH19e2QVGFFcS5gm/WrUd+Nb21G24AmF6T91ymoY
	aCLBsiMJ/iVVLhq3VvDHy6IH3uw63gcKJJxcCk3NS8AVE/BDX9C6nHhm7GanjYSb0u0uJrIFwzt
	q38q3UCQvsngqGkwrdDO2ZmqLsrbFKZaXEzTdE+jB4mSY2m0uf+toRU3PnpVeYEoay5dOfl3PMP
	bxMj6Z68MK+6AqpgqIXvm3uzGKY7OQjoK2IWS5Ec6c/suwyseCHPXvGal6rT3xWxuoQDwb1X0gY
	0vU+EsNZLA4jneeIn0p6Rbh
X-Gm-Gg: AZFdTZdd39dBQO+HDwV0mbRZ1d/SW9YEJyA4dpHZYKkgJs7BjIxJ52DqwWhklcWbsXK
	dPUVkSuM6VMX/HxB2PqT5ZFolCJwWAMJMrfqHcklCOKctO4XtukCNlzzlpJfKMZ06agYxxmZFko
	NHRwcL5gWI8Sv27ZgFZ8pVCrzN9RUVZrjH1p7BE6o5qKmhaC6OydqkveDgHJiHn4uWqpp05VGqF
	iX+ofI0S+cPnIy7swEj7IzKR6q6fT7Y53FiUwPgmzDbiiw9aNQ66FKYiGUxAu1+o5pqLNxVXUE7
	FzqLit8Kct8hEgdH+tk5dwxqb12xRxfQJQ3SNoNZY0FwJj0Rhb1C7qXGG2oqC+0W3jx4yMaD38i
	tE8BR/yJmLA23dC+2ZaV1ofPSTBY4krtfusliw46nQqKH6MC+jo60hbDU+Fgh5/C+JppCFtKbtX
	vlx9GqEPnOSpVFej6+AlpnN5UVGn63mdZLnCaR6yKx
X-Received: by 2002:a17:90b:28cc:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3b3ffa6d3e2mr181968a91.41.1795050000897;
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40298f89csm47532a91.4.2026.11.18.16.59.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:00:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-921161ab1a2so6783466d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049999; x=1795654799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=XpPGTWL4EUv66qGdgWCHdakIdiOL65GskTKAQNxQAtczh7AoqgCAs0R4fRe1FjFgIL
         2CPnoX5WnckfkdSedDEFthZUBorFCg5L3s0FSUECYam+KDrbwHoClc+hSZu/GZpYqOVl
         0OIw1exrXqC+0xd3EpqyGWGBqWGBmXoCiVMO8=
X-Forwarded-Encrypted: i=1; AL+hErHylGiZC371Vhn9A7ulMfqCf2Mt2CR6JPDtvgSkS0mjLTaNnvHG8HE7v2Q0hvsxMbFRgjXtIdyWXyXT3TM=@vger.kernel.org
X-Received: by 2002:a05:6214:1c42:b0:921:11bf:51c1 with SMTP id 6a1803df08f44-9212a287872mr2987166d6.27.1795049998625;
        Wed, 18 Nov 2026 16:59:58 -0800 (PST)
X-Received: by 2002:a05:6214:1c42:b0:921:11bf:51c1 with SMTP id 6a1803df08f44-9212a287872mr2986916d6.27.1795049998116;
        Wed, 18 Nov 2026 16:59:58 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:57 -0800 (PST)
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
Subject: [PATCH net-next v4 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Wed, 18 Nov 2026 16:59:41 -0800
Message-Id: <20261119005943.999981-3-florian.fainelli@broadcom.com>
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

