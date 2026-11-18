Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026304;
	b=Y2nR+y6uOG2ajtRXiZs+HT4Azn4SWXTkAUk4sARg7rd/8ojm9+bmIUjqwrvsyh3TJEMi
	 TGETONKLAXhDPJPkW0HnsA7QPioYUMpDm4FR+OIU4fBBhXpgF4DHFi2xk1Nv5+/BKEgrD
	 gZwzlucVj/8o9wLwipK95vA5j+vW8PGmo5BwFer2fh6xJlcxZZxrEvC5O8Ic6L7+yLtDQ
	 aUxAMdNImUfGwQWEpelpWIdyTpexYkA9f2Ka9vUnYbcR/VTVS66N+US16v9C8Qu66mACh
	 N3rql3UL7+z7XYwhz4Cw5yUmE/hsLtR4hn3L98PyK3EbrYoBuXTzv9KLz3TgEngQ/Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aPm8bMtN0XCic6a8OKv6xXRC+l+0XGJs8lRtJHx2mLw=;
	b=5FYShrzjtiAlI3mYf7k0HB8jxZPvgVG79Vy9VG3Akw74uAs8+NDllQfeZR4PsLGVplEL
	 BsSRz0zx/iTmnxt3rgN9PLfZwu3+Qph3+BgtYIuwN48begXuufItYp2EObINWhxET51fv
	 XDkEapH6CSiF6/QBacGnttRc7G6FMoM+GmgSCh55sMtHzjyHzaI27/u/iUcwY/yXaG4Hf
	 n7h5uycMAHlhNJXm5yxGJb/6OjoXB0rYQhFYrPliIr9rSx3+I0yglj/vpkc3N9aJBqBxP
	 cPEKnZaSVxyPpgcRr68+qcDhxVXAilcDqm36wDx483jlXMUgO+cv9WFkE+aNRNgEuYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDukXne6;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D11606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDukXne6
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so904469b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026304; x=1795631104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPm8bMtN0XCic6a8OKv6xXRC+l+0XGJs8lRtJHx2mLw=;
        b=aDukXne6qZLB4OGhduaO1ZScJ6sh787QT/POYB0Kof2Bza+lT4qRtqvmYVraMMR82f
         2ullkMEbpOLOz4Ut2lnHlnuFATEz3nLbHMsG7enezp0W/zkZANczH+MT5CArnBUBCZ0J
         gHA6SXt3R81BrFARYotuK8H7q40DRrajh/ILSQB5IwVhOl4lqFt5y3lukw2i0AXM5fgz
         mVXGSFOQ9sxcSy3d2sIovYHGx2BvyXKIC1YUZ2iLIG1UweT21F2f+72VI9cu0yig8WO5
         WSiE6SoKBgcYBWY9EoNclQz+Fp6pTHbsJPn5fVWjQjglPoxx01PtK0V58rKf+FGPh76+
         LO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026304; x=1795631104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPm8bMtN0XCic6a8OKv6xXRC+l+0XGJs8lRtJHx2mLw=;
        b=omeAcan5y3zRvEImBKapTsWAW1d9hGbB2+8LVfQ9FHvTBJSSLO5kkRxPr3g7XNRcpJ
         GPsTQ/LTj3pIvFFwuScOYBpwJ2w6yKN8Q9jzFFUGreDZwWLrM4ku/CS2BLU7ZnLOLQUl
         LBxPCOn7P2hrd1HoLsUWo7emDjK5wAdz2cD5duQ5q9tSNYTP5JtajQ843Bo4XvUrJ1v3
         xig2wnXjUep+GtOXtIsKLLcOKQCNvys1rINjhIgPer4VcGNLKW85gfzv+6uNJxOUu9qO
         m0L9MJnHJ5Y8MVhUti4McTzhHSRoOy5sttnA2yds5FI5qacilRaBn/2L1zw8y9IygJco
         I7fA==
X-Forwarded-Encrypted: i=1; AL+hErGJiFERGN6lOB6yymnZQpzj+m7rRq+cXbxpnb7gMgUwA3T0yB9XkZCvVWTId9hxLg/UZrjfwPkTZsbsuwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zQk6D/YJeAw7KtvC4u8U3XYX69lZskH/pwA8lhB91zarVTlLt
	oaXxbrf+SWVW7Yv7x9ye1RkLNT8HLHJ2aowiCx8rB8AGx/PelgknJz7q
