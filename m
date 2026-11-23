Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440054;
	b=kBokrD05AnAkkR9nBc/xT/FSH6o9DwM5frfXorca9ta1qxZ8jmQEmiZrrx8nNJLhVBor
	 ckzY/0/2o9s+DJZdqB0B1pR33jJngObgdBarrgQyTDVwu0ADd7E/oMGUIkhDsvJWesWBp
	 n2Lg9K4iqtLNKnJqOzutZLzM05XtDwY0LIPahnwTAX6Q19XOCeAYTDLB7DDSu0JwQhYio
	 k3IKyLhQ6uDiGMYk5wvx7jkdQkq/zaDdlkQyVIMbHvdediXKdqEDcmYLL4a8xh5vOR6qA
	 MsKvMHF9lW3xo+GkgN1vH3kCw6psPXVI+vX6w2ZDdYpCayS3VNjdm9N3cPQ1XFv11vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uXc58AQIKnSVosQ4y4//VCEnNXKp3+RfnItc2ijL3c4=;
	b=uBhz6Sbioc4W/5BKonHz0+1TWJYrRdVOhwmG/wkQNIxeP/XrhELI4/dvCPDJQrtS0DJL
	 KuR4Phd+SZTdf3hZ3HEZf5IX4Obn37t6PL07aini0NDbBueY1mrgjTfXEGJaHVynBSYhm
	 A1sbZrByiBTGKv87VvWhdaSL0Thf2MIm5jdVQZs37xJvjSL6D7XBGhOIYIfCyCS0gmpUB
	 PjjZQTthcZ5bgA48V9Qi4ZHRPeoIMgPXlqLcJtUnoaD3hvmJNvLVW7T10l1hOdq4/o49z
	 4N9kyGhtXU8oCfw4sUzb0NwvxHmizfZC6RYa76jmA7U2CvAzvU+xJ4OGWdYIS9oW6Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvyf4Xpv;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA80606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA80606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvyf4Xpv
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67dabd38cdfso3545654d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440053; x=1796044853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uXc58AQIKnSVosQ4y4//VCEnNXKp3+RfnItc2ijL3c4=;
        b=cvyf4XpvZlo27c2/FJ+VZi/agROBnMKBPBmWQb+kKyjehWx5R0de6wzFDANUeyoY+U
         xU/FD37tR6++FQV6pE6ouY0j0gW5Otr1AGPtuWt/L5pVD/84Bhbq1lP601BY4N+aNxBg
         racExJRaPCa/+wnVjf/iRxHROMHKT1/2BToEPEtZLI9Szh9GoCBsEKQnBtWFk92wFlJO
         6ubhRH4Gz9JigWOvgZIZXEE6VTI1fstfptJOYez38ejxPSUNmaffKjcwHqa/PToH9Pj0
         yFYHm5e2XCAUUA3Glp2TdKg9QiZAgTigZ4IJYgSASZF1W8HDg8N8SpPr1Xp9tU1hzAyo
         9n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440053; x=1796044853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uXc58AQIKnSVosQ4y4//VCEnNXKp3+RfnItc2ijL3c4=;
        b=gxNG7feOuAfIndP11Zr7wsxkaaq+nm+rvzdjezAyitrDURQr9VUIM1/rwYxfeGUias
         r383LE5KS3OBHiX6cGZRFmhJtWPBkJP4T6XlebIsy235XickxRm4VL6ogywmbZs5H73b
         dhr0BEmP3WE3pGKrIoNhGKgfkKlPoIkZNSIXTMQr1XbfaW7ERoXch5OLqXAf33uDIWy/
         hUcU3kjQ3/UglN+dv6JZxQAJ8FxyHOyUE8yRlYFVbQZEI2YZKC4GCt8YSodbqrD601Y+
         DPrmjLbhsfAhgRpbBiG5BnwHt5itp987Vdoj1XG0QsspTGLUFQEpAhiRklC5Xi9jPcbn
         /UGw==
X-Gm-Message-State: APuU4Z//MDvYSvKxnldIj7PPhNcXsg6COkVP7Y2A0Ab6E3x4EhWjZUrF
	EVkf/5mIjsGfP9PNtQc8ThT527Sx/gkRakWsFMNbCCEjCsNLta6PGk1XiE8/ckW7
