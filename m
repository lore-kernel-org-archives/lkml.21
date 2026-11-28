Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884046;
	b=EzthbYXrmDllk81WJEo+Gv809acgAuvtnpp9m1kXi+Cx4oUUolNbKKU5lNYN8yffM2aL
	 4mCTo/TcHqIeGnmM0JKShJBopTF2UhEiotzbW9cocTeGvAOrN6SFBBXKeCfkjS3gUr7y6
	 D9Mvi/jA5Gi+y429n6b0KRTwgoOS7UItfIQJwLPkKeVvF8lcipUHjJN9p0hOwMrSVkk/X
	 QGk/Wa+Wr3tvJz8uVoX0DbKy5zzDeJ4LLD6ktIE9nCXMWwQsHQeUOxHqk0X4l6yGHShfs
	 14yALwc1mUNRG2ITD+1XIjDBEfC/Gbievby5r9eEarXDo4pn6t3YyLD3SVrXKAN8Uxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z9oFq5m4Sf+jgbyEuQxS12qQ16CYzT1vsxpvB6tN9r8=;
	b=GbrJDaJZ8/1OmVSeMpaRhzKn/VvDh1MzgfW8ecBi4YMWnz0yuXZhrIOA6QxgThtM5OLf
	 5ZAicbK45QwMydxxJ0NRxGCgyx+0xq8xLXQGL5EsGlxnBm7K265IPjQ6jiOixSONaCkvR
	 ocgt05k10nhGUpXPTT9ymOXhLm2i42XYObobdLJk3jOcYeTLMHpUd/TNaLYwvQ+RM2HbZ
	 lJHM3lOlQV14d3wOIkLV0E2pz5oJ4ciM/D+NRGEKkcKTBQM8bs1RV/kE7WbuZsJyM6nZc
	 gwp1aGJp97SNYG+XnSUT+WBrfYpAVYYMdzeIjJft/mjjQ4MMTwgoz8v/a/rq0T4Twgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nstONax;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9920606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9920606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nstONax
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso322291eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795884045; x=1796488845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9oFq5m4Sf+jgbyEuQxS12qQ16CYzT1vsxpvB6tN9r8=;
        b=0nstONaxJkdkuo2QMwX+1ogS3SYBuIyxpk6/EberBKChQFeyn/sYZqvkQplVM3AA83
         cxsB6Im3HRrKE8tASvNTo0Mtbaf4XLSkVzYRnFAVFdzzCm83For4MH1kYs0fPBoYT+Jd
         8J9AXggx3jl8oHa/HrgPaE7YoNcSysUl52ds3mpkEZNJ8dolnoNnoGF9OPgScB1gIKaT
         a+dzXfygxUidVqDoV42QOhVKbNLN1RKiGiONrdHkPnMwTV+/nFq7YprcDU7FAI42pXbZ
         Lj/N45UZFiYDHq+VLC0YXnFmhhqP2jgX7JtMyvuclOq56CGu7+wB1+ft3vb5NpF7Q+MD
         5OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884045; x=1796488845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9oFq5m4Sf+jgbyEuQxS12qQ16CYzT1vsxpvB6tN9r8=;
        b=ofsjMVxFNv2f1KafRIY7SrSGhb8+z+n1T6RuvyO8Q1YrF4//HQYpTFAaegTI7I+Od/
         T/9gKUV/yb5RoNxfi3eIeYZuxlC/KqqlgHZ36+7pV07s3x9SqXJnk1hOwmZ8l5vf9ina
         32rI0qTFMkcusXdQe4A5tW0kTXNiGpHb7ZmJVQMshkXjKlaV6BNdqw4U6k37eNAXG9eT
         lZYcMjq4raBKUx/wzuyiDgVgI02Ntue+KgHIoRpwBMd0gMzhZnCcqHjDcCJeyfj7jLPd
         DpPkyA3PoHmLtLjQ9aB25udGW+B3pDLW3vA1rTkDmLrET4W1R5rgU3foRujIPqn9BB6F
         Ts5g==
X-Forwarded-Encrypted: i=1; AL+hErERJmdIcUXX8FUILMnxneKRBDhEzWM1R9bb9WD6i6G6WFm20y68Qk0arupiIalWkGcPRkhYZGsc+kJ4K60=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1WEz8+nKS/CP+G3JrYaPMt8b9mknjZ67Aetjkzdil5P9hsVvx
	h1m1wsdq42bT+Ven4jr16dMPef90+7Rudwqk4OzFGRefiMEjcSjuous/
X-Gm-Gg: AZFdTZeVZE/57WiGf6LemsrxiBUt0zqAEgIP8X+sYgIdmuGIRkhlymn24bDwDuxA5K8
	CUZglhS+lMKgosNy6weB90SPXy1zh11uDHe/yRumzZLjUGqSAj//rFrD9CK1D5eA9q0q6hhFtc4
	X4/53AmyhJoFSeZvbOioba5pUF0n0a7d6Ep4bmngCh36zOPX9vxu9ukNmsufJyBCBkGMxXxXOq3
	q866D/3/+LCeKCWr2UNp1LaqKmh9VFyDrmAoJjhfb2q6HSXw1z355Z4ii7WaqyZlGnZRfZKBInV
	cVWMWRFQWmUO3TcsjS1GVo6cVWmOAHKoIbl/5Sc3NkjoufxoPNvS81QznVYLUW204wv37KVBCAN
	wRyEJXYNSriJkMiHuH/M9r/11LS5bNTrvNCuHpJpXQVh4Hn1hWsdXj0WL2BW+96c++0rn2189xN
	8J5XIPHAL+NUYUhROVPOINeVp34HNqBefWFZClTq32IbIazMiIoDUiOYueKxPcgtxXOzvISU3kr
	qcNM1WQZ2Ge23dV4fEb2H/U8yq2sQdguMiusaew5wZOXLCinkJ5DfO2OuIR+PHuIy8bkTJhxH+z
	s00IPzP34QezjpeUHwf+QR16Pe5TndX90ntEIQysf6YfwbE=
X-Received: by 2002:a05:7300:f483:b0:384:e31e:3c58 with SMTP id 5a478bee46e88-385714160f6mr27004687eec.33.1795884044764;
        Sat, 28 Nov 2026 08:40:44 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm50903467eec.9.2026.11.28.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:40:44 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-labibb: use the platform device in dev_err_probe()
Date: Sat, 28 Nov 2026 23:40:39 +0700
Message-Id: <20261128164039.1831620-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

When the short-circuit interrupt cannot be found, the probe loop calls
dev_err_probe() with vreg->dev. vreg->dev is only set a few lines further
down, so at this point it is still NULL.

If of_irq_get_byname() returned -EPROBE_DEFER, dev_err_probe() passes the
device to device_set_deferred_probe_reason(), which calls
dev_driver_string() on it.

Pass the platform device, which probe already has in dev.

Fixes: 390af53e0411 ("regulator: qcom-labibb: Implement short-circuit and over-current IRQs")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/regulator/qcom-labibb-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 8641e69b55c3..83fb6f70e3ed 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -821,7 +821,7 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 				irq = -EINVAL;
 
 			of_node_put(reg_node);
-			return dev_err_probe(vreg->dev, irq,
+			return dev_err_probe(dev, irq,
 					     "Short-circuit irq not found.\n");
 		}
 		vreg->sc_irq = irq;
-- 
2.25.1

