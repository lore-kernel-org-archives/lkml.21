Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432754;
	b=uhm6OMbUGEJrCI6WfzFhLXGyB8Vdci9kTJwMuuXVqdpeGQGOunzu7+SK3q1otR92tCOe
	 lSwAw04yHFEWeJZ+BTcbU1jWo4TD44WOjgx02WBpfrUEdg7ole6IGQlmvyC9nj8Y2MMps
	 Myto7zPFLx4SFGQ7QBuk3dJy1XcMm+TIf5btWoM0Uj0JhPrCLJVkoYZB0MRTRZn58fDov
	 bZXIslHwNe2UrQ6cB0ZMWVD8u608YPXhTw47HVKJSgQE/H5zhcD4ryRzi3j9i9SBo/xTN
	 e/x+6ja1dmloncjnIG20LBSgwag1QuWlEXvpTnvvQEkhsLCLvP9ElPYWivFEtDmRzPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
	b=3XdFAsipvbznihHfISBIu/laBl015ZFChDE6tWS60sqkCSXZV+o75x/mEK9Uxc5nnz2w
	 MMSOutkmE8nOS01o1E4qWhTmTVTRtIrX2Fq5cfso/ilwRNBeybTirMD//T9ph1yTuUaOj
	 qO2hXHfprn7fc0j82uE+t8jedlgDPOyB3pmfpHTNzIG+jderinJWX+w0848Od0RHPvA+o
	 utdX9OAvqmXHhCM8RkfdRkl4Oz5Zth4iXBRuj0nBYi03zRy0XN4HL/O4/3iAzw5QBnfkd
	 wSNdOeEILz/uAKW5tvV3Y75AQEjFnSPi25grk1ctDTv4jhPYOMz9uFy/jv2NV6X9d5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QavJG4MC;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307360A3804
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A307360A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QavJG4MC
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so17258255e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432752; x=1796037552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=QavJG4MCGXKzx1stbyOt5jVm0gtI2GXV0po5AZZXylwvUyMn1sAb5zJefMQEHpOx8T
         6t3N2BqHgk0D6M2z8Txuun4pPVDI90fy8+/VmwYXyV6xX1waJYScXmS5LA2TuciF+dRW
         BFwDwINzdopsgufEBqKf4HMGePh4RWM9M2E9VSwZmuDx+5JDk2hWNfv27nxm5/LvacAG
         IAI3i+MSTU8+Kmvdqo4bR35vnrL9oq8x+U/2ornD7ftv9KncKRy3qBq98ysK4iKXjIa4
         C6BlPIY/9s/hnLy73Zcs7gT7WBCwJSyI3/vc8dhrr5Ifl3Rh7iD7Wb+oUIfanqTKwSAr
         Qodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432752; x=1796037552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=BfnB3GQ+rmUf+E0yCnr3sABUmHLvMVcmbe16WvzZWqIShqTlEmqowUoUUMFO6ABSw9
         4EnZ5m+g9DidxJFHv/t4Ks8+T2MVNtSgx4jIov2D51hZr/NgamLzDfWkVdZrYzUjTiPL
         HgSBA4HW2uOvZwl2kfRm/Vmr80aT7EjIkfNfhP4RLJEdqtr0bUWCTgPMIndH0UwxpDFv
         IS5LtwCmHnFiZCR/q3UkK3dZNgaMy4Ln2SJJ63I1AjvqaTz3idFeZGzSJOB/chS73NA5
         bYKwmNKjpr9MfCuuYWFuP0CJVQNH3dFredimRX80HSQvJCGdBwqtLW9s3wOrDMR810rX
         Z39Q==
X-Forwarded-Encrypted: i=1; AL+hErG3l9wyawANq5NKbEfRqbFkBI2uE5sS+A5NIfU3ecspDJKnpbJX71KYLrmbkJtHMFKp6lt0zIsUU0t6NiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+75coGuLSC5vZhKI6WXCX1m92Hyz0nr1l8svcx/IK9roxIYN20
	QBL3bzaYwgEwrg1CKd27kDY0phEBvQU4RNNebiDe8w5sFEy8ULQ/WPzoy3xF+9oToYI=
X-Gm-Gg: AZFdTZeIGSKAObYZaQ5Ckc2OC97eQyb/bC/EJ/SjRt2ibSKL35NWjyBxl8Kc2cRjSW4
	QligybmFrNWRacCbfAU2+NYcEPdDXs3Cb2fmb3a+RF322pFkKSF9dh3z0bzttclOzUtWcy6vIvl
	+iZ4Tgi7j0PQDtKJSXiQ0ryRP3LoXVuRBswMTN3+dHQLCJKrzddehnr8Jp+WvFY5gAIZ8tW+cs0
	q/h+usdzX0wuXAJVt24biMNyh/wlwCrYCeHgYrVl67gwp8IvSj8nUQ2zpihw4M1ULmIvAWElICz
	tDh0Yt12+wAVPj2Srb8kzog+cbOYdzAGpv0cQPOcWs2dGQ8q/vrDKrREwIn0088kudf0YIhMvuJ
	/lG4wyX7gKjICXbOLC2B8aTHt8CJB4Xo5fOrpYBiTo2hmRwfuVJ70Tl/2yPgiZg06JBPOeOZYS6
	zVfX7v1J1JQuJA8D3Ku/SJlaNECWVJBfTIGowDlcbVr3sXldCCT84IkTtnQsJKaUXp8d5FA6RQC
	pMF1elm6Leu+H17J5tJA2wjeXYEZvGm1+kLCRUmp6+Sffyqy7iPW167h3rhVi5Xci90G/6SM54L
	z27adlQO4uNCPj8LuYpqYEdfctz1gkWMpIFRUGQRK8u8lOxQCJxpN8UH0X+FsDMDl7I/ARpqGnN
	vjxos/OSQi2OxOh1w
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr230811345e9.23.1795432751939;
        Mon, 23 Nov 2026 03:19:11 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906cdcc1sm160681095e9.2.2026.11.23.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 08/17] mfd: Drop unused assignment of platform_device_id driver data
Date: Mon, 23 Nov 2026 12:18:06 +0100
Message-ID:  <6d088972de962cd3b8a22926800e36defd268d97.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OvFq0jqcix+nwy/hTUrsl7qFm0ROsXuuz2q1RVingjQ=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGsEIPvISAODgKyfpgbjFnyiCAHcQ7IbFHzgEvRZzaz3yy47u YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJrBCD7AAoJEI+A+1h9Ev5OguoH/1w9 aQiu905LCob4dh8+UJ0quimfHVX9xW7+i57G0S8G2aVJctqf2euVKBSoxeeSo8zEke4pt4akQS6 fJ51B0cHc8thdTMyKEvvqix6mrX+xyKcVQqmq9lHk/m6n71IDFR+XBKvle9oQJaeZnQGiry1mC5 9hKGlxP9dWv4btXVIModwmGhL+nQLu27g8zlS4yCW3JbqOHO2j9R3gWD6EBfus+x4M1eQaAv6Zo x5vYa6z7z7lbQ5+suCKrVLirWylLU7XYuzMFyPb5zxB6Sf+qTBKk9cJNzgsawDWKCbigX8sw4iU BQpqVjVQ84v/zNG4tyEpOu3AkqJKnJGD/7SiVm4=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e2f6315f7da8..816ddfe1584a 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,7 +327,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.47.3

