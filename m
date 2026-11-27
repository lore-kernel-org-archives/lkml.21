Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801214;
	b=ASfhuBUprPGl//z9wjG4kdbpDxyoXSwS+R8LJkkSIJ0+XZKwhUnYp20fJDIlI7WwKDSi
	 boNGbiLhOn3XtwOxSdKht8V/NxIynoTd7mnobsdr1eWvjb7SDKTb2G2xWK7hB7jqRvVjM
	 wPKoulrGjmeM8dRww7omqsov1GDlratw0f1JKQvtgU8deyvP5Z6UCAAKF6EltQep3gXkH
	 HjFbnfGat+gi+azccOhoAt7/bEFjwCmWo+vBxyz/wd99K8tKLnZf0rygjNqYPE3JkSgY5
	 cd8MoDyqQnu/HSOnUmJxDhh3Od75ku648HxaKRLBRxXtUfKR40A4UtT06Cdk3dY5K4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=QO1WMSUsoU7d4+vr/dMAYRmW9+EjtD97ziyOCmzqtAw=;
	b=bHwUOgRa7B56G5l3CDLayZf/MfjEe2xtoS4evVSRw8m5WHhtGbnV6aTWFvUb/P7R2ZUU
	 EuPEaKnS5eZDEtKKc72LL9AADoi3Baja2lyOJy5N0PqqiZyizdAL5hyTpdlR+LW5UzMHT
	 3GQnhYFhFDeBibimQXXnvpxFvwxAIHHKUmwna3SoJIqG1HVRm/MK8+jNiSEi6rH6dhioW
	 73QS9FzdBuV1DZCD7DZMPNB/hFrlpFvTN9uqzF3EpjkFudr7sncPwAZyc090mDzU09g/d
	 IQIXLShq8vo8DH1PjmIHLMAat+Kb+bGYVmmMcKMCpB9+Mt9umoglKkulgLK70F3X3FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NEcjCA5k;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B3E606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B3E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NEcjCA5k
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso3369134f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795801212; x=1796406012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QO1WMSUsoU7d4+vr/dMAYRmW9+EjtD97ziyOCmzqtAw=;
        b=NEcjCA5kQNjo9s+AnKKJpIRZpyKuDNJLX/AhwnHh2pCizzUdyeDknE2stQ+NKqqncT
         SpoWUyhQcXs2NlHtI3L33xvHIZuscjeugEuqQfD1xAyWJn4pSLKJ9drP0TLRhKndTUKq
         u+Y0TTHvts5q+26IHDncmGh5JpMjv2U4QuJjTzFh88tRiFRAgTs6lR3UMEjlPbXf9n7M
         u8w8HrfHE8j3e5UZr9FtweIKeyX1kbxruhs+VD1Zi3zm258R3idTNOtZctjqsRKHqz9f
         ee7rQA8q4B6AVyKGYwsTPQRVC0yP1G5In/ukjiREhNP2E4PUEpJh5IOhK161EkpKOmtH
         CUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801212; x=1796406012;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QO1WMSUsoU7d4+vr/dMAYRmW9+EjtD97ziyOCmzqtAw=;
        b=A71qcKuuUmbPu4ENqcumEf8PuS+8/S+Diois2JzGnUM177JoplhWVFCm8Wbga+1GHV
         8pkUt3MG4Huf93RQ8yMKw8BZb0kN+/+YdA1L1bx2vcsaMkEr7s6UExFqTUD1apWAVccF
         CcbI4vU6qtAOzYztyDq4QRBMk00C3som5TpUGr2NZ8POg6EGTZSTU7pldLJYYIDpbKLt
         SHCG2VO4EqJRWGLt/SQjXoiSs6Vvfd6kLQZXZoQ/vJQ030GHs+kg4R1irPchprZSJyPp
         cOBuz81j47xNdXFDQsiiOsNxC3vZRwNCGifiSQOZ6zFnBau7+ZhWZufylBK2C4lxyiXD
         jrIQ==
X-Forwarded-Encrypted: i=1; AL+hErFqOVoM57Mz8Vg0lyxvhq+FANFYe0v6layHG0jJyvYye/ufZM6CoYir4u8UGpzmmf4wTKdMCXN01znutB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M/tn0L31iMnE1MIFOZWX2FpoL/Jg01MpHkbjcw+bqLiW6rbf1
	l08l1jVlVa/H0jnMePBNf2omDtXKVL7JQsz5qIudm6OUUJU1txsOL5JDZ0ZjGwiTC8Y=
