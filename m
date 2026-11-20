Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142664;
	b=5YCq6me4GA9ak5HhwyjEH2kadraknGFUiOQNZ+zktr7Mc4Aygj7MxiiRKVWJReVf/Glh
	 uPsAomLIy9fnCEjWqLqNPHw1C6D2jsn/C39wxu9Ia8/yZ7hRRRB+qy9WlqAntMw3yDhN7
	 gHTLanhA7hdqNCgtnU6dJkkxcHKQtO4wqVVe3p0H8Xe1c7KxcQuF1gm0hOQ5K2OWA+2tz
	 I54mlTe63vsnMFxZom+Q3LkVo+MSdYiCCh/2NLMRUTm9NQ2/k+OJgA/TNC5PuFgvlZOUZ
	 NxpzbQV7qCRw9zLDTJ87Li2Ix5q5KsOrTYJcYcp0Ghx0lgNUPC6t5Dy/s1mxWqgUQrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FqAwkj/RgVbeEeWB+OVqnE+d236GoP0AK0b8fYCl970=;
	b=pthzEOM/gxXWN7attmRKkNXqWSJGT7G7MaPJbdVzISyVmP1t7vQeky4d8cjMKHaYTi0T
	 1DO+oU97D5SXvV6W8uOimh7vkJDtnggIxVdWc79yDXMyB756djKLkpoSOkvAzIRyirURa
	 N3vdfhOEajNB1J/GetV7OxfmPl2cB7zgdMEVgGe3q27OoSeRFkf+alRu41i1axDgACBp0
	 ziGx40c+i3A15aA5cKWelhp6jT16oXAd5Lwr4nDOWKnsB+O5HME1SBLayPFVJZeYE1J5X
	 4od45Vu1vH2TdlJSe0m2TFA9OPrqSA5OqPwuzCO46KDqx7TRzzItqU11w/oZV5f61lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3ps3kCj;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1384606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1384606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3ps3kCj
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so390504a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795142663; x=1795747463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqAwkj/RgVbeEeWB+OVqnE+d236GoP0AK0b8fYCl970=;
        b=K3ps3kCjFoNyQsEPKIrqkA25PXTWmPoCohdlMH+cgnWa+ww2d5P0GoV7m58wKd4wHK
         rt/c0FY9n6kMaoquQG3fPBl/i54b9KCwn9NnSP5eUW7UqpGVmE6oGS7YBQsF3w3lCaB9
         +Yeoxl4vA0qOmEAJe9zRZB1KbIGRua0H9Lp/AYPL6fu7kxHVoXQKuSsA6CgBSrhH1Kky
         1rUQcNdFmBdEpDoKkPykTKjHPBWdMUlAfbS4ultqqNW2nfgToWg5Mh9rL7RXzoVDw139
         +h+HieMBc0cNKLNtSsBtaTNpIAORGSopsIOQD2mrZXfP0CTQjCb7Q8cJU3W5xUI+cTqg
         TGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795142663; x=1795747463;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqAwkj/RgVbeEeWB+OVqnE+d236GoP0AK0b8fYCl970=;
        b=jL8jdT3JARrLRoMNtgFsUtX0rEz8FfYlN2C8R5wtlTGgTJQLjUD3N8wNuTsYGrwudk
         OfkRglxVmgf0VASJKOq5OURqKJhwW2rir/RF4f4a8eTUbKOQU+Ip7eUH1fHuaSPn2Rh6
         o66pkGQSa3wbmNBnzAo3uBhlzv55PGT2lTUnRncp/g9gCDWSk7GgPdbOwBpIQegQ/+F6
         OGyQie3oPatFKFehyz8/SZwnYY5LWroVulKu8NobtEk/8sZNjzL6h5JFxMNUx40lCKr2
         tjTD6t2VUE8aZN7j77RKhG8nN5rDc8G8yZlUENOPYZdUL4xJ4K643wx5N2zGFm9XETp0
         8COQ==
