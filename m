Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335929;
	b=Bk5B+EcR54QLC+AKdngzHblw2wLmayF1Mv+m5V3dfNGiXJpuNCFiAVMrDujpk0W9Cwmt
	 OR7NM6cSAtOqgYM5MlCa/bclidhvcfn0wMJzcm3MLRWh+wwjeDC08pZthVp96308uyQKi
	 3iACdyjIulgw9e4YvPlwHy1s5YO8oFYoKtZcIJDoYXW1EhupYd2yJBzhRJNHa3G0wOiUQ
	 9UvrGiQweJNKDbJxDHuUpf/1t5l6fLk9NsTlJDT3723+TFuSEsGlj+H3SSvAr7iDjFtz3
	 q1O1Ui7tZnfz2xWANGuQ5XaMmG9gKQi9lbb1+F3EWDf2XPnf74+UZW8k/X0yIcGFvdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9C8VrUUMQ052sNkqdlVlnIUSUE4gVO3LQI5iweO8Mtc=;
	b=38Btjh6fGNOUpsApYiZv/YhH18BSamPpE0PnbuoxgOtwFnpwQLuk5mcd1JPckHWCoM4D
	 XziAp1UAfl7NxMZ81qNZrUAQGTYHelmKLQplFsAu2aue71HIcOOm8j0fxrIOn+Vln7Ifq
	 fzfZusGf9nTRWZg3MXWezP1mISpooSKbXfMrvdIZYr0e+1JzdaAW+uL4sm2eZvZDWqxIp
	 vbFbhITmQ0glwxqeY6GERhd/yfmB8IwzHZZ2/RtGmALs9RELDVG312sbbufcgQvVJuI1I
	 0HJSIGaG3km7PHzGSfUm0aB+Yx/7Cro6LUEfQg9QNjcF2qkWJ1BlrIcz2iiFopjyAYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xqi9qO2g;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0341606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0341606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xqi9qO2g
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3005377a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335927; x=1795940727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9C8VrUUMQ052sNkqdlVlnIUSUE4gVO3LQI5iweO8Mtc=;
        b=Xqi9qO2gn9gR0YkDVq1lPCaXmr3v6MxF8ivf8UKDfRYNlLV7b9pQFoW7W2T9UBwyG8
         6q6UD0I3kucveel+jM0PgeXwfik5bmxlnxLoJhuphijYs6mZH3RmwuzL4xopRsbXvo49
         oCKEoxA+FUsACKuGNDZ+gjZIB+gAf68y445IGcbsxn3sMNqsvu8RMxF7UNZCIGhArRIr
         GLjfu/CCnVz82xUcaWCEwuF/wfz2fcRpkocktfyUIqNHGMBuJKE6sXlfLpTV/wl5wg49
         fnW3Sf5EBQSaXEsuZwmSxKik8JW6zyjM3mM7lLiYV1yaDjy++010wCG7EyAuS3EJYV3M
         nqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335927; x=1795940727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9C8VrUUMQ052sNkqdlVlnIUSUE4gVO3LQI5iweO8Mtc=;
        b=hQVMC7+c4xhjBAmrkjR+U3rnljyazJO1wWVWliMadIotG1s5xO3/ukXlmISVevM1h1
         pGvH5gym/GzcwDhiPX1OyAg9MGM5hD/4QaTVapGHuXE1fueCp17Sp1vw+iW+iyz5NvV3
         N7n3ukGM+XNP9375Cbe48VcV7PSXw+PnziCVG96VxA3VUonu3dtPnfc8/OYGPbrx0uDM
         sb7WoXv+e1KPkPIf7qu4aQQKj8mWtlWqhsF7QevJCZjH1VbotqXvqdulcaJ4HvzLCLt6
         n0fJ2cBTLIsvIkY4HNXN3D50xnt2EWqWNZqIN20rO4MAe3gQfGjGHhqic00DdC+IyIjL
         q5Zg==
