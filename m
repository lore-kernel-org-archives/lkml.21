Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852358;
	b=GFwVsMIJ31X6EaZN5iRhXaCtmcDnTdufHgxZC6r4jBZJtGx3W7grmYOP7899lniTkRIK
	 VqyZQhm2vsm7ytI51/wB5KcVUn0PDcYquX0eDcl6aL+EbfIiEJDy8osQGs/ezwoRzJFvG
	 6AaxOyMQgHh+Ncv+UFBtHE8Wk9m084CXPWPQi61g5IjeVLfHYDd+ECjMOD7YNG+Vro/HL
	 RZ3ceGWcGGA6+tzScf2LRriDP1qXP7P+FepZA+3GBUJ97nA7IEmry6bOSoxY8qBjB24v8
	 E/HbGggghA1lVBtv1uksP3P9hc+LMmazcPDpfj1NswMBHg+QkS2I8JTbnt7Y4Zp6ToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZPuz0aqvMOYLLk2Z9FL7zt4DuCqrFJ7GN1kkziqWaY8=;
	b=lPphRH88kDALsFijt1s2YCAomubWhyHhbo5pCvAbezEcvhw5rm7FNly+9cfT6SZ+LYAi
	 5vnCW0YdxOUYQjCLn9druaNBYnjYDXypUBxoqxiflsiTeLWBfBmorUW0iVtmNLqKB4azg
	 G2WpTJwstf5xmtEzmnEiV+SzVfjPer6Lm1LLvWXXRpDl8ynpWy6UVqYDw4ElFbvVOXkT3
	 L0oaUTSKttl3xObutn+B8snfZbnC/h0JS5oJzOYKN4biZQr/0M/w/ZtP6sOYMq2Dfm7FX
	 zN3aPpuJ6d6N0K7R50aepWUhrBHoC/H8ucGzYZNyYOEJWxyb8NnsOWpfRW0qQDfY6Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BbyezwKj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE7606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BbyezwKj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so5573632f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852356; x=1796457156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPuz0aqvMOYLLk2Z9FL7zt4DuCqrFJ7GN1kkziqWaY8=;
        b=BbyezwKjKHetbW0yBPvFepOzP6bRLylD0c8hEytcXsT7aDXr4hsXJ5qz+slXLtNaCh
         jas3uiMCeNQx/f82HM2LwjLcL8KOWoBL0MhxrH7b/hVRK+tzcn8cF0pLSDSpSMr70lke
         NsTuUOAGpfSkM/osGxk7ldgXq/uFjLPPU6W6+SaPcRnRvoCQ8tY2z4KkjYDb8i/ha1q2
         bRIO03gnb/DBJ+REmac3oQ7+qDxmiB3HxOPPczqKvml/EWrvXpruSdQn0bxnOnRoBFK8
         dQpi1sKfYWvA7ovl70n1AS9MlWiqh3mIiZO3bhItwH0bJB8UVqus/t9AXjxlVwiQ/73a
         xodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852356; x=1796457156;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPuz0aqvMOYLLk2Z9FL7zt4DuCqrFJ7GN1kkziqWaY8=;
        b=sC+GILiySPnEfPqKJZw/NYNRLmlPKPg/tqR6fMAEYtWYZszDhjRiQMbCozHL37GLW4
         CIZjBkbabmKmi2PTyKbFLolh/3lFbNoYSCMBrkJppATVICpWu8xnC4S9bg9ZSAYEAwCk
         g/zoG7H66DIUVzWnfOL3Kt55Wu6rtkPGTq+QoKREON8lWxqa8V0WMMRHsn91g0bv+mgg
         lPLh7wSHHXhmHR/03OX19PLHgRf1tm09WlcTpLqcF/XxVVPLaXnfheY8El3kTZbjn3JG
         36uZnW8sVQZ1aA6s4n7pDy7sd7FK303Ij4tEMe3y6fOd06CHqwQIluQ28uyYw6yu8AJb
         FfVg==
X-Forwarded-Encrypted: i=1; AL+hErFLR0pW8UvJPFfsyodQl/8mIYvTy+QPT0koJ/1x4rBXdaK5TIdFOoHY3cQfSyk6yd6Cch9E5oVFb4nxoyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M7ylG2cf8o5vJ/6MuRHC8j5Sc6/CWMGLYqpELyHekgY2IFHZk
	aqnPz6GChnFRstPTO7H5mJI1Vy5VWaarwpYwKzM6T4EPOkw/H/Ka5qqg
