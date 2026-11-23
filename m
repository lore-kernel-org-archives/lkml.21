Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446167;
	b=B8X7YTTxtjnafFrAaBTdv4XW5PR2x1ctnAN3iycJuENrFdSwSbokTq6mZ6NzgMYQrEQV
	 snftWT0LZyiWVesaXpewYHEoaZdBws/yqAKJMpnuIQDO8smVhvplCF2q+e1bM8yVreq07
	 F4jWKB6L++opwA2Vs6kdXUT7igMF+t4M2F6MZv6cE1vEs5zQjcUNFvwJuprOkHrg5O9II
	 vTEQqMu8zdmHOSd7HZHJ9aLqVhBRS8wwQGWXc0eE0R3eUpOAqd+s6o7jaxMZeXrFE6NGi
	 Ie6PbTGyXUwUxLShtk/D6UGleAEjEgYlQgdNXWaajBJcMhlfEJXatsqvGAE93AC9hOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
	b=nJ+FH02X4oYt/jD/8fGcP65jktYj8uXsF+2FX5Yi2eTVCYfqpS+qyJABUf6tQGI1YDcU
	 +0g3MCBelxI7wK/uusIwJcoTlNfpNvnQC4o461M2pKLnYN9nWRcjED9M1bhFCke3DckP9
	 0LHYK28MNMn1z9Zl56i1bTlouAVfK8k2dvGy4QV5PFZEgrgpBfcAY5+YwdXzKvC7mc8Tg
	 nLBEoxUaCyoYqqNwd4OzA5635V9MG1vLfk4iXL6m1ERMD6xUqAyKqkoKm7zISbtzNlIUm
	 Y4deWIp+muTNRv8w0PqjbvZY+K3NV6QkIJYarrqCojybnq0v/vTJxpMxf7gSfddEfFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seAqjJRZ;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E214606A687
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E214606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seAqjJRZ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso8244441a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446166; x=1796050966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
        b=seAqjJRZNq3wLY6hn+qGvoYs17635nlmvda0G5cRl0FPPD9JP6td5NVhbcySQJW9SV
         3qO1nxx1BW7ZdNTVKXjZ0XVK98ZH3hHAg6wDXLYVsPSqHSWwRU1MRSxGZNgDaT5adk1K
         fk30tJN7XwrcicD6eCM+eJfkCWLLaPdPQxzU4MPGtecZ7KCd97laW02uAZ/lFLSii4q+
         Hj7HckdCv7sUOhveMW72zb/w5maATHiEDp89gScH3FwAtq7G3f5MkmRj0cFd2v8mEfTW
         7bzi+nBruJjERCKwXOV9KH9l0p46uDdGqtzsDzqOlkxqyQY3HMdQ9zcTIjg68SN2eddz
         FTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446166; x=1796050966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
        b=Jgsv1POPTIIffnR4bUS8RWPyQjlZoqIQs/wq10YkSjA+QJ6uZauCur6I13WJk6N11D
         hgd15h+5l+OqBSK+q3PS8i4r+hmanfJzMP09YOyhDLG06Vul6rrwcfO21YOFOTLTspX1
         YGdP0xp9h8DTwwvB+5xrBFs+iIkctqjCRBihn5BDRgX5IutZvehB8JyMN7AYtfy3QdNI
         E1bNeZUrauBcNdeS/+JJtLcx2bfEnXNzZ1BU/BMJrts1CgzLUTANtjhmmDNRq++zqBqI
         9tjOLfkxDo70XHSTvXgZUFiB11y22MRfNnSipEZMKSlzdnaeZ8mGFhZ4IOiXj5YPU5pX
         ODJA==
X-Gm-Message-State: APuU4Z+kTEZ03BzkRQTj7434DjBBGffp5W68BX3pZirtqFpq4UI52hZK
	xx4gUDoRo3YkYYuQWdZWVAhdaDYfqhbdxLSqjwG3PpOjm6lWe36XhFzXxfmSgA==
X-Gm-Gg: AZFdTZd+Wv1fA1KORq2iyVgIwhELPLUMTUzyXdIRboI4VKCgv+iNjSSDRqtBPIFhMup
	oxWwbeaQ0npPjqBnmBN3aMl+jm6ZIJDgtoXCqy8qOupAQJ1xaJbrPpijQGsFsns3PXaCKbmIRsR
	wAjWWk5Ecy4MloldmXHpRjjvwkBR/2L0ML/i9VqHW6fXJUc/ntVdK7i6jT+Ch9W2Cxxx5i3AayS
	tMKMsQodDhlBR97Hb97kNUsBvLuxjq55ReHaTh6SWg0g9jTd4OhUGiBqA/ygBf1rG8fw6ggTII8
	94JWDtGPHRPUhu+fUrH6v35uy9FSjwQxSTFBwBUrRGhpe/Ly0HtxZDtiHB64c65+chlEHiWIBYm
	56wis9L/0tq6VCD+dq5UnVVVbDGluaFJbRomPIKarV/G/lzb7uh6++GJECcR4Aa7lqgUiZhqLCJ
	5KvOdM9rHu1HAviuMOSqYdhh53/qVH7Kjux1ovB+nUVU3uFINANg2xnMZf2QPfszdypM6oT1gur
	ACnsM8LreJeGjNia+f9xYnJ+AaTUtJXYCl9FxtucP/JwEkiKeZtMime7NCHYBqYO/8gI4gBmx2e
	tlN3ZaaXvEFnZGi3g1XU3j4HU/9RN2oMNV0hqzul6crzium5qTwR8vCuf3MG+mN4rZtK5fj6Pvt
	g2VRBeGjfvw==
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1047945666b.8.1795446165573;
        Mon, 23 Nov 2026 07:02:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 2/5] mfd: max8907: Remove platform_data based probing
Date: Mon, 23 Nov 2026 17:02:21 +0200
Message-ID: <20261123150224.199601-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2f91791410538..a0e0c480ff43e 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -188,13 +188,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index fd227fd136121..84de0c443c945 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

