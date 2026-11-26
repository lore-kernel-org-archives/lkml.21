Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699805;
	b=Mbg6App1JUfj9vImShpKbI7cWmgVimiIjZbSc9BOFhddE0K2Swq4+PmfaXcAWkDF1gMq
	 nLlfZAPjgE6O16dbc+XZ9awHOgNdcXUOsA91hxgQqSYhIcmCSvlvvq+TsZR3HVc0k6Rmx
	 A8gs3D6gRyzVy6vSlv4y+UvPkERbEyO2hbB7qDBws0tQl3NDzm69Rny0njgimxbaknD98
	 /D+nEwYRj5tLCydJ5yZL1A9RSKTdPvTClnNLTVGqPHWY4K8n/Bb1r6Fi9Uf6Mz5Aw5DCx
	 KxKB77T//T2nmAYPmTd8O75+ozNCJN/n9toc/VsE1iF1UwbdeQ1NYY6AqAbshUGjwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DSqP+Zr9m0+4cRuXqQzsW+yKYGuSsncKqOmsGZULKn0=;
	b=w+wCnRVkD1D1YJp9FR+HabfZGlQapQI6hJK8cSztas98IxMZjkD0D2jNW1BfKh7SoW24
	 LW+qZMSVLXFa5Xk8HpyGqyOzjDjoYvFI554k/YpZMKOcoN/x23a4OIX5xqcVVyov8rnN2
	 A0nxoqtjNiROXclEZ3rC+yl/wFesHiOVqBkvsEjSnkiUBlPb8lj9aNbXkl5XHMSZBQ2eM
	 iw3T3y83WkjhLQ+F66lA0ptFXzS3w+B2LobTTEnd1VLTkz1ZoV+a2DGPaU7e/56A/VrsS
	 UPm8aR++KwU2xqc3wRv5iNCvMdlvEEK+7MLO4duVakbKra/PN4yfFA/Y2hIj6G5KAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvwNXSeN;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvwNXSeN
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4713365eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699804; x=1796304604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSqP+Zr9m0+4cRuXqQzsW+yKYGuSsncKqOmsGZULKn0=;
        b=SvwNXSeNexZcPxTqjz5x2Qo9VSiFLHbr2P06wGSBxU6ly3+OyvZ7cyf2/vz2xQdOeW
         h9WYE7oG/FUXSq0IlbcihxCn7ycTkeC8x3PFaQeOEMSEnmct3VA0N2RhrvubzoB3FkRp
         KkMg5wW0piUcDXAnaBqxSsxlU0GFHRTG2NawvNWyw+Q09JZd5nDIt7LOmsd/lnikCS5t
         3hx3ekH4zD6vNB8+1kC6zr3YyVu+9s+w5QvHEIOKV7rOjYS8a7oENzlX533j+q8HmOEs
         o1PSq8fIyF+0sOsUxFgdfmlh/dKH0Bike97GDAlJ/lAsBG9rIV4o1aj6ElK/Q38nUbdD
         2qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699804; x=1796304604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSqP+Zr9m0+4cRuXqQzsW+yKYGuSsncKqOmsGZULKn0=;
        b=Uomgb8S+qGI5wBF6vXLlTDC0pB51GuAeJT5Z4j8nSpLyWzsxHeBdKqL1ijkDkxKOgx
         kG30ptvTkHRfIcvhzlH5mLm46fptfUrWZ1Mr/cYeFYoMWrPAsPWC9DxTtvvH5YJhGqXn
         2Ow8oOygrpu3YNYr7UkP/xQhxB8+J1a5taj21DTaM2nlz+MI8R9gu2A1lfjFz/DYm5e7
         rAaQ9dQMDCpGjtcOarNby3HiMAy92a/yEYpqoJEGNExjq0dtEkCv1HuQFzW56PsFOFKn
         vPZGZqSvCc+rJBEhLcaJX2h+IuQg7pkBnnKdF8GPJ1G/XbhAigDmGChs+96hAI7YDUFb
         MQTw==