X-Forwarded-Encrypted: i=1; AL+hErFURarvm1NbruX/hVBuYK8kkBUJdmXowJ+BlPRFT8NE11na7j3FBopL1LGswTbQ7Q8eONPVw9eU6BXj7pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8r7kJHdFRLttfGWaIMq/QMcq+0/p9ulwk7i77HgNQHTnLTOIk
	r69HOD4zoxGP3xWf7DoBJvX70ULAiGn3oLjktPOSz+6t8x5Mmdh8ue7v
X-Gm-Gg: AZFdTZeodlZicEsZxXnICjIuWLZA10YBfI3pqfryHtvy+suOyKO1yeltHH+lmytd0nO
	GLI9KSHVK3XxXGLRnk/IXja7muPWafVJ3/u3TzVPYy0NM8ZoC6ZE2rE6rYGyC3hG8CxpqAkvp9Q
	9pd9S0VTzLHZQ6bZzMEY5nDAm9gKRrTNFR3mE6Z6M/O2AqM33pqWyjVhTYEIwonOyt7NdM5EmbA
	gcmvgb4x5lOgGyP+j0cVFuX8n+18gGq54iXBGlHX8echcYkD+E/DVYW+/cJwZg/1rJQWbmYTS0X
	08Ybm2DxlnD6Bb+N/RH28ShtSK03KJh9TFOxgZVWu8OdhaxhI9rqFNpvTG2tZMdCgs3llDx8KOT
	5hcFQmAhOlqyYHKwT9o1Ty7l+ie8rUgihliwP2RcuMtOpgJ18/zqH7tJ/C/ZWnO00RSgk4fTjUZ
	KlwGmSOjr8/e+TiLSCSlFiR4BpUjE3Wf1QJ/4DSH+AgBDJh2DcyyYmyO7bn9w83o1WuvkvfYLjd
	F34Ylt3BN2M529x5HfCg5ToHqOBp0heUrHmDC4ZIMHYn0TC3mhBkbfahdULZ2hF+sgGI19MqoNu
	wfPCs4ihIL6CIn8scfvP7aiY/fvTIXGxCZ1CuCnQEKyJEcnbiCqPX1Nmxcic52xhThgi7lc7lP1
	oiuRgzGvNL7s=
X-Received: by 2002:a05:6402:1cc9:b0:6ba:a614:2fa6 with SMTP id 4fb4d7f45d1cf-6baa6145b71mr370609a12.43.1795335926933;
        Sun, 22 Nov 2026 00:25:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2116187a12.37.2026.11.22.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:25:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] usb: misc: onboard_usb_dev: Add Chicony USB2.0 HD UVC WebCam support
Date: Sun, 22 Nov 2026 10:25:11 +0200
Message-ID: <20261122082512.64304-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122082512.64304-1-clamor95@gmail.com>
References: <20261122082512.64304-1-clamor95@gmail.com>
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

The Chicony USB2.0 HD UVC WebCam is built in Asus Portable AiO P1801-T and
attached on the USB controller via integrated Genesys Logic 4-port USB2.0
Hub. Add the support for this device for the power supply and reset.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 0606d405c16f1..f846d7fe331ea 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -565,6 +565,7 @@ static struct platform_driver onboard_dev_driver = {
 /************************** USB driver **************************/
 
 #define VENDOR_ID_BISON		0x5986
+#define VENDOR_ID_CHICONY	0x04f2
 #define VENDOR_ID_CORECHIPS	0x3431
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
@@ -651,6 +652,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 
 static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
+	{ USB_DEVICE(VENDOR_ID_CHICONY, 0x0b354) }, /* Chicony USB2.0 HD UVC WebCam */
 	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6241) }, /* SL6341 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6341) }, /* SL6341 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a1496..10f010fb57c07 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -150,6 +150,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6570", .data = &microchip_usb424_data, },
+	{ .compatible = "usb4f2,b354", .data = &bison_intcamera_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
-- 
2.53.0

