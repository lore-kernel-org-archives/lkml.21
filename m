Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155643;
	b=QehRX1UpCW/0gfDQ8iufyq8zltxpQuF1lC2ULNcZWd+7sjgk8Xytxvl63/6oDSKIYP1o
	 cwF+We+491ucX2FHbiRi9S0qIFvdidZkFgtfMILPhhjaVFsanm4ZJuex2MQGNn/Dsk1cd
	 iEocJkZu/Z6yek9QM+NJHsIXsvt8hwfQVx598Xjy6Kgt1BYdwATXWU1LWP/zKunyUA/1K
	 Lqix77zuTyaZ8sAvd16QspnBxj38l6YTMfXaGHEIbMOOlI5EQgSNc8Nxq5VLlNEEnZo8p
	 oQYrVLx7r0RYX8MOiXO2NxDAqFBRlDYFY8gfGgxPD+Sm/zznPjRKzFtHXH+58Mg1FZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nA0GNsDUy1tpumaxLh3EkNJc+6NgtbUCraObGF4AZjY=;
	b=Vj83+SMhD3wNcTK0dYu5WRM1mbO3jmcjWlLknQHMZEDhUPwoaa7aXVHXhBTP7BDuET5n
	 5irvBwE21MY0vQjpG+tEOjVg2mbNq7FhGfu0arN1NzULayiEyoXxPXkVt9LoYdXm4cN0E
	 whSiYQmt4hAJriBSE+IRtgGNqGUM/8QpAwkEDv0Q2dI3RgrzzbxRLrJ41vaFAKZK91I0g
	 XihuAIjoHWqTZo6hmHSmuSw3FjCxDtuNQ2UY1ExMFJNI9Lg3aNM/25hhdvqNeCQt+JybL
	 oNt0SrHVWLQ/qh2C20U7wNXvAmMst3l+hD6lNHzayOHRzMoCHKBvGoWZ8W5/7hgh9NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PncEarci;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB2606A514
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AB2606A514
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PncEarci
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-382c3c9671fso724976eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795155626; x=1795760426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA0GNsDUy1tpumaxLh3EkNJc+6NgtbUCraObGF4AZjY=;
        b=PncEarciuvlhtNkKI7kdDXieIM1JkCT0+mCHiLspX4FhLZl0oNFcY8lctmD1TanzBw
         Ns5mvnbGFgGHq+vEWpgMupEtPp4j8s5suBJeddc7pWy9mlnf4KvdRMucju44eI6o8P91
         K3R+UauadWVMYMgxZTTZ1L9+QxrOjp2Qg4K7aIxEjdXMmgEjGcLhOp2kJbDXDYnNWFL2
         sqcsLW8dMQKbnp+YRco03AI4gcNFhCGrXZJpko+OSlKK6xwAdV672RpNd6AxOGa1fj3h
         ZSLcUUqLf3T0Rm3ALYubcjcCpTIAepE4CPuvsZuROt8O7zeXPqOqAd+x7uFTpxWsW1nH
         +pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795155626; x=1795760426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA0GNsDUy1tpumaxLh3EkNJc+6NgtbUCraObGF4AZjY=;
        b=rmUlJK8L6BJAzlZDPs6nVZqMwfTDMlYAnHMXenS92AZXwIYrFTgZrBvg1pKtq84ZCy
         fQHxz8BzyOkJ3ffZu+wMxakC09C6p+Da9/rB8m1lIWii8YbtvfJ+JCeuShTK4Cx7w7Lm
         HD62JPRoUKGMx7bTm1pP1qg8DnNTimJFvdfeB2ea1OUq3W1pVk/Dj89lDcrR7og8zaIE
         2qtNRZ+2A48Dv+A0VxBN0fOkqMZ1H5bOuIh4WSu3PayFOEvK0U6eUErsagUaz5z7Nxbh
         FA/DmNW94VFcwGS9Pr9lPFQTcbuwbxqQxi+AccHudfzQWRyl6rCptWCFXccAjMawgnPI
         Kocw==
