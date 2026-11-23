Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432745;
	b=DzA2/V8HJGWUQw7mLrdKh+N/Etj1amURMJ20ecc8ccdMtGQALm2etmKG+zXfpZfHC1sB
	 +Zy/eELQL0QsDchW6tN78H/NCwdIRpjQtsVloHr/M4KAyIhFM4h7Le/rsI/G0agsYn7q/
	 q2U/RxpGi3rBJ3nPAC0NN9SNMz6phH3w0v1AVONHIObLTbc9UpGEKFoRlSblcMJiVRN9P
	 WQFLDMyggKAupgtjsJPb9ot+tcw57j4jgQjWTc2T4JcQWYyERLOQ+fOEq0zJ6+yaS/HC2
	 yeRDUKHGRZQAMMUUJX5GheTKyyVd5mT8y7NEmwgkQW6bFGH48P3oj/0Wf9j6nboLa9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=k3uSf+LngMc+GclAQbDex6wYdGJF5q3WDMpqyCChbf8=;
	b=dOFoCJ8NziQRgVZC1/RZozXpEHPRWi6PckE8rVt9nUhRdNvlpsijc/w9NTPL+ocRslyz
	 LvHl58YiP1YDOtGdivC7WtBMRxc05kq2tt0NPySpaomdzZ2+7RuAS65pJQJE10AfbNR4n
	 5zEuGDoc1yKUZXpuHFaUriPdAz3meaMGoLZRQXxDDU1r8ARRDT14RMSKsOYv/wsnhM+gU
	 sGTcGs8Y0Z7UblBvzJeoZVVisSSO4+Pg4AW2OSwG8IkWblEAG7tiaaEhliXxPMj7qvygm
	 u+EkUjSnlUDe9bDqX57Sw24kGzq8AOZgXtFUgbOcmy5kZCFyNLwPBfEr3fie2Zdj2mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=g91psyOu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FAB606A695
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FAB606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=g91psyOu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso38100685e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432744; x=1796037544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k3uSf+LngMc+GclAQbDex6wYdGJF5q3WDMpqyCChbf8=;
        b=g91psyOuMV22qP7IvX6gUT2og19/KdUaOsLCB8AbTNWuwLr2fAtlilWsqHx1DFxtYX
         DYwFcKFZ44GbfyVL2ydF8i030SzQ7euBnmMxgTMOPgynAH3v+rzwnqcK1Da7KuHD9klC
         FHxwrfgZIei+Zc7docuwjXTNmZ0wCzfKF2z08/zJ7rn8wGA7qdotmNRSCfi9c7mL5kb8
         pPCWbdOJ9qRX2fVk75G8xX22QM2t8Wq9v4fmMr+ztc5C3HeaHbuPM2r0gewYr65SZcqY
         kVXf3XcRlutq2hve8tqFhmghSjWNXIfTPbS9KwiRoaUFpsmpykTTJRuCy4jLOWO4/e0H
         eIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3uSf+LngMc+GclAQbDex6wYdGJF5q3WDMpqyCChbf8=;
        b=tAqS3WdP1kJYjtUOcppDRO2m3w86eZcd3zk7mt/x29/i5Qfm6OSsVBmyC+VwPh3bdM
         SDOcsPP9jKMn7XMd7qHEEn8eCi86CXKn7IspzLlxVVZqAegUJOrIKBv0sJ1erhwk+l2k
         8+kCBma0f6cogLYRenm4mdUNsDo3elfrEbEClVCvMYnAa6bwwed/L/+nqPqgf2TKjG0+
         +AVKRYqikBd0hKY6S3WrhutBQu51tgOWNC8rNDkq8AIknuWmCi631orp3LqsxAwTisuZ
         z/drPg7WMGPEPnqZUPlwbAUUTifiKOH1RJspuIyTXY+18h1dMxUogxqMwoBGauBwEwp9
         e3zA==
