Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648894;
	b=M9dWcvwLyKE1lTQvz4GIXd1ZwntAboRJFV1ecQhDsMmPxE2m6tmUCravZi7e0hfZImY0
	 QqgmTGksxtX33nuIFYR8mXayWDG1dtjfCuMpV6B9WMfPfCIw5PlMfml5DL/ngKD1D8UMJ
	 4Unej+8o9356YVrr8ktYpeF6AVC3swpzNm6zaXWS3AcS1FHI1ON42HW0xncnErri08sWt
	 IbkhX5bOlrM/1mbv/BNa9WjoH5idhbEv0c08aV5axs/BcsLSFxZJltcUCOp/4PpJRupO9
	 dPwS9QeOSZKW1hPgzuoLI7ybQLioMOwytyzGyQrtCyoGKkdK1g2PvuUrToldNSr/BcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gj9qMSHT+Mx/LydFpV6qogu9dyCtEpqGaRibxJJdMRU=;
	b=v1Dk+uqIAeXaWpNQOCoa9qXbx6PajtlQpH+/vplJTYIYK7NsyJyzFSgDj6Shc7h7Snyl
	 3gX6YfZ1xnmGNKCeHoL5mf0oZE0usO/StYbc0cQFkgMzFkib8AGjUxrrfSZDkPlhqh3zv
	 n4CzAzpVT0FRigy8woLzcLqtZD1/z7j+74iislzn4PEb25tDneTfqjr6rWzJw2hxX/rC5
	 j3xsPVR+3mTA5lCgMTkmJ7GDPnenaf4rAUMwODt63Q6fLxzb7jdTEdWznrsKx4bUoV4mu
	 0U4s6IZmo8HJLzncx4kbATIz9hVcqNlz0nADHH3tp772oV7C/zwgYEPAblh4av0cW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hd+TBogV;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EE606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999EE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hd+TBogV
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso2626922b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648893; x=1796253693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gj9qMSHT+Mx/LydFpV6qogu9dyCtEpqGaRibxJJdMRU=;
        b=Hd+TBogVQCZQ0QxyAJE9K3LubfJJ8SKyDOF6Pb7z/3tawizgA103BN7DnTi2QHz3GN
         rbFrADJ5Q/5sTmKUA7O+LrcdY85+at4ht1qDUiGtjdBrTTZm0I8Ity3HPHCdseV4dqvP
         ATMQiPrAfaWnkyQDhXSgBPJtwIAB/yOie8PGcPYyz3UWhuTL/fblj2bvrquqshtnyoz4
         7G6nBGltJcJWOMyWkm+fNy+3KwCj8y1Fa7IrwuR05Y9vsNkY67UM4sosD9uJbhtFtXwa
         8lsMha1upkbl4V5irEARJWX+oSUYkbjCC/W8bsaSYh7WJlTtPor9YUnCAcA8GdFzonDW
         c1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648893; x=1796253693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gj9qMSHT+Mx/LydFpV6qogu9dyCtEpqGaRibxJJdMRU=;
        b=xObXkmpYbby8KqcwTSXzieu6lxHQAwGKYjcoU3SZQo1eHD5RXItzwQaBp5kb6GIvof
         09+tQEhHoElBNHtBZ6h6+xUSpzHPP84TkraIbG8D8weJjKbg8EK5k2Dux354rTv9EDVU
         U9FBq6VvOBGKS66WXY21Wk0OVm8gGzyQvDZFI43wMjzRBPM6qRDyHEjPQxFAzcVPPSXf
         SDxf1vV29vTmsJMCEzpMDPj7mduHUBIjKjrvdPRuBPfAngbrfLetuk50TyN50afT5fW9
         6J4V7cA6dLQbPCcgyczGO3a1RbY0fOShmUWC0nyaoOrazQGD2SJSW+gt3maH6k3B279V
         5nXA==
X-Forwarded-Encrypted: i=1; AL+hErGo7Apta6pwOnkvkhwzEFw2kxhpRQI7AtjkxEPdjOR8QkfvpB9YWksTQCcUKKcFmxno6CYBOxnzx5++tKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kZpnRgyPXCP1spUyV1OhLbITiJRrHSihNV/lzzW3k6itND5r4
	4PNLxlw8qdgC9iX5WDEgNY7MKdRER9j3RutKUnIIHwTRCyIBNCUus85V