X-Gm-Gg: AZFdTZf9azSEHsQkIhQZuKf7LUvC40C1gbx9vGJtoyJXeDxrCRf/yLsKBRY/Vn/VdAr
	s8Mjz9oSFvi9chsWdVdFlZBFA3sjrnx7p9PNgjjNlBFopsEKx2x+m6weqiOLiMJDaZzbwYe+m+J
	j8SWrAV3ivwWC+Kku9T5tswmCsS0OkO1J3r7xaI4jG5XYJ/gn0nxXjcM+8JmNmMIlbONkEOEBtD
	m2QsJBjNqLKzkVTyUGlctlTxNaRWY0DjWA8JQSYf+RdHEbgVL+d5yTmpBDDS37+e8CPmjES42UH
	1xS83g5YNJioKFLt+oohpvOxnx17lGW6wxVQqoux5BZVshiPSoz7yTFNVomvwAblu2T2FpCk1z9
	o76XB627Pl0zi/HaE55Ul1UZWPblxnXgMESp5VNEAnm9lsWOCewKZC1wjW2lHsWjKhLkxiPAVPr
	Z8tNB8rf+I92zxbGJiTo84CQ7OqX77yciQaVQa46bjTDATfF/1X25r+KhohEDOZFMjpZKn2gBLQ
	hewAN6q5beJ4KHhD4jiEFBgjQzUmKTsKtxy6HokvL3tX5HtYbkvEDKl2EQfx6mgw/g9QVviBQa+
	iKuCcFt1Ftgy/4s3gh+RLT2IMnYxSg8ExBxpydV2URMG9VWmvEMkaIK7Bc8hsDejEmtzVHSck/R
	eIOerUq/ImIYTItYlzyG4xydsdIlO2XsFzvRV9g==
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr313939755e9.2.1795801212019;
        Fri, 27 Nov 2026 09:40:12 -0800 (PST)
Received: from localhost (p200300f65f044d0890ab5f15b7da13fe.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:90ab:5f15:b7da:13fe])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb88402ce9sm584249525e9.0.2026.11.27.09.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:40:11 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?utf-8?q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] pwm: tiecap: Use dev_err_probe() for error handling in .probe()
Date: Fri, 27 Nov 2026 18:39:42 +0100
Message-ID:  <275368fc5d2f50ed42b0c344712eb8753f34131a.1795800756.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fanNnHi/RF88/u9VlLCWbekpr5EixXr0JbIpj5nsOes=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCcBkWjxsxnINFGpBRxMjWRSmhBNhpvtxaaIwg 4ercOjy4G2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawnAZAAKCRCPgPtYfRL+ TtsjB/0Tdr3i4C6xGIWj4FqEbQqyuvgRIPS2zCuNUQkjT9Hwxo4b38gDNpQjy1mBeZSvZf3Om/M XWvAzhHsoAYx60bQOBE1Y44tNkf8qC7MT6CXLqLuX2bKBkmK36Dwbne31v5pNngt66j3Jyp0IyV 63GKhaVscNyROvLzTlCZ//7i8/a1FEGG0qxvgTm7DrJkgsmsbGC4uuYyX/uC9vKSWpjYIMkoaCV ocI8RG7SRjYM/niVKSUQpfK6GPVO7c0YFr+pgJ1SqiLqU61yVh3M/2SE6muBYzq0xF7e1LI+Kzv OmB5Ckk4ZVFputYO7vqZfDRlYtGqFcA0Bb6csxwlioFihf+d
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Usage of dev_err_probe() is more compact, (usually) emits the error code
as symbolic name which simplifies interpreting and also properly handles
ENOMEM and EPROBE_DEFER. So simplify the error paths of the probe
function using that function.

Also introduce a local variable for &pdev->dev which is used a lot in
the probe function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-tiecap.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index c441df9d3f62..a7665e514865 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -254,42 +254,39 @@ MODULE_DEVICE_TABLE(of, ecap_of_match);
 
 static int ecap_pwm_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct ecap_pwm_chip *pc;
 	struct pwm_chip *chip;
 	struct clk *clk;
 	bool running;
 	int ret;
 
-	chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*pc));
+	chip = devm_pwmchip_alloc(dev, 1, sizeof(*pc));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	pc = to_ecap_pwm_chip(chip);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "fck");
+	clk = devm_clk_get_enabled(dev, "fck");
 	if (IS_ERR(clk)) {
 		if (of_device_is_compatible(np, "ti,am33xx-ecap")) {
-			dev_warn(&pdev->dev, "Binding is obsolete.\n");
+			dev_warn(dev, "Binding is obsolete.\n");
 			/*
 			 * An ugliness here is that the resource freeing is
 			 * bound to the PWM's parent device instead of pdev
 			 * itself. Not very relevant for this obsolete binding
 			 * path.
 			 */
-			clk = devm_clk_get_enabled(pdev->dev.parent, "fck");
+			clk = devm_clk_get_enabled(dev->parent, "fck");
 		}
 	}
 
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
 
 	pc->clk_rate = clk_get_rate(clk);
-	if (!pc->clk_rate) {
-		dev_err(&pdev->dev, "failed to get clock rate\n");
-		return -EINVAL;
-	}
+	if (!pc->clk_rate)
+		return dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
 
 	chip->ops = &ecap_pwm_ops;
 
@@ -299,11 +296,11 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
@@ -318,15 +315,14 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 		writel(readl(pc->mmio_base + CAP1), pc->mmio_base + CAP3);
 		writel(readl(pc->mmio_base + CAP2), pc->mmio_base + CAP4);
 	} else {
-		pm_runtime_put_sync(&pdev->dev);
+		pm_runtime_put_sync(dev);
 	}
 
-	ret = devm_pwmchip_add(&pdev->dev, chip);
+	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0) {
 		if (running)
-			pm_runtime_put_sync(&pdev->dev);
-		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
-		return ret;
+			pm_runtime_put_sync(dev);
+		return dev_err_probe(dev, ret, "Failed to register PWM\n");
 	}
 
 	return 0;
-- 
2.47.3

