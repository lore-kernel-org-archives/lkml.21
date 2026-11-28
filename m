Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824974;
	b=Up2UyhWZtOYvBUfDLTMFwGYg2VS5V2bVT0fbD1s6l8CmeVyg6jmApsMwC8SnQ48m/QRb
	 H6X2fsQEYeioTXJY3wwziTlPgOmpy5hSQNWNKtgV0fti1ozHkx61ayZWWjj+GrM1r9T/m
	 lT5IEpjlhTE70+gNRYxLvepb9Nbok2aGESfpiZ9l13uDe8wG8RXPAYngNc2NfZbFlf3B4
	 o7zrsOLYO2CC+NnPIzMjKKgsZ6N8YHb4BXqCikUB0Lc5XZguERv3UWkqn6bFr9QoKJm/w
	 HRalG7TOPu8WZTNU8D9KXok5dSvPC+W0jdzPWHQK0XT/PLWXv45q6rGvxLRn5GOjUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tTWe7d/JA8UqJTHQt7KWcT8ojN0qEryOEBsHqx2uc5w=;
	b=0uA2Yz6dpkKyi9eDJ7rdDtcZroSe27NQeS6cWqumICktWS6j2+Ra51bpI+5XjzaAX4xd
	 JzTtYb1mxa7cU8uoReB8+KEv0lI5NPGcKR4TYGMoDaDpdbXlL/4nHIqMcjNIPYNCe09xy
	 IBhApFb+hSOyN/4hS0rVVCkVqhc3g5L2CsBIGOSHj902W+PJDPl9pHI8vYNuseXp/QhO1
	 M0GUGecofqVfUSopbI2s8PV5JgZ9+5/8Q5K6BUvqn0z3GBXD8FtolSU1wEGvaq/CWMiN8
	 hYzhl3zhdJOrvwqylPLqyQjuZw/JFEkDJKxDbpKqWJdmkvgW7FuauUc8yDwuGnWpn9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skotT+C3;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC90E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=skotT+C3
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67da62357acso11380052d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795824973; x=1796429773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTWe7d/JA8UqJTHQt7KWcT8ojN0qEryOEBsHqx2uc5w=;
        b=skotT+C3nKiMFIjYCgLoX+K04+IPDVrfDkzyeoVapCOW/THhiTZiuTWZA5KRtid6Zt
         nxhUap5Z/RKR3IwBjwmq7KSsw8v2egcRhhcySY5i7KAZFykbuuR5FZQcblCQOIyGD2Vj
         fpG9xwsD4r2wgSjMtRB+aPG9EvcKtMpAAyM/1lq59/d6MCCcTJdgr0GOVPORDy0HOBJH
         fG7EAJovTqQXksA+E0iQOtWNXCm8+fg/xZuabTHGu0xp7essix2GnybfW/nzQqF+h1tr
         eniMp1qSB9cHcBcDf3Ng6ubnFvS3x7GASSwrb2p7F7QNB7SJiRmOk7SjBqXL5t3xh6on
         V07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795824973; x=1796429773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTWe7d/JA8UqJTHQt7KWcT8ojN0qEryOEBsHqx2uc5w=;
        b=QMqoLbzcFVXTtl0xcJU41WU9RRRfW8dsiQ1/kV6txz2tIulDVieyZ35iuCDjbtkWxI
         WFBC0nFubzHs1BEl11PQ4F8jUJcgd8yx3oaiYkswX/8BcT//mOMP34W/eKc0SoASO2PL
         YH1KF4EeTywPxVk5cFRJbS7IdB9QQTbo4G2d9db2+NSiYfsZWFWH9E72QLM40bKh/TGH
         P7v0X7YKVkq+uIXumguO1oDEhdm1NEknTAanWNWNaQ9v3Nro8tvy0dibffOioJkuB1lA
         NzMoKEoF6VitJ6FtJZxhScVKgT9O7eAxsLE9SMljsIBm4y1yZuMYdLyfAo/qLm6nmkE+
         QjcQ==
X-Forwarded-Encrypted: i=1; AL+hErEQfGunKmpx1G7aw1qVhuSCgA7H+GkYD/X3Z7GrV7KcRsODKaS2w9q44hi+k/vhwW4Ij7N3hgOkcqoH5X8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zd/YZdsybw+97rS2BCy12CDFTyIpLkEIH+e+/XsXFKVnd/uxD
	TR21ni5619uOZrKJ1bC5g69P73BPEzKEjIJv+iPwf8cufM1il4TM1EMsQuIANQ==
