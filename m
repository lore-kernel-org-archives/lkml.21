Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967981;
	b=S8v3d86rcsjeV4B4PL8BEtr9B3/gnIkforpVy6EtjaaCZyWN7HJcX/3KTUvQdhF5Jaid
	 +mGdHrIyUKJwgoNlg6G3IiZzulV3N5zbM8/NMUB1UpXza5n6oJFslrRaQ8xR+UrijwGfq
	 HTVoMzyKJx+UAr6quNg4uoZyRwFaS3DTUpp41fSQZy9663/m3JTEEmlaE+ex7Q9BXRD4D
	 DT298AaflZy98y3dzTXhzKnv95kERqn0jU05CzH/miFxgag68kQRHZv8AZtW9q1RWUD5e
	 v1J67A5f3N0vWrqBEevUBDhAzvDPQWl4tTIy02iZ7kY4e/l6mKQdWGItzmIXVrkK+hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967981;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unCvoH4dWT22gs7hMg2zpAHOjI6QOfktt/odrb/e+VQ=;
	b=ujfw1pxjp7mQWByn8EmKQi+fXasy8HmgKmAx69mT1Hht6J9w95Y1AfPHqCQfvbtwKEJE
	 BEibfEbDzwnty80RSHWNnfuwGQ/DnYrXytd7qhuQyTlXLlyLoViYhJHweES+e5N7jTOOn
	 h+8QkMI7lrpPGqixRvuRXS9PDlEGmnXkLIP+8WEsjQVWAzjUbRabfcYaFoT8OjwjT/jj6
	 FfkxVnLDsDMBKiTtiK6qQkL/6D7aWwwsuCJFXC9pi12OesWJ/ZHHpVz45wRAotaibu7iz
	 Wq8EgpS2nkqftpjdoY5+GGytzCNJ6iaHXWKq2UTmtWOxU3XGGsKuoqls8JQ5lMft9BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CZMCxM5y;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D692606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D692606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CZMCxM5y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CZMCxM5yzAbpEyndOO+lsm/wltU2YIuSyeuxtGDIGTNGioRN2zbdnysGgmxiHshKG9ayboxuRK2/J
	 h0sGiRY94EsfuhFvY8AutxCMP8dP4fgh+k3hPOpNmkXu9sSJwQuvFmxSUSHc4qSq9IoyJPFrGSiWCB
	 I6k4qJC5FA8PHd7s=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd09a3ef7-ae2c5;
	Wed, 18 Nov 2026 10:12:52 +0800 (CST)
X-RM-TRANSID:2ee46afd09a3ef7-ae2c5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afd09a1cf7-c534c;
	Wed, 18 Nov 2026 10:12:52 +0800 (CST)
X-RM-TRANSID:2ee66afd09a1cf7-c534c
From: zhaofeng2@cmss.chinamobile.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 2/2] mtd: rawnand: arasan: drop manual GPIO CS release
Date: Wed, 18 Nov 2026 10:12:47 +0800
Message-ID: <20261118021248.1952-2-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261118021248.1952-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
 <20261118021248.1952-1-zhaofeng2@cmss.chinamobile.com>
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

With rawnand_dt_parse_gpio_cs() acquiring the CS GPIO descriptors
through devm_gpiod_get_index_optional(), the descriptors are owned and
released by the device-managed framework on probe failure and at
anfc_remove() time.  The manual gpiod_put() loop in anfc_remove() is
therefore redundant, and would double-release the descriptors once the
core helper is switched to devres.

Drop the manual loop.

v2: respun together with the core devres change (1/2).

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current upstream master.  Not runtime-tested (no
Arasan hardware).

 drivers/mtd/nand/raw/arasan-nand-controller.c | 9 +------
 1 file changed, 2 deletions(-)

--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1478,14 +1478,7 @@
 
 static void anfc_remove(struct platform_device *pdev)
 {
-	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
-
-	for (i = 0; i < nfc->ncs; i++) {
-		if (nfc->cs_array[i]) {
-			gpiod_put(nfc->cs_array[i]);
-		}
-	}
 
 	anfc_chips_cleanup(nfc);
 }


