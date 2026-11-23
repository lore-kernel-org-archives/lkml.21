Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447299;
	b=IZX17gQVBW1MK1qoebW23BkczG47a+D9C3YxouvRUpOGx9Rv6QbfjNnXiaxhb9p5KeMM
	 gJ2GUddfSV/Jsw7BUxxt4bwsRWbSRjvmrd0+1rLIivk2ghpJ89Jn30IZSHAI3OyKP2pjU
	 WN7LhK5mR9GHv//QLALkJZT4ZNYK/dPi1SApgcf4q4KmDtECPMZGHj0Q9clcMzGMjcaKW
	 D5y1EJj3mJEdgFfVqqCVpODCITnUTyNcdrF3YHzWGEgSuhvavJ5sZkMaVk6Jo8yDUZkPo
	 XtpS6DemcX4vkvMbmIGyXzyMs+r3cHLgP8Gl1RttPSFPjQCdbibRldCTaD3+JsALFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
	b=Dhp4qKopWqeenkExm/1k2xDI3WKg8x9YhuyIP4wvo5819lN2jctjMdKY9NXY7oyMtMrv
	 FWrPlHmHPJP26+r/edFpbHjhaC2235jm5thd6d0HxpladhBPqFP07G4fJkHJprtw/0EEk
	 o13uVqQ72K2uxyaPSfwXRWmPZf2myrz+eTsTluvCN96Ph7Tm7pvzmzzgoMDvKbikoup6M
	 UCMvfyFeo9bjvuscD7meIpoCCR3c/3M205IpLJTk5yQL1UwBoGO5tFJHI/OR/sMqUYe16
	 jK5sxiuemwcLUBu3TxPvTJD7MYbHuGkJH/aa5GBc7Pd2MJP93fkfQ26DRYdKkUxHydQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CS02sU2T;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E5606A6B8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118E5606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CS02sU2T
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so31494995e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=CS02sU2T48ouIFEjHaR+piUhoPocCqtgzhnP7+Rn3Zeis3+2Np/FzAal1oPnvHoL/I
         /2rloZ/C9sR2G8k8tpRsjryOimYjiD48RS9InlSalSYXwoEkj7Zhq2giNRs05gX7e+U7
         +4oerdbLK1kgpv63JcaPwUFvYGPD0lvy8/HQ6ikdvcwdYqaFmhdBtTkyVWk0JY811gkz
         Nm/VsM0GxnqJkl2ywyXoZJJu4dh9ERVTZo/f/KCxZ6DeoY8ZkLKYuze2GDrPT6r5n4Yu
         ezJs/B8S1TeMj0xJ9taRfOA727n4fkw5NiKi90ZaySsTdAHZ6yXiBwdsPicqhmnhnQNe
         a4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=PtjBrGV7JLuF/eYzD2sPvyMg2dYaUizsACYxbNDUbIWkp2LXq9+rpPCr+O/81nEcSm
         hDmrf+A80Xp/ax8Jv8CQy/hTdxRgyE+Prl2FrLK43yhZBbHh2prebF4/dCfQturdU+sP
         nKCIIN4o0Ikd4iUfqwpi0oo2bGyyLWBjW5mms6QgiksGAh9dEGwuGFqu+iNAgVIrcj51
         Zr4PJTNA6ZomybE+9AG0hOcfzN76pbyR1t0b7UTgQwh4gBosscKr4pNShZmOi1J8IXlh
         XPrWL9f4T9ec2WVBqB/YTlPR+8YPZ/PRKmCFH8znbK8HlkPlUXPG79r3qnY+KO8ic8jI
         I3Uw==
X-Forwarded-Encrypted: i=1; AL+hErGqBvh8CEVGRx3p8DTIYHG6b6E+K+KlWsgADAltLVZFFP+/a7cWDntbXT69f862xn/c3cX/cyvfDAdyNwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zsmv2XlgUmbaCB6cjoff1Gl2W0louPDHcixhcNtax2Rdx1EWY
	ZN2fjc3uqygWSw8TVu/XSWKlScrW+9j5rKJisH4UEyV8/1PsK/QVAFB2UJW4kU/poUo=
X-Gm-Gg: AZFdTZeDdLj+FlWOBNA6V7auQRDn04rx3NixlPVUk85GneJw8cUsB7FfRtIK9UQ0z2m
	BzJF9VbI4rKQy4lXvvTkH2uQ6Z607uuCZKaXgr2WKTF2F6BegbwXalDa8mhr+pGSmylzf0RNI12
	eGRRbi0stOQi5g62XTSqSDTr/AXZbAF8bfzvMYa/SZY+We04ZlBY6R5CMYYcO99EjyWxuTYk4Q3
	YYn3GhB1W7/HVnC/9OH30Hrm8cgbLyQRb2WzZPD+jbMa8+XQki/IiBOE/TEr0huMzjy3K35nw8g
	hksyDKFDcjvRjgIeXffSP1PZ7O6cIE6rQr0PYlNeHgMZYM1otNqC7dXWkY/ueOnvNdWV6SviFxI
	o8nHQ3G2a0obqFYrjOev1aKhJoMkT/ZyRQaHoylraAuXI9f//8o84+rwVIt5jlbwkX3yNz7CJDP
	kTQ6Eor8g+Q2dYsdqD0T0vbdb+LtEvvCxaVy3fCnx5PI/OL7NJinob1SgypgXg7XU0mA9F4QxVN
	0+gyftJCvZDEWVHJNYJqZplh9MQVAy+KrtWYuvYJkT6RgfRv4I2g/ZAMxcJgEGlFKxUhCT3x/jy
	u4NtCyPt1Z86o0XVhEsfrD27ZFV8B06ndZyk0rkeJbynJOpRf/s=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr226405515e9.11.1795447297388;
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm666128495e9.4.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:29 +0100
Subject: [PATCH v3 07/10] pinctrl: scmi: mark the GPIO functions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-7-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index dc3282126d54..3965f920851b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -485,8 +486,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.1

