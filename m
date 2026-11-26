Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708659;
	b=nGnzpvfwqeztKWMN/LqG5rAyDc7aIlSflnjw5xH2iE5IRF5L8t/Melnmf8w5p22gZ/xz
	 4Fl5RiYHPf390f5ZzYXYeyF/KyU5SttA/WVxUvm7oI4MaaNbOzilknkx6W7R86nBCKJBf
	 oqIZMIF1wKOqYBSBAfhgU03OK65ccBGMlwsyUY9ueqgs/b81ev4gXdALIQVmlNq1JLIgK
	 ZVGLwPoWO+ZMxnErWRKb76M2y9qyPKiRJou456RMxMtzIwwif5VcdIoL6kT3TYe1nm6RG
	 sUzKiRR69L1ZRDQznxEOkON0GjgbomldmM1v9lg2v2+u4WjIOrJ6iz+QcDO1ayRI/EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1yQkJU6KhdeCEUEF8nqQNF0XTzFY9Kz7sbooy8mlEF8=;
	b=p7D5OvhABMTRAjGGmBZM8xInaY1XsbJTr/RmuP1tMAn7zDI/3yYvMqAS7+3JxYy5FQVm
	 m6RWn9nJknlBvN6Cz6XsguJOy3BMUA1nr7OaKHgq8Ti9AI6f1gdRNfKgGghl4wQU/QJJ+
	 nyapOU4O0hqOLfMozgMFhWIxNxfFLxTbdDuNUXqFwg0+zoT9JNKprUziSc452Mld9ACTe
	 1gGhn4bgvB4Lhp2RmQecEUAvtJ4seE2KcV2dfuI+e4t9HvDQDtXzSipezPFy3uS7dvz0w
	 4drCTXykuJGYTy8YIb9ymLsOzGgigPVOw/l9yhwRcY/C+CG4yloysy5jnBSLx+VRfFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arUOrHSC;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D57606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D57606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arUOrHSC
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5688554c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708658; x=1796313458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yQkJU6KhdeCEUEF8nqQNF0XTzFY9Kz7sbooy8mlEF8=;
        b=arUOrHSC7HQUMYWQsYk5dRbPdioxHsg+NDtCkuCjk7QGPboT1Vq5OTjkgpwc5ycJpi
         zsKQ/xYFw5+o998zw1oJUdtqNiqPBOvEkFhKeHtO1s+5jNpfjxSJ85kVkoPgAaR2apd/
         stVEm9jzqaE4PTDEg3j0yhkKBXo/fxGBdWl/ibCTSDkPlJB27OVFubsrXpUEz+JPeoYM
         sUtwP/Ogjk38iR4Xmev3mjtlmfhfO9T5O+Wb8yKf19FoeogDuihd/x8tSPrNpguH8fL0
         HlB5ebTZGkudqcEY35Rub1KiRxl7FBPMvTr1O+NROvSaYURiJrR6RVHseHfw54XfhxfZ
         kkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708658; x=1796313458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yQkJU6KhdeCEUEF8nqQNF0XTzFY9Kz7sbooy8mlEF8=;
        b=nE+KwlVITiP/o8wluE2dnjlsOgl7fgLmZsIsHbw90VGf8a90IVyf/9nahpMYX9Yvh4
         lOnCnpWYzirDtNFZ3IHxSQE6aAshBo1Db36ByYSI3f+ooalmNn4vqW4uK+VXJTGVIs6g
         IrXEs4cpZ72/jtqWI/af9en7H/0+R0AkC2WOp8G2orHavFZIysx0uI+CcRYs6Dz0ccdf
         cstAp91O7FHilb/fyLhxpbHG6DRQhARASv3GzlKv5L9FC53Mp/8/uSEQt9+CZSi2jUwH
         Wquo//GQI1Ws1+zRJqa1vCLOiFjklZ+5uRlW7s4WfmgoSqOdb2+nGUwOJbrS8/ybTQpu
         m3LQ==
X-Forwarded-Encrypted: i=1; AL+hErEFEiPjm1YIvt3k9IypCAAyKf/LzZIghUtw5ZggtbuCOrpcaCiDfGefYK0MLcME7pvTjHvTF/maOkLEbwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jQStsiQf75Z+ePN8NRRzni3R5y2qIaM1iRTcxZE3VA8jV6+Jc
	wwVNRiE0BMe6+AxV2GTcKaGCEs5ArKevT9+fwvbuK+AJElzTvkE/T7I=
