Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432751;
	b=r4ju0TXX11xOCvnOLJO1aXiv8NogVznISF4/BokqyuV7KnAgf4fa2KSkX671VH8MR051
	 WzanlDVh/ErCWUdaHSgJhtTOuoJzYiY1h6kFnGMG3bjKaCYNWVjGSfLLSu+l9t87xVcda
	 GYmASdi7rG+x+aaX5UUCqw/9NytNZH2Mmnox7tibbWdjL6VUysyX3bRqKZPxATaR2BSEE
	 CXpXt/d+qxjTdifjXtHGKYjPsaVXGo4YP/GoE57hevLkcBmEJTP56vdUMIBWQ47F4x+nN
	 +u4faFgLc6rU9cbtr9oj6jcDEZAiianIfq2dbQXRBAbOSmEaJNv183olcu39dwIUzCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=lOE6R7Xl/jlA0aq5T5u3Q2xfUb5jKoEz/z16W6dysFM=;
	b=ddsa3FaFAbvGn+sfv5va1BnrhQDxc3jMdCi1K8naB1IFZ2Qijk2H6ZG5JgHAwHb1zMS1
	 +lJmjPaEo9fDIIHnOvkvMh7UWo7GgB+zQRHpPg5/k1p3Sqj1tQBWWbd1706VD9aYL6854
	 U82YalrQkNGf7iycbCKxesuzZLvLZgKZfSvYxJss0ta3Rx78NSKt/tJZqJGELY5NS3lIB
	 am4mPX+vxi82AKsJqHznxocYxSm1Sd9mo5JfPsCEWgnejRxFlaOMkJuJggFLEhw8L8kGz
	 /qbUP5h4G9ZpwryE5tsuDUtWx3/6AEt7HNtgDt8UC1Tj2V2IOiJGxyd6jyY0VBltmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GCIUeQLv;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CDD606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CDD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GCIUeQLv
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a358881793so1564933f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432749; x=1796037549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOE6R7Xl/jlA0aq5T5u3Q2xfUb5jKoEz/z16W6dysFM=;
        b=GCIUeQLvG0uXeYIrIYrqQ1HkCVKBPtQbDySA1PpRiRV6N3mG2JRk6Uqt1IOC38WRom
         VyVwi7ki0nCZqj1NNdNL4BML5Rsqa2Sjl7PHIHDbSYQzPAT6aGTt46iALgifPjGbHWIS
         lqPcBL3P0lIEvPR996pLWiA1KohvD7shFrhRopV2U3MnzdGm5czgNQlZ2o/765HaGNuZ
         rRzzkV5Yh3p8HheZRAVft2qsi1AidDlh3cSARwcRKzYndGfbBE0bpPJ3jq7z4ujnfMJa
         7j9zYGe/K/IneMD8xSEEg9002Ynu+XcPBn8evdGctRpHqUWEKSSQVYvNHey4C67AoqiO
         P+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOE6R7Xl/jlA0aq5T5u3Q2xfUb5jKoEz/z16W6dysFM=;
        b=C6TNyZzQA1icNGWE9j/Ns8pnHcK/11h2S08I8NSqCJ2RsfFshYrr/AuZwSO4mezsrO
         sLg2rOvP3+sHcPAjKaoasbcvUIQUifLVz6YJlmmI2lOiY0484SMyZ9p3iKdhHiAzzZ/8
         fjHMM/haCUjXBYQuLt8oEo3BwYm7d2aW9X+y2G5/fi60ceQMw23ILIfp4RiWtsGJsWK2
         h3vYkE9dLgP73+NNmO1PqIOXCAzyD9lfQmknlk7eQZpgh4dfhBnud9j4zvgUnosZf/oM
         cU6m8D3U6iM6C71il/QA1Q/NDS90tt2xrayY2lri1kB4RAT+Scp4+QI9QD7z4fUnrZFd
         bT4g==
