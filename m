Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447994;
	b=bhc0r8czElv+JdfyL1XkPsfwI/DbM9aZ/mxEHxiRMJ5cIRVn/SLJ5Nod1z7+rjnaIYoI
	 fqMPfSDSQiz5HVCOSWEGGt7d5CvICCZvS2g+nIUFifp9Po8miyyedtrRfdOFSuXQHtj2I
	 f6vcgcBaODF6u2JUkAOSP3aDSzB73y8oz8zDWiIAXrxh15cF1Rb3qt3ySL9YPhE/83ctU
	 nPa35nlskBHI1xdQYD0iU3FwptRA8y2Tm3TQTYA0tVM8of1sZWv4IilTZr/gYxq+D20YH
	 1p6bhEPMiuYkYtumXOaVOW4mEY4HqIYguvSZIfmkLNREB+iIFCQ+H8j6svp+DkGwmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kWLSHx8/R+2zMKFW4nd9QjS92NXhkGIV5/Qn0pcMWDk=;
	b=Pm/c4c+kSJzp4Xzh9Am3cNWa3uLF6mnE6NQ9GWsq2zhLE+5MXzpj+JE5g8qcnYJfa2Vy
	 fb6cJsXpE0RQTcrDhOYbUM7DaruMBIMkuq1nkJZ64ZJ4VWkZgqv8SPgf/7O3dEoXg/Xi5
	 9HY7SrEEjMj4lztelj1sMltKTEx8Ji5qiPRKlWwRLB4l3GEN9BfnJ2GjyddlobqrvKVqm
	 VSiVs1/gu9GzpCdGwhqGQ7qvOtZo29c9Elf/OLqAk9owRjrQc8NMBYDRZTpO5cYnQU9mm
	 E7dr2Khs9s68WABc+TBNalpPbLXkvF/k1m5Oo7A488dcvEvTs3UD7kfwbRUl+nWfBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYWvcMKN;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF7606A684
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CF7606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYWvcMKN
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso7363675eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447994; x=1796052794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWLSHx8/R+2zMKFW4nd9QjS92NXhkGIV5/Qn0pcMWDk=;
        b=GYWvcMKN3tDC65FFLe1C21Qs9+Ct8D3KvApyfM8S/ST298wjdzAdBgfcDkGb7jh23E
         oxru6a0zv+YtIcrv/pHVX+wJ3WgqxgeQc3+pnq6r/Cbb1U5x5ecy4QgquKKz/Z8DuNTT
         JXQ4JDoY5+e+JPid/Jw8bNBMrVQTz6XliLccffHMbwRxBvHi6dNtslHM7gDnBqrVXyjS
         Bh+hOw/OAbwX4S2Nk+WVER5cHZIk/qgdqhpEBZuuSRJ5P8GES2ocFm/1JPwG+thgYJq6
         6FA6etxUdCOn8GzKiFNhXdACkMs7WVstRLTIqufp2EwcfInctcClEayuhZ8X1n5h+W3f
         RfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447994; x=1796052794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kWLSHx8/R+2zMKFW4nd9QjS92NXhkGIV5/Qn0pcMWDk=;
        b=tyl8DPinEBoHubtjNgOiF0CYXLZA7XX09HK2BKrYyhGK3w0k3V73/DTQF2TX6MBvEM
         HAwYnJD0BQYA+VaMrvoD5HEP2j1mcr/A5I/y4LPPOCs6NtsQa5bAi9z+pz6vkEu2gpuj
         sSuqkzP7B0ly9xJjwua2kuToND479fYx5k4CWX2MSMg4GMP5KzlWHiLCNsBEFI3i1ld3
         MaEIZbcXiLEArH73FNyLz8iTbU8PpCu64gm8qRkOLGmBsRAs3DqMzWLMYAn97Yrbzynm
         EqkKfUQ+y78u0gjiSuk61unKAkWHT4h95fR/ndbmudxpV4TIXORbpP4cEfEBh7EQmJQ9
         lFxg==
X-Gm-Message-State: APuU4Z/cXbus6h2YYCrc258AwIudwwzh1uHxLEA8pN+THVhB0MOAI9IY
	yIerQq44QdjxxBk3CKYnBV9Bno0EX86TaR9FKiRmYzEY20VAMhEEPpdq
