Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105486;
	b=wpqofoUlyyBR07y78T/dilR3FPeovM3djaWVdHwjKRbzsFz8za6s6IR5gOOV4zrcHrF1
	 StNxQ2ZEeGREe3avhSG6IGfgfeNtBm6PMyRb3KrSja3lkWU6XDi0kFwd8cVwQZfZxbEP8
	 WOADzoMhrE05OTakkAmmtn2D0/QEbUC1lHID7+qf0X4YzTj4Rh3Nsij9KmqQOnVD9LEGR
	 tAw5Fpe05wgcQtQ1m1grNJYPNuf0oeLGk4yS9ZLo7LLBMg4jlAKkh/XC+r7CnVW20pTrr
	 euiVDTZGzi5VmhRsq7vyPRzM6t6nG/RUyoXq+hTiXtWp68tCIxPOpbBLw8iiakxDMsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zViofjQkPVVEUQkfBvPP0RNa3rX/Lm5exoQ3G0lbCX0=;
	b=bmrL9zHCONB3HqWd4o/gcxTBprUgQYFfhuWK35nY5XTWcJG+p+r/0AHWiTMj4IYHUNl0
	 EbsnyUCh8e7WQCBDbpdDLjxw6O66WzaKEihRFqdN05GwOtQHhHt3nHSY9ouwf5tDHOXgd
	 k5NNW4pBOX7c4merN1u3j0PD9R/iwP9EpQ7Kih1EqFuDrAWMjKk5Ok0zZqmnI0zXyxwSQ
	 u+aB4wIO7M/jFaOCclNQKn9fmfV00uFfNuHQgqYCV64y9oMn167hzXCsQ/aPGEY8qnwQj
	 G7QGi/kvhOajkMN7/R7r4YCESn3RJcTp2Ba4Brno87Kwz4A2rUbH3P7GJCrSaHg3i2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TyP1ii7E;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12A606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C12A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TyP1ii7E
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so3723524c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795105485; x=1795710285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zViofjQkPVVEUQkfBvPP0RNa3rX/Lm5exoQ3G0lbCX0=;
        b=TyP1ii7EHJBEUuA4KkzLpPvb20WvmY/UZdB0Gt4PutDmLyUAQzX/ddmxohNEpU00EW
         YVM2AOXDdU3mFrjmAVjZ1uatBmiXF+8uvcbzQ4DLDF+E0D53hWJ/8bRhlYfDzIdi+01h
         L1v8sK/SvSb/vTJ03onjGn6Uk8rD0a/h10wOIOoXkKDgh02LkGCvGt0Sp9GHqwxpOorG
         AVQt1Rw3m+UwDQ5yW//UBgiArGEQi7hGCRfY7KSSdpsdBzs02FsAALpejEAQpkzaKEDc
         O7SI9jR5/YuaRLy/OpYDaxflxneyIooexepUHOQ/AyCIj1qLJ167Hz7O4saRf1yTH1vv
         vGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105485; x=1795710285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zViofjQkPVVEUQkfBvPP0RNa3rX/Lm5exoQ3G0lbCX0=;
        b=gT5+njNY0rVv6Tec/NZqhWRG/35eGqYZs5+Am170QMf829NgXphI1DRI835AMkE/SJ
         aBJcAt60pw0wauN+pONqXMkawl24DOrv3A2SGBMub008WJc9aCIjF2XLBdEOoN/L7TMv
         O+8K8sHTCtYx59a/A8RVo/kJDONOjhvfLOHvycQHoByJ4dcxMa1ziC8qtGJUxfFNTwnv
         Au9ohl/6DHxIRgmHOfm+SS0T6v4SKBrvPiNbVJ5JAo+JB71ghxVdL2VmCWajrbZmWZDP
         6e6qFDVowJ7pcH6t7sKbwXNAA0rLNVza3kdt22gt+ILm6foY2xwiQgt5WvdvhCo/46ft
         qXMQ==
X-Forwarded-Encrypted: i=1; AL+hErG6x3CQhXhJyuaAejQVSpUr0ShGswQsAo/sn0XbjmC7BtFxMmcFm9gIchZod1M5q6BEHcvpaGsdUq+CDBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o0t/qSH4LnmmmRfIcxcojfG4JuhkuiMPJRqt62ULXQDINsh0Y
	Sju7ET2IpxWGEY6G+yv7MmBYY5zVk4oDjazmLITTA2UD7UcF2yM3vzX/
