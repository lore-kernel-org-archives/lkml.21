Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989830;
	b=jfxaJwcU3G3hFZI86Gvm/s6NBAcgY1f9V8qSWfz8oszWQEGF/TtlxpBXHUwTBCs3pI4A
	 EFH7ccZTSrPfZPSIXil50tASNIAWCS9F6U3/8wAhJ61dDG9PoB6tJBH9rTf2lLYLcj/3z
	 JJ9qKDmn7SDQwvgnBrSJAjZJ5PBy8cC/HmwQqwszeeknlIFl7TY6FTr5Cj5TGuXwDlpQS
	 6QHAXOM9u683aQOuSxE+I2pQkoRfeGN4gVox1fcUAEyos7mBo1h4tz2VbU+/iJOi3ahNG
	 rr5zVsHneiwiHutMnpdpkxdX41Wc/z0PPSguBYSlex/0RqVcHMt1qsWrSq0rysHeRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XwiQSknzuG3mbRqQRgEl+28sKookmUItrsarjIqLkOU=;
	b=Arf/LB3Uya8ILyffO9OyDjGCR8nVA68EZd+JrNTYgXx0woIZPc6KUFwoyPOzI+LU5lvM
	 tAftrvf0/cLDBnNv1OiNvFPBwfH3EaEuErYW0kGuy9SXpTGRNJlxcOQcy9yv0paoVx0jg
	 LCq/p2Lp/EBvfhBiOattLCrNoCP3/zJLXstE4EXeFte7tsd0owc5JFSigJON4tKR1ai6D
	 HKsz0IWHT84u0wdtfmuXu7K7gmGdYjaKWDEZ8QZVnVl34SxbBWHlJY4hTcGxTJeyCBJny
	 rAZqP4xM03NUoya+22Rri/y20oAHuAM3SViIH98nSsI5pb2u2PZVk1iF1fz/Cbr/b+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbZO8Exz;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F560A2628
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5F560A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbZO8Exz
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b2f59de176so612166b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989830; x=1795594630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwiQSknzuG3mbRqQRgEl+28sKookmUItrsarjIqLkOU=;
        b=XbZO8ExzavDbg1mRyhK8z088k6pjSc9z2l6J/zd+bRx0Q/ND9/3gfzvnY4oxRJXll4
         D9HrMIOHRkP1OYEy06SPJ0mn9I0Em9aRg9pCa90tnxAoF6OwgcMa97+pE9NVmfmchKpl
         q43CK6UQa4BzCXnhefQubFceV9QfMrKCpX/zuojh1NRxNI8hqsnLWKIXK9UoVW8xzltP
         GYa1STY/TuC3Ue45+rRpoQqF5/STwAI1K/h0rPNOsF24TtWh0Y6mO5Un9PpWxla79gkf
         v57t2NJSc8fnfVzgfDof2GG5MMLgoNL9N/xGGkTmK99JSqManKScya8DqjZkV+ebuul7
         pMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989830; x=1795594630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwiQSknzuG3mbRqQRgEl+28sKookmUItrsarjIqLkOU=;
        b=Gn9slBHvr+7h2Czn1drXLLJGnkaGnln3ky6l+Q1AhvzOibNNH/LiQ7Ps5/GRQXrHQ4
         ureH0tGQIQPHAvGejIaxN3kdtleEX5D6PO2gb49eUy0ffugmlR/ZYYznX7DDtWx11oVm
         BuR0kkGvW7ZRtqVX38DgxR7/ynXPiPkZ3yTKPSsMrx67mJRSY5E+7cyOkw0ujofI1a+F
         AE1MDKs6kFR/IXiNDTBxF5UXnuHW6FZnmF6I4UIxA1OS8jjxUFGchwBb3NA+8qIKXTjr
         5H0iKGq6HqFPpnu0tuaW6PY2puYDRe9RDBA8XEgLfUe44TzHB7uvlIbjG10F2zHhtDV9
         tQGA==
X-Gm-Message-State: APuU4Z+arUL/l+JQych/j2Is9zOxWl77mK/x0xE2Y6J1QPM6knKS9A9b
	XqdkPp4i+osfe3SZykKsGttjnJukMcaO7D9OnbBJf+0kpuccaxOIf9WZ
