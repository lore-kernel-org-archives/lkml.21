Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801212;
	b=EqCP7mLjX4RHXMruexlRgULHr/f5I9QqOQ6xn3AjLWb8NOb5sy7fYIOXtdTiHKCsdVd6
	 GgvyBXe60yymNDKU553rNKXR6IpjqfqtPduW0zBHCg3gS/xNICBQtRg7srGkyBNUVRCKy
	 PcIKHR3OiG16MgJ2ESFEKUtmv+uiSnXBQfrIFlRbh417W+fvY15pBb1tEWT2wrm8lgIu5
	 cv1h7DiiXR8Sk+9sEObJVDBHcudOnD/j1K0Ic+Y4Nul/Tl6lgF+yWo1XPsjX9QIFRX4i5
	 yCZSwR+QtAb3hDoildw6QuoJKMAF6H6vuGH3ZyqGY1792ay1D1gRzT8G7bh3pf76IuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wGqpN1iZZLpNmp84bJRXyOLdJMWq7i5VMPEg1kPwJ7Q=;
	b=VTTAGvxaCymFBKN4Ze6WfaSfSr1MPN3Iweh833xRe5PNZyHtnN84Jkx7DeZf8YunJfSq
	 t1kCIJibjKGezM7VAeoZ2L0SDABAqdTmsYWYXi4DHGvADQWvNznDwWhMmTZn3ju7qLNll
	 Rcw9sSqu2uH9CJLJYV3sFz0c2/5IhXDKCNAvw8nYBB1NCw1qqNHQFfI0SbSiDi6KBTQc9
	 D/uUqiYi/ruNpc0uW9auxwZLkJiWd1mGAhR1FIejr+LZhrc2JrzIMyB1BBkeGdrFckM9F
	 5ZPSFPPVGx9a2jk/xxtIyEjhF4oYCFe3T7IFVP6/187jbLp19KByzDuYef3nMjLwVvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DJgAf3Eu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E791606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E791606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DJgAf3Eu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so67369445e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795801211; x=1796406011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wGqpN1iZZLpNmp84bJRXyOLdJMWq7i5VMPEg1kPwJ7Q=;
        b=DJgAf3EuwaMP289NzdDFnXDv4/0lPwCnBIilOOT2O33qb2+zJEdEROO2cYY8gWRge4
         lB78ml73kPXJdME87HQCxu/XbnsXP7C6EyG9KlIGJr6MUCthhJCfOCRP6mBKlZcrxic3
         j3JIrZ+urgy2P3K8qhNiQgLLEybWXM6atXN1GTakZ8FaR0CxOcVeQbuLYu+v55jhvC/m
         CWsueeOWBNvDPmhs7T+ioe723jGfhCPdKHMpbILNCT9cZiAeQxtYc3BD1RAQY1d0XLkF
         lP4zoVWdQM3MFQ1Qxi+ptYKharxicJNQKEKz0RB+7BM0B/SxwNA5Ipt5GH7HyQWiSagw
         InOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801211; x=1796406011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wGqpN1iZZLpNmp84bJRXyOLdJMWq7i5VMPEg1kPwJ7Q=;
        b=qxRggd+eRWC51HeT3BlPQ3T7kn6K8dh7VKLPxQFLJbRcmZgU3sbd0z7iHbnw6N5rE6
         ZlOwpDbUnBSgyueDXHb8D5+gXreBGZa6dOPDcuiVx/+heGCtwioArbt1U/N74KMZLpNR
         XCbIIrKgfhTEQCSxhmXLKAQF7euOabxUWGKseKi5jEKLfQe7qIk4rANsXNaQbhUBfNsw
         eRL+u2wdYcF20ZFQDuEiiJbVIlsQSzpfsLsbWEDH/DFW+o4Ol4wGha3IyaD0N/jtTX4g
         aarHFslT/uNMzNqUDzYv0YZqG+1ws9wmpPrloRnMJ4f2hNiWTzcHjH4gk0SXqTwHXhCz
         nhpw==
X-Forwarded-Encrypted: i=1; AL+hErE/gUcqnHgJIABcieGQUcX3dZo9ZzCxe1XwOftGpBeM+H0al/zc6F3dml2pgcG3qpEy6XJfDbTc1adBM7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EC99piEPEkWX3Q9MRx7o+/BXcmDMmjL6yGSUg9U6fc0s7mv4P
	D7pqM2xw75ZQ+5Lro98fmGFwS0TRYYY3qu+4GrewAY6tVXwGSu7HuG6cqIkmrXad0rU=