X-Gm-Gg: AZFdTZdO5npIwchM+v+wZGdUJc0i2muxoYXh2yUlp3h4nOwGr/UBcrnDiXn2p6gVN/D
	+xPN8/fkLpUCUgTxFm1WwDcUN++3qh1jt7Ulbn5JOs1jLdtTV0MunP7WApL3FY2KylUAyzMvL66
	vV5DC/RdWJm4+YWwpExszy9Fl6xr1na8E4u6P374YOu/DU5vNfGr1pxz6seV5lXaFNHtPfuCOvv
	NCtps5OhVnKb8uVEQKwoiifd+XIZRS2l00CYE4eWdYbPg9C4GNAZ6pEeAtImIJtHiKYkbCepTQS
	qFmixL9R/WgpKlvGb28UV3LCVQzmFeQyhjfbsXy9AqtlUPqtR/qh5r0MjdRl/nxW5N6ppiGVYYu
	6hutkMDWs/wUNvot8O4q2b9t993TIxCyttXrh7hfPiWDz2HKjC8B6f7V4XVbzzHjo/rrOBbeWiq
	gFfITmniqXBNOKY90UhRUnP2lT40xwitFt4/5NOd6T6l5l3pqL+wiu3J543WvRFjS61hZ+UE/bb
	pJ5WPCnVRLFm4bPx0qLrbGC3A6nqcZqKRhJM6QvcIXthWBESxuWhX0H4h5IfS7vMelho9XAPCoA
	6vUbLb1YMFx+KS0O4hMrmtxmLWlvG2DIK29Ld9c+OqgKC9iVkKXpu5/MDpEEJPqeouM=
X-Received: by 2002:a05:690e:80a:10b0:67d:bcde:a150 with SMTP id 956f58d0204a3-67df448bbd7mr8243684d50.65.1795824972729;
        Fri, 27 Nov 2026 16:16:12 -0800 (PST)
Received: from nerdopolis2.mynetworksettings.com ([2600:4040:5e70:4900:b224:6226:2e9d:e3b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9217efd0637sm74422316d6.42.2026.11.27.16.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:16:12 -0800 (PST)
From: Adam Simonelli <adamsimonelli@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adam Simonelli <adamsimonelli@gmail.com>
Subject: [PATCH v5] USB: serial: visor: add vendor/device IDs for PalmSource devices from inf file
Date: Fri, 27 Nov 2026 19:15:57 -0500
Message-ID: <20261128001557.452362-1-adamsimonelli@gmail.com>
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

PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource 'devices'.

Vendor ID 0x13e8 in the inf file indicates PalmSource as the vendor.

PALMSOURCE_DEVICE_1_ID (0x0600) appears to indicate PalmOS 6.0 Cobalt. No
devices were actually released with PalmOS Cobalt, but a development ROM from
a Tungsten T3 made its way onto the Internet. This ROM can now be loaded and
booted into RAM on a T3, which once loaded, the T3 now presents this deviceid.

PALMSOURCE_DEVICE_2_ID (0xff00) is also defined in the .inf file, but there is
no known device or ROM with this id for PalmSource.

Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
---
Changes since v1:
 * Fix compile error when changing from 
   PALMSOURCE_DEVICES_2_ID to PALMSOURCE_DEVICE_2_ID
Changes since v2:
 * Add note for what changed in v2
Changes since v3:
 * Fix up commit message
Changes since v4:
 * Don't handle PALMSOURCE_DEVICE_2_ID

 drivers/usb/serial/visor.c | 3 +++
 drivers/usb/serial/visor.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
index 5706c46c49c2..b985f9c53e1c 100644
--- a/drivers/usb/serial/visor.c
+++ b/drivers/usb/serial/visor.c
@@ -75,6 +75,8 @@ static const struct usb_device_id id_table[] = {
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
+		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
 		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
@@ -133,6 +135,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
 	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
+	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
 	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
index 622d639ce74e..c99b8b8f999b 100644
--- a/drivers/usb/serial/visor.h
+++ b/drivers/usb/serial/visor.h
@@ -32,6 +32,9 @@
 #define PALM_ZIRE_ID			0x0070
 #define PALM_M100_ID			0x0080
 
+#define PALMSOURCE_VENDOR_ID		0x13e8
+#define PALMSOURCE_DEVICE_1_ID		0x0600
+
 #define GSPDA_VENDOR_ID		0x115e
 #define GSPDA_XPLORE_M68_ID		0xf100
 
-- 
2.55.0