X-Gm-Gg: AYBFou02AFYPU9LiqOxnSmuZHdpMLz8mm63hBAiukZ+NIg2Mk33RZDV6qtvFuj8sRz7
	98N5jEhiLuza9zVU9MouvB6pQIvKNFpGJwDsYPh1NYuCxdW622NDPqJ9MT8WcnPhDDKBxoQe6I1
	VIDY9wEpxGkrtdHOLDKE+TaTatQ0lhofNYJr7CBKNhV3XJPHH/MWwl3w9zEfIwH3SjzNr7A3y3o
	QQsb5jxfwvEd7X5LJ+S8c3XDnMJaFXqd7dkeoIQO15Ig+3U6KgsmVkQZUEycD/iGMcdfIi3V1Z1
	7ROMb0+8BH9qiv6pOMttX9iyVzyRNNTYcb30ucjyE0KZV+lz2jttR5wUOoVefAHwktWVv9yJqDw
	2TzlOxSok3n1eOly7tgUUhM3j4jdOcdcXHeMIN6PnvK+mkpSDVUWd4Iv4mhsMFBdbNMqOUxORI1
	gICUVdozjxn3ITBKPSIfONmyzCT39XerYM4p+nfix+oJYW7ugVVRiOYuiCfrM7ohVHHdm46AWAB
	NM6ek5OSH1aL+afnNJlDPId9PDt4IQIihJTUdLZ+5St8h0iuEjgoCKbo52OI9Dkk5YcKVuZI2BK
	aay9i4NW5zaMKBBCKMNbYEtpVXikaeci4SmfBAqtgptD2N4m99/6ULrChx7RAnNi2s/S1LA=
X-Received: by 2002:a05:6a20:7f8e:b0:3e2:278c:297a with SMTP id adf61e73a8af0-3fe86fce08emr2380474637.6.1794989829834;
        Wed, 18 Nov 2026 00:17:09 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:17:09 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 12/13] mfd: nct6694: Add a Kconfig symbol for the USB transport
Date: Wed, 18 Nov 2026 16:16:23 +0800
Message-Id: <20261118081625.2399247-13-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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

From: Ming Yu <a0282524688@gmail.com>

Now that the sub-device drivers only access the device through regmap,
the core no longer depends on USB.

Build the USB transport under a new MFD_NCT6694_USB symbol and keep
MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
that existing configurations keep the USB transport enabled.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- New patch. Split out of v7 "Rename driver to nct6694-usb and update
  Kconfig"; MFD_NCT6694 remains the user visible core symbol and
  MFD_NCT6694_USB defaults to it to keep existing configurations
  working.

 drivers/mfd/Kconfig  | 20 ++++++++++++++++----
 drivers/mfd/Makefile |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3c59ef8768e2..8b969dc37312 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1183,18 +1183,30 @@ config MFD_NCT6694
 	tristate "Nuvoton NCT6694 support"
 	select MFD_CORE
 	select REGMAP
-	depends on USB
 	help
-	  This enables support for the Nuvoton USB device NCT6694, which shares
+	  This enables support for the Nuvoton NCT6694, which shares
 	  peripherals.
 	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
 	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
 	  PWM, and RTC.
-	  This driver provides core APIs to access the NCT6694 hardware
-	  monitoring and control features.
+	  This driver provides the core support shared by the transport
+	  interface drivers, at least one of which must be enabled.
 	  Additional drivers must be enabled to utilize the specific
 	  functionalities of the device.
 
+config MFD_NCT6694_USB
+	tristate "Nuvoton NCT6694 USB interface support"
+	depends on MFD_NCT6694 && USB
+	default MFD_NCT6694
+	help
+	  This enables support for the Nuvoton NCT6694 connected through
+	  its USB interface. The driver uses USB bulk transfers to send
+	  commands to the device firmware and an interrupt transfer to
+	  receive its interrupt status.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called nct6694-usb.
+
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
 	depends on SPI_MASTER
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 20a5de726071..2efffab949c9 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -125,7 +125,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
+obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
-- 
2.34.1

