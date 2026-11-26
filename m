Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672742;
	b=YdWd1EkGweWBaQrDqnYGrWhW0K0DPWiTBmzYdBR+k0P5cPIsvXPEx8fhIm2f7Wa99zE+
	 XfTxnHrAtbPWKmqfOFsGwZ2gv4tKKKOtyy6Q27w0VJfahUfxWodQdCNTKghpSdJybu4wC
	 S/N9BfPy9ceChXNZWGRu1RO9Cr8DY99j4YpspE+UBYvjhZ3hizt4RHXISWO5sC25fgGqW
	 4AUQfYHNCFQCJg6Vof6/1kWmtrGD6qY2pELBm/un3PbIeUzjQNtj3sL53eDefxoM+LY4M
	 OfcG8B6M2W5Bg1FSs8hVuAModwXDLvCKHEGWqsqFfc24aXdlL9IEkaUKp68H2lO/6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
	b=FtpSu4BeBfXZAiV4nUpM7CZMwkZEQw6RN2dbEN+6fMz3/DgblAS2D0Y2T2qu+GWS/z71
	 2JmTwsNaPQQ2fetFzyOTHu2ecpQ8bvgh4bfAktWY5zCpnqd0jrgWwHujbxmACr8ijXIdm
	 znfTqTB9Ppa4EqVDjYw3GRfTXkuJLENkeANy32dUe85ODmfUf9KPrSzWwXzvit3svg5/f
	 eEUyUsOqixii7ibCvgRh3De3yTLC/iU+ewUjYQWHR8iP42m7IJI4IxgPb5xtphM7gW1Xz
	 +96TPIFIgq04Vh8PB3X1sIGFhcVc0+tVxkdbmiiOPSAo+vjb2LoL9UhZn3My0tRMRLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XAsnkII;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2794B606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2794B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0XAsnkII
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so10061437c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672741; x=1796277541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
        b=0XAsnkIIH/J1m0YQZbpAYLj93XQ5MM4Yp6RCzt/EPqp35wqexoyQKwav3soOPNZH/k
         pzFNyUItCpEqqNkwOXnGxX2YNdsAI7fkNubYsuGmZZn7TIgNNJ624dmST1EFCAzn79ZT
         LOLFgy/x1WIoaBRZGucYAMM9JX9xCN2Mx7zz7WJoHRjxMTNb6eu5HnWxafb5+IlNF2wd
         IaXj477cN4KFwqnP/DHYXoXO62owL4GFaDucl5jxeqBzi53SYPHi098CCh3NwwsdkWU0
         gROe50ilPRpXDIF6UcVqKWhco9aepPw+i16NxOi6Hm3GKl3eywLEyL5fOfz60bLfkDWi
         k5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672741; x=1796277541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ENOEvWpXS/hO0xFIEmj5YuEGPhTN4rxHq1cUYnvsQg=;
        b=PHKh/sC8dVnxY7GI/hUV1EhjB0LMgr+2WW9IS+682x1vOHSHW3R5UyVTobusznxZ2A
         UM0jp8T0gqCaFPjRlpNOkaEVEPR0PKAFtpubjYaV5Eq0NDIenjP89GZjUWfVLyftXS9L
         q/Kv5QRJlYEgSxaGKOxzliDSod4rr5isxwhICiH1G8i7BSWAPGpeZS2RcOtS98C9beAh
         iIOAUQTd7cvcqJDqOKCsk6pZpycRXBZ2LDtMkOhnM6YTBpz+7iGLc3gj6PEwFPVKHIGn
         M4dCF9R1RbkdJ7pG2o/6imf1bOVBxYawiC61rSklV4W1ooNvpvGOhLcfwtkRWOklemja
         hpSQ==
X-Forwarded-Encrypted: i=1; AL+hErEMZKaMzI7A2CNfaZEukbz+N3LNXDx8sJy6JA4vTkrfMUcoJdi0iNGHZD0QIzuj6Grg9ucDfrBCWXE7Esk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m50m/e6ZZ94GY1WWptkNBbqoQRC4CbefhQjqCulLtO7YhGdz/
	3pARv7DQJsv49nGmapNXhrgi1ff+D2jCnr0d1BmI7NtLGVRIsMQ9zY4=
