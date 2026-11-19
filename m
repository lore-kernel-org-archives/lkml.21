Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053577;
	b=c4hbfZyl4iaH+sZUP3Pcr0tU1FSTmrgBqB1uCE1Es6EafERXU5Nnb4o+O35AmyM2QtNc
	 JvhBXP6NnUsvmc07ELqvHnjllvFTcgqIZ+LSvsig2PD7WfocCF1RNHRIKCx/kyHhsC2Ng
	 821LujcQ+K05TSnmnW2RX0M6QWMtBJtbY5G5J4yDsjBI73+GbASy4epMLkv7Vb6gBNX6W
	 XB6zsIYT0VjF4w0Zui6tKLjsuM4aKWe9lVSMuIOaiPCBDvtL0Q/XLj291NwGeoaTPK3Fg
	 SQ5p1YBLtVp60o2jv2O1HvZsnxBzghiejkdvGrujLYGpuJFppH06FrJCsHaqTVctF9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jLpLOfHRhYYja/kDglLxZfSCn0S6WQr9Q2BVcz9tDHk=;
	b=xvRPvAmIqD5slrK4hkVvB+f4TLe9AOqFLfJkZXRysFwpZUQ9yYvaEN9w9XuZBi7H4e1t
	 GdGCcKSopdQ+SdMDxnD88btXkrwQ/6XDm+USGO/2fPDHdPwW+gtZfJSD2M1sHsPMlnLZX
	 lUlGc9EtSnXOL+MHVm9r+VSbSkcT883Av6gagIaG3eujHLHtCKe0vSSMk0A0LmzEpwtAq
	 TcUFBZYbu4X4zVuD2qIJoDJl4c8rkyRq1cI1uebXlwq53UD4x5f9/1rV1rbcq7dLOdcZw
	 aw9riLoOK4VVxoXURWXNH3KfHNGM8C5H6hdkCSJwT88BObUXNPvKhE4zMpDfRDzYC8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/NCrU91";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5ED606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/NCrU91
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91f0274f88cso21801846d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795053576; x=1795658376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLpLOfHRhYYja/kDglLxZfSCn0S6WQr9Q2BVcz9tDHk=;
        b=b/NCrU91iWWuHOrmtby0+M8QtrXiJggXF+bzgth676TmJrMikhvB5V4494hFMBn+8y
         6+cneaGiba/6/ar2SCYixmg2O5swasKSq02zpyGQI/TpdGyy08J7PGQlAsvsmOvidvqQ
         VPhYnVL3z/dyebQQl+FXTf788FK8TCq5e+9Ogpr2kG5hbz2+4SAt+8wQ+idU6CNLQv2g
         qCEuZgOqYjzhXimlnr8WgieQlQ2yPZRgdpDjl6JYN6cMEI4a32cQwJLlUMgK3SlWQeXW
         o0VAN3TQyhGoXG8hs3M1EO8XcWQ5KugfXfleADQL6dUMD2ujKUL0xS4Rr0YanExVJSeq
         5TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053576; x=1795658376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLpLOfHRhYYja/kDglLxZfSCn0S6WQr9Q2BVcz9tDHk=;
        b=eoCxZGaew7dBoz5lOQ1KzFtC/q0xettT0x0rIXOInmgHKDhZ6jLS4JMMPuRp3e7EEK
         n6akuBNzGNPyQaVXDYQj6/B0CGdiCO8pSTxcqZSfmWPCrDkPxQnpbySrgyel/VX44lwo
         qPOC5XI3W0UnCAGzMa6/P3scKBOMFdxbTZ5XyB9qVzieUAiZ02DxjNVTdlhI/kjcrA1w
         r66A30Z/UgUqBPj1jtSxDjnMYQQEVYDyl6fCfXmWOkQ7ytYDwcD2LhXNvzcyxsqq1dLF
         YNSzau+3QzHPpqNAOd84bQgWE25MdAtKuq+7mitckLS762X9FrZNH432nFCIYG/+I4VN
         /SJA==
