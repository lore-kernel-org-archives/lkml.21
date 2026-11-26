Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678326;
	b=UKNI8AhA4Wej36mprzJkljYX7cJwoSMUwjxFYfsb/1mHkjOEbQ2S+hMzuxhxgGN5SefS
	 kpi+gIxlOSp77kpos8slsa/Egpn9TT5hjSr6tMkDzmrxqtH0ghl04esG4O7rYFyG8k4Pj
	 iYUItIvzb3Q0iRQLW56GOApfeLEAQSEfkZvO1xZUYnqcHU8e7KpdGLZc+2Kp3eZPGKALe
	 YlUIAb5d+9QbFvG5+OWXjmvi4rdq0+TjYbNOuFjKO/gxRLaqZLaMdaT4PCKV8IuAZPcC4
	 Q+U5MfRWOKeKFgRXLClQ1Tus9YfGVTr9YKFPN3eArLyLqr6L/2Aue+Cj+7+KW7OaAXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
	b=iniWEGnxJyfys7L+SbTjlsTrT66rcpd/XD2IBfR72MzlhjXQb04IScIbYFdFwYtgzX9g
	 JVziPWS6WsGPSvuLkM+U2QdRnvt6plqBYtGTkmBGpp9+tbfUMlHxFsHkNL3ufGzWEBaHF
	 AXMewhnhz/rsFlgKtKEW8S0ofeNunxzD1II4p/i5Jlr1wgBXk4NCOPOc8rOB3tfH2jgK7
	 Ljx68HM73zVqUcYlnZ6AYkHv1lK8ptoi1GgL9lf3QqMnXlfwjVsk0QtfNvSI2nWmfNNpP
	 YIx9pCRQuO3u4lX7Qx/Vxxc6ZgnYTr9OhOdjlFE9fyM+rP7Ub7ZpNA14TIj0HClTLjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gToZehnz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E1D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gToZehnz
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ddef424972so5438840eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678325; cv=none;
        d=google.com; s=arc-20260327;
        b=F98qzQ0IiSt9x050wHPGtlgBtLVU9nLDd5GPz2AalEcGquJU2KoctFaNxnygrZySth
         iC/3VBCRqpfca0Qv7Ar+SzbrwJLZocGpZWwz/DNoagLEvLG4XB9QGcwGPmPRem6vVtEn
         10kiTsOt8lpkSihBe6ocpGN3Sl6eB/MbkXRyWGQy5ZNMaqi5YBPEaMdKiEGid9soYGsh
         rdy0yPtgmJIDvEGcyhLXW9EKfdioLMVkAU9G4Km5f+t8P77Sqkd60AL/OnvhH76HqYVo
         iEDg70ql4VZyj3KRJNosdixkE1SB0res2rrl8yLrDxATElRHjsG99tSlysDRz7wERGZ5
         lHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
        fh=YasJMRdmcA/VJf/mzdmeV0bsKYLEl4MMzoM2S0dju2w=;
        b=P1arGH/foTjUTdTdace3Ex56DMbNpRc8LsoHHRoQQOHvGq/1B42tbvXsZRQbUmCNo6
         eaqGzlqPFqLWsEKujVwtGkL6UFPLKv7nW9rG3TL2JH6dO6J/xunrHu/cd9ngO73ASGxg
         ZQ8yqMm9PPwuwRwCofepKAVjE3Vr1l5Avi1ToHfeO3LrJxHgmDN5KBmi1+shEZ+Kw9EK
         boz78OGGRyw0A9OlgfpjUIuiI9lO9BoN2zmRhrmCKToQXwr1y7jKv5V/pRoU7pvc3BYx
         rC4wAVUL4n4Nd26D3sJDHIe8AMClllz4JaBSYTiM1me5snZIZHM0gjf5D3rNmFnJaIHS
         7prg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678325; x=1796283125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
        b=gToZehnzNxHiXwihqawNvfwWlDoL2hLNJO3A6kWEDfnll1pXFTfJqQCZ6zLV7G7HF5
         cwkzNEXvCKDqK3KL2fBsqTy8mVjUKMZJTAP/JZdAjTirGqd306IPlmfgOqG5LBDcC+ru
         C+RsGbWmyli4UxzZcJZv+1gYol5nBELGzpho/CRWlM4rKBhckGRwPEbBIbnxvsr2U6a2
         QGxwRLLY5IEHi34twbLkzNKeTy+m0YC2GWjeump6s8/EYkhkdQF8pdx5ICLliwwyJJSm
         OFor6LrVuQh1cl7SOIyuQPjMzByQy+2TjWNfhvkX6Mj+tQ0MEBrHT4IrGEMnYP7zz4gi
         Va6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678325; x=1796283125;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UxfJLJ/kw6NsKgiSQx27YujKpKmMB0ZKnG+0GWKtM58=;
        b=krrtmewm3IqezL3YKSGEIRCoK42ywttOy4+tsm03CO9jpBYsUFvOmY2b6O06aAmsG5
         wri5rUhMp5UcvV5UHHczgoGkaZS1yx3qRr1O8UtOR32ESg+k86SQfqUVhpZCSRG8nQzi
         cfB5ZP5qdFYOQpT3TQacFxWkkmRiMA7VidUokr0mMUjexshEIEAWhclRMxvJacMjpPQ8
         v5nzsBRW5/lbCu8J2AhraSzNugDkSTOvnfbo/icz4GfdR/XhD2yRhM6IdyEwJGDKbSHp
         eMl7e3ICYBMHnbL65SroNM0N9VRfXY3ElTrW4RjEYIESSd+b7qXP178Jws/FWQ/bR4XY
         8AUw==