X-Forwarded-Encrypted: i=1; AL+hErHMukXSCvzkiZ3s+KYL9sJEIgari5RssWiC+8OoCz93ukvlA8LaWBKr0jWafXV7gRZuqUCDAVWh9bvm5e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y5YksGlN2XsjMYWOYbPdWIknJf63tfeTvdGN9Hqlswk1AjEA/
	63WIcCEfoyBDoSvMdQ06HgapzU0FGbF0oJBavOJ2EpkNxlNF6UI8ApZQMQRxoGTpHg4=
X-Gm-Gg: AZFdTZdEMKo3dHFPepBLeNf/Z5SYKsh0uSG4u+KuFwWxtQwB3mwtFwNecsOF6RoY+zC
	8Z2fDFFxJ5z5zlcVwzD3BhYNZdetx8SoiSkFk9Q90H7wtRriwtF98I/5B0Y0q8LH+CAvM/5GtXz
	3Dw6YP+tShedVygZuA8e65ioJ+pHjHZgTdDuduyiWoWYOCrK4o3CaWJIiWz8m32vntnTEq8NV5L
	+zPzNlcPWWXWietWy3jEjuNgP7JVpvs9T/oXdtqg8YihtFRD5N0wQ2DnzVsfnnasgA8pAukxGDw
	szj7UnA1tsS6hZzl21OANVwPduyRVT5ciSRHNEh/6DbQEIkpZDVCtQ8vPU0AqpTUwBucCneju/7
	mRdA+WUTocLgQbENmiijReavrhzxJX8ensy2xuCTtgn8e0fw8klgA2j0xDQv09qk8Q/UChWzvW4
	1ZYK5xk8h8TkC6iGmwkkl+QM268SQuBJ4t/jfjS7k78cZRoHcaSEP9MbddKuVDRyjE72IiXAjiM
	CHcKpvM5yCxvl+NAH//vjJtP/7q9VYQ/EHn+iOR2Zi8vqpL7UGIQVTESxuy+Sn1DaCSP5/rIa1w
	tyhzSVTrt+RaznSEZCUQjGhddM6WctLAUV59275VB490+qLJQ7RzB9PqznOq012XeVny7LM8L/6
	r6XmrAsPhuAssKEb5
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr261104855e9.30.1795432744004;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853b2437sm512008535e9.13.2026.11.23.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 04/17] mfd: lp87565: Explicitly set driver data for the generic dt compatible
Date: Mon, 23 Nov 2026 12:18:02 +0100
Message-ID:  <e2659aee5fd535a1af5bfddaf363ee4e5ce1c1b7.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=041Ou2CUmqGEP+iZWns10y5sS6irUDUF3uHGK8uBwY8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDxQ1Bh+OxORbNKyYh6miKzEokYLD2L4x8dy 0DNt+iHcbOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg8QAKCRCPgPtYfRL+ ToMwCACPUcymCoZTmzE4UKqfBqCXcu21ZylCcGbiixCoZ+Jgbnos+K7KvqG880IDBWHpCoUeWH1 +n32hQn1VrM8DDcIwE8YBxbnivVYWnhV/ukbOYsNZoy01sT4NTV2EtWoStfWGLtSrG2Ycox+QN/ HbP/5Sml7Ple5g4qbnWQDKjvbNOZagO21dFi+ff1z+HwjtUUxfcxsFqo97SkFWp70b3mdZQJxTV vIebcsGyLsxFHzhsWZb8OpaK2UQ98+zfBHcL5k+A4Ur/pACfGLdH+lLTJDkOklu1bCNQ3LlTkkz n/U3z7j92rohADNvv5SLLy5pgMq9I7fUgZiPvBfU+IBW39td
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index 9e5059636225..08e7ab41a638 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] = {
 };
 
 static const struct of_device_id of_lp87565_match_table[] = {
-	{ .compatible = "ti,lp87565", },
+	{
+		.compatible = "ti,lp87565",
+		.data = (void *)LP87565_DEVICE_TYPE_UNKNOWN,
+	},
 	{
 		.compatible = "ti,lp87524-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87524_Q1,
-- 
2.47.3

