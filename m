Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076099;
	b=ALmmDmvwRyuXZkt6Z5NTHg3G1yDQIzNq7pp3WCamIrdo7PXFlLUNABXF+rbNl6lRqKqw
	 O5r4GMuaeawRELleQlIQUzSqAL1goAhZrCWdCctGo37I6bezJGGHOY05HIKHGBxyz8pbU
	 OvP/DiU8r29yFQO+vgxXDA/nyBy57Fr3VdLfQeFTCfRu7O/xuTQp5sQtjOztXmJ9Kilky
	 yOEzLAZF2YjhK2jBQHEueHVXVeM9xk5zDiYf4V/VeyQbScPVZS6jF///sF+1gZiD4WT7s
	 h/4SkCmUjrqZBDwhm31XgKygunW2SqhrumF6JhPlfaWPnsqhGj2w2TMoUfz3aYT/K7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ej7ChYpOZ5l1Y3NR+n8BUjqWY6jWLDDINKnXOpUmMGg=;
	b=Mglq9UTxZQxZgOsbFW7FGB7/q5HcA/n0dFpsLAGoBWelyGlMZFxQeGckQdOM3SOAEKkr
	 YlSKpv0hjA01bB6vqJrqRQZjDU5KjVODrr8cgMZzJhB7bCzLO0+0Nbq5voQNGFViFUXS7
	 HuMCVkhceyU1dsNgYG+iPl1C3dT2D4FNVHs1MIzvZmpPEO43fZpFTcCeBzJlUtxnJuOQo
	 nILd5gzw+t04JwTH3eGVuFF6xu9tBJf5a/JhYNCP/TNQFZ6a3Hl0MuFu6wi804vh2fY9A
	 GosBd8C2pIOMt1V23rSsCPG/Uw03UMroSuqQYJPuVY+Re1dehr6KchKP2SO6lQMfKWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ia++hh9Z;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE2B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE2B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ia++hh9Z
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491846221ffso1533516f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795076097; x=1795680897; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ej7ChYpOZ5l1Y3NR+n8BUjqWY6jWLDDINKnXOpUmMGg=;
        b=Ia++hh9Zurz6bop0/BSOU1RZsLr/+TaRJPL24B7wEwqNUG16tuQJ7MNqwDR0WbsBN2
         rmSAdXZkyQEB9Dg1/pqAcyUl0uJq3ySybcH5aoGgTXBuirs12ESa6b+sYDuXEsz2TPBd
         GGSS59O9t4mD0xr1ZW0zZBbJyJSTWqRZcW3Y+/8KOKAEuv5qNVYvoHsET2hdbOh/fFVK
         D75x9fu1NCIsOqLsCycINXayS2awoOcbUZLwnd3Sswg7iFGxEb+ddeS3sLWp9neEqmnq
         7EJkPQQk7GZI/gSQ99M1j+f6uptmvFCfoYuXux6k8mLBfDjn7JzD4+BnSayb6mES/JHQ
         tLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076097; x=1795680897;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ej7ChYpOZ5l1Y3NR+n8BUjqWY6jWLDDINKnXOpUmMGg=;
        b=RP8tq2VyL80rxY2vsHwHdYIAGI7/gPhjR7g3088+WejlcnVPHUP3XnzFk1vh7KVPVA
         HrD6ba5e7lUvrSAbChbW7F4z1l7ZajM/6i6xLG+qF2yrpIwRxFPnKqfhwe09rjtEXSo+
         /wcZ7BIuOBV6XODFqPIzuVaenG2Rvfl9C8fe24Da1poyNIB5u20zBsj8c7rs+vfiLdsQ
         /pCU1P5kMcSwZequXnhqcJ7MmgcVh6BQQrGuJzApzJ9JPCpoSlCxUhA7riCrTTGyyo+p
         Zn1zxye714gnmqg9WGx/sQVUm/toZCqYKB/ZHPurvU3RPfQIQHG0rlMydzWhwsEfIprq
         arHg==