X-Gm-Gg: AZFdTZf6vJlKnQGLozpJp7uhFKJTpHRwo2FF89C7l47UzLd9+r27HYZvAZcAMMsdX0P
	RQJLVUi7F+tjem9gSB1Mbcs4jMfqOfBM2MOY2kjlzaTlN+LdptUUMdHVbiW8S5A0xFw0HNML2rh
	B9EbX17FVuHChHpXWeCHyfeAKNhr/1CFXG89jHGmRC0pY9drgRk6dvSYFBIPTpfa6RWlEVYRr4r
	PZfJtUSGBqUEMSduZz/aWe7YnCVT6fWydbhieEO96n9617IIK31pceB0/zgHX1a59WsYxj9Zrmx
	b+GxRDmKPpoUvnG5GsoXucMaL/TjeXM+s3XZxl+iv5e+M5ppbey2sDYEHyGjEzlGyu5VHJXaaLR
	m2nIaOyrYsgAeyKSjk6WYaP/zFAcUwSf2NrCSo72RAeutTN3RpsZlIsSuYmfZOke5p9uhtm9MC/
	MjbJWVr/WLmRs/aP0ovJEIZpdC2Jtie76Rrg6cHxH0Q1hUf6wf78N6vKOUdNnHZiNNcqYA0cRP8
	YzFT0C7cI0NdprbSFj1AFX4UPlp9DyVmHfM115FIOJmYkkM0WdQoHAVtx06q1dDYT48N7V6UqoE
	3TkytTmf31xVN+KB
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id 956f58d0204a3-67df4410b69mr4603962d50.55.1795440053123;
        Mon, 23 Nov 2026 05:20:53 -0800 (PST)
Received: from pc-i7 ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330fe0esm5503938d50.8.2026.11.23.05.20.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:20:52 -0800 (PST)
From: Aaron Ma <mapengyu@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] HID: pulsar: add support for Akko Gaming Mouse
Date: Mon, 23 Nov 2026 21:19:37 +0800
Message-ID: <20261123131937.5473-3-mapengyu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123131937.5473-1-mapengyu@gmail.com>
References: <20261123131937.5473-1-mapengyu@gmail.com>
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

Add USB device IDs for the Compx Akko Gaming Mouse in wired mode
(3554:fb29) and via its 8K wireless receiver (3554:fb2a).

Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
 drivers/hid/hid-ids.h    | 4 ++++
 drivers/hid/hid-pulsar.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 91319aa6516d..47e4a9cecad4 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -75,6 +75,10 @@
 #define USB_VENDOR_ID_AKAI_09E8		0x09E8
 #define USB_DEVICE_ID_AKAI_09E8_MIDIMIX	0x0031
 
+#define USB_VENDOR_ID_AKKO		0x3554
+#define USB_DEVICE_ID_AKKO_WIRED	0xfb29
+#define USB_DEVICE_ID_AKKO_8K_DONGLE	0xfb2a
+
 #define USB_VENDOR_ID_ALCOR		0x058f
 #define USB_DEVICE_ID_ALCOR_USBRS232	0x9720
 #define USB_DEVICE_ID_ALCOR_MALTRON_KB 0x9410
diff --git a/drivers/hid/hid-pulsar.c b/drivers/hid/hid-pulsar.c
index 299baf38a2ff..5133c87b1854 100644
--- a/drivers/hid/hid-pulsar.c
+++ b/drivers/hid/hid-pulsar.c
@@ -14,6 +14,9 @@
  *		- VXE R1 SE+
  *	- VXE
  *		- Dragonfly R1 Pro
+ *	- Akko
+ *		- Gaming Mouse
+ *		- 8K Receiver
  *
  * Copyright (c) 2026 Nikolas Koesling
  */
@@ -59,6 +62,7 @@ enum dev_type {
 	TYPE_KYSONA,
 	TYPE_ATK,
 	TYPE_VXE,
+	TYPE_AKKO,
 };
 
 /* ----- structs ----- */
@@ -756,6 +760,10 @@ static const struct hid_device_id pulsar_table[] = {
 	  .driver_data = TYPE_VXE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_VXE, USB_DEVICE_ID_VXE_DRAGONFLY_R1_PRO_WIRED),
 	  .driver_data = TYPE_VXE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_AKKO, USB_DEVICE_ID_AKKO_WIRED),
+	  .driver_data = TYPE_AKKO },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_AKKO, USB_DEVICE_ID_AKKO_8K_DONGLE),
+	  .driver_data = TYPE_AKKO },
 	{ }
 };
 
-- 
2.55.0