X-Forwarded-Encrypted: i=1; AL+hErH9rOPxD+U5hCMaDjsRPf5UscaLe3MTi4uyG8sDSU2UGZ1xw3aROEKMstmbiAPqoqh8+glywSUwdCCrBXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ser8Td8sbC9pQngL3mzxkEcilJZh7jFRgXcZtQvvOVNS8lHVO
	uuFvgvrOBHuHDe7QYMoHuF9F7ezuuX/FyUCGE5U+xgZPjh6ncE6reKBLMUZS0FePT5cfOf+wkhU
	2AFCEROkoYqFFK300LLZJU6SnFGW+bxM=
X-Gm-Gg: AZFdTZf8E+k/MudsTcukegp/AtiTC1NZENUv+txoHVpAHACmBQN/dzmXbXiJhzcGR1L
	zpl/SeMo/a469jdeXy7MneKvNhw3GVSLknoJ1xpl9aT+kVUhWLVKacsy5APTqd3jKfNGTKdqAmk
	zV8jTvulTBGlyqZrh2jNror51oB9Vc8TtM7YGLXBZUesDZtb+/L9vLej7OVB1jZCIt9c022TyDJ
	KPapxR5mwAR4b3cgxLxl5cB5nx7vCv87pNJSP4PFf/enBTh08IEtuJlUjj/8JCTvnUixb1DJc/H
	6w3IOiGOnG5KlylYqXl4o7f1+F55AbrYEcxo5OFe9bmtPHiXR/fjZ7n3zeMRu8LuvCnpe7G9XV2
	0xRTWr9CXRW9crLZOyac+9tavynHr/nxyZ3GuZZr0/+YFcwTD9PXZBBiiDVWd3xr8w3Y=
X-Received: by 2002:a05:6820:c30f:b0:71a:f754:a22d with SMTP id
 006d021491bc7-71b3957ed4fmr13966801eaf.76.1795678324642; Wed, 25 Nov 2026
 23:32:04 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:32:03 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:32:02 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 01:32:01 -0600
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
References: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 01:32:03 -0600
X-Gm-Features: Aa3M54q5AR0MiMyVtIAOsUeAG0ROYsnFZU4yeWmbzz3XS1iJWiHd725NhN01sDg
Message-ID: <CA+m4KrBqx-_TmWWcoGrYVpGwspxkxWXZ8eOmrT4kfHZECN117A@mail.gmail.com>
Subject: [PATCH v1 2/2] usb: typec: ucsi: gaokun: Defer missing USB events per connector
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The EC IRQ thread dispatches both connector and USB events through a
blocking notifier. Waiting in the connector callback holds up the IRQ
thread that would deliver the USB event. The first USB event also
completes every port's wait, and those completions are never rearmed.

