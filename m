Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151857;
	b=NBb6EyNaBM8sIV7KbYTLVKpCDo8HaKWFGW2Rg1/ea2U+iSqZgsTgpBTV5P3Tf3PTXhvU
	 r7sBCQlBnGMZ4PSeVSj2CfSNeuutRtP69+J4fljZVYhAdZZ6Uygawi7HSSrrOiyIKw0gl
	 Yil0XJShpciCyhXVAhR+pAXTPVtUvt2g8rTlJUY8PqSjqBtvaIVXq+x+r9i5l4p1a+0g3
	 VIARogzJ6oXyaaDHz7VECCnRDgZ/nsOoz9JEd/zfKQMMDRbzhWRhjPdgit0YugajXTmiy
	 OA36sJf6ReCWti5Hm9GMu7yJn5InLKoYzrVVfuw6mjEe5KXkI0ArQWlBf3Dx/LrxPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151857;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=p8ugpnH44ZTevnaHmo6qBqbylDFhE4Uz2vrKtTuMe2WAEkU9PBWW6UsP67oOesGV+z1l
	 wjpNsSyMtMOBH5JgEH2LleFtpFBt5mo8opCxzdD4F7erJ8d08xVWXjWoF5r5kedjWoB6K
	 6jjaAH5D/kbsAk1SDzgBRY/SzYbVmCScx3QvLPjWpDUFhn/9/dXGkl0qJTCXuBkq0wRez
	 2muvmxSfIXoVy7KTWJb1z0b6CGMytjQLt1Vwu3pJp+O5WNJeQZKUEt96nMza0wB41LCuS
	 tlcotVVwm0VZuBAI0u8UzeOlQ0hezzdlszNB6G8Ctco/90n6xKlWoDUeYngQRoywoWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ARktmKcF;
	arc=none smtp.remote-ip=209.85.217.100
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD719606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD719606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ARktmKcF
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-745497ac8fcso193695137.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151856; x=1795756656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=M/x8jkDJNaC0zhVuytBNEkiR5kBo6CllHmYQt1VASG1HbU8vhLogVLetrUnB+02UiX
         uKkPcF5Si88auXwj/A7ERO0dtB7f1UZf8XgFux8MVkiu2NlfAZdsDdPPWyicQZi2hAsx
         yojQ/y5cNl788iIW0U2Zqh6uU1J9v4nsSqkwAirZ44Z4WNbmCSl2jUcCtLl7V+I0Eh5s
         M9KBVHTUAhpTEWX1Rf8DGVGUlwtXyTDVQRDQWmZQ85YOu+aEbVybkRbgn20sDVJtFQFD
         foWc8CHA+E2M7lvSxAAFPfAxK3J2U6fYkjxB7WH1pCB6+odDk1dUOuCO4+hu/WI0x7RO
         iC6A==
X-Forwarded-Encrypted: i=1; AL+hErG8sZ2giSPfvKiw4kIDW4LbmxvleR9JvYu31A9BkqPWMlkkgU5LdKH/bKFOIWHYQ7EHfwuIUMFLnX63v6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rad6OPK+3m4FQXrCpiwYNewnMUNhdbauLEDBrSxz3KC2QWrLh
	WFOQm3Nbl2QVWR2GxygHBjX0pCdCZ65kQs8nXotdIdV4aVsfYSlcASdF0sDgdi01i44lsOtI54s
	5aJVa050tu7zcSpokblAyzKmYgiBj5jRhknFfe0zhoKA8OsPs7p1B+A7xIYNj4ncZ9IZjMyy4cx
	Vmsh48VByrxkzg93EI69zXJr6FrDcfWf8ry5fkt6qL6LikJgH7xGZR8WmXP7VPIz7NdhPdn1QkU
	pd4mujpPS4TjrNvvWGvtX7K
X-Gm-Gg: AZFdTZfOXWG2Ikbe9QqRp3YQEmLwJPxerTCmcHqvgjxisccdTCW3AkUe8zAKDmQtJC6
	PhL402llUhomnc1LjfQwp0zqJp/kD2NwfDQs9wWLJcHtJGGq397PXAwHSxvHVoKZCxm5ZPD/lVE
	rH0Gg5tuZtNcYaclOnoYNOyPa9vycHV1XViNMgz7KJERisebmgo+78VH7Bwap+gpbSOW2c3p5Yj
	BZvSuETTWhMn6aMmoQGHcM0ishonIB1wyvapwQUeDygFUaGpELVtVNtWumWuXXQT3MOIkVR0z0C
	2UP5eYdp/tQezTkDcGSagRhv/wP5LQyeGY+/6E8r1ny0yaIpSC4Me+JlYaHJW2f9ZybmmwT2ggt
	ufNAWbckiCGe/sIMne0Hnu4v7keols0QK6KvewP4G69jITAy50WvnoJVBBvtvOgqCmFxriSU3sW
	pxe0bfzZK1QL2fbjdY2CtxMFozmGXytpD9Pa1Eslpd
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d72b3688c2mr810310137.4.1795151855678;
        Thu, 19 Nov 2026 21:17:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e0fa50asm232483241.4.2026.11.19.21.17.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so124621885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151855; x=1795756655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=ARktmKcFjywSuCyl1xWBwkFPjwTg3eahE6eUXnGnPS04zLzaxwD8+TqpSDcDsuUHad
         9o01Zjg4f12WVQia9r9MAvC2z6354eemSkAgS8c7+hNemv8uWmqnfjvmmLbL7//mzfyY
         GhhZ+v6TvkpnZQkGcvsyxVJEIgAvrRXCaJH3c=
X-Forwarded-Encrypted: i=1; AL+hErHlzRxSMyWMM2dWcB6EEe+WJTwhZLfUx785q0zTUcxM9GhYMjfRMkOZZvZmATr/zo5gl5YaGHyBHe4lEvg=@vger.kernel.org
X-Received: by 2002:a05:620a:1d05:b0:949:744e:12f2 with SMTP id af79cd13be357-949ba99cd87mr329955385a.22.1795151855061;
        Thu, 19 Nov 2026 21:17:35 -0800 (PST)
X-Received: by 2002:a05:620a:1d05:b0:949:744e:12f2 with SMTP id af79cd13be357-949ba99cd87mr329953385a.22.1795151854681;
        Thu, 19 Nov 2026 21:17:34 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:34 -0800 (PST)
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
Date: Thu, 19 Nov 2026 21:16:51 -0800
Message-Id: <20261120051653.1433677-3-florian.fainelli@broadcom.com>
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