X-Forwarded-Encrypted: i=1; AL+hErFoq3EmPpgMHWZAamABdS1ZS4mglBLzur0NTrtFzLytgb7uRnPs7VQhmlDtn9UlJwJM+cNWfyns/rCG1PM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9+mktQGPGoF9MnMH0KaYjw5AVh0G0cz3acuxHijVF2qXIBvXc
	sceA6s1e32XB7mxJXmsup/4yNgAvXESolkCtNMNDwWHdegfVb8ff3rw=
X-Gm-Gg: AZFdTZcUKXE1JMr/zNR0Mzv+h1Wkse6WNOzUex8zXu8wA7huN2D27K3U1R5hguLEjOs
	o3igUZtVC5Es3GaalZAdwTIaeLQSNitDwafiZpio1PEJJjNMe6+gyMIQaG67qs1T4l1062drUu0
	Jz1l5LfFeFlBgpqXQRiRNWylXmNXaKOae9f8dVZlQHDeQEy+k77CjhHYKFbumvCTiPZ4onvDsbD
	LxQyuZGhg2PR9qglkRmK/GUMR3fattcX9kLZsSMMVj3Ra1uMwM/2gevJbKAeU4WcZgBurzPllr+
	hq5aL01rf6GXuhAH4qqU/YyCRmrr0rN+A5dsIHSvisdIJ35ZVnSA5iUaBVnWNVC9uW8rFE1JHcp
	2VbQMqh/KfP8f45+WjodukKnwvNHqeYLORK1sWmkO5Zg4Jqtu/8qFe/vTuxlWy/PCBHXgNthOok
	7JYJIsh9BJRLBKzy8EE5+2BPJQ4700LtmDrg0Y1enjgVf2YmGlliXync856/15ht+7dmjWZXuDF
	D5ZFsgaFDaauo1p1ABsuCsFUlhA75+V2WDa+WOfiKDV846fVonLyjxQ/XAPgl1evST+aqktDgJ9
	DrrisGJLskOwVByqS08qnh1cqIXqU/w3Yx45BwPKzN2+3cFMZ6sFX5qZYs7Cnj3fsapX6cvh0i+
	qRB1DIuISPAAN
X-Received: by 2002:a05:693c:39cc:b0:386:48c1:6c5e with SMTP id 5a478bee46e88-38648c1719dmr18979641eec.37.1795699803763;
        Thu, 26 Nov 2026 05:30:03 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm71811250eec.26.2026.11.26.05.30.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:30:03 -0800 (PST)
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
Subject: [PATCH] coresight: tpdm: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 21:29:57 +0800
Message-ID: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
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

coresight_get_platform_data() takes a reference on the fwnode of each
output connection's destination. These references are not devres
managed; the core drops them in coresight_release_platform_data(),
called by coresight_register() on failure and by coresight_unregister().
tpdm_probe() gets the platform data first and then returns directly
when the drvdata allocation, the MMIO mapping, the dataset setup or the
device name allocation fails, so these references are leaked. The nodes
come from the base DT, so this only leaves their refcounts unbalanced
unless they are dynamically allocated.

Get the platform data just before coresight_register(), after the other
steps that can fail, as the funnel, replicator and TMC drivers already
do. Nothing before that point uses it.

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_CORESIGHT=m, CONFIG_CORESIGHT_TPDM=m, CONFIG_COMPILE_TEST=y; baseline and patched coresight-tpdm.o, no new warnings.
No hardware or runtime test was performed.
The paths need an allocation failure, an MMIO region already claimed, or a dataset setup failure in tpdm_probe() after the output connections were parsed.

 drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 102b8b7edf87..07e19c1a94b6 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1404,11 +1404,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	int ret;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	dev->platform_data = pdata;
-
 	/* driver data*/
 	drvdata = devm_kzalloc_obj(dev, *drvdata);
 	if (!drvdata)
@@ -1444,6 +1439,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
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

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
