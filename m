Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645739;
	b=oySnSvCEKnNiidDJzUJDqYdvOkTjErCDz5RvQv3LEauzObTSK9xBVPg2YiDfFTV6ZH6b
	 +8hbfO9Al9Gxtkb1nnwwNVhDfr/EKa5B1tA+gN3Nzh0U/pRnS+LW7T5QBo7U6dsEVnCRC
	 YVmHnNQwW9pKyQ5mm5RURwU/XPkLjN7oiicEAE1LueHEfM8R4j1UREFv0Gu2/xjgcC8LX
	 xIj9PQByrxueNhLv+756iq19LRJhvVUI3X+9v3E5YtebBamriWqjUnxyem3jXFyJA3M5s
	 NHVRXma4w6/WlDu7LUoB5XSKM9Nz5R8GWi6W4xQ2rbdUGrfXudWp58QsWZYlqJzrUCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sLJgVW+/Vd4As4viT9lUZGKhVy1YU+uNFIGupA5gILQ=;
	b=IZJtBvRPcJOPBv9SDW9bk94veTimkg3GuViGVoS+OOaGZlY/rrSY+V4IcQ0l6ckuU35M
	 9qK+FgosX5BLL64B4gW6qd9Pcpp/eydocGzrZqDD9Cq98hj+A2mQPZXMeedLdkXQ16Mlh
	 WuBvozH230ZFIVvHAaly07eBvooJZTIoDWaofcC9wk0X6JjehRbLnpenFpL1FDjEksvht
	 1ZynK6ZF8mRHYPkHTGn0ubQIJSypD044ARoAcOj2eS8J32B/JRrIo/dwOxeoKhCA7gxb8
	 diAizAudyvXP4lQOHKafbn3yLmI/YzqTOH2/weOt8B83C6/0K3V0nHY41OIjZg5DwMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NYowGDdS;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC408606A68D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC408606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NYowGDdS
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8372725eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645738; x=1796250538; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLJgVW+/Vd4As4viT9lUZGKhVy1YU+uNFIGupA5gILQ=;
        b=NYowGDdSdLeXb0RUxZvRQ51HbdN+GM5GWA4aLQem06pYn+ezmdLGgdGAvEqlJ6ZPxW
         OL5yE1CdnxCY9+AP1eDKUYQ+1D112KINZOyMWLliNlH0RTjlFosYEflHFbBTYKCWSBgW
         9sqi6daSKH1rBfDgDEVyN/d4sc8Knv8r22U2ayMPHn1CldCcTWn8UL49D6pjpJj3tzeG
         Nc+S4sMCcnJoac4k78L6ge3ySK3fCOAWl4AAcPoUYF8gx01CAiXyvCRZOHPxkRoBgLwC
         59VmQcfK8+Iz3zJW2+HjpZD3ZaXzc7bEyLlEVwjejQyUpJlELsfN94bzSvvPQAPviclL
         oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645738; x=1796250538;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLJgVW+/Vd4As4viT9lUZGKhVy1YU+uNFIGupA5gILQ=;
        b=2FqUqJwfQ20/C60YAnafHyNJorqeRWXGImEDQErrDhhBOnmYNQ65/zmgkqj5nje0lQ
         ORm/UooNxGaWJTje7egZGhezmSsqFwXSQWL42W6Lu5zEERBegqrQcr0UAcYPep/PIAXL
         zdG6O0j69HK+RCJDLDlNNM/a4KinJ0PxmCYA30Oau6QYdM9y9F2BJglHyReo7+0HchiH
         nwN4/dhFhCOWVuzVYglhEszp4C7c4KpPk2MajDdUci/1Fz8uylJXMDbxAfAjgg7ich5A
         OK+QRoZHMIlys1SvlCV6pWgk64gw0d1mcFn6tG9g6UrEOTWcTcIbUylS/aNVV3w/taFO
         nLVw==
X-Forwarded-Encrypted: i=1; AL+hErGj7rG1N0J14Gv7Z37U1pTqZxn+QXAOorznCuO0KnO2TOyrSRAwcBgKU7+d2HGSknC9zcXLTqJhGy1nOGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z98kL+xHNzbBy9lTe3iCRY6zQv/qNoPoYXYnAWOjwKp1C34rCJR
	fI9th4hBzSdWqJ/ZoTKfi3FTfigbusHtBRuygTfVAk7qBS2uUnf3lNYFgMrac3uKz+SpC3R48ch
	ssA==
X-Received: from dycnm14.prod.google.com ([2002:a05:7300:d18e:b0:386:2134:b328])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:1c1b:b0:386:9d31:2d18
 with SMTP id 5a478bee46e88-3869d313208mr14179933eec.0.1795645737640; Wed, 25
 Nov 2026 14:28:57 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:28 +0000
In-Reply-To: <20261125222828.1452483-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222828.1452483-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-3-elkin@google.com>
Subject: [PATCH 2/2] usb: misc: usbio: validate endpoint maxpacket sizes in usbio_probe()
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

usbio_probe() allocates ctrlbuf, txbuf, and rxbuf directly from the
USB descriptor maxpacket sizes without verifying that each buffer can
hold its packet header. A malformed USB descriptor with a smaller
maxpacket size causes unsigned underflow in length checks and buffer
overflows in usbio_ctrl_msg() and usbio_bulk_msg().

Reject devices whose control or bulk endpoint maxpacket sizes are
smaller than sizeof(struct usbio_ctrl_packet) or
sizeof(struct usbio_bulk_packet), respectively.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/usb/misc/usbio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 6142a32c18a9..c9f22b600333 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -591,6 +591,8 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	usbio->ctrl_pipe = usb_endpoint_num(&udev->ep0.desc);
 	usbio->ctrlbuf_len = usb_maxpacket(udev, usbio->ctrl_pipe);
+	if (usbio->ctrlbuf_len < sizeof(struct usbio_ctrl_packet))
+		return -ENODEV;
 	usbio->ctrlbuf = devm_kzalloc(dev, usbio->ctrlbuf_len, GFP_KERNEL);
 	if (!usbio->ctrlbuf)
 		return -ENOMEM;
@@ -609,6 +611,8 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 		usbio->txbuf_len = 63;
 	else
 		usbio->txbuf_len = usb_endpoint_maxp(ep_out);
+	if (usbio->txbuf_len < sizeof(struct usbio_bulk_packet))
+		return -ENODEV;
 
 	usbio->txbuf = devm_kzalloc(dev, usbio->txbuf_len, GFP_KERNEL);
 	if (!usbio->txbuf)
@@ -620,6 +624,8 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 		usbio->rxbuf_len = 63;
 	else
 		usbio->rxbuf_len = usb_endpoint_maxp(ep_in);
+	if (usbio->rxbuf_len < sizeof(struct usbio_bulk_packet))
+		return -ENODEV;
 
 	usbio->rxbuf = devm_kzalloc(dev, usbio->rxbuf_len, GFP_KERNEL);
 	if (!usbio->rxbuf)
-- 
2.56.1.839.g22a8290db9-goog

