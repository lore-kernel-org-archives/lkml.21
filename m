Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446173;
	b=17n/4EVjYGUhgtlXAi8TvmRDhVvJpOpjArsVZbVOUgAq/WppJnZuwfZV/HVSCkNEh8/J
	 Pk5pUA4H60MVLN+CF18J8l5QEvMm/XMwjREakPBxs7xglibfKVdhgxj7jIO0X8Ul9gG5d
	 TWkvuS68SEi8Qy1TGFlv9PeASgXDXj5UywlXB4rGOjkPfWN/jlpIYK0lrYGHRsFqrciOU
	 C2aVZ94S7KO9jIvE+aTwTDPFjJcgusDXmfW25HCNXgNdBNN9/gK7pHW1a37++NRUuBgoz
	 RS7EvsF21ooBxhO2mBSSuRIvQqc/3+ifPwMknp+6lVrlxf77IXggXXIf7ENJY/fcDaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
	b=vXKcVdVaFFD8AQFmaC8bdqrdW7wggrG000g7Qi9esZQc8fgk4gbfjjzT40ryne3GpDXD
	 1PqtK3HvgY5h2TFzfMZWgZO5koZ3i/84d1a1SqN5cv8X9FKXVKsrEFujz5DevwO61qUud
	 BBqWD288M4LF8IzWELSfWFqgAHhXfyY6e8WA7KaIH0wfwUFXeX9gfZqnKu7q1u/2uPWvA
	 oCSdqoz4yJ6JcDjYDZfltuAsS9FRrovhzDhskfFGs3C+GpBbCtxpvDIDTOXmYM6M1mBCl
	 QJ6edq/pWYnPK+cdoTeCUkpBa8+RwLyC8/GDXbEd6fbQHkpD8/3QfTfUgQLpEvl+Ydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2x23gux;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FFD606A6BE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FFD606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2x23gux
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50a4a2132cso484871966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446171; x=1796050971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
        b=Q2x23gux2WXou9ID6Rf6EgbmD8oXLtysYLRow+Uukrbzz90PtXGe90vTL/vay0y0tg
         edMCC6JWUOGtYhr5pqwXtMIvG4b6mtxkgyA6r19AyWGbcsPZt/dKl8av4np1GeGS+Spe
         RU/ilHW7lhQbsH7zsc19RuU5i1z7N9KHEQOGzdkuQHG+r/00XXQFsx6YaiFhEOA2ZhKs
         LuaKi9RKaV1izEn2aaHu6hD9zlll5KR4s8BYfrkDqCq+yAqxTI3OJQ9k3AJdxgp+e2xn
         lV9CgyFBMDLItG1COTd2ejBp9qOXmrAC/nkzL5wq0RPp/brQ4zixR+1Jar20qeexxLzY
         T6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446171; x=1796050971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
        b=tRdCXheHAHnPnm4pPvjaN5pNUU9+rmyLoIRQvSV1xDZG5Z82nTXKkboQLms9PBhxM4
         cYnfRSadlKn7g3W5c2ryH0I3cQW7ejJEBWM1UTb9Z9FEtq516+mogxML6tUom5B4YT1q
         bdxv5Eiofc13krJk8LuD7NIJUCF65QXZmZi8tTBIicos4XWoV1cBTbWIpt9CnxZz6ysL
         bG/kBkqlaqJppx9IFYTiLJ3eopQ3PbsaQMmTBW3J3RUeJ+3fwYn2+6K1bG27+UmFQcSU
         8OOihUVJEo9jm4qCKAioiFM0Nr3tv2Prh5DSkBn2lj3NnZo3p33759rn9d8HI5UQ5IbI
         wJ1g==
X-Gm-Message-State: APuU4Z+pqUrQb7KurYrLG2CQA24AYuv532xSmnx8nF+WqptfT/TUKN4U
	RxiHrk1peNDBY2PjwrrnXs9Fd67yEbTOdbSF03BvoqSkHmUEt3/dMy77
X-Gm-Gg: AZFdTZdUYrJ4TxvpAvY+gtNnOHDAz5RCKeVujYZx8KLy8waIBbzamPHzoXlksTW0qFy
	2BulHdlrWdb3/4A3qXezD0CfMmsAgB9YrbEp2vmgRflgpnDka0NIveT5Gac1lAbHv5ni1G9zt6t
	eJsc4s8n4MnyDaqAaXeIs9qgD9yrDcdSjyRdfj81PwOXfRVVHFvJ4HQNuMIhyBYIk5rYThtWyTD
	vBh1Np0qrPduDh5jlKFLl9OXiEz9MSIbvmAyBRgVu1SxaBHfgB38XhOJ3CoVlQMmBatI0hp+xmq
	A/D2EwVMWGlRs5Sbzo4nFujk9ant6nQVxu5X8E6NIo0qiMOEe6FXBjnXlagwcE/9tMpiecxnggr
	Un89QFpJImLVft9AvvpKCrOxGUmLQrjyLlyNGBrttkTHIokaomwYmnU6MvNVN9LkikdzyXXd9IL
	0yW4xaWLtgTiLgiDZ409xhYLWeuv3xPhf+3aKYDIyZ7+BTvbtSH15i8c4dTA5MGnNLZNTLk6iOu
	Pllj1BRtTKcDZ77bMQbAA69jYtD9IV53xFJwnWVheDbmXmSaHYteStTXhvoQyWZM1igy0w0IziB
	DjBfEXGoGTzorQNrHeUbQM9zrskNDkPEPjmMeJ6DMvwoLUF9uYt0QLt6UlL30U+tJcn/BV2p988
	OQhv0/NdBkQ==
X-Received: by 2002:a17:906:7d42:b0:c4c:d6a3:f4bb with SMTP id a640c23a62f3a-c513a999e3dmr714080166b.10.1795446169636;
        Mon, 23 Nov 2026 07:02:49 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:49 -0800 (PST)
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
Subject: [PATCH v6 5/5] mfd: max8907: Add restart handler
Date: Mon, 23 Nov 2026 17:02:24 +0200
Message-ID: <20261123150224.199601-6-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 14 ++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 5d17971a8e9ab..fe71ada77696b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,6 +184,16 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+
+	regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			   MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -243,6 +253,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..025874e5f8808 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

