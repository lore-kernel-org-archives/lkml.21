Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447992;
	b=vsK6CnmaVzoHE8oXtwCwj7jsYQgQZM681oIRnIlw9K5lhxk4Lua5oekRn1cQ8MgQ85n2
	 7xO6Y/OF7Jq0JydG5yaKHOnEdYw5dZVnWETnbQVw3dTq3x898R6ec+jlQDZ/2b/KSV4dW
	 /9nEFIjZoAMCFDB98hI2qMZZV3edwBi4XsXTWA7Bac3cTBgpMO/nzNl5nIa144WtsiU9O
	 wScmbS25prIEPXWpisiN8zF1LyqFk2pVOPKKTh014YykXDs1i3JfbS2Lax17a7TK35TVL
	 5Aza8NHKBReiWM3RwSDilzva4J46KNlQ6Y/dlvPmEXwY3bvVG+7s0HQXi4yebla9Y1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ipIK7sVjw5HFO+rITfLdlmyImTHYjd1/xZQ8o7M7p5g=;
	b=4H/5tMY3xU/cX7psUztaV9tf5HhZmpWHHHAuTW9RKPnpGAOsLz5H8O0t1LUCJV+ywN7t
	 +0nj6ep8FnuTf2hU16dLHlK8yTR1tFq0exTrjP0Dy6bZlKsGpkoVVBlEk0s1ZrwYrkyRR
	 hdAcO/ByKOWRxAJHPJ/Ta/cR5ehc208P+Kh/IIA6nGAEmqyJZcuhS9J9ZSqg3/itJzuUr
	 JDvUxUImvF8XtLb3fmTWhcG5ELGr9EhMU5+kWFN24n5z21AWZUgtSUwApyOtyK8sqllzY
	 2aQ3miHeWcpi0lWXX6lJHmHmQPGLhG3KiwO+QXY3IWt3fXEiT57+PqObU1/8LsJ+Bzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXtVyhUO;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB2A606A6A6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB2A606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXtVyhUO
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so4724004c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447991; x=1796052791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipIK7sVjw5HFO+rITfLdlmyImTHYjd1/xZQ8o7M7p5g=;
        b=RXtVyhUOdOo9t65ynoQFDJgTSUThZ5zeGSC5PI/g5g+aRMOLtSX1WpNLxOMyvkmAD3
         ZkM2iTmg9jY3Ug5GT6BYez4T5UKvRnIQXm5fQ+gZIRbm6ZtLtzRW3WLBabv39PnmJ3rt
         CTaXr2QIykD3A7e/VoifJgbVOn0ENaFSMa6SIsBGE/kNUpq6O0Kk0XySAbGhehQCQfRL
         VsIjfd/1PQ3MCbGcDNV/n/Em9TsPTEnQY1C7nbCMhTj1k24W+PVKNyZaxjIOVPWl++ew
         jjetNn5/3Is8ByxMJOX1jEuRET8QypyVoBGWgdC1Wv20hPX9WdbmASP9c6Aik7/eJMIG
         guTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447991; x=1796052791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipIK7sVjw5HFO+rITfLdlmyImTHYjd1/xZQ8o7M7p5g=;
        b=FjMm7B3ZTaC/AXUPatU7pb+Oj90omsE01HftdOEyj9XLwbyd38j57gxajeUeQtMdtp
         TRaTkV8Y5FRyTfrwMbanwQJrthrS6zmxvsvj+fXw5uEvuVppUBNXFNzRBdqjxqoqW8d4
         pXxb8e59Mch3KJqIi95UMxy6QQNoTsZMfhXW+hqqvbnJy7HG7TfkruHuLRrCT/OAO/sd
         K9V6g2OVyMFLuCjvfAYMTYKUMYViBgYFPd2PW/Rf1/ryiwTHvS/R/HWUAHwpL9yOuVtH
         sAEuwqMSK1rPS8Jon7DCtfmqfPtQC9X6JoCWmo67zH5xAUo2qS8NJ2GUK//y5IWUCSNz
         kDTw==