X-Gm-Gg: AZFdTZd9bfa8BTzx/imp9ZLdV4NVpEKujPkSmsDUphCpn9JxNWKO3fMF9t1+7MnowMp
	1MShmXUH/qMby4MNVSzSjVp4XjGpSoODYBUQ23+pJxySakQBdhrdMxawUwrF0LwhciEQ+Z3Zrca
	AGPOjoxtoa4xUslH7aFkpQPjFC12Pev6kwtKkN6EPtwEiozpM609AD7ddbLW9eMl5ti7/MWA/OE
	Hk0TNIklri+n4BoTGJp26Nt+vGG8YEzYfDQZQ+GvNdbORJ/EKxaGKGX2qefvh6BLoAf6CUsKJWY
	X3eXLVwQnHp7FpDoBYLNLMfqIyCX5nUFfSN0r5t7bHqJbRoz5n5C0VJ2buLmvuOBV1fdx60lrwk
	qYPPN2pvEXcU9CorfIJa9pmF4kQKw6RGPX49ixpvTYRpNsWrS7TaoA0OMfbzqQRjgSjemIkvLkW
	ige0tb0RVuBBADwOpktekFYAshbTIp8meLbdEupmQVAf9e1O7LDyC1GchUyo7y9jR8xB87SJgYD
	eTvhRHOv1h4A40vFBqY8AhfzxSZXZLAuTWJZfDlMmCJ3gUBugxAgjv131WRQFZUI7m6OwjLdHwQ
	CYzMCplr+7XWeIzwZpA5tnIy2UFMHM1xyU/Kq3ZZiljC0E5qTenvDohel0vxMM2AGNbHGEPVGBk
	bpuxCmgc/djUR
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr559271445e9.0.1795852355939;
        Fri, 27 Nov 2026 23:52:35 -0800 (PST)
Received: from wlqmpek ([109.245.169.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm538208405e9.4.2026.11.27.23.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:52:35 -0800 (PST)
From: =?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	uselessfire@gmail.com,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Redmi Book Pro 14 2024
Date: Sat, 28 Nov 2026 08:49:12 +0100
Message-ID: <20261128074912.20008-1-vlku.milos.fun@gmail.com>
X-Mailer: git-send-email 2.56.1
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
Content-Transfer-Encoding: 8bit

The Redmi Book Pro 14 2024 (board TM2307) uses the same WMAA method
(SSDT with OEM Table ID XMCC1806) as the Redmi Book Pro 16 2024 (TM2309)
and stores the WMI_FN_SYSTEM_PER_MODE value directly in the EC register
QFAN. NTDP in the DSDT maps it onto the DPTF variable ODV1:

  QFAN  mode        ODV1
  1     balanced    0
  2     quiet       2
  3     Turbo       1
  4     full speed  4

Map these as low-power 2, balanced 1, performance 3 and max-power 4.
Fn+K only cycles 1 -> 3 -> 2 and never offers full speed, and
power-profiles-daemon maps its "performance" profile to platform_profile
"performance", so full speed is exposed as max-power and is only used
when chosen explicitly.

GET returns QFAN for 1..4 and 0 for anything else, for example a 0 left
by the default mapping, so read 0 back as balanced. Writing 0 is not
useful: from the same 80 C start at the same power, the package cooled
by 15.2 C in 150 s at QFAN 0 against 29.5 C at QFAN 1 (n=4 each, no
overlap).

The firmware also accepts Turbo on battery (QFAN 3 sticks with no
charger connected), so add a battery entry for it. WMI_FN_SYSTEM_AC_TYPE
is not implemented on this firmware, so skip the AC type check as for
the other Xiaomi models.

Values measured on BIOS RMAMT4B0P0B0B (bios_release and
ec_firmware_release 1.11).

This change was prepared with an AI coding assistant (Claude, by
Anthropic), which read the ACPI tables and driver code and drafted the
patch. The values and behaviour were measured on the hardware by the
submitter.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Miloš Vlku <vlku.milos.fun@gmail.com>
---

Notes:
    Tested on the TM2307 on top of pdx86 for-next (61c0dac952b9), built for
    7.3.6 for the hardware test: all four profiles apply and read back as
    expected on AC and on battery, a stale QFAN of 0 reads back as balanced,
    and power-profiles-daemon's power-saver/balanced/performance map to
    QFAN 2/1/3. Builds cleanly in-tree with W=1.
    
    Anton: when we compared tables in October, the TM2309 matched these on
    every point, so the same entry should fit with a second DMI match on
    board_name TM2309. Happy to add it here if you can test it, or for you
    to send it on top.

 drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index f71c93aff..9bf705d4e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -139,6 +139,22 @@ static const struct bitland_mifs_quirks tm2135_quirks = {
 	.skip_ac_type_check = true,
 };
 
+/* GET reports 0 for an out-of-range QFAN value; treat it as balanced. */
+static const struct bitland_profile_entry tm2307_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,	0x02 },
+	{ PLATFORM_PROFILE_BALANCED,	0x01 },
+	{ PLATFORM_PROFILE_BALANCED,	0x00, .no_set = true },
+	{ PLATFORM_PROFILE_PERFORMANCE,	0x03 },
+	{ PLATFORM_PROFILE_PERFORMANCE,	0x03, .battery = true },
+	{ PLATFORM_PROFILE_MAX_POWER,	0x04 },
+};
+
+static const struct bitland_mifs_quirks tm2307_quirks = {
+	.profile_entries = tm2307_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2307_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct bitland_profile_entry tm2424_profile_entries[] = {
 	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
 	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
@@ -169,6 +185,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
 		},
 		.driver_data = (void *)&tm2135_quirks,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2307"),
+		},
+		.driver_data = (void *)&tm2307_quirks,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
-- 
2.56.1