X-Forwarded-Encrypted: i=1; AL+hErGaSB2JknxSqPwOVR3GeTeC4Wj/3BfqM2V8UnC8x4cQ1bHGiQegdxBdgk6cipBK40GrirlSoKSwxmR1lQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YdKylHbsiQRsr6Q2ZmPDoOOrcSCH+fcX2Uu3NMjoUlAFiD1eV
	No+qbfXcjIbqhOFG7zaIdSzpvW/XOTCcPDaHpQS6n88pEHhZTasU1onKcMiEhwhqiM3/6VWN7hH
	HDg==
X-Received: from pjq3.prod.google.com ([2002:a17:90b:5603:b0:3ae:c401:753])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8f:b0:3b3:b36e:8c3d
 with SMTP id 98e67ed59e1d1-3b41cb466f4mr1155511a91.62.1795142663097; Thu, 19
 Nov 2026 18:44:23 -0800 (PST)
Date: Fri, 20 Nov 2026 02:44:15 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120024416.338876-1-akorn@google.com>
Subject: [PATCH v3 1/2] hwmon: (pmbus/max16601) Support byte data writes on
 VSA rail
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arthur Korn <akorn@google.com>
Content-Type: text/plain; charset="UTF-8"

MAX16601 exposes the secondary VSA rail on virtual PMBus page 2 backed
by a separate I2C client (data->vsa), while page 1 is a read-only
virtual page for VCORE input current and power telemetry. Although the
driver routes byte reads on page 2 to data->vsa via max16601_read_byte()
and PMBUS_CLEAR_FAULTS byte writes via max16601_write_byte(), it does
not implement write_byte_data(), and max16601_write_byte() falls through
to -ENODATA on virtual page 1.

As a result, PMBus 1.2+ byte-data status writes from pmbus_core (such as
clearing individual status bits in pmbus_get_boolean() or clearing
STATUS_CML faults during probe) on page 2 are sent to the primary VCORE
client instead of data->vsa, and byte writes on virtual page 1 fall
through to page 0.

Implement max16601_write_byte_data() mirroring max16601_read_byte() to
forward page 2 byte-data writes to data->vsa and reject virtual page 1
with -EOPNOTSUPP, and reject virtual page 1 in max16601_write_byte() as
well.

Fixes: 2138f8853a00 ("hwmon: (pmbus) Driver for Maxim MAX16601")
Signed-off-by: Arthur Korn <akorn@google.com>
---
Changes in v3:
- New preparatory patch to route MAX16601 page 2 (VSA) byte-data writes
  to data->vsa and reject virtual page 1 byte/byte-data writes.

 drivers/hwmon/pmbus/max16601.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 2eca7525..f9138fc0 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -153,14 +153,28 @@ static int max16601_write_byte(struct i2c_client *client, int page, u8 reg)
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct max16601_data *data = to_max16601_data(info);
 
-	if (page == 2) {
-		if (reg == PMBUS_CLEAR_FAULTS)
+	if (page > 0) {
+		if (page == 2 && reg == PMBUS_CLEAR_FAULTS)
 			return i2c_smbus_write_byte(data->vsa, reg);
 		return -EOPNOTSUPP;
 	}
 	return -ENODATA;
 }
 
+static int max16601_write_byte_data(struct i2c_client *client, int page,
+				    int reg, u8 value)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct max16601_data *data = to_max16601_data(info);
+
+	if (page > 0) {
+		if (page == 2)	/* VSA */
+			return i2c_smbus_write_byte_data(data->vsa, reg, value);
+		return -EOPNOTSUPP;
+	}
+	return -ENODATA;
+}
+
 static int max16601_write_word(struct i2c_client *client, int page, int reg,
 			       u16 value)
 {
@@ -252,6 +266,7 @@ static struct pmbus_driver_info max16601_info = {
 	.read_byte_data = max16601_read_byte,
 	.read_word_data = max16601_read_word,
 	.write_byte = max16601_write_byte,
+	.write_byte_data = max16601_write_byte_data,
 	.write_word_data = max16601_write_word,
 };
 
-- 
2.56.1.703.gf848ed807c-goog