X-Gm-Gg: AYBFou1E3+gLHAL7H55JazeOBKhHeFvDoxatLVgzS+v0JSWPzsmjMJf/Q3qp9JDas+C
	4Lql9XZLFOIgt+J9b/Y+PdhXaY92GFbxJgjN9ueLgFuVVuT4c0IrvuqEeLAZD6Z+eNoB9yxmYAF
	8CA/5k8dHLffha2XBaKV9cJ8212cDk7b8IzIWE2zUHHMDCd4ZOjN1mbr2E30P/WhAGqR/KITPkc
	MHepblagj+0xUOkRMahtEhLSB5Pkkmk0UPUxWVek7fjCopTo58sfRWPdE0gxXesGmxLc47mXAt5
	rCxudhHZtTxo8Pap7RwnNZ6GvMvNmC7kDtg5QsV8y0ykrX9k35flMhozMPD6BZZ/e30n1Jl5wUE
	8polVpu5cIgdf2m7yiWYR3qzIRSwnP8/NADfqkoMA3yq2WapFhvlJUi8QZc+Hl0TxrA4kiJnkdR
	EVcmk6TT4In32Whv0bQT8vpFu4ol5jnu9pWxfXv2aGMCu3I44B0pWu8Upe0IYJSwth9Xmc2aVSg
	Ny87FHKxjncl3dH4uoG2eO1FjsUssLdAPZ9VxKvHjahAyL+LQOvidPRDbzy1TL0VEjD86sxNfax
	c0tN2aJoIgzqGWKFtxHYqL3u7SsfPB4JS9+ukZKWTRN7
X-Received: by 2002:a05:701a:cc88:10b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b55690cf1bmr152886c88.37.1795105484976;
        Thu, 19 Nov 2026 08:24:44 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm302840c88.8.2026.11.19.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:24:44 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Akash Sukhavasi <akash.sukhavasi@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH 2/3] drm/panel: kingdisplay-kd097d04: Use lowercase hex literals
Date: Thu, 19 Nov 2026 21:53:52 +0530
Message-Id: <20261119162353.12962-3-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119162353.12962-1-architmore303@gmail.com>
References: <20261119162353.12962-1-architmore303@gmail.com>
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