X-Gm-Gg: AZFdTZfCYaurBuon17fo8/8xxhDs6QF4i4kKvlqIIucOwNqwqjFsv37V6mIqmAsVGXm
	QXEa9Crb2FVy5gfBCW6YggXZdZ/Cyo2UnoHALlC7CoZNwRA0OCu1i8I6eJdfhsj0fryTs//qOi3
	S9EZS340osK8lQVtDgHYN6gk9WdFNrPFOxMFFM5MaYQzyRU9WTFBxILrG/5JGUoDlOwjO2XwvXy
	zHaZKbxGcp6ppH8RQksf+q57h8ru9yyLz7NxnX68rjyEXbcQtxzDjhWe5NKtWViv+A5zgZyZ47Q
	wedfGgpi6mYrkOIGD1Ux6Nx03JFUcTuYoMycEaQidk6dxC/7yVavCiyZKESGJBOHDZccZshdrXu
	dQZ7tkwxvOpgcw/ZIuzrvyX4gflVCW5RiIZrvV46a+eGwc4ED3iOLsNMOX6k54uEL3eHvipHbAO
	NQlPlKQ0kWAHwogWC2a/cxMQ0gMfdEOLWX/x/kTBUFSP0CKReaKqHl7TNs7ow/XXbe97pvgnzLj
	PXBChangvI0c8v1pxJ3CyLyGe8pZ7Mqu2LrZ8ZNDcsM9M+Ki/OdXN78ijtXfaRMnCeHriXckRBY
	EZ1/kijc4+QBXCxvZbd50n3zj3GFdQPuMZUj74FDf+gR1xgoB1v+pH+ADqh9q23AFqnNRpDbeiB
	Q7+eGRbbg4fAOHJae
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr507662915e9.1.1795801210855;
        Fri, 27 Nov 2026 09:40:10 -0800 (PST)
Received: from localhost (p200300f65f044d0890ab5f15b7da13fe.dip0.t-ipconnect.de. [2003:f6:5f04:4d08:90ab:5f15:b7da:13fe])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906640a2sm408972145e9.0.2026.11.27.09.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:40:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?utf-8?q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] pwm: tiecap: Ensure the input clock is enabled
Date: Fri, 27 Nov 2026 18:39:41 +0100
Message-ID:  <97197e923b47ac6d50f5923e8cf1cdc5cf5f331e.1795800756.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xYtiejv9pUqwFdIS9LUCXqv1gFj6bmlOElRjDsPG1JI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCcBiqjQD8V+Rt1l6DdsYFd4W7+4kGpJUMlxA+ xDkJG8TOniJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawnAYgAKCRCPgPtYfRL+ ToYtB/kBAexUj8K/c3Y63X0v16R1qWxUocIjcioSjgL5Qa0Y95rXzHUztmyOicuXY04MFJS/fIW bnyD6AaX02ft4gcs4oyezHCTGg4oHOXJ3udNWTtad+A9nujDKPPd02cS8Ybfic6ySBmkxs1uVhY HrKPjf6/ODu0GsaPQhM2TqowvaA3lT/TNPZBlpvkrCbsb4zgE919t0mg4YMpQDGH68VKw0VEpAJ AP8mOAcJWGATkdiWbqgvevA++7I0pQFGkgIHm+rtZZHhXionXXlKgXTpfnb/GkuSChzgsb/7Zrz D7Zju159LYngzDYgQuN5VSoGHtEUh1kZLpbe988m4dnprXra
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Calling clk_get_rate() on a clock without ensuring it's enabled is
wrong.  So make sure the clock is enabled by using
devm_clk_get_enabled() instead of devm_clk_get().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-tiecap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index 7ca23a7576bf..c441df9d3f62 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -266,11 +266,17 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(chip);
 	pc = to_ecap_pwm_chip(chip);
 
-	clk = devm_clk_get(&pdev->dev, "fck");
+	clk = devm_clk_get_enabled(&pdev->dev, "fck");
 	if (IS_ERR(clk)) {
 		if (of_device_is_compatible(np, "ti,am33xx-ecap")) {
 			dev_warn(&pdev->dev, "Binding is obsolete.\n");
-			clk = devm_clk_get(pdev->dev.parent, "fck");
+			/*
+			 * An ugliness here is that the resource freeing is
+			 * bound to the PWM's parent device instead of pdev
+			 * itself. Not very relevant for this obsolete binding
+			 * path.
+			 */
+			clk = devm_clk_get_enabled(pdev->dev.parent, "fck");
 		}
 	}
 
-- 
2.47.3

