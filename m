Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245403;
	b=OoaYy3dY0kYlQUmID/6JfPx5iB2Su45+E+xwN7P3RdVbXT0fYBxUxM5IM8J2c0zq9tOw
	 Au9KygcdjjrBv5W4KBlifxDaYFjAl3v6O8wahwgNRPULTREvffszDMhN75m2zosq+++wi
	 kAkGQfKeTr2/pZ6mz46Bekw3gGSTgyjZnXpF3phM4B6DluQCCbifcGFEh+xBJwinmoeQB
	 enitfsFWY48Tf9ni7PjL7xDFAj1lg9FVMJKYHIYa9JeR4iSVE6GRQGo4wVkZ+YqSK1fhh
	 5g/o25R1f70d71rvWpN1uuHcRprONKNNSWxr9Kbc3kncU3DLdIDgWS1Z6t5VwEIp3RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lyjDt4srRQIFbPUU3r2/dQUczxyZaXszt6feOM3BE7c=;
	b=MiyOLvelYAGEtdL2HhvEekmDru1nju30/PObMphLi5MLCEgsOpzGZ7y6PBVwSk7vcsHB
	 vL6/kcgMmRjUtQAzlblTl92l2g4046oL1GPHdjEhSnkejLePbzIKzVSj4ffPnGOHE4XDO
	 ktvoR6W0SsYYN9jAVWBHa2ChSCasTP2RchtCVs+QEAyIVHV1WD0Dpx+YywKfRZlQ9kflW
	 hKDTP71WiFQwsd+cnJ/w7rMZcAnaL8jd61jhPA4Nr+SB3YJ/NN07zmX9+yMyUddNW72TJ
	 5dRHulhqH8gpaWDlbGXvAdPSl7Qu4waHn9VOIruGj81HhfR1NY/4TqYUPg7AmpSu8bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuGIDlqF;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F8606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86F8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuGIDlqF
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3ada81853so1861586c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245402; x=1795850202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyjDt4srRQIFbPUU3r2/dQUczxyZaXszt6feOM3BE7c=;
        b=MuGIDlqFUE3oyT3NnUxUSuOxFVENsYEzc6lYKiTO/Nu2f9HuGSlo7nfFbbjr1SHUCf
         OjD3fw2qlNsdWo/R848jLDEN57M/AG6VppyX74HuwvSi9NzNalJnv6TspAsp8bIvWq/+
         4bGfOEXUpPiUfGJR1BF2JC+1wZxoW0yiGaJAesjiSSi9FMgA8EsSFL9X3Fce6deOfxVL
         bFo44L88yQU97gRTvASmXYSPeUqcg9+9PbHy+S/Sl9uQqERmuT2DBzuns3Dq3w/wItH7
         b28KwD5hWsYWZMlX/vA1W6tW1WJC8ZNHvXk+HJToQiKaba8BW2GzvOsIYp1rcx3pZ14r
         qv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245402; x=1795850202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyjDt4srRQIFbPUU3r2/dQUczxyZaXszt6feOM3BE7c=;
        b=WWKlmXsJFddkSEM+CtD/p43iL81pOfZfByiPu4+71pnK2yEncCugIPlFb2353Fjpv/
         0L9fZJNDKJCvWLQCD4A91ZKDHneRNVdlzfgbqlH3BBaLxE/qEyaaIDt9vdCE2kzxQlRS
         9uly7hPUyp2oJApCWPBE1kx/KIrN0ByXeazpqLVXKA4u63qGgLKLHWQjwXlJ4prueypx
         dGhex+hrLxtaY058EyPnOovnfLCjLe1h0ywWsG94/JIHbb9yv9lBt7eHGZkBYelUWfDn
         aA9OtiN46fhvHfDpvqgq8xUb5BwcS2UjwX6Gzn6u/IiU1TRryA2lJ3WCOjUEqhBKhBlx
         yUTg==
X-Gm-Message-State: APuU4Z8SAdRI4obxFd0/SuaSLdvRcXOxBKvteju3s7T9miy3o18laV07
	AoRRwpJbcUuITr+GPGX1CQ4VdmDkCW73X3EEKsIL2hY/lHvn6jvoWHMx
X-Gm-Gg: AZFdTZftyRi0eyEgIcvsr4WjKPA0fOKTxCvx8qCS4AYzFg0VfbXjU0M/ncRC8SSWFYS
	y3zJTm9aJmTCNafrSdmT7zGFEQQd+S5NKk17XnpqIpSwxpfRawoxwp4cd6cf+ViejvQ+uMrfXLR
	wPnfeQwLQuiNAuNJ8EAcJh5FbQ9/0LR5v+VInwvxCK/4IzmJ61AKfuaPNKR6QmNMpkBtJxTpnp8
	xYv6dRnZBUQLshTYpL5gN/2CKhqwShxEoCU3ksboW+n3V2tmu97pdDRvoDJ2sFvOS9fLfZpRrVs
	xUzmMH/kuMaIeMTnm7xjYJdIPi03idLsn5HMh4s283lQQr07WETkORNeejVlj0Mxyav4HtVCMz8
	Jc/Vq+ANBGNWkO1tftHHVsfLCxXLyXpJLp3RCW1gHh/+Ih3Bc7xsWhPveNcrnyB0N8tZg+ZXAPz
	UaKU7QYF7Ld+PeGTH80NO3S8MWGnRgaJL/DNmKrjcs3k4zE74Q2ejKTsUQp58YrNsnvVQeSJZoA
	xaECJykFjxaSzLEL6TsPEqC+Hzf8DMqF6WXkScOzaNenhdVFPR1G414SK/vEPpfgN6ix3kaWG3s
	+xqPiuBl+8Ja+snqhsLnH/6mlsXSIzsIEtthF0jwtGgIvN7n1t8=
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr5252313c88.32.1795245401808;
        Fri, 20 Nov 2026 23:16:41 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:2f:4d17:70ef:2f53:72ff:31c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm20880373c88.9.2026.11.20.23.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:16:41 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Sat, 21 Nov 2026 12:45:33 +0530
Message-ID: <20261121071534.28473-2-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121071534.28473-1-nonameblank007@gmail.com>
References: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
 <20261121071534.28473-1-nonameblank007@gmail.com>
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

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
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

