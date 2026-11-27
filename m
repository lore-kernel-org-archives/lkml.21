Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801215;
	b=mu6SGeQ2zrEo6iR7D+kQ5+JFVl5ZkW5xzDqBFYj1MyldekQFx2og6dwqFLcrn/F6MD0h
	 g58XT4aUbCYUD88R/YjbeDdMN6iVTcY5LtbZPt83kfMdwsXTIu3x9VBVKpxFSxD45NGur
	 svXTDD+1E0XgdBFm03/8mpDTDeIgk/pwGJOTj/UKf6b+AWBkQSNjabbYk1MZPLith+LfV
	 enBI9lWLOuqjNgySuKdocxS1Au9GKwi0Pil+885vuKdJpvqN3x4GlFsbfWLto4zOSsCzn
	 AXuVDEcYXGfk9UQ9FCT6S0orVWxz+bCaBuVLIDVZdCQgQ9Rtp9/A0NwLgmqBbbq7Wxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=rvkQhnQ3gDZexPEzpwSApUMeXfCt1mDiFOxJe9Lt4zA=;
	b=lsjiXb5FleH87HupYSkuiVZMTQRfh7BrYvCDINLs3ccbor40sk6kaxBzBTguZztbkkwT
	 NhjmkCCZkAk4xUNappXyW5q+GL+hylTbaAER0QuNT1sDZ3i7LkNcXt+XUOJu9Ohntw/Dv
	 38h2CzpzVuNz8ctdJ3T6ZbnZIS37yzOtMqTzIi/GyjhcTtsElpRJ/BF63ApOy/FIagzHr
	 04HMsS+yUxFVKb1jtra1nPlgWvGvQTstZAweB5k2kaBS6axq/6VXShvVdzvQd24hRz5Yq
	 QqcDzRC2yRSvmVG3Xu5EG3UD7oUAHRb90x2sYe8IwMVa8Fq2XzIPPMZoG5xWxvKkS2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dR43ZBCU;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A6606A334
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21A6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dR43ZBCU
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5242341f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795801213; x=1796406013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvkQhnQ3gDZexPEzpwSApUMeXfCt1mDiFOxJe9Lt4zA=;
        b=dR43ZBCUwCdHsdokV2dvXBDNIpU3K+Qdanl3cD1SiAo1b4KBCISjdNQIBl1NCmirRP
         vUEwJqx45Tg8cTEKRJG4a2BPQZM9zpm/zM3JbYH4JNdm5wQHTzhDrJwobBJNaq99vy6j
         eqATIvpihOUgJxwIXqFXKMCvQInHW7HTAxC8tQlJSpIgkP7TdgYkR2L5eywpkPQt6LRi
         D4L/1Fp810Nq1TzkJ4svmSKioeysYilRVwqtgxc3I/vmYqZxFHgzOxfVGjO3xV2oUZIo
         MHEukY9W73wwv+MRUeZ2VStWk4wC0q6Lq8XYEdBo/NOXxOsSdSSFwylmJxvAMSIlAhRR
         gw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801213; x=1796406013;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvkQhnQ3gDZexPEzpwSApUMeXfCt1mDiFOxJe9Lt4zA=;
        b=LDs1mYYVI2qhkMxOKN3uz29onPuExusd17n2d8EsIv+E1pxrbdmWWj1g9PYPV2E2uk
         ZRmn4ZsQIZ/aBZjgmBM43VbokKLPXOMTOL98ebLc7RqtaB8JhWRXdftrQrLIGukF34wP
         7Wbs6kqwCplpWzINSJJAH457Il6LdwQC1sDjuT4V00X+3FoqUdiAC/m6btdAyOFPkWKN
         fW/dNCXILq6R21y/oBo8fl4JiPb26O1GLsOJnogmEuyh4KjZbur1oSfk6awzgVHS/Kax
         Q2KlUL0KVHC6mnyEsbUjFNrgpfgVF/RSWbcS3R1jJ6vtEidh3Wq+y0vxdGmVc4qVpKAu
         4khQ==
