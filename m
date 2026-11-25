Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583301;
	b=CNWPxqHIQG0PfXSiEgChOvKOKuMuqKVZ+Jn/uGxMVvWwDQkd6GkXtBpgv2QEgHJL8WTL
	 u892EC/eOOyDRIHiUgpo23yDwle0tCY5P3K2ebqBmLWZbChRrFRAbaV7a4ZwVcP3GvrLy
	 7h7W4RoncJ0/wnObsCgbtIqeceYv4VV/Dtp6uwx3TzdA7epHRNU3EZapbKKlDF6dp/HFE
	 Sw70xrMZa9DugkdJ5paGxJwZW0DiJQzJck1E38JCHkwCDPiXoDlIzMohaRPE8CPa9ZJwz
	 yMlzUT1sFVGS89RmwXev0nbtaOvWPP/+FCzz6elTrfZAz682JlwdSCPIFLVJivEPi+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2/c3IKzzHAgU514/BNkhisNgWo9Ok/mWBzvy9lacaKc=;
	b=VQMk1zb4M5SVVMJFFEU0VPJAzk0wy0LFBFBLunv/SbF+uvbANgW9Mx9TJai+F66kNYwS
	 GIElZkCgnLoh5VZoj0fOwVHfALBOIXc5QQFfzrgEIZOubGCFcHpXUmjhvrNCbUoi1lyHm
	 iqIM5gGCZUBDzVx2qBa9RQ5TZTT/QQ3RmcHn+I5vvTsI6UVV0E2Ic0BfufTWN5HU4FysX
	 agFbZEhFKo/a1USSvOAlg5GUNd5OoxDQESxH/kfHZ2PeWEQ5BHaHOTBV9VJpfvHR/Ey8t
	 P/1UCewctJdIDG5myWTLp6IF+GPzqv7EijdwsZJx0ryC3fD8i5gOCUWjbjtjy8oqLaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erJW7+sV;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A22606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erJW7+sV
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3869c1f4d19so1332991eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795583300; x=1796188100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/c3IKzzHAgU514/BNkhisNgWo9Ok/mWBzvy9lacaKc=;
        b=erJW7+sV9OG2wjbQVW+nkxcdIGBMgV1gRJfoeQ8/E6dFzxt3qwqYHE4un0liH8GQaO
         z2X0LF4SqbJZ3qj6srQkAMqAPPAg0wHkIdGWttrLY7HFNLk7jWdl4hX/s7MkDOByY/QK
         dl4oEFGtGffWAV7u4+iFNXcI7o7Iv3bhqjpjFE16ZaYhDJPFSD2RK/iUvl0zrmR9R96n
         FLPqBEIbgNbci8Aco16FpzpDvs+slb/B3khYH7hoyZpMMrO+0Mkbg127TQFsNeVUAgIS
         FYMP9JKD1rVkqB3Cwr+kBH0PRA77P1hyEQw/XA/j2KSaoBRSbrH3bOPXNEUaHGTl+cAx
         IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583300; x=1796188100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/c3IKzzHAgU514/BNkhisNgWo9Ok/mWBzvy9lacaKc=;
        b=J/x8fv4jlsCc+wMzfTkvvxLVYCVox/3nIKjrKvcPgFaMx06jS5CGVAInEkCKW9+5ix
         Vh7+HpObM8lBEoqm7pSo8SxCBUZzMwFeDtxCHvOjSHIq5XqIVYKn1juhJc/D9Gysc15F
         +DYuOJ+wR1C+7+S4oKaW5eo0Ls70nMSki1I331rD5kJYe0bIOdPzia7vXhsIBUkDNhYt
         Kn52LB87AzAelNuBWSM+2k0iYAJUwKXr94YBpt+VsVXimeAjDTfZ3hDr4/+D+LJZunjm
         EwXNbWNHOD/ppEVeLGXLLIM9AnhPcygQ3XuGGgUeDYBnloSdI7G9oNC7XGOhDtwcj1tR
         rVBA==
X-Forwarded-Encrypted: i=1; AL+hErGUyP3ww2hjcPIlfrt6D2Ft5s8vKeZFyR9/c9KZvZdAcSVCwcd6/gVzRi/zt4b+PrTld6UEEX3JYXuhn5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z++zJPZMSy8AQr+IhvkD8K6aHmPMZcDp+MGILGj81A/m3Qdp+sa
	KRrOX1Lw+EXwUotowia7NNHDJ5fM8F81DuYq/uN/scl+vXyuEXvfmEu4
X-Gm-Gg: AZFdTZc6h3wMzpCpaKLJosZQsn3utsUTL7VaVGqXtdCWNvUyH5vQVcJyHyYIm7EvlZy
	MGCXhsXP+Euy8Fj7xIDVdLxo97WC43csKoRDG0gGE6Qny48FB4TDayOeMEXHiYJRcpAh4GyKYN6
	Bg/Uodn02HeZ97DbwSMspQQiHyzu1u2shvxDAZTPHQHVd288UI+vUvYFBG0CpPJP6loUoXJKMRj
	2F0YEjc804lPpdpRlCVzHChPIbMRfg7LUUClRjakdZeTnHEeFNrCDIutHFsSA3vZukeub02uvOy
	N+Fn2uqEB1MdLIUgHh/uFAVZIAaUiLlFf6sNfOZbkO61P+ZWO60kH45jMfPoWpmWlRbfIOCtg9P
	gAuOZVZeoLKTK5MI0hM7uWRBpUlEAc60m3LCz+oJ6tMs0Rd98OsHDwsVBPJsW3KyJHtiv94rbAG
	szjBJmGvcJRX6EbjDdjXnLBpR0H2qB83elJF37aEM8BBg4GjCYBxKNAgLLDqgyh/5xiCpT5/ELK
	I2z5j6+fEoJ9kx3PmRWhxKdZZEn6NPyVejfOzWV247Ylk2OvL2+xtQrjHP2SfakNfsY+Jr4/6M2
	imb3JpGPLftLH4bmsAZYwwNLfsyRj3MzTjr17MhHNqJLBoP2sIo=
X-Received: by 2002:a05:7301:d81b:b0:386:3e56:d039 with SMTP id 5a478bee46e88-386b844ed9fmr6001412eec.9.1795583299525;
        Tue, 24 Nov 2026 21:08:19 -0800 (PST)
Received: from fedora ([38.207.189.59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm44303184eec.20.2026.11.24.21.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:08:18 -0800 (PST)
From: Astria Li <tianmutnt@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Astria Li <tianmutnt@gmail.com>
Subject: [PATCH] platform/x86: uniwill: Add MECHREVO Yilong15Pro Series GM5HG0A
Date: Wed, 25 Nov 2026 13:06:22 +0800
Message-ID: <20261125050622.19073-1-tianmutnt@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Add DMI match and device descriptor for the MECHREVO Yilong15Pro Series
GM5HG0A laptop.

Signed-off-by: Astria Li <tianmutnt@gmail.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7fb52b574..7a6e1450f 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2977,6 +2977,19 @@ static struct uniwill_device_descriptor gmxhgxx_descriptor __initdata = {
 	.kbd_led_max_brightness = 4,
 };
 
+static struct uniwill_device_descriptor gm5hg0a_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
 static struct uniwill_device_descriptor gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -3576,6 +3589,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &pfxnuxx_pfxluxx_phxprxx_descriptor,
 	},
+	{
+		.ident = "MECHREVO Yilong15Pro Series GM5HG0A",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5HG0A"),
+		},
+		.driver_data = &gm5hg0a_descriptor,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
-- 
2.55.0

