Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503029;
	b=b1tVGSS1RLvr0ZznIKCLFVyAf1evU5hQMlO3R2i7I9rxZM3xkehJvCpMy/QGwhbK2JCG
	 dJXcg2l6XEnnCZcnrGRby03Zo0N19ZmaMk4uL2UNT7/7hOgnHGo6PD3CbXobj9kdtfVyq
	 gEb/aozBGhr+ZpIU6x2a7ZOAMOoO2lFm/LVvTqs+hgRcJQ+c6Y/GsXUGJUUTGNt9jK48o
	 3f6ZcIg+QAnNmAOTeHvc6Mn/GBkiYKf8vV1rFzrIxpW8bgBR1oi9tpUYFTrRq5zXv9s6A
	 8rDUls4ugknhzMlb8aMNn6WNzuyLTEZ+x/2py3OU8ecnj1rhydRhjLpYPiDcmWd3Eew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UOn4hDwfQTw/XYPgE2jhZm1AB2+X5E33KlJWlVFviUU=;
	b=uhdjS3QQECHgboDliqVqjZZS/ZpopXp7J7Ksx+BwgXNXPwVrndvdIdNHXibpvJDJuzRN
	 gnJPAgPROLwZvkjYdfldh65I7eaBoBOcxi8COHw860X7A+yutwXZDm4RzSV6hmYgQvjgo
	 pb8bGoUZarFeIbUz6ss0X2OyeD/xqIjiuyb1qJo1ePVPLYiRlCe5KhMeDMo5+yowu+7qN
	 FI/IHRVvTcfWOAiBxQpAHpRPgonqyHr92QD61wYnSegMJSyjOGF4BNK8O3MvpmLNaq5QJ
	 ZWafa/OjcP38vCZhPsnsvT7utmzPnGlKZOa6uEhX5AuIvMM7MGE0wRLweE0d2hcHkoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R988hr3O;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B9760A2608
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B9760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R988hr3O
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c10dc41270so4487657e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503027; x=1796107827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOn4hDwfQTw/XYPgE2jhZm1AB2+X5E33KlJWlVFviUU=;
        b=R988hr3Os4IeqdwhkRpwxXQAWDAar+YYhT+uJqAPhgzJZ2bKJSuWBNr7bBCq16YaWZ
         ZNiA4so9QiTCbRiLpFwWO85Ik9RjiyCFy+z9kyRf+vnAnJ7Mma7lUhNLMnqz64Nop9pi
         lGm6mKyGsyrxWOIrwbNA24bvXoAcCJa4bHI/bexoowh4moJSMv3DaSEAdtbbtrkA3vZ5
         uXnELVA1zmNYgSJssKunscMhnYKK4AyxSRDWmcBS0FMijKiZg6yN9Cu+P0NEkLV2XhzV
         gyf9gtWGVkw5dvNBRMFaIqivSW46H7E95nwWLCgzWv0fXzDjh5KrX4O0SCnh6HNmFt/7
         Uurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503027; x=1796107827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOn4hDwfQTw/XYPgE2jhZm1AB2+X5E33KlJWlVFviUU=;
        b=TlNYNccUqku++GXohxoIa8Zfo+CCuedK0IXcYxJCEsujWxyVEm2pwUTyzz9xVhRRMU
         bKq92PqVMb3HbkVB7AKenfmyIq/M40zrgg0gL7MUBk8PbypUvZGAlY7XZt7YVrGKnmIh
         KxWQ4luLhEpxGk8EDAHakHwBghx7n2KF1Eg8C7OORa24HMxHHnuocLx0n3l55jGgs6Vx
         7NGnH0gMYt4SayUYFVPMNtnhAyeb7Iy5/rHeTRRKDqyDssdYZygiWqO9EI7MYtlR5dce
         JfEw3hyXuXErhb+7mioolwjOOTc0MAVkxvV6eXuI7TXa2GR7J39FTgLJN4QNvAk1173M
         D2Ag==
X-Forwarded-Encrypted: i=1; AL+hErHtW+VZbePRlwYMjmhITlfftiCm1mHSP6fz2IqXHkWNTUKZBsA9EpQIQNnxEzGAUonJLaoOgf7Db9pu/Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sMfV2adIqdd+CW1Ew395c1YfVJY3/blBeBpuE868gZK0XRWOG
	8vn1Lsg9hPQJfX20uFcmgvw2ODoZXsl0kTs4R4/+9lRU+k4RPHx0fEy7
X-Gm-Gg: AZFdTZdoRj8Q40ASPQhL0k4Jwyl1pwAYzP19Gm7OR/7C2Il9m2Rj3EjGTOodOxJUiba
	DPryOP3c8rArP88xJa/verx+lNgjRu262I+mr+hHKr+bPjoQuk6TEPaQ4r8Bh39R6XShMJxLrQK
	dq/kvafEGMgURVx0rthe94jqHOJ9n5vtpg6dn+bfkRFRBAE+A1Y+hLadiBNWfjKLbH70JYDDBLB
	wbseaGxHMwUvbxutzbp7rnNxvboZswUKzx9pRDakPQ24JxTVH0xegRvKH8BumY4TJeCHvBgnu2R
	SYjil++dzC8nRF4fcCphdCssz8jLdhxAo22pEluU/ImntcoiaqxI/mWr8djuz7ghhe/pgy7WsdF
	eYsNFn/DyKwbvY5KJWOqUnPZPwQIxsHsgCHLKHZbktkj7XtV6q4GuYEQ10QRHamLvnYUKqjTLuu
	mZwsKnYLfcoH6kzNfbjAja/jxTGhILVQqbPhhR9u09ViOxGQLMVnpXyPbp6BbAUwhA7BMZ9rG57
	kkc3FtQjQsL+np4iO99qNH1DgARVok0RKT3J3idFlfXiEtj90VEGp5NbkGWh4N4xodEE5DU2K7u
	Xzgi/MYeUN+q4Vb8c207joOT6iZ7twn7uTeMIj0g7TNjUWWOaw22hNAeBcsMyOPwYsxenKtCVYY
	Pdor97fwaow+G+VCJ4qNejAEHwlDhWet6Mm3n+FY=
X-Received: by 2002:a05:6512:2255:b0:5c1:4f2b:a2ba with SMTP id 2adb3069b0e04-5c1bc7da45bmr4469860e87.34.1795503026920;
        Mon, 23 Nov 2026 22:50:26 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:25 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 6/6] iio: pressure: dps310: add debugfs register access
Date: Tue, 24 Nov 2026 08:50:16 +0200
Message-ID: <20261124065016.185124-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124065016.185124-1-zoone.rupert@gmail.com>
References: <20261124065016.185124-1-zoone.rupert@gmail.com>
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

Expose the registers through direct_reg_access with the core regmap
helper, so the configuration and status registers can be looked at
through the driver's regmap instead of around it on the bus.

The access is not serialised with the driver beyond the regmap lock.
Reading INT_STS or a result register clears what the driver waits for,
as it would on the bus.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 9ffef150cc4c..257fe25c5ce1 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1563,6 +1563,7 @@ static const struct iio_info dps310_info = {
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
+	.debugfs_reg_access = iio_debugfs_reg_access_regmap,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