X-Gm-Message-State: APuU4Z8AMorHU0OvnptLtTv2L0PYUa8IoK+3GcIeCzWy0I6SDZhUtNFO
	ZfALM/F8bbgvjEalVW9Lw8yXA7vswQY7jB8mFfVOVdelA2MvaVRoIovZhPrYVw==
X-Gm-Gg: AZFdTZd1mO3bITTstupIdHYHbVMuTMV+ILxqs+n6l6WbdMTa3QtGRL5D2pY2w02S9IB
	xYPFmy/wQ4VmldIwjKmGuCaBYIl7zN+IaYFgwIKttHjptkTR8fK0AyXaaV7islgWteqfRdkVNPW
	ds5wG/F5OpylxljIKquNU52Npn9nKysjgCxExt8gKP7x01+DUlfHifoGDEQ9jO9LxqlJxYI1XBZ
	Wex9in58ECnqxcYdJe7ieYfWqmHVC+1H0V6h4ZCfUmFT+czBZQQ102gzmz3RGXAvfxXnHS50krL
	num5OOJz5/eRqbcd18+Kk9FmtGaapVR4iHEc6Gm8dovpjTvVDFpdZY+gJI8QIgP6qKvZCndkd8O
	PJ28Trt85Zyor6fYn7DQph6OLgMeDeGDdQvBJCWjMcVn3d4qAb2Jq/gBJaD/Gq2dKkigR3yJ4VU
	k/KX79Q8Frw2tlLEkzJOtOohnr+FfgjdA4Mx5tnLGFPSx6GJlkOTCibsAnvKsPeC5rLFC8/EbfG
	krqIF2DOetmeSwxYOlnYagrH2m23MG+unHVI3k6EwlroMafJLo4EDBH7V+cB9n4k/rYKzAfHok1
	n2VxHq25LO1JT+p70xBXvVHuVKSxJHpDHXMyRF7C0tvrd/MksygnTg==
X-Received: by 2002:a05:701b:4308:b0:165:aced:1fde with SMTP id a92af1059eb24-1b56f87a910mr4332174c88.0.1795447990101;
        Mon, 23 Nov 2026 07:33:10 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:122d:3887:9ee5:1e78:760d:3a39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34587395eec.16.2026.11.23.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:09 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/2] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Mon, 23 Nov 2026 20:59:16 +0530
Message-ID: <20261123152917.14260-2-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123152917.14260-1-nonameblank007@gmail.com>
References: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
 <20261123152917.14260-1-nonameblank007@gmail.com>
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

Currently Victus 15-fb0xxx (8A3D) takes victus_s_thermal_params,
which causes it to register as incorrect EC layout while cold boot.

- On other hand windows Omen Gaming Hub registers EC offset as 0x95,
- which is set in driver as HP_OMEN_EC_THERMAL_PROFILE_OFFSET.
- So, address it by adding victus_s_ec_thermal_params.

- Also perfcontrol modes as performance (0x1), default (0x0), quiet
(0x3) registers. So, add support for quiet mode.

Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af86800e..0166b9cc4d9e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -125,6 +125,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_ec_thermal_params = {
+	.performance	= HP_VICTUS_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_THERMAL_PROFILE_QUIET,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -168,6 +175,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_ec_board_params = {
+	.thermal_profile	= &victus_s_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -251,7 +263,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
@@ -2395,10 +2407,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * but logically it should have tp == 0x30 || tp == 0x31, as
 	 * corrected by the Omen Gaming Hub on windows. Hence accept both
 	 * of these values.
+	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
+	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == victus_s_ec_thermal_params.low_power) {
+		*profile = PLATFORM_PROFILE_LOW_POWER;
 	} else if (tp == victus_s_thermal_params.balanced ||
 		   tp == omen_v1_thermal_params.balanced) {
 		/*
-- 
2.55.0