X-Forwarded-Encrypted: i=1; AL+hErHcX1M6VWCKOF1+1nzXMp3ti6KfZZf5vxPXcUWeloMMehEXHBbLLKwUNyswiPx2CLECL2pGfgKyXGGId0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H4Bhisd3RjaOPqRzLMtyw96nLLfgJ9pH1gREAdYfAmZ8LdvsW
	yTsQVZtg35GrJcBfgk2xuZO9Uvl7++XP5erMtudpRag2wTAI/JQ1pW6qC3NTv9IgvW8=
X-Gm-Gg: AZFdTZcXERFkJ71laBW+olRTF6WMiwTXrpuEPWmF6gOafUWRPBr1ioawifWfmE1/yy8
	FLYXuVffZTQSsj1QeRyH5XXbvGISAvvdtoq8bdEMO2hX+xN6xXYGawqrSaNZqz3Ar637Dbo9TeB
	y14t1+3sQ3whwl7b28HcnakHQFJMnKoDBDn+KGrKddcVPcyNkvS284KkdKarg0E8pbO7iJXQQUU
	ML6GV9hjJehUnbogfOKoBirzVCEujoxv2R/6TXWPvBHJVFItfGRs6vpToQknJkjzxcaUVClTgXV
	gJXrVYnlZPvGT0hr3s2PKUYnSJEO7rVj9rO5/t1CRvrjTzjVVCoUkL59YEhcvpRtAyUYNKvbAcj
	hEVLerl3a+zRzRgPKlxRD5KJ43MtzFOyWLzVrSz2PoYRsFAIG15msJSEIyAPcCYSyxb9avzFSsS
	5oXTuPMkZK49qw/fI8TZtEdJCR+46RKPgc796dULC94rGna4flKYZjjiyPSaqg4YVieiKWn+Y9n
	uGlxGhm3pG7mmS8PCdNEKwNR0726IZ8/Ft1HpIgnHE3A8egPxVHTYnAFg7M1mqAy++1Q8hi56Nh
	EjWFw9xn586rI/yRtliBPnZpkq628otmGCw3eapNdylhhKQC0b+ErQdif42wBPnaQ62ytJte4bn
	2gq/TjtYXQzdZop5JAQ==
X-Received: by 2002:a05:6000:4a0e:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-4abb7787c05mr21163192f8f.50.1795432749041;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b10b2c9sm22480961f8f.31.2026.11.23.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:08 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 07/17] mfd: Drop unused assignment of i2c_device_id driver data
Date: Mon, 23 Nov 2026 12:18:05 +0100
Message-ID:  <51e03a317097dd87a1afd7591032659611dae693.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BOZAeiaAw4Eaud+KaCugllOmpmTVVDFpxRVJslTRZps=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCD4XyeVWvp8XdlcWO/uEO3cdf31L4fMMm1Wd nFDQVp25+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg+AAKCRCPgPtYfRL+ TjfRCACV7ttZXwTw5e/+aK/ttVncaxXZPGCgFmRhxQRxOXavYhzNdvaOeqyVj3btMFnfEHBQNVo Nrv6kPRaHwYzXG6Hc9opdJBXN19lnfpRlDjM6TGhSqmHQFupvV3lHVaBhbnO3xX3BoO6J5Re+pW Kp7aERCGgp3ccAeev3T0N5+vWdwWX6tNxkh2NtJxFRkV+ixOr9htYHfWPy3Sd/xjR2NZlTtRjA+ uCseWDWEMv5Pc1YEYyhYPd26kZUBIz7RNUdJ3YDPWPB55sSRQT/ItCyNXS7e3bzsQWyrcoEsn4L xqxJwIAfY/JR/gHrhfUuEr+JjDXO4YOzvEjenLpPmkq4U2pc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/as3711.c  | 2 +-
 drivers/mfd/rc5t583.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index b123195d911c..9513dc4ee0cd 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -191,7 +191,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3711_i2c_id[] = {
-	{.name = "as3711", .driver_data = 0},
+	{ .name = "as3711" },
 	{}
 };
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 431ee5deec00..96553e5a8279 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -280,7 +280,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rc5t583_i2c_id[] = {
-	{.name = "rc5t583", .driver_data = 0},
+	{ .name = "rc5t583" },
 	{}
 };
 
-- 
2.47.3

