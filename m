Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797672;
	b=0ggRH7m29TBkbMp9taKWqnWlq8Aybmmgi1ZEow0tEP582EWu1gTyqw3ynpTUrfys4Y8G
	 AQO07OA8bnm3CPlRQTsB/1gT2kNio1/TOQ/HkndwnzAJr4Pe6tST5dqUaGpfqcbVcSim2
	 QTaZdksmHnKUomjTAqZ9E+nKre7asXikrDtRx/IhPNVywiyRZOEnQkTah2gcJAh/UZoDz
	 0zCg49J+YshT6J6l4yGCjpZqe0H0/kFzOg8DVT2GzUPLjQkp+mvCdNlN5o7zphUUgi0Ig
	 iXXt7BqJCoHzrEPPg7PWv/Gb0zhrC/PDQAEmY+0eTcjMifwov0iX9UdAwcrbksPpJZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5N0OVRWzESFMIcAIN5lBl11eGWM/IXTJun2FVNhsjY8=;
	b=il3q7HzZtGB/K3zE132uzfBygisON81vkX6AJG+7Iwk5wKb3KFH87QNcVSudPyPNb+BI
	 YDQoahwGWqpP5ETnKNCbLv2CwzTnY2lH6gy9bQqY38i8lpoNx42/vW/UdUZSo1sY1zCbi
	 I1nf3L93tDibQAPKhmSh8VmPsuih00gTlPrYgPHwzP3BmEerB+dretAdUl6ww8q6XSdgO
	 4WGkvar5sHZU8pgvkVLSqfUresfIYBrTsdIBkfa2KtVl3K8/FNSP3RCqiDvjRhj47ceQZ
	 F6bHZkbyvouI0KvbdKsD7LFrX0mdXGDlSx0VtRf9f8CT1rznJzkFnrhU6LS4Oolj+2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIl3J9+2;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61DD606A6B4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61DD606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIl3J9+2
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5133831027so1157194466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797666; x=1796402466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5N0OVRWzESFMIcAIN5lBl11eGWM/IXTJun2FVNhsjY8=;
        b=KIl3J9+2t3Vh8CjL0d6/UCt4CPENza2Vexh0Jk8xW77EzSfvIlZjxprpcGOuIOQV4l
         aQUOQj3GwDlZbrictncweyACRUsX2mfpPN3zFJS0UJf4wU7mLpVYj3g4gemHOZeYvTbR
         u0G7bWpEr5bxsE7RvstaHF2fx1jZEhaR77aTS/WmpHlhV1toyqKFxN2e4hfxxcU2W9Vf
         zeL2VNplg6oX467eAlKYgcPPV46gTgqNDuqGdtpIuvQyhnD/VKJ3PuFm1TIHeKmaDMLN
         pAQKhYBrfJXtTmX9wJuKkDME3ePwU3POT3kXIhW6nn4QbiFKJNVemZ28uLaj+tb2Nq31
         cWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797666; x=1796402466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5N0OVRWzESFMIcAIN5lBl11eGWM/IXTJun2FVNhsjY8=;
        b=dpHP+/o8NVUxqw5T2egDlm6k8+nbgHpZtH/FWFdizMBcjG7giudnXNXpemIa8jFRmC
         UBf5BVbybtRWZiAQ+i9lW4TO7Tgac5hQNivceB7SWvlMui9qJgVcDvQQE9gJIUcomgeo
         8nD3YUPMfDRSVXXWoi8OoF3E+piTcSea6RG+5p4Hacn1Tco/2EYyeYSF6fvquwu0IZB8
         nXHvts1sPCFoyE7VM2nSxRvTj/2Qy4eQdVR3V4WemjkbBdnL0yQMDZud3636yAqq2Uno
         oBJQTy7sUO6hoUXrXUSkkhoPq3L7m27J2Ptx+v/+GXSttJbKm9onqc0a/bOFa+DCLtKq
         yGPA==
X-Gm-Message-State: APuU4Z+Xt7/MckFtS3i86OR7cn7MN4wIy7gRhlZxCn6v95rM8SckI6rI
	XD/nEZ8Xu1dHNGX2FBbuIC4tVQJ5hUCKsLLci1RDkYMlan5qY44E8X7h
X-Gm-Gg: AZFdTZfb67xXk9uw+uwNhBiDte5DLuAuwN0Vm3SA33kOvoJl/V1Y2HL14r7Yhjm8RF5
	dH55e4lgXfCiP1mExAMAGULGT4WJjEe9JRLfX4T8lXvW7qFCipHhhXMjgB3BIb3KUnwTWuVYPg/
	mYTK/oAMNuOpaQtPQHiF7jizwvTBAM1JTZvz0PFLTpn6uZ+XdDyvgZpFpfUSrXmikmzh1leCtto
	copbOb4RUsMK2DIjwntPMYVC74E100TfNHcxKJflyBEWT9flI5USwN848+95dqCEDqqzYyH3gip
	DfoNPViaHdmxyEsUc4alt6PrWmbmcbYM9AP/VnBOxn49nlF96OKQ8hPiiM/y9vtvvRgOp+ka8f3
	HvUYUc83WgCXBYA0I6x4ySzmVpE9TDE6Ub20o3IHS6etTnJYm7Fz06YyYzxpkZGJ+eeevjNVxP0
	l3l/Exo7/jK4ouMqlLpuPPE2wF+XC2DH+poBL1KZXfARAM2dyq0hPKefMBL91EFMzpg7J3BIB5A
	of7N4GDuOd3CTnInqZQvzOTnkvgHCp83snra7keA7NSrPG9jRUt7BJc9rNRRIRasc/RpKcLvCcf
	rJ6+IkXBggh+6Gyq+tIAC49oyWruM56tTiAPfGUOv3KflBvX/jeHIkhM5sbROiQSZz8FV+0MpEP
	dbEqcqHfyyw==
X-Received: by 2002:a17:906:6057:b0:c49:df95:f0dc with SMTP id a640c23a62f3a-c513a60f3dcmr1627450166b.19.1795797666109;
        Fri, 27 Nov 2026 08:41:06 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/6] mfd: max8907: Convert to use device managed poweroff handler
Date: Fri, 27 Nov 2026 18:40:41 +0200
Message-ID: <20261127164044.285910-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

Replace devm_register_sys_off_handler() function with the dedicated
devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 8091514c28aa1..f6eeefb419622 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -190,8 +190,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -242,12 +240,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off) {
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max8907_power_off, max8907);
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