X-Gm-Gg: AYBFou35KoI+hAhp5kdxEkjaZ0bvWhBF37P8NVshvn8GsaohGW9kvFBRFr4f839oano
	ZkFPlhuSMXmYWa2bA15DxJ4ShYDTH1wsk8OUSJbCgnmXSOjC1jFBt6//zRQDn+NHxZejF7CQ0b4
	SlUCAsVoeKknJoW6p3A+9CT7Rp/GI+s02xt36x6Gi2Ca5WNr5ubw8B2sfm27VgCPqeXxkJiaEa8
	r6L19oTiAaWNPd7Mhmd5zUDMUyEDqNjrK94EoxNk9US6FUqYqr8dH8u3W/K6PbFux8QA0HcC5r/
	PceDPki0DTSclHnUPayqhMHiH3BShNNwwX4BjGT4jpLytxOX7zMbSBIQRHv+1HUOF8c2LcZT36C
	8ijGlSdOGEuc1ahdXjJwpz3afFaF7vNtOnhSWHp4ggfo3fHQ3pkvtXghADp0TlBbnrTzwpopGXL
	WATmE23fpVGieE3CG/XFOdjgl42jSTR3aB58WQVfm0JAryXOmSYRIlbPfJl/enOkRLKb3Ha3mSr
	JaK6r801Cd1RWH1TeDA/q9OK3CWFJJLbGCPBqkwX36onXg9PDS+8jh3iJ3cG553LS9oHwlRgiGG
	XcV8Vy55zl+Rk/lar/MudZ0hI6HeDGccQ8oMPj9NaAofrYaI/KqihOJrwj7xC4QdWKssAbRiCML
	LcYzm
X-Received: by 2002:a05:6a00:230c:b0:8ba:f51a:1bc1 with SMTP id d2e1a72fcca58-8c5d3639dadmr3086650b3a.24.1795026303092;
        Wed, 18 Nov 2026 10:25:03 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8ffe6sm1669954b3a.23.2026.11.18.10.24.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:25:02 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH net] net: phy: air_en8811h: check PBUS register read errors
Date: Thu, 19 Nov 2026 02:24:36 +0800
Message-ID: <20261118182436.32455-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

an8811hb_check_crc() ignores the return value of its PBUS reads. When
the status read fails, the loop tests a stale or uninitialized
pbus_value and can stop waiting before the check has finished. When the
result read fails, the PASS or FAIL message tests the status value.

en8811h_print_fw_version() also ignores a failed read, which leaves
priv->firmware_version at 0 on the first firmware load.
en8811h_read_status() then handles it as firmware older than 24011202
and guesses the link partner's 2.5GBASE-T ability from the link speed.

Return the error from each of these reads. A failed version read now
fails the firmware load or the probe, as the other PBUS errors there
do.

Found by an AI code review agent; not triggered. Compile-tested with W=1.

Fixes: 71e79430117d ("net: phy: air_en8811h: Add the Airoha EN8811H PHY driver")
Fixes: 5afda1d734ed ("net: phy: air_en8811h: add Airoha AN8811HB support")
Cc: stable@vger.kernel.org # needs adjustments for <= 7.1
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

 drivers/net/phy/air_en8811h.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 81aa9df08dee..da9a5deccdac 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -378,18 +378,25 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 					  AN8811HB_CRC_RD_EN);
 	if (ret < 0)
 		return ret;
-	air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
+	if (ret < 0)
+		return ret;
 
 	do {
 		msleep(300);
-		air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		ret = air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		if (ret < 0)
+			return ret;
 
 		/* We do not know what errors this check is supposed
 		 * catch or what to do about a failure. So print the
 		 * result and continue like the vendor driver does.
 		 */
 		if (pbus_value & AN8811HB_CRC_ST) {
-			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
+			ret = air_phy_buckpbus_reg_read(phydev, mon3,
+							&pbus_value);
+			if (ret < 0)
+				return ret;
 			phydev_dbg(phydev, "CRC Check %s!\n",
 				   pbus_value & AN8811HB_CRC_CHECK_PASS ?
 					"PASS" : "FAIL");
@@ -403,14 +410,20 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 	return -ENODEV;
 }
 
-static void en8811h_print_fw_version(struct phy_device *phydev)
+static int en8811h_print_fw_version(struct phy_device *phydev)
 {
 	struct en8811h_priv *priv = phydev->priv;
+	int ret;
+
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
+					&priv->firmware_version);
+	if (ret < 0)
+		return ret;
 
-	air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
-				  &priv->firmware_version);
 	phydev_info(phydev, "MD32 firmware version: %08x\n",
 		    priv->firmware_version);
+
+	return 0;
 }
 
 static int an8811hb_load_file(struct phy_device *phydev, const char *name,
@@ -560,7 +573,7 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
 
 en8811h_load_firmware_out:
 	release_firmware(fw2);
@@ -1164,7 +1177,9 @@ static int an8811hb_probe(struct phy_device *phydev)
 		goto err_dev_create;
 	}
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
+	if (ret < 0)
+		goto err_dev_create;
 
 	/* mcu has just restarted after firmware load */
 	priv->mcu_needs_restart = false;

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1

