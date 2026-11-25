Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648307;
	b=Lt1aneHwh0rEEE7SwNBwtkyoInTozTYHgS7+hFAtoETSEgDje8vrOnSXNiNdxHq95yY/
	 6v7Quk6Jk5kcvXvaP2twDYvZ9YfhI7UIyO77vigzcRSyImPQeCUA8CbyPvikXWkRuN/ch
	 92t40y1sAC0EE+rZzLBbuc5/XV4Vw43j7Bp8xoGteA30df7l0o1BDMjDzCB0a5qRugcSv
	 E0fkeMpGaP10b59EKuEbeeT/EKTMjmUkjXD3sqAkjO+8R3V4ZG1n0k/OXBL3DpxmGYp3s
	 ZKkfAh4omwZ609yc3yId5UAZCSvGo1cXyYRtqHS3a86l6f8Z7XRvvWTXWAMpsGvXZGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=75sbqUsP+m2318CQ2ECdhPXFymfmplFKdqS6I0CgJTE=;
	b=LvBPlH7bf+WsOW9oJarEdOAxfAtOkKcbbh/hpxKI+mSABrrqHodGG50UQIt/bsochtAj
	 40mgo057U0STaAT5YRGgkU3T42SBfKIwC0jzsFukJtNyRSLMxTiUiao25ocgzTZnsy04g
	 1wISxiOpVpmF6qhGSx0ET6VIUSDop7TLXfeO1VzUznZBneLVBB10hnfI29Kbfm5opUXbF
	 JqEMEjaJh8KoFfuoyKhnOsjq5iLmHS9xjYBZG8cSng51WkzpT0xMVYW37vxZBxjy3505K
	 ZvsSO7jGo0Qf2d/rAZTg765XcbBjM9yZrYHmt3t8ypJ/0H//1I2LG+GTK0E7txbCEKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPJDFBMb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5968606A696
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5968606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPJDFBMb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386ab9ab619so8114283eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648306; x=1796253106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75sbqUsP+m2318CQ2ECdhPXFymfmplFKdqS6I0CgJTE=;
        b=GPJDFBMbMeiyj7qxCpYA9GXPxQow7jA2gZJFIe57tZ3tIXfEZ3YUIuw0UQz/QZ3Qis
         LVE6uTya25ql3mCaQF/2jIVlBe/d/RbkpbQeIjbjE+83pj1/skIeoSEdsJ6FEI0jhThN
         OWqmRlEtfQb5EXAchVI8FuAHHAvQwkuzZea4h1pxjogGfhguBYy4aLSzvky3TBjsvbUP
         P/rrPJTlREKkOkRNAAsmS/BnYYfAxDmZo6YFQ1dckBMg/ligbH8xz5apYndLh96VWYcT
         rxj0rJDWoPTr6K78TEOEyMLJnQYBngIkWu7Q2TR8QDXzlcu8DAZfH65Oapt17n3FeJcb
         2b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648306; x=1796253106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75sbqUsP+m2318CQ2ECdhPXFymfmplFKdqS6I0CgJTE=;
        b=t/2tEoarC2foX8uWu5u4or/0cdE6XQJmofkK77rWtUvLhxHUEas2NXjdHbZagj8r2Z
         XaIqsJiNXGlHAqd/fFhUQZL7y7JrdkEfdnIcLDo4UzNEemAsHOzK5YF+gFa8uf9O37rG
         QSn6TNZ8vD19TMiALALui5FC3FV6LBKnWPWrh/WpLiIQjyyqhEXLLugb+zVJlxyiKtlU
         7crMwe7xbeMn/0EeiqT5zKPmztvwku+6nymNvEARxuLJeKC9rBkb1vAR4EJx9MW+uzkw
         TZk2HhhBVtv42/a2hu2CkXX09C8WYHfOo6LYLj+WrSfDuALzWBzxSWKQ4dkNcQO84q+u
         qcPg==
X-Forwarded-Encrypted: i=1; AL+hErF/oMrmwxNuipn7J+BMSn5FUA2sthff1e9n9T8WK2xbJo5z1TlS7s9Bp5vZXVk4ALop+BU/O4qDhhXiBiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x0kgqLupCOFYGBxKNqh2QKT0JWjHuhpj8UPjbjdNEDj9uaaMU
	q/FKwv8qbevv/ftCwEJx5iJw63Aj85ZJMi1R7atAI9TMn4kVMgpbvVvP
X-Gm-Gg: AZFdTZevzgDv9D/sz9AO1vIuHW7yYhHW372zuILhV6gA4/UArbfiuxhZ+tL+nBjgqZM
	HE0R7ehZGSBDjIsknAhzTzM0722nKBzcv3d0KUnTm7U8gtjaGphW+wQEHtbQUK2WqbrXrXbhqDA
	CfpR712uutVV6FY5TjHFM4KdNmI0wuTpZE4v2VmHvpQ0HmuE9Sdq04iG5rJu6681O9g/fTy/NeS
	QwYV6kPzjcNXek8cnHEgFjn4rNJKt5K5gzbr9O9SL2s96EglL06e3AwLWaNXB10E3oOpbaAoemP
	mKNy8zWkBQyD9CTTh4RJ2Mvoq4veZXiBLwXQ04Cpo0D/hzHuRdTlbWfc5nE7xtmYV3vsuJWAWV+
	dQarpU44YbhmXZ6c9hJo3+WtCMQmgWaadNR2uRw3dv5c+EYIVmjaKaK7f5sdDcwyvWqkVrZTTRu
	46l6kW20dOWUJUhKpeRlcN2YPvTqrAGDufL+nipNIOhukFZ9HK5jrj9EdGlHu/zHZ3Uy4Gy37QE
	bGoJUjhPBjECjfaXhzipAuqxsIwruG1fe6Xp7ck9C+6EX4VIGJyDv1ZCfYJseRO5N+e1pGpCmiR
	oE7f22EB7eoe3DRdiaApTqLGykctqoaydGW97I3Q2QP1fYxOZwbSAjng/+14lv3bi2SFxV481Qf
	wj7qDnDjF2fkKJ8kktg==
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr23275357eec.32.1795648305896;
        Wed, 25 Nov 2026 15:11:45 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:45 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:20 -0800
Subject: [PATCH 7/8] platform/x86: thinkpad_acpi: remove unused
 hotkey_poll_active flag
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-7-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Drop the unused hotkey_poll_active bitfield from tp_features, which has
never been referenced since it was introduced.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 0ebaea0ab96b..898d919d697a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -377,7 +377,6 @@ static struct {
 	u32 mixer_no_level_control:1;
 	u32 battery_force_primary:1;
 	u32 platform_drv_registered:1;
-	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;

-- 
2.56.1.839.g22a8290db9-goog

