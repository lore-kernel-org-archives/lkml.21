Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432762;
	b=VhiaoJYErsvRJfw25K2vlr/rGI/gbbrj8tIOcY95x7hpCOfbXt1mVv1lBlXNI9/NmmXY
	 iWsottICXEEf3QILRcsasc3ds9oJLurs+CUzVweMAF71uzvpHidkYrpS0iC53b7y1s0q7
	 K0kQRVnU0jUNmPGkE7oKndA9568jwImL5t9JU/H7ZWvSEainWn83Oz6fTu6A4cp3hylZC
	 C0bpAgvt0I1+jZ9+InTnG8Y2CRspeVV7GCac0BmluogEVBgUr/WNtKm8gsC6PUgjAxkQS
	 3i2Y0pnBMJ040MM3ADoAyoiGCt7R4Ccq5bvyvo4FkPkBiXSpCXAVd9Hq8M8lgv6lLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
	b=rIjUZSGj6Lnr5y2WCYvJKB1Xg555zRTGKGuhe8R1qaga3sok32HUumKJgU4eDSkA/vtF
	 uc/M9htCAPwfPJRW6Zr79Lbay2NBkVRi435x8froxhQR0sr1QPQpUw+YmLal9ndm5ol5z
	 w1jNAYhSvdqNbqfjOLU4sSq7IuOhsQsxNhMLC+XHVjg8azP57GvUG91gauGoJ7qsrivYP
	 ck88Yeafa2R8PZ8f/CuF5Qr/Su9TBzwYwRtF0eBVBYLZAQ6RlTVyNWqP/UE/JMixC0Na7
	 cD0TKzrmSCq/b2f1mOEG0cJRWZD7QPMQFjL500S1NyJphRSJOxZTVH53hHUuNyRib7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gv9p0T8c;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC8460A2634
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC8460A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gv9p0T8c
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so21251245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432761; x=1796037561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
        b=gv9p0T8cy851t8BWAX8RJxS+Qet5LGL5xYyM3BWr1tkvsbyuiEsUVfn0REIrvYTGQb
         y9LN3qS9ZXncYAKCPsSflakzzIEGXvfr2uzYdXEEo4or5Uzj5lFCPaGKbKdecpFjhzXM
         y5UEJ/loc/Ey3EU/a5QhHb02Wj2QRL61Q+uvxpzFPZgv3y8n0ckUCr+SpY/vwDRx6QPB
         65ZomIgvCSabWMdxpUE1VpCwc9F3DQCNUmP9KbswUBvLPMkli/oeteK0vAziRuUMtSmE
         7uzvNCPhoVxMWABFQPGhI90N2S2EnGpD9xQvw6asJsZAB7ho+xiJ+Jun/DMx1n4nCc6/
         XCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432761; x=1796037561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
        b=IHtqxrHQgYj4Q7asqFrRz94URo1B2lpiOc6BttgsouKElkDyz2MbbgW691xrDIJQ/J
         0ObXUpnaEcuT1cmf1lzHrgvoftf5W1QMpNwB+sXdyTkmpWF222HTHoF9WGNP8aVRinhH
         afCqI/xPGlBl1PLZi+tv/Od3jMl+ZfjdhT25Q95qG8rf/cJJE7Tq4Fvp++uC9pLBq0ss
         kbKsSq0oHMZIUibDisKnBNDt7+EJ9WUUOpAL0NJB5F7BzqPogcE+Ksi2b2GzbDFql7rf
         XpERpX2NSBMo9K3VQz4Pf2ivxR5TB78yTV2Nk5Y/3jqunMzajUt16/Coo6CkeNpKaSyQ
         4eHA==
X-Forwarded-Encrypted: i=1; AL+hErGlzgpdGYbPpxZYMLX30JzpMJNQRB80hNR4MGE437wYuGwDCMEtyLrGemrNquS7KmukrIkjLg2EcrKFIVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gd740qqAwtsfYY7aAfoajPpvSZIXc8UyOd8ybizVeJcepNN7a
	lDaJD2Zfkg6YB3ywPaZl65KWszAZHPTRkUwdDs08ENJHEsYDjBu+6fXxyEAXhgJ/oog=
X-Gm-Gg: AZFdTZf/B1TguB/6R0NaDYYHy+b7STZ2kA6/fG4vq6OIWq4gb4gW85gwEQHFe44UGQg
	/v7stdDCzSandBKCN+TG2mZ75r4niaGd/xDNtsL1L9QCI8RDnZ7E+TClv9CMz26lRFOFGy6tkME
	akQdTCM9uvRhVQIGAmt8gL2oa1WGlaB2EYpc01sQ9KBqNNqX8T9j562rZXjHxPTFbiulwjoq4Bo
	dR5/GPtylp2y4EXQh2ZQzKfSMm8em+diAmrKC+g+1xjzWLE2hA31LTF7ggoz5ZXFJKZl2jiH1GM
	2cO6UtYSTF6XYezAVaXXSoBtPSdJAqq2uHNQzsrUyceKAqNO6LwdYQpt/zLn7RGKuVvf9QxMMx1
	+Sq6R9iwdHSXXjHYWnqsaY7LdQPg6bGTGTCGsavpFhOBLrvYkR6xuB3PkDCPMQ1T02amQwTDqtB
	3iRMDyQpSdOgPhMf3WWvCBGjbe5g8S05gBVktxFket+gcIEvFXrWJcYSCxr5jVFXiUOtQ+fmnyj
	Lt4iNYef2f050IOnjXsGVrJjcWm8uwZ0F7snBYJPAGbm/c+mBWsxVfYeo+XDZg8xS8FeLZoDD9u
	MSPMEjnmZ2AYbr99GyYkGaB7BZ5F02fM1xikJ+yyQ1d33v/+QcVSoRrHJWVkTJwT26n0yCM4yvF
	UAjeW5pVgzTt56zWl
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr226781205e9.10.1795432760806;
        Mon, 23 Nov 2026 03:19:20 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm640103425e9.4.2026.11.23.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 13/17] mfd: Use named initializers for platform_device_id array
Date: Mon, 23 Nov 2026 12:18:11 +0100
Message-ID:  <77a7d8f6dc1defcd4bc444a17fbe12b12c896dc8.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yuApXE+uP7wBaUCWW0JJGBg4bYRq2vqUwBWOU3wES8s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEIp7lbUSpH1IgOlUjliCpKsH7j3vn9CjcJD 3WO2mFrQS2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhCAAKCRCPgPtYfRL+ Tu2jB/9cHZJmTztjkBAPewkCzIe0sLvYsApxAjpJFyVTQxIZsS57YALEG/TS583ylkpslKALZ0b jEelLoBq7MmKSd5oIaTxPtgrZNLWtEuF9+KwBSHpC1+Fa4anJcG7zsSeihzQCFik+1jLMASuEB0 YcvN99U16bLsKnKAjAAyX9xfCC2HDOIMTHWETww/LGG3b1utzYM/Vq4BPiX7AtUXEXPbk/QVrCD WzsP0BLCsc7IwXpqmtb5jw94qODzHtIip1y5u8dCk8ZwqM94NGMMM7r09N7+32zl0/mzbAztEe1 oYys30KFdupnY5eisDJATL1u7A2NGA/LDUfDEYwRj05RBfE2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 766b0eb73e43..ed7e6a99b444 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1249,10 +1249,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 816ddfe1584a..9bc146bcbe0c 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,8 +327,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.47.3