X-Forwarded-Encrypted: i=1; AL+hErGId8h7GI7bcu+0ZipTns1tkR5fHE8XVx+jGA8l016pcngssi7Zb5ngkBHg+7cM9KlxZUIjbjxxKvm8TX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UzO4WK0MaTHf+/7FU54vnh5yPzfaH2+s+ooNLZvbhNyHMsBJ2
	KIwkLLG3ruthBDUocdtkhwLPE6pRvFZK5xSbgE212UCfwCLYmPGAdNBV
X-Gm-Gg: AYBFou0aP8DsKPfXByidQKcst0QkXD9wqkugeq5YQqbgrtKxusAxSvNLWcSVyVECfc7
	3nLKvVClwdw+H6FQNPxUfzWgu/QX4FhbaGbUYOuCApFHu7F/lk9nIJAeQoHYyfKHM1af7kGEn6L
	j//DysCnJH5WpDTquV33hrVfkjeqdIWYHyDiWpqIWybfHR6dekd7imRqT0ZppBnhD9Dtmif4fCe
	Rt8EVVqcFSzwiXhRAVLaNtTFLI6Sn0fBsssl9lCuC58Rl/Tpf5W3Lij3KP3rVaxiMlt/g9jE2PL
	J5shsCziO/Vh8Oqc5lzYZOCcamUydAJdsr0CoJ30aIbu39/dm2k3ehEcr+20E/04pkmWtQ1jmUV
	I16QEj6VSPIaqppQvucn+rDqjJaJLbrxGncIvJqkuq8gEHAknuG4Epu9ryjo5vJeVM7BqpykzPs
	ghicI65hkV8jtlA1HQRgTYd5ifeWdbD3tZ8Ynk2om/viIzs8QW2F7eWjEBLrnXV0QXvyGSsoz61
	c1ID/znXq8QBwtOghC43dSAt4hVOTB3zNDxLQAdhFDiC7EN2T1fGsHPo8EVEPTQUIMNzQDHliEr
	1qu9jFjh696zQtnRWKLpifVXu7Ebp6gipd2PEMTWa/aHINBeNJnw8LbF8HXKRr+nOsVvM4vGmCg
	V
X-Received: by 2002:a05:622a:4d8a:b0:55d:3682:d238 with SMTP id d75a77b69052e-55d5a571415mr76797511cf.16.1795053575905;
        Wed, 18 Nov 2026 17:59:35 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b24f4dsm13293691cf.5.2026.11.18.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:59:35 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Zhangfei Gao <zhangfei.gao@linaro.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jean-Philippe Brucker <jpb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-accelerators@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] uacce: publish the device in uacce_register()
Date: Wed, 18 Nov 2026 20:59:31 -0500
Message-ID: <20261119015931.596086-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

uacce_alloc() publishes the device in uacce_xa before initialization
is complete. If a minor is reused, open() can find the new device
before its queue list, mutex, or driver-private data is ready.

Reserve the minor in uacce_alloc() and publish the device in
uacce_register(), after initialization. Until then, xa_load() returns
NULL and open() returns -ENODEV.

Fixes: 015d239ac014 ("uacce: add uacce driver")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with an in-development static analysis tool.
Compile-tested only with x86_64_defconfig, INTEL_IOMMU=y, UACCE enabled,
and W=1.

 drivers/misc/uacce/uacce.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index 45521d4a56d1..026f076fa0be 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -514,7 +514,7 @@ struct uacce_device *uacce_alloc(struct device *parent,
 	uacce->flags = flags;
 	uacce->ops = interface->ops;
 
-	ret = xa_alloc(&uacce_xa, &uacce->dev_id, uacce, xa_limit_32b,
+	ret = xa_alloc(&uacce_xa, &uacce->dev_id, NULL, xa_limit_32b,
 		       GFP_KERNEL);
 	if (ret < 0)
 		goto err_with_uacce;
@@ -550,6 +550,10 @@ int uacce_register(struct uacce_device *uacce)
 	if (!uacce)
 		return -ENODEV;
 
+	ret = xa_err(xa_store(&uacce_xa, uacce->dev_id, uacce, GFP_KERNEL));
+	if (ret)
+		return ret;
+
 	uacce->cdev = cdev_alloc();
 	if (!uacce->cdev)
 		return -ENOMEM;

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