X-Gm-Gg: AZFdTZeXQuAb9AKt/0fgOKHcYneleP+u0ubJyT9abitRhX0DEl3gCyynTogBUz++5Nf
	D+H2cdr6jvYWNqQlQAkfJOQMWHCuSNj2H1teiOc8GbZPT+tugrLGSxVLlPyNJpUQ+aWxmLWopU/
	RoIddKghSfB6PzTOHjFNgn0XeIgWc51OJti9PcpPKYSkSp4HCpnCn6C/K19sYCJEyxqy6UY4xwp
	ddmc+7bEiBPpFeZ7jUa4K+rrhOAyegrM9o4AtGbkZKmNLew7iX9vmfne5FSsnd5gX140sQFqQzQ
	P5CaaDxwc4LtCXFACz4ttXK04JNc1WngTefqMano18XrhM2wpc/35Q7oeSGFHg1FpXROzJRAjKR
	ev0nRty/+OiCYWrnJZeT4v5ZeOiim8m+8wegWKUtKktbJ0ML+1uUiBL1VqPsv+vI3x23zudeq3x
	JuiNuCpkEl0fTn7CbYPOMUni3icjjSFhYzis/KiWKP7F2bgoMIuM7SvdWS/M3Dg9vha02YgvPEF
	Khwg1jqwUueZGMwuwyoffYPcNLWIRwSZIeP3WrbzzZy5B2xaKG6rxFqg3x9kDf7bELzMjL4iq2o
	Y5AS738jbLMvZSPjsIrC4pMjCCAha5KaqcAB8Yjy1eFwxUztfI5NyN8miGFz
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr10096617eec.7.1795447993630;
        Mon, 23 Nov 2026 07:33:13 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:122d:3887:9ee5:1e78:760d:3a39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34587395eec.16.2026.11.23.07.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:13 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/2] platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx (8A3D)
Date: Mon, 23 Nov 2026 20:59:17 +0530
Message-ID: <20261123152917.14260-3-nonameblank007@gmail.com>
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

On Victus 15-fb0xxx (8A3D) model, Calling hp_wmi_fan_speed_max_reset()
causes fans to freeze during loads at 0RPM in auto mode,

So, fix this regression by a flag to struct hp_wmi_fan_profile_params
and enable it for 8A3D in victus_s_ec_fan_profile_params.

When fan_speed_auto_reapply() is called, It disables maximum fan speed
via hp_wmi_fan_speed_max_set(0), and passes to active platform profile
to reactive curves via platform_profile_victus_s_set_ec().

Test data:

auto/max:
hp-isa-0000
Adapter: ISA adapter
fan1: 5400 RPM
fan2: 5200 RPM

mannual[255]:
hp-isa-0000
Adapter: ISA adapter
fan1: 5800 RPM
fan2: 5800 RPM

Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0166b9cc4d9e..d9a51406aea8 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -155,6 +155,7 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 
 struct hp_wmi_fan_profile_params {
 	int (*get_fan_speed)(int fan);
+	bool fan_speed_auto_reapply;
 	bool fan_table;
 };
 
@@ -170,6 +171,12 @@ static const struct hp_wmi_fan_profile_params victus_s_fan_profile_params = {
 	.fan_table	= true,
 };
 
+static const struct hp_wmi_fan_profile_params victus_s_ec_fan_profile_params = {
+	.get_fan_speed	= hp_wmi_get_fan_speed_victus_s,
+	.fan_speed_auto_reapply = true,
+	.fan_table	= true,
+};
+
 static const struct hp_wmi_board_params victus_s_board_params = {
 	.thermal_profile	= &victus_s_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -177,7 +184,7 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 
 static const struct hp_wmi_board_params victus_s_ec_board_params = {
 	.thermal_profile	= &victus_s_ec_thermal_params,
-	.fan_profile		= &victus_s_fan_profile_params,
+	.fan_profile		= &victus_s_ec_fan_profile_params,
 };
 
 static const struct hp_wmi_board_params omen_v1_board_params = {
@@ -2286,6 +2293,13 @@ static bool hp_wmi_fan_control_supported(void)
 	return params && params->get_fan_speed;
 }
 
+static bool hp_wmi_fan_speed_auto_reapply(void)
+{
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
+
+	return params && params->fan_speed_auto_reapply;
+}
+
 static bool hp_wmi_fan_table_supported(void)
 {
 	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
@@ -2945,7 +2959,19 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (hp_wmi_fan_control_supported()) {
+		/*
+		 * Victus models like 8A3D, calling
+		 * hp_wmi_fan_speed_max_reset() freezes fans at 0 RPM
+		 * under load. Instead, disable max fans and re-apply
+		 * the active platform profile, so the EC firmware
+		 * thermal curves regain control.
+		 */
+		if (hp_wmi_fan_speed_auto_reapply()) {
+			ret = hp_wmi_fan_speed_max_set(0);
+			if (ret < 0)
+				return ret;
+			ret = platform_profile_victus_s_set_ec(active_platform_profile);
+		} else if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
-- 
2.55.0