Convert hexadecimal literals in the KD097D04 initialization sequence
to lowercase.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Archit More <architmore303@gmail.com>
---
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 242 +++++++++---------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 6a3ecdcc1795..c801e94bc4d0 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -38,137 +38,137 @@ struct kingdisplay_panel_cmd {
  */
 static const struct kingdisplay_panel_cmd init_code[] = {
 	/* voltage setting */
-	{ 0xB0, 0x00 },
-	{ 0xB2, 0x02 },
-	{ 0xB3, 0x11 },
-	{ 0xB4, 0x00 },
-	{ 0xB6, 0x80 },
+	{ 0xb0, 0x00 },
+	{ 0xb2, 0x02 },
+	{ 0xb3, 0x11 },
+	{ 0xb4, 0x00 },
+	{ 0xb6, 0x80 },
 	/* VCOM disable */
-	{ 0xB7, 0x02 },
-	{ 0xB8, 0x80 },
-	{ 0xBA, 0x43 },
+	{ 0xb7, 0x02 },
+	{ 0xb8, 0x80 },
+	{ 0xba, 0x43 },
 	/* VCOM setting */
-	{ 0xBB, 0x53 },
+	{ 0xbb, 0x53 },
 	/* VSP setting */
-	{ 0xBC, 0x0A },
+	{ 0xbc, 0x0a },
 	/* VSN setting */
-	{ 0xBD, 0x4A },
+	{ 0xbd, 0x4a },
 	/* VGH setting */
-	{ 0xBE, 0x2F },
+	{ 0xbe, 0x2f },
 	/* VGL setting */
-	{ 0xBF, 0x1A },
-	{ 0xF0, 0x39 },
-	{ 0xF1, 0x22 },
+	{ 0xbf, 0x1a },
+	{ 0xf0, 0x39 },
+	{ 0xf1, 0x22 },
 	/* Gamma setting */
-	{ 0xB0, 0x02 },
-	{ 0xC0, 0x00 },
-	{ 0xC1, 0x01 },
-	{ 0xC2, 0x0B },
-	{ 0xC3, 0x15 },
-	{ 0xC4, 0x22 },
-	{ 0xC5, 0x11 },
-	{ 0xC6, 0x15 },
-	{ 0xC7, 0x19 },
-	{ 0xC8, 0x1A },
-	{ 0xC9, 0x16 },
-	{ 0xCA, 0x18 },
-	{ 0xCB, 0x13 },
-	{ 0xCC, 0x18 },
-	{ 0xCD, 0x13 },
-	{ 0xCE, 0x1C },
-	{ 0xCF, 0x19 },
-	{ 0xD0, 0x21 },
-	{ 0xD1, 0x2C },
-	{ 0xD2, 0x2F },
-	{ 0xD3, 0x30 },
-	{ 0xD4, 0x19 },
-	{ 0xD5, 0x1F },
-	{ 0xD6, 0x00 },
-	{ 0xD7, 0x01 },
-	{ 0xD8, 0x0B },
-	{ 0xD9, 0x15 },
-	{ 0xDA, 0x22 },
-	{ 0xDB, 0x11 },
-	{ 0xDC, 0x15 },
-	{ 0xDD, 0x19 },
-	{ 0xDE, 0x1A },
-	{ 0xDF, 0x16 },
-	{ 0xE0, 0x18 },
-	{ 0xE1, 0x13 },
-	{ 0xE2, 0x18 },
-	{ 0xE3, 0x13 },
-	{ 0xE4, 0x1C },
-	{ 0xE5, 0x19 },
-	{ 0xE6, 0x21 },
-	{ 0xE7, 0x2C },
-	{ 0xE8, 0x2F },
-	{ 0xE9, 0x30 },
-	{ 0xEA, 0x19 },
-	{ 0xEB, 0x1F },
+	{ 0xb0, 0x02 },
+	{ 0xc0, 0x00 },
+	{ 0xc1, 0x01 },
+	{ 0xc2, 0x0b },
+	{ 0xc3, 0x15 },
+	{ 0xc4, 0x22 },
+	{ 0xc5, 0x11 },
+	{ 0xc6, 0x15 },
+	{ 0xc7, 0x19 },
+	{ 0xc8, 0x1a },
+	{ 0xc9, 0x16 },
+	{ 0xca, 0x18 },
+	{ 0xcb, 0x13 },
+	{ 0xcc, 0x18 },
+	{ 0xcd, 0x13 },
+	{ 0xce, 0x1c },
+	{ 0xcf, 0x19 },
+	{ 0xd0, 0x21 },
+	{ 0xd1, 0x2c },
+	{ 0xd2, 0x2f },
+	{ 0xd3, 0x30 },
+	{ 0xd4, 0x19 },
+	{ 0xd5, 0x1f },
+	{ 0xd6, 0x00 },
+	{ 0xd7, 0x01 },
+	{ 0xd8, 0x0b },
+	{ 0xd9, 0x15 },
+	{ 0xda, 0x22 },
+	{ 0xdb, 0x11 },
+	{ 0xdc, 0x15 },
+	{ 0xdd, 0x19 },
+	{ 0xde, 0x1a },
+	{ 0xdf, 0x16 },
+	{ 0xe0, 0x18 },
+	{ 0xe1, 0x13 },
+	{ 0xe2, 0x18 },
+	{ 0xe3, 0x13 },
+	{ 0xe4, 0x1c },
+	{ 0xe5, 0x19 },
+	{ 0xe6, 0x21 },
+	{ 0xe7, 0x2c },
+	{ 0xe8, 0x2f },
+	{ 0xe9, 0x30 },
+	{ 0xea, 0x19 },
+	{ 0xeb, 0x1f },
 	/* GOA MUX setting */
-	{ 0xB0, 0x01 },
-	{ 0xC0, 0x10 },
-	{ 0xC1, 0x0F },
-	{ 0xC2, 0x0E },
-	{ 0xC3, 0x0D },
-	{ 0xC4, 0x0C },
-	{ 0xC5, 0x0B },
-	{ 0xC6, 0x0A },
-	{ 0xC7, 0x09 },
-	{ 0xC8, 0x08 },
-	{ 0xC9, 0x07 },
-	{ 0xCA, 0x06 },
-	{ 0xCB, 0x05 },
-	{ 0xCC, 0x00 },
-	{ 0xCD, 0x01 },
-	{ 0xCE, 0x02 },
-	{ 0xCF, 0x03 },
-	{ 0xD0, 0x04 },
-	{ 0xD6, 0x10 },
-	{ 0xD7, 0x0F },
-	{ 0xD8, 0x0E },
-	{ 0xD9, 0x0D },
-	{ 0xDA, 0x0C },
-	{ 0xDB, 0x0B },
-	{ 0xDC, 0x0A },
-	{ 0xDD, 0x09 },
-	{ 0xDE, 0x08 },
-	{ 0xDF, 0x07 },
-	{ 0xE0, 0x06 },
-	{ 0xE1, 0x05 },
-	{ 0xE2, 0x00 },
-	{ 0xE3, 0x01 },
-	{ 0xE4, 0x02 },
-	{ 0xE5, 0x03 },
-	{ 0xE6, 0x04 },
-	{ 0xE7, 0x00 },
-	{ 0xEC, 0xC0 },
+	{ 0xb0, 0x01 },
+	{ 0xc0, 0x10 },
+	{ 0xc1, 0x0f },
+	{ 0xc2, 0x0e },
+	{ 0xc3, 0x0d },
+	{ 0xc4, 0x0c },
+	{ 0xc5, 0x0b },
+	{ 0xc6, 0x0a },
+	{ 0xc7, 0x09 },
+	{ 0xc8, 0x08 },
+	{ 0xc9, 0x07 },
+	{ 0xca, 0x06 },
+	{ 0xcb, 0x05 },
+	{ 0xcc, 0x00 },
+	{ 0xcd, 0x01 },
+	{ 0xce, 0x02 },
+	{ 0xcf, 0x03 },
+	{ 0xd0, 0x04 },
+	{ 0xd6, 0x10 },
+	{ 0xd7, 0x0f },
+	{ 0xd8, 0x0e },
+	{ 0xd9, 0x0d },
+	{ 0xda, 0x0c },
+	{ 0xdb, 0x0b },
+	{ 0xdc, 0x0a },
+	{ 0xdd, 0x09 },
+	{ 0xde, 0x08 },
+	{ 0xdf, 0x07 },
+	{ 0xe0, 0x06 },
+	{ 0xe1, 0x05 },
+	{ 0xe2, 0x00 },
+	{ 0xe3, 0x01 },
+	{ 0xe4, 0x02 },
+	{ 0xe5, 0x03 },
+	{ 0xe6, 0x04 },
+	{ 0xe7, 0x00 },
+	{ 0xec, 0xc0 },
 	/* GOA timing setting */
-	{ 0xB0, 0x03 },
-	{ 0xC0, 0x01 },
-	{ 0xC2, 0x6F },
-	{ 0xC3, 0x6F },
-	{ 0xC5, 0x36 },
-	{ 0xC8, 0x08 },
-	{ 0xC9, 0x04 },
-	{ 0xCA, 0x41 },
-	{ 0xCC, 0x43 },
-	{ 0xCF, 0x60 },
-	{ 0xD2, 0x04 },
-	{ 0xD3, 0x04 },
-	{ 0xD4, 0x03 },
-	{ 0xD5, 0x02 },
-	{ 0xD6, 0x01 },
-	{ 0xD7, 0x00 },
-	{ 0xDB, 0x01 },
-	{ 0xDE, 0x36 },
-	{ 0xE6, 0x6F },
-	{ 0xE7, 0x6F },
+	{ 0xb0, 0x03 },
+	{ 0xc0, 0x01 },
+	{ 0xc2, 0x6f },
+	{ 0xc3, 0x6f },
+	{ 0xc5, 0x36 },
+	{ 0xc8, 0x08 },
+	{ 0xc9, 0x04 },
+	{ 0xca, 0x41 },
+	{ 0xcc, 0x43 },
+	{ 0xcf, 0x60 },
+	{ 0xd2, 0x04 },
+	{ 0xd3, 0x04 },
+	{ 0xd4, 0x03 },
+	{ 0xd5, 0x02 },
+	{ 0xd6, 0x01 },
+	{ 0xd7, 0x00 },
+	{ 0xdb, 0x01 },
+	{ 0xde, 0x36 },
+	{ 0xe6, 0x6f },
+	{ 0xe7, 0x6f },
 	/* GOE setting */
-	{ 0xB0, 0x06 },
-	{ 0xB8, 0xA5 },
-	{ 0xC0, 0xA5 },
-	{ 0xD5, 0x3F },
+	{ 0xb0, 0x06 },
+	{ 0xb8, 0xa5 },
+	{ 0xc0, 0xa5 },
+	{ 0xd5, 0x3f },
 };
 
 static inline
-- 
2.34.1