X-Gm-Gg: AZFdTZd2Sif8jKOuagN98bySBwX88anBEGylurbuwxU+aR9tfSy03RLHxvFRY54DPXl
	yNBr7mauH1As0Ecr8OuCyz5ip6X+Y+2kT2zOEM3k3cvpB2CGVUuVOhGy86ebrVASWXipL+ncYLj
	wlYA+MvgqUNDm0iVlJRr+FuqTJaGHs4FpW4FU1xxkURW0eyGzYRea4steubQS0MUFkK6yAZYO0f
	5LHQiGRb3dJ9ikqw/gJXKOREp4rudsOOMEzXLyxQPFkLRQlDibULo+rk8ormSmBCGU1g5cz2Nc7
	Lxwi85tKEOc+pEvmhlAXuzfgVJvcsbgQVhkoqVKyglrspPSa38C073FhUyVhVztY5p9Hqe3K5KH
	uP3893xPGlOQhYe9LgFWsKM8kPTIowC3xaiKFWJ8geyjEmOX7/RsVwCxXY2zbezzTFIA2grp5IA
	0wOTru4LPKsZ1h82/IrKkrrFGZe5DpsySNgVSWnaC87YcOknXmBjQ3K9y/OLq92Um+pW+43Vnjm
	jNWn5bQ0q9JEc0lV+1lcc3jiiHfwNXJtgO2ozlM3yuGJ9aqZzLrSrxOA/d36VKp+tGKLO8aHm7Y
	pP+Ccl63W4aw4aLq93AOLPYA/+MQi7EHV41bxmAEMFLvAujDkPTjdr0h83Ama9EMXR5WvsAFjr0
	REnD1zvgUPbtdCwqTWd+k6s5YQRXUz1CiFD4wdbaqSlN5EszKaK+zGMFf2sx/Y40aXuxw0fDsy3
	H1nI1ep8FJYs4NcEYqDyN5yYc=
X-Received: by 2002:aa7:88d4:0:b0:898:22b4:c8c8 with SMTP id d2e1a72fcca58-8c8794b8edemr17587263b3a.2.1795648892877;
        Wed, 25 Nov 2026 15:21:32 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Wed, 25 Nov 2026 15:21:08 -0800
Message-ID: <78b2d044b90dfae5dca66c5eed5cbdfeccc1f4e1.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795648586.git.rosenp@gmail.com>
References: <cover.1795648586.git.rosenp@gmail.com>
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

kbd_init_info() ignores the return value of kbd_get_state(). If the
call fails, the uninitialized state on the stack is used to set
kbd_previous_level and kbd_previous_mode_bit, which are later sent to
the BIOS when triggers are enabled or the backlight is turned back on.

kbd_get_info() has already succeeded at that point, so a failure here
may well be transient and is not a reason to give up on the keyboard
backlight. Start from level 0 and the off mode instead: the code below
then picks level 1 and the first supported mode, as it already does
when the backlight is off at boot.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v3: unchanged
v2: fall back to level 0 / off mode instead of returning the error

 drivers/platform/x86/dell/dell-laptop.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index c1a51bf95c25..eca348497ac3 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -1455,7 +1455,7 @@ static inline int kbd_init_info(void)
 	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
 		kbd_timeout_ac_supported = true;
 
-	kbd_get_state(&state);
+	ret = kbd_get_state(&state);
 
 	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
 	if (kbd_info.seconds > 63)
@@ -1472,8 +1472,13 @@ static inline int kbd_init_info(void)
 	 */
 	kbd_info.modes &= ~BIT(KBD_MODE_BIT_ON);
 
-	kbd_previous_level = kbd_get_level(&state);
-	kbd_previous_mode_bit = state.mode_bit;
+	if (ret == 0) {
+		kbd_previous_level = kbd_get_level(&state);
+		kbd_previous_mode_bit = state.mode_bit;
+	} else {
+		kbd_previous_level = 0;
+		kbd_previous_mode_bit = KBD_MODE_BIT_OFF;
+	}
 
 	if (kbd_previous_level == 0 && kbd_get_max_level() != 0)
 		kbd_previous_level = 1;
-- 
2.56.1

