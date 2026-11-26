Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708630;
	b=MASil97Bo2QA2JMzIIi69t8Cbxa+Ns5siwF4mr3Xs1zd7ByAYBSI53MlHyIBXPIFaLV9
	 6QDdBI5mWEVgXjmlyidWs2C3sZowksk8s3jTNnLD6NhCx38cLQXYV/Ve+pfltxV7BqbQg
	 5i4VgSK1JqoAK17IzsFY06FVp6kdFm2KQxiTm4pPyzvZ7qhMciHOgste+G39Euq5kbLa3
	 SH88ZMDvh4DPv3IG5UDBJFY6Yj/JaT52khTAG12zg+gxnB72vPymrj82dbwpJco9Y9kEV
	 P1gklJfaFgdLF5F1vHAvE0y6KvujS4j5rxqowFOGomv84i0IfyqnGm6Mw81cQhF0Rpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zTCr1w1nVA+vCLa1qAE8nCmQD5JZKwmRbzFiPOSprYU=;
	b=Th6zkpmis/bJNiTxjXL+E0EegLBoamPV/ffwC5gr36jCgmUHpyZgxEg6tthv3L5paUEB
	 OMY2hWU7rTSS+MiOuqxngDGXznwsPkK2sYMKjlLBK9448wctIN+T7zv+MZF6BfOUiXJD2
	 uojefNlrT4Zc6EVUUauPUeBJRDlRZtTyztyTZeZiiTVyznpm17Ms/XhtORRU0qOW7O9Xg
	 QjUyyfK2BExrt7rGS8KXLNIfvdSKDXICpR9YPys7ni9zmAEOx7he0fOLhNgZWAlnjSjAq
	 fu3FBMvla0a0GCqZxQnaw4Fa9ex8kOydfkieSz36L9aWSas15Y2rcokT+ZLasQd//3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTXpjiT3;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEA0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEA0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTXpjiT3
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so3198108eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708629; x=1796313429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTCr1w1nVA+vCLa1qAE8nCmQD5JZKwmRbzFiPOSprYU=;
        b=TTXpjiT3M2EjsuYA9GatI3+qwHJMxhRccYBooiQ2XzOsx8sjSwrJJ+6pAXQu09SEho
         zTiC9jh+ZwLvqd9dtwCfprw66vWcn9n0OmtuO3COi+IowrRP1LB1978QC0K9As0iE7A+
         FuGPX45zyGvlnkvoyXayggco4+iazRQZU92M8Y/G4ksp8Ly0yJ3Mj59LofVbFeeWT0ER
         jYdnE/Pfgt1hyGfBC7TEeOCSpy0+iHeVr/68KNcUEgpnB1q3s6m/yYTSoVawjC5lnx6N
         13jSxJ9TbOtjKCtG+KDZyXSLpDOHEI2/HsRIV/RPbV6q83J7DWJZ7jPLvv3C/3CVJarm
         5Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708629; x=1796313429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTCr1w1nVA+vCLa1qAE8nCmQD5JZKwmRbzFiPOSprYU=;
        b=AFS6R9BKlIIrkLVlNHL0P9HJKQlOXS6jfx8CtZpNGr0P4uYMPb3em5/FocXs+gtBJm
         0dXdZT7WsW29cfyDYw7d6HMdUpFSePa9szl7Oj5WVxF7u01N2b1A9hdXKUzSFzuqrXeh
         L8IZluCNcU53q1GF6pMwtz6h0X392c5j6olNjHqif1AenukxqBXZU8PvBuHw90ubNkam
         X8hYKl7NSv1Ho0qYJv0KRzzU8PgWMcdsiBLpeJn3kDD5+eQLmNyBGuwOKNSqpeduDgYT
         CL/hrnW1N/E4WRN7Nyk99TQwdASHGRmuA0gOSR7rrCV4gv8D4vx4roiXPOtCqNgINUYS
         Ontw==