Schedule the existing two-second fallback on a freezable workqueue and
return from the notifier. Track each connector independently. A USB
update cancels only the matching fallback. A newer connector change
moves its deadline even if the older worker is already running.

Serialize mode updates and acknowledgments from the two paths. Stop
notifications and drain per-port work before unregistering UCSI.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 99 ++++++++++++---------
 1 file changed, 58 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index d4c66de48..9b51b60b2 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -8,9 +8,10 @@
 #include <drm/bridge/aux-bridge.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
-#include <linux/completion.h>
 #include <linux/container_of.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/platform_data/huawei-gaokun-ec.h>
@@ -19,13 +20,15 @@
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
-#include <linux/workqueue_types.h>
+#include <linux/workqueue.h>

 #include "ucsi.h"

 #define EC_EVENT_UCSI	0x21
 #define EC_EVENT_USB	0x22

+#define USB_EVENT_TIMEOUT	(2 * HZ)
+
 #define GAOKUN_CCX_MASK		GENMASK(1, 0)
 #define GAOKUN_MUX_MASK		GENMASK(3, 2)

@@ -77,7 +80,9 @@ struct gaokun_ucsi_reg {
 } __packed;

 struct gaokun_ucsi_port {
-	struct completion usb_ack;
+	struct delayed_work usb_fallback;
+	unsigned long usb_fallback_deadline;
+	bool usb_fallback_pending;
 	spinlock_t lock; /* serializing port resource access */

 	struct gaokun_ucsi *ucsi;
@@ -102,6 +107,7 @@ struct gaokun_ucsi {
 	struct gaokun_ucsi_port *ports;
 	struct device *dev;
 	struct delayed_work work;
+	struct mutex usb_lock; /* serialize EC mode and PAN operations */
 	struct notifier_block nb;
 	u16 version;
 	u8 num_ports;
@@ -330,56 +336,63 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec, int expected)
+static void gaokun_ucsi_usb_event(struct gaokun_ucsi *uec)
 {
+	struct gaokun_ucsi_port *port;
 	int num;

-	if (!uec->ucsi->connector) { /* slow to register */
-		dev_err_ratelimited(uec->dev, "ucsi connector is not initialized yet\n");
+	guard(mutex)(&uec->usb_lock);
+	if (!READ_ONCE(uec->ucsi->connector))
 		return;
-	}

-	num = gaokun_ucsi_refresh(uec, expected);
-	if (!num && expected == GAOKUN_UCSI_NO_PORT_UPDATE)
+	num = gaokun_ucsi_refresh(uec, GAOKUN_UCSI_NO_PORT_UPDATE);
+	if (!num)
 		gaokun_ec_ucsi_pan_ack(uec->ec, GAOKUN_UCSI_NO_PORT_UPDATE);
-	else if (num > 0)
-		gaokun_ucsi_handle_usb_mode(&uec->ports[num - 1]);
+	if (num <= 0)
+		return;
+
+	port = &uec->ports[num - 1];
+	gaokun_ucsi_handle_usb_mode(port);
+	port->usb_fallback_pending = false;
+	cancel_delayed_work(&port->usb_fallback);
 }

-/*
- * When inserting, 2 UCSI events(connector change) are followed by USB events.
- * If we received one USB event, that means USB events are not blocked, so we
- * can complelte for all ports, and we should signal all events.
- */
-static void gaokun_ucsi_complete_usb_ack(struct gaokun_ucsi *uec)
+static void gaokun_ucsi_usb_fallback(struct work_struct *work)
 {
-	struct gaokun_ucsi_port *port;
-	int idx = 0;
+	struct gaokun_ucsi_port *port =
+		container_of(to_delayed_work(work), struct gaokun_ucsi_port, usb_fallback);
+	struct gaokun_ucsi *uec = port->ucsi;
+	unsigned long now;

-	while (idx < uec->num_ports) {
-		port = &uec->ports[idx++];
-		if (!completion_done(&port->usb_ack))
-			complete_all(&port->usb_ack);
+	guard(mutex)(&uec->usb_lock);
+	if (!port->usb_fallback_pending || !READ_ONCE(uec->ucsi->connector))
+		return;
+
+	/* A newer connector notification may have moved the deadline. */
+	now = jiffies;
+	if (time_before(now, port->usb_fallback_deadline)) {
+		mod_delayed_work(system_freezable_wq, &port->usb_fallback,
+				 port->usb_fallback_deadline - now);
+		return;
 	}
+
+	port->usb_fallback_pending = false;
+	if (gaokun_ucsi_refresh(uec, port->idx) > 0)
+		gaokun_ucsi_handle_usb_mode(port);
 }

-/*
- * USB event is necessary for enabling altmode, the event should follow
- * UCSI event, if not after timeout(this notify may be disabled somehow),
- * then force to enable altmode.
- */
-static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
+static void gaokun_ucsi_queue_usb_fallback(struct gaokun_ucsi *uec,
unsigned int num)
 {
 	struct gaokun_ucsi_port *port;

-	if (idx < 0 || idx >= uec->num_ports)
+	if (!num || num > uec->num_ports || !READ_ONCE(uec->ucsi->connector))
 		return;

-	port = &uec->ports[idx];
-	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
-		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
-		gaokun_ucsi_usb_notify_ind(uec, idx);
-	}
+	guard(mutex)(&uec->usb_lock);
+	port = &uec->ports[num - 1];
+	port->usb_fallback_deadline = jiffies + USB_EVENT_TIMEOUT;
+	port->usb_fallback_pending = true;
+	mod_delayed_work(system_freezable_wq, &port->usb_fallback, USB_EVENT_TIMEOUT);
 }

 static int gaokun_ucsi_notify(struct notifier_block *nb,
@@ -391,8 +404,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,

 	switch (action) {
 	case EC_EVENT_USB:
-		gaokun_ucsi_complete_usb_ack(uec);
-		gaokun_ucsi_usb_notify_ind(uec, GAOKUN_UCSI_NO_PORT_UPDATE);
+		gaokun_ucsi_usb_event(uec);
 		return NOTIFY_OK;

 	case EC_EVENT_UCSI:
@@ -402,7 +414,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,

 		ucsi_notify_common(uec->ucsi, cci);
 		if (UCSI_CCI_CONNECTOR(cci))
-			gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
+			gaokun_ucsi_queue_usb_fallback(uec, UCSI_CCI_CONNECTOR(cci));

 		return NOTIFY_OK;

@@ -437,7 +449,7 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 		ucsi_port->ccx = USBC_CCX_NONE;
 		ucsi_port->idx = i;
 		ucsi_port->ucsi = uec;
-		init_completion(&ucsi_port->usb_ack);
+		INIT_DELAYED_WORK(&ucsi_port->usb_fallback, gaokun_ucsi_usb_fallback);
 		spin_lock_init(&ucsi_port->lock);
 	}

@@ -523,6 +535,7 @@ static int gaokun_ucsi_probe(struct auxiliary_device *adev,
 	uec->version = UCSI_VERSION_1_0;
 	uec->nb.notifier_call = gaokun_ucsi_notify;

+	mutex_init(&uec->usb_lock);
 	INIT_DELAYED_WORK(&uec->work, gaokun_ucsi_register_worker);

 	ret = gaokun_ucsi_ports_init(uec);
@@ -548,10 +561,14 @@ static void gaokun_ucsi_remove(struct
auxiliary_device *adev)
 	int i;

 	disable_delayed_work_sync(&uec->work);
-	if (uec->registered) {
+	if (uec->registered)
 		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
+
+	for (i = 0; i < uec->num_ports; i++)
+		disable_delayed_work_sync(&uec->ports[i].usb_fallback);
+
+	if (uec->registered)
 		ucsi_unregister(uec->ucsi);
-	}

 	for (i = 0; i < uec->num_ports; ++i)
 		typec_mux_put(uec->ports[i].typec_mux);
