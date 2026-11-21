Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245406;
	b=FSmclGqxhJWWlYVVOUnP39XadO70RTDFA1Kn8F11lCPaIjTK59fm2zP56pLuHJPt14bZ
	 Y4egiBG8dYW1vq6fOvsD0vCB6zXusdWUQN77H3Ph41sC+NrwtpU3MyfCpcQ2nS7DmAlJB
	 I5vC63GRuyQPGUuceNSrs2Sf70TaHL0EPWDecfKjwj44eZG8w1829HEXF5rg5axQgmhfT
	 OYt9s9r4TJeeGOKyIwR9l08QL9O7Lt+BD7yg+5qJZOfNSAQCQa6BXsboppgjBnL4eqLRa
	 RK46XNpo5i9SCGBjmM75UqJbdY+/kjliwBYukqhQuMPoxz0JCrZpQqgZhma5KDd3CQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mYq2jtOrJLY6sKHqCT+nIWSwy/ZRL+QownEH1kRdhD0=;
	b=TqlZvDxa4piU8tgKtt+T/UVHkdysAGYSnEB3+chN1eSYwRLZnImg0FR/RCxYnpog6D65
	 nnMnNQ/lTK3eBzof310C9vKcuGzZDhkPX0zy1fUfLJz12oeeRgb7dw4Co//rqUzqE1YnC
	 Pme2Er/F/dT7a20w0Lio3Mem+xYi7UqL77JATzZ8jngGHtbCU3IbrN9I48hsuSc+kEH0m
	 me40AmzLv2BF5NEbmwnv2SY50/rYDffRmI9jtsKjVotFDPg1yMzw2L982aDe/WPaKJa3q
	 n26dpKy9AJ2zX43HKzmMckv6fzwkOY5V+gyRrI1mp6EE0CugNehjpZTimin4a3Vcrww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryU7Gb31;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204F606A337
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D204F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryU7Gb31
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso3440444c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245405; x=1795850205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYq2jtOrJLY6sKHqCT+nIWSwy/ZRL+QownEH1kRdhD0=;
        b=ryU7Gb3189lbMLwd8X28moCAhKcxEl3rsYmfp5v4e5CyupNCGj5Ge58FnS89TS/GkN
         hLXelRbRkcE0ybBI9bb2Cm500muc4CEyUHy9SCi60OW5lZpdqNqjLJtsMfwyT5OAOKYZ
         KHZ98H1v1yu0VOVr6/kJKOmsfuhghheANH7XyVBDVp4tuquZJZnsyxGJYfdgIT8WZHSZ
         safzQZLV9DZKSp6NfAl8Q7htThhX5X2sbOW3p9I07UhNmsZhBInF0p3GVkMbVQ28l8gv
         NJQGIhGgmsuqcPONMxmyrWlfOkuNx126bC8xAeb0B0jC8wrjMkv4Eo23xh6E0s1XF5Gy
         8iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245405; x=1795850205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYq2jtOrJLY6sKHqCT+nIWSwy/ZRL+QownEH1kRdhD0=;
        b=QtxK+hkZfmwMSJ34kX//osnoF4yKLH72v8aawo+JE0/Ou3vRv7KDBB1Vuq+alTx65T
         PSi4qydX9dnrW5Tj6pX+232jVyHbsQJYzbmBlqDqC6YoS6cJ1scYF5IOVwMWEf2wCkJ1
         0p4yli4MqzORbe1RHxpy25tsMAlSSXOnD8ua3rj0Y3m9px0hSyuZl+xHJUQvRt9l3LIT
         199uEQNiUqduQlHejstbE9IaLbyU+U39gjUAmc7X7SJtD5Fd+ZWZD1mHMbfFtIv3UWM+
         XmohMkgOkzeaeJSM5NhjLoyK0Rfrt9qCQG9/Rj1j7szDB6c45D9fnzr9EieKOWnW3r3R
         civQ==
X-Gm-Message-State: APuU4Z87uaUyKaDpbcqkHPCXcLlf6UB0QRTbahUsLikxpb7caQVBHe9W
	UY1V00JcBYJ8E72ocPTvpKw2dPt99MAIuPzB9lhOWjPRcujEwkAypF4/
X-Gm-Gg: AZFdTZe8MnhHKJdXYw3bVM+ev+8wXi3aZYUj0G2hbJf8NNP4EDwmoaPu+Rq5xp5WRWx
	2KA/gVyo/mbnXG40e/L3abzhXYfYB13ipZyXWnB7zyDbxpQFCSLgM2+YC6n3qtF5S3wMmyJHgfv
	lCgriGHLLvIlB6Hnh4pzjZEJPd84xY454XXyiSpA/ahU9qKM37uSzzKMhSS1enAyrUeBvOEIKfi
	F5iLhTaRdeff6FajAao/Qd1rbl0kc8u2RROi3fQ7REAgacxU4q6vdk+jllZ3h5yqnU23gNuW4Av
	jUJgDkZ9q271+UgWbEFtp+eQ8n9w+jn9QEF3lAPc0EEaO8HZNgcjcxKuapI22YH7rGBdCT1KLY0
	ue5Op3CQlQtrIgntW/qSkTcZhVqpr/tn+CgfcmEAbPd+ekgb6iXWnEI/rqc6/POxmnQKKiPGw3o
	3b88rL+2FDmdYPrEQWpa/Djm9YVuHOhPHH4HDPJcA9dpNw7d4X9LkzpW9+QNnfvuayzBc6l8xo7
	SuND4MkoSfYFCttuAUcmXloK0ZVkPJOpUPUHT+LED9/5Z8eeg53QpMt2D0CqpbX+/O4QPHhk3hE
	7Ptaqz13JxCL7xoxsor88tP0mz9lD8aihg351j3ZNjCkNqJR6UU=
X-Received: by 2002:a05:701b:450d:20b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b5568e825emr5905692c88.21.1795245404775;
        Fri, 20 Nov 2026 23:16:44 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:2f:4d17:70ef:2f53:72ff:31c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm20880373c88.9.2026.11.20.23.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:16:44 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/2] platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx (8A3D)
Date: Sat, 21 Nov 2026 12:45:34 +0530
Message-ID: <20261121071534.28473-3-nonameblank007@gmail.com>
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

hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at 0RPM,
So, assign a custom victus_s_ec_fan_profile_params for 8A3D,
introduce a 'if' statement with hp_wmi_fan_speed_auto_reapply to resolve it by
calling hp_wmi_fan_speed_max_set(0), and passing platform active again to reactive curves.

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

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0166b9cc4d9e..583e1c0dda07 100644
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
@@ -2945,7 +2959,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (hp_wmi_fan_control_supported()) {
+		/*
+		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
+		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
+		 * the active platform profile, so the EC firmware thermal curves regain control.
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