X-Forwarded-Encrypted: i=1; AL+hErHEczcp5cK/nrr/wKe9CRk+ASnHB7jQjbX3McihIMdqTfqq0rotEb+yPzWZ7TTIUGktyN19hcxkYyxYAp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CrEF6PMvpup8+Wa5MuWPIRH1BVIJjp+8ZQXcFX0eJKr4DUBey
	Ni2lutibO8d9nV5fBTHB4EoKCD88VlO7rudxGETo4dcC7DKuYVTBPVI=
X-Gm-Gg: AZFdTZfm7vkm/Bj92CSYlBbD70pk2/b9kpPbjBlnjnt6RQOT07fnrFspr5dFfVReb8l
	WGTL7El3EpVU8NX1Viv80k0KxqOY+lRkqpP7SWwQflIyDh5huz9Gf7TOzhr/BZkSdtjK0OkxHF8
	iOIIvQkDdFZTm0+0V/NkPkP/5RMzdPFyB5qUQDIRhUQn2VLaO1TXSihjC7rqA4x6IkOm21qWhvz
	5z02A+5p0M8lRDtdjApOhZ7OTMpAv8Vq/74FKDimIzHgeqao129SqcFW+F0aSsBJvA1devecPH7
	Bu1NCP0vsAL5blg7pw8fIf+ooiCeUfr7B7lhLJ/rZI6Xzh0qrZ8zEr43zZtrOyvL8BVO9kw2U3C
	J6A3QaOhk62KkxSdnKZY8yLwjEpqYRAOmRASdwSLgqkd6sYEEs18Y2oezzzB9meazUC7IKqKHGZ
	heocWWaRrQcj0rOYIqjrtcamLvF2UgOPiZMENdHuhtxNuUVPMsRFO+LJxiJLgayxxypRRTLWuVj
	bm6KYVOKxGugVMohebqZVGqxtb+veZheM7G+s4wm84SbecFd2gdi8CgBJrvq+vbbvYbdgptf3xj
	fXySGBH6xljoZy4zUYu8tOP1XfWMDhcTYSGHJ7soXlpOOzXFl+V3+k91m701boNcS+0=
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr12731586eec.16.1795708629339;
        Thu, 26 Nov 2026 07:57:09 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm58003234eec.20.2026.11.26.07.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:57:09 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] coresight: tpdm: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 23:57:02 +0800
Message-ID: <20261126-coresight-v2-58e559131f2f@gmail.com>
X-Mailer: git-send-email 2.50.1
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

coresight_get_platform_data() takes a reference to the destination
firmware node of each output connection. The core drops those references
on registration failure or when the device is unregistered. Device
resource cleanup alone does not release them.

tpdm_probe() can return before registration if driver data allocation,
MMIO mapping, dataset setup or device name allocation fails. Move the
platform data lookup after these steps so every successful lookup
reaches coresight_register().

Static analysis flagged the TPDM error paths. Codex helped prepare the
change and describe how the references are released.

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
v2: Rebase the TPDM fix on the CoreSight next tree. Add separate
    fixes for TNOC and TPDA following review of v1.

v1: https://lore.kernel.org/all/rc-b1-20261110-vc-178-2d9055f946c8@gmail.com/
Review: https://lore.kernel.org/all/e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org/

Compile-tested: arm64, GCC 14.2.0, W=1, coresight-tpdm.o.
The baseline and patched objects built without warnings.
No hardware or runtime tests were performed.

 drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 8464edbba2d45efa5ba041dae70149a946c20465..f4b879bfca1a153f50012757e1b078605fa87944 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1408,11 +1408,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	int ret;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	dev->platform_data = pdata;
-
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
@@ -1448,6 +1443,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.name = coresight_alloc_device_name("tpdm", dev);
 	if (!desc.name)
 		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	dev->platform_data = pdata;
+
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
 	desc.ops = &tpdm_cs_ops;

base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8