X-Forwarded-Encrypted: i=1; AL+hErFL1QZ8az11My5scUoGDLVhKrXzFHBz4Ns8XJAPlKKfF2u1t/w1LyJfBH1oeMLJQ7CfAmiUp4hkCe5a6fE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H1VB7F4dw+kfjEBAC+19Oxh0n291sXAnKSsQBxnVrzOiTxmz5
	h4m6TAQSCbPX2ggV5X/Syu6RkL5XvzNU19vLPs4TgJpwN1/qECxg4+4f
X-Gm-Gg: AZFdTZcQIAYPHuQC6JCLwjOsZpPrsCRKsnM7+ZrMBNBM+665xPFDnyc7wvheI+1uX3H
	drALoFrk/qwL2Z6jHVjwTOmFMdEgARf/oUSvoujhpEtBmZ4A4Cz92Yalt05WQ6v9eLic2u8arQg
	4v7/WOCZm2p8/Icr1PDBKMWd8WkGf5lij87uT10uDtI3EUksW+xUOwbm9unMTsnTsJJUt+Qux09
	56WxrR0pELEWWd1yJiK/0CKDxJepqH0o/xQJFtUXIbh/DQKadkN0JfbhF2EtLx2FOhZBSGy3Rav
	KrSze4PNOxcQ01Bg/Dd+GDGbE7avJPDRHWZwBBHCveg63B2Hly9KXCFSMyIIwfYfRBwI15NNwE6
	qkxar5CVZWqcq6jGjl5MnA6hDyL2kQlBLbKj/p7FS0hZKn1mP+XW3LnTdbEa6L25iAGZ5Le0/qi
	RggbifgUmLmo0rDViflUsNCJEUoszJV0X3ZraBPlvEDE97WMd+XVDiox4W2bv8aKpS6t2hmqHeY
	gX/q33B3HMgHnoOQyx4Fg7oxOGrKL7A7PU8Dlwd7YwXupofElKbJx7iRvLHEIhYFjiTREpDkFRM
	q5VlCHK8PM30k8u+i0Dd75WzpdXL/n4CONDRPJ4lUL00CiaE37jejgpMD9mHbLVHUWoonYTM4UR
	gtIM=
X-Received: by 2002:a5d:5f92:0:b0:4a9:df02:6040 with SMTP id ffacd0b85a97d-4a9df02654fmr1704178f8f.3.1795076096580;
        Thu, 19 Nov 2026 00:14:56 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65560911fsm9161190f8f.26.2026.11.19.00.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:14:55 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 19 Nov 2026 09:14:46 +0100
Subject: [PATCH] mtd: spinand: cleanup ECC engine when
 spinand_randomizer_init() fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-spinand-cleanup-ecc-engine-v1-1-60d007d2ddd8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAwF0KtI1gaMFJFepXQRMl8bkHSYQRHEu
 3fo8m3eRRXFUenZXVRwePVvNEjfkX00VrCnZhqHcRKRmWv20EhsGzT2zDBjxOoBTiq6DAbFY6I
 W5ILFz3/+et/3D2xfVgJsAAAA
X-Change-ID: 20261118-spinand-cleanup-ecc-engine-da1af0ceae46
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

When the spinand_randomizer_init() fails, the code jumps to the
'err_cleanup_nanddev' label and the code leaves the ECC engine
initialized.

Change the respective goto statement to use the correct label which
ensures that the ECC engine gets cleaned up correctly.

Cc: stable@vger.kernel.org
Fixes: 54e1bc80af0c ("mtd: spinand: Add support for randomizer")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 18bba02fbd31..f6741d121b70 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1982,7 +1982,7 @@ static int spinand_init(struct spinand_device *spinand)
 	spinand_cont_read_init(spinand);
 	ret = spinand_randomizer_init(spinand);
 	if (ret)
-		goto err_cleanup_nanddev;
+		goto err_cleanup_ecc_engine;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
change-id: 20261118-spinand-cleanup-ecc-engine-da1af0ceae46

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