X-Forwarded-Encrypted: i=1; AL+hErHiJKzRf2IrcWFjetFOGV88n/ain8+H6z3W52HZEYcZZBqAq3kKennT0uAK4FzfatvT+odKGpaI1LMI7EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/fMOyV/zr58am8M71YRCieEnSi5l3y01RLJ5xvjEL5/YBS+J
	jOWTpPoqlz2d+KUhSiUWAqai1CckM/VddJeiQBcEq2FW47BzrmlN/Aq8
X-Gm-Gg: AZFdTZcY40IkTyJL+Lv+bejFuB8qv6ilBfA3AvXb+N5VtWwSdTFniXgpVIoXZzfUHrY
	Ljf2BYYz5yKvVUNjuXhtl1HBA6yAvV109pVWiio9qTgYn8OwbZ1Yopj0GSHDwhGJ0D95TdrD72v
	iWvcs7FAloU2Iu1pyDNtqPHIJBonMUI7NKkiDX0ZuKR9ktZXeoHrlqFoFyZkV72gBrgItCzKVDt
	G6oMOxkhLOtwr9QZ1UxF8UI8Lu2lNIPM6ECRBhgCeLCubxWEcZbNk0MUzDGeMOr4+KcTN7lrtxX
	d9+eNNZoJAW8MUuXFK2yHuLGxXgK2aJBUIL91LUxe2/Y6ur/bg1WY4y/PallBDj0FYIzbu+eORP
	AHr4QQlX+dot1nhTfI4dcxJMeFbAgjo2ChtalV0eL7j/eYGgnkR353pooz1NQGW101qInRB5GPV
	RBLrbqitcwQKf/yEif2Pliw4fWMwQ/tgGaXzmt61kxy1EOsI9ZL8xxyYtq9G288ly7xMmQtkWuM
	zkZOnYM9F/OPeJqeUU2cJai33a1NkfrC2EnTRWZ+kaivhqF8dunEfni/nsAOhBgOzlMbOsoeGp7
	TrtVjHP4Y6pT/uYcACeX36GTCu4z/EhdoGHkloHe88b4jhuqX7/YSbo=
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr2512258eec.5.1795155626034;
        Thu, 19 Nov 2026 22:20:26 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:84c0:a687:3d35:47b0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm2920863eec.24.2026.11.19.22.20.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 22:20:25 -0800 (PST)
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
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH net-next v2] net: phy: air_en8811h: check PBUS register read errors
Date: Fri, 20 Nov 2026 14:20:01 +0800
Message-ID: <20261120062001.38233-1-enderaoelyther@gmail.com>
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
priv->firmware_version at 0 on the first firmware load, or when the
bootloader's running firmware is kept. en8811h_read_status() then
handles it as firmware older than 24011202 and guesses the link
partner's 2.5GBASE-T ability from the link speed.

Return the error from each of these reads. A failed version read now
fails the firmware load or the probe, as the other PBUS errors there
do.

Found by an AI code review agent; not triggered. Compile-tested with W=1.

Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
v2:
  - retarget to net-next, drop the Fixes: and Cc: stable tags (Andrew Lunn)
  - also check the version read in en8811h_use_running_fw(), added in
    net-next by 89f0fb60afdb
v1: https://lore.kernel.org/netdev/20261118182436.32455-1-enderaoelyther@gmail.com/

No new W=1, sparse or smatch warnings.

 drivers/net/phy/air_en8811h.c | 36 ++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index ef20b41ed5cb..c48ada43ab6b 100644
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
@@ -527,7 +540,10 @@ static int en8811h_use_running_fw(struct phy_device *phydev, int err)
 	if (status != EN8811H_PHY_READY)
 		return err;
 
-	en8811h_print_fw_version(phydev);
+	status = en8811h_print_fw_version(phydev);
+	if (status < 0)
+		return status;
+
 	return 1;
 }
 
@@ -575,7 +591,7 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
 
 en8811h_load_firmware_out:
 	release_firmware(fw2);
@@ -1179,7 +1195,9 @@ static int an8811hb_probe(struct phy_device *phydev)
 		goto err_dev_create;
 	}
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
+	if (ret < 0)
+		goto err_dev_create;
 
 	/* mcu has just restarted after firmware load */
 	priv->mcu_needs_restart = false;

base-commit: 0742ef27cd72f155e6d355d13c49133116f19c89
-- 
2.56.1