X-Forwarded-Encrypted: i=1; AL+hErFSBdsXig/O3+HLwH5HUxII/avNzduOmttKZYz4EhrXBoF3Q889Zd+zT39220nWU3NjWnG3o3ayNJRoOQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AF4lt0/dbBEV2jSSJmyJIOLpPjeJNL9Upjcz7bsthcpIFg3he
	CfRCJfEydkjoRqrO+0+KgZgnZULSPjtrmGfIWlJvfwUi238XSieWdQIEK2OxMH2UbHw=
X-Gm-Gg: AZFdTZdNa8aA40IjL8F0GaWdI3fwf7rBGYyNCciEt1do2w09jZrYmmT5LTM3bpJq9XN
	okpDkdfKj280Ah1vaJqVh5DZd/KZRmKjg8JqButWUJGXDX8IUyigKrkVlcjsXOxex7CMybhQ6Lq
	VLFNGaP0Qt4gf6mf3nvFimJFFMcEVEusI98HUYsT6Y4hluTekaVYoaVVh6Xf1cLhA4irFSrbPkm
	j1UL5aFwKHvui69hSepY6UBWp9dBsmRwPDSKOfcSq4VhSOFgjVzpwbNeQVLgMmI582cHCWIrZmh
	1f+pEijY0WwLmbc3iI18QzKBQ8jQb9B8ceoRMivC6iW0MeoKpESJVcH6t04LyIy3JVod8CsoI8E
	JB+F7mR8yVI+dbOK9WMltNSnFrYClvRroKeqMJGJsRuUEWHeJ38PTAvCiSLNruI5Ut019t2UtCH
	H/wNl+vIPpgTbwvLUPdbRmI0dFhaV//Q1oIZJqXAKniG6YXZccrGAMrnY9giLQoS7quBp9NhrYm
	qjctZkNtvZFX68GqhKzztZpFvDElI7qVNsQorArGL2t6gHCTo7eWhKc8O96nXt7GxZyuFSg/yNC
	M3+bwhC53S1yNDQyW/6KjvqxOo/WQnS2FWSKRlpCFi2dEe+o15BKuOplm11BDtQIpFYNq29hXN2
	IebVs1yFOjEX4Ke/O
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr50384565f8f.22.1795801213192;
        Fri, 27 Nov 2026 09:40:13 -0800 (PST)
Received: from localhost (p200300f65f044d0890ab5f15b7da13fe.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:90ab:5f15:b7da:13fe])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b110d56sm47817846f8f.40.2026.11.27.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:40:12 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?utf-8?q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] pwm: tiecap: Make sure the input clock doesn't change rate
Date: Fri, 27 Nov 2026 18:39:43 +0100
Message-ID:  <cf0bb39e659fb506eaa3eee346338381e4d3618b.1795800756.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795800756.git.u.kleine-koenig@baylibre.com>
References: <cover.1795800756.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=b/a6uxnrk6pYA+orPJD4C66GD24gVjrMfjZs18xuNkU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCcBmiacGSqh2LVENmfXyBBELOe4Ir4vjkWYKx 1k2boxCVImJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawnAZgAKCRCPgPtYfRL+ TuN1B/4t1FExgceYFxoXrNKnByvqgKqgC2EeizTU1BLPPaF6sazFuOOR4kc0smMTj0WyXOo3edC +Etqli2BMt4PWG7FQakiZRiieCQbE4MxENLDWNKPgZFrvp6u9qktrERAA5GJ1ZeDA70KD3BWW+G Lj3725+y8Hu6TQEo53uw6uniEpXgOBr7N/qhifl2OEv8RQQfN4xM41MsS5gHkdI6H8iefxVvu7H hmtg0fkWJQrTbnsJ79x3CisOk3SJhA2wY37EATUVttYfXHaDy9IfVAKWYe4ZA3RPRJ/ZXsuTMVE onIgoTbvrQ8xPho2GLH4DYEjoSGjevJNcPIgjL3aBAmg8fg6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Correct operation of the PWM depends on the input clock not changing its
rate. To ensure this doesn't happen, lock the rate using the devm
variant of clk_rate_exclusive_get().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-tiecap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index a7665e514865..05c38967504a 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -284,6 +284,10 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
 
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to lock clock rate\n");
+
 	pc->clk_rate = clk_get_rate(clk);
 	if (!pc->clk_rate)
 		return dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
-- 
2.47.3