X-Gm-Gg: AZFdTZcPPVZO1swr3nid7Q6E1Dt4nKejcUA4wMus8CJV88XqavRwY0bHIpYgVzlVmP5
	K7zNYntlysR15T+7CmpLnh7mNaXKgCMG7WcBRb6oX0C8Mhl/bOGE5NoBvhDZ67LKAjcKy+6xv7q
	TZEG5rGcWgzNOjNaFRFS584X3KZyR2x3xhr1VcOlqD/qaEKkgTYNT1R8aTujgPDAMipY8+45k4k
	C2Tje5mCQSrgSEacoawQQbHAhzPBRyZFVaDY/UYwXRQCxQZrcMU4hP/uRcry/bRMpXqjPcfPy3h
	pQB+uDM9VZSLgZ+eq+EF9dQsnxO7wTxUc7Ch6HPsSydwv/qPTEWYklDDcV/prqyscwKfyo9zOZA
	enrPVgnw7kUcLYfTMY4YvIekfQWM/n2IBw+oNUPvUe5GCV6F/ka8SguIk4nqcPE1VnmzToUHPL6
	lvmTgi7YGY0GFu5mhpHWsADqaMIMNCR4VJ9jer/Nsx10I0hgLAKYSq0U4sLcDgoKJBVAUzMNymZ
	nMHMGi5F7XLoMEuqfJ5IaaGmMo9tO1Kr44zlkvb8idOkppIw6k9Ptq3zMp48qgIg6VxoOzASZIL
	TA9/A4HZpu0PxC1/EnxHU5eNwNZPJBxYaO8CDeFIMZO7QgT1w0hGGcq4E97QSqC1TK4=
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr18022188c88.19.1795672741112;
        Wed, 25 Nov 2026 21:59:01 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm45249439c88.2.2026.11.25.21.58.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:59:00 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/exynos: hdmi: put bridge reference on probe failure
Date: Thu, 26 Nov 2026 13:58:53 +0800
Message-ID: <rc-b1-20261110-vc-19-b220c856ecbb@gmail.com>
X-Mailer: git-send-email 2.50.1
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

hdmi_resources_init() ends with hdmi_bridge_init(), which takes a
reference on the next bridge with of_drm_find_and_get_bridge(). That
reference is only dropped in hdmi_remove(). When hdmi_probe() fails
after hdmi_resources_init(), including the -EPROBE_DEFER returns for
the DDC adapter, the PHY and the syscon lookups, the reference is
leaked, once per failed probe attempt.

The sashiko AI review bot pointed this out on dri-devel on 2026-07-16,
in its review of an unrelated exynos_hdmi patch.

Drop the reference at the end of the probe error path and route the two
early returns after hdmi_resources_init() through it. drm_bridge_put()
ignores NULL, which covers boards without a bridge on port 1.

Fixes: 2db0d298f22d ("drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20260716132919.A3EA81F000E9@smtp.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_DRM_EXYNOS=m, CONFIG_DRM_EXYNOS_HDMI=y, CONFIG_DRM_EXYNOS_MIXER=y, CONFIG_COMPILE_TEST=y; baseline and patched exynos_hdmi.o, no new warnings.
No hardware or runtime test was performed.
The path needs a bridge on HDMI port 1 and a later probe failure or deferral, e.g. a DDC adapter or PHY that is not ready yet.

 drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d67a493c8fe4..cf570be8fdc3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1997,12 +1997,12 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdata->regs)) {
 		ret = PTR_ERR(hdata->regs);
-		return ret;
+		goto err_bridge;
 	}
 
 	ret = hdmi_get_ddc_adapter(hdata);
 	if (ret)
-		return ret;
+		goto err_bridge;
 
 	ret = hdmi_get_phy_io(hdata);
 	if (ret)
@@ -2079,6 +2079,8 @@ static int hdmi_probe(struct platform_device *pdev)
 		iounmap(hdata->regs_hdmiphy);
 err_ddc:
 	i2c_put_adapter(hdata->ddc_adpt);
+err_bridge:
+	drm_bridge_put(hdata->bridge);
 
 	return ret;
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