X-Gm-Gg: AZFdTZcm/mC6jc7iwWoN73TuZ4RU4W3GKgRwnzpw4BONf73n/CubX7Vz3X6dMoMa9V+
	KvLS6WY7T4+PhEGQ99+zsqYerpqOguDmL392jn6jTcCiG4avDvGryLF3nm+FjIYu3eaUzsbPkR9
	JmNfolZbqU/McbNhmqlJIw2QkGd9p3eAjDTulDySXkzRiqM57EYUdb+oiVNTEoVyiKYFrc31tBm
	q4pn7Z2sewQUwarRIy1fQkZyCpzM40qktiNTpstJtRqiA4sW1bvLVCedJIVUlOs3B9OAb8YYeHr
	Aiz4TZOSZmDFLiw0YLnMQqewLOCiIQlnjD4dmce85R+KNYCs0wxjIdMci7xz6CwwfE6hEjEZlYH
	OsAyMOCTZgu5GVN3yelrvkLpGwKealJhCO690ms8ZCnrYL5Opcx9lcy6J2yn5+TeeEniAuh5rEI
	ZnO5/QU+4CAYBiqbaVra4vmTkREnSn/S67A7xcIsuMkJ/D8Svcj0uktlqUpPIhgXG5sXNnqj2NK
	G6LoNiNnIHjdxySYU4RcipqCAmkHNVMCCpmTjsMtCU91akuivwnvHzphZZhDM7FXLnoFeQ0ZMYq
	JLR3AFzznyP9E412mRTG+aFMpW1uu/udlU/P66YCma7gb8qrrPMfuBrmQ2dQOLlEQLYqR1DAKAs
	nUGwYMGe9vYuO
X-Received: by 2002:a05:7022:f509:b0:1b3:ad88:b9c5 with SMTP id a92af1059eb24-1b5568b7e07mr21816423c88.24.1795708657937;
        Thu, 26 Nov 2026 07:57:37 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm59966455c88.7.2026.11.26.07.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:57:37 -0800 (PST)
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
Subject: [PATCH v2 2/3] coresight: tnoc: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 23:57:31 +0800
Message-ID: <20261126-coresight-v2-9e483a5f35a7@gmail.com>
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

_tnoc_probe() parses the output connections before allocating driver
data, enabling clocks, mapping registers and setting up the trace ID.
If any of these steps fails, probe returns before coresight_register()
can take ownership of the destination fwnode references.

Get the platform data after trace ID setup. On either lookup or
registration failure, return the ID if the AMBA device acquired one.
The platform-device variant does not allocate a trace ID.

Codex helped trace the two probe paths and draft their shared cleanup.

Fixes: e54a52a28a36 ("coresight: add coresight Trace Network On Chip driver")
Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
v2: Add the TNOC fix identified during review of the TPDM patch.

v1: https://lore.kernel.org/all/rc-b1-20261110-vc-178-2d9055f946c8@gmail.com/
Review: https://lore.kernel.org/all/e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org/

Compile-tested: arm64, GCC 14.2.0, W=1, coresight-tnoc.o.
The baseline and patched objects built without warnings.
No hardware or runtime tests were performed.

 drivers/hwtracing/coresight/coresight-tnoc.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ec28b439d73d083ffa0de52ef454a9cd54b88175..2f3e2044676358925233c59ff3977fa36555c2c3 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -191,11 +191,6 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	if (!desc.name)
 		return -ENOMEM;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	dev->platform_data = pdata;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -217,6 +212,13 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	if (ret)
 		return ret;
 
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto err_put_id;
+	}
+	dev->platform_data = pdata;
+
 	desc.ops = &trace_noc_cs_ops;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
@@ -226,12 +228,16 @@ static int _tnoc_probe(struct device *dev, struct resource *res)
 	desc.groups = coresight_tnoc_groups;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
-		if (drvdata->atid > 0)
-			coresight_trace_id_put_system_id(drvdata->atid);
-		return PTR_ERR(drvdata->csdev);
+		ret = PTR_ERR(drvdata->csdev);
+		goto err_put_id;
 	}
 
 	return 0;
+
+err_put_id:
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
+	return ret;
 }
 
 static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)

base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8
