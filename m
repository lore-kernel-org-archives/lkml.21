Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989801;
	b=k9ZKImfOwoCQu1h4sf4I7vzOGrJ5++Q15y7ooS3hKhaXEXuNDzsf/LXaUPvWjHSw9pkw
	 HeuAY4N0dSLovaPR3pUjpiUx9+eV2t7Gek7v/KXAry3s9Fdc5bjs4IjjnhoeFgqFvZzEj
	 lIIfV28BpMZXM96f4641lWIKTqUSfjhkQYECujPprrXEW5lHyINmqDB2hIEHH65iD6saR
	 YcV04thyHc5nDmwUqRZQkl8QoU2JQuMXE2JdNuGRXwuUodovhL+HSKtOlCQqxiMv7RpLv
	 FdTyft5q0Sef/EHw8p8Y+Tc4FOaAvn5vnNsoVJJltTozQhXvwv7hd6cgb6z+QNfdTHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zs+S5yUZxI5UJIwT47i1hdYSehc6gDMi64/ByZlpHWk=;
	b=Ci1D67gcA0UqhJ+TFkXX+lALDAS6eUPwldVYzXRvq1rqhuMOu8+RoanedJloNodZYaHf
	 P+k424E53ozD0TAUfKMJaMN/P6zzur/VIM+yCDEBmCOsW+g5mmYZNUc524+Iq8tTmwKZ8
	 jp2JFfoX392bgTxazPW6R/rKmm8ny/++iyD7rY7JAM94j3R2o0Ehz97T8izQn6Cqa4xRj
	 Ls/5zJnlJ+vwbOzDou/FKXHU6+u5M8mpdPoN7iss2mc7FJfYIY3IhItiNoEmwl59ZGOrE
	 plOUheszIen7U/S+d99CWWMmZPAwVGEOm9Aut4G1ZX+SAy1nESODCIytbtQnU/NOFCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZxr+Z4p;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063F606A885
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7063F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZxr+Z4p
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a058315c79so349879b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989799; x=1795594599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zs+S5yUZxI5UJIwT47i1hdYSehc6gDMi64/ByZlpHWk=;
        b=gZxr+Z4pgheo+7kFmwAABKxAZp7rf+wrH7LtWfQb7NwXlLIHP50cSPjtM6GF+Mpht+
         lS3qHxwnhb8+BDEEurhuG1DKVnUcyRFKicxJR7bGHAfa5Mbjm6KkLqEjaD/h0S18bpLN
         oFlQafsi/+fPTMoNZMkrFoDb5cnMa6OobgiacEdsUNWlOCOqGQ28PgkrJ1hspDmVICdJ
         N86tmWO6y/W1mlOCct877k+tzM0Ydolrs9e7i5zkfMomPZrJH0PG4mUELq0nmISOxqXI
         VyLDMPHRMjfDJMH4+hxF///A/pNawiQQOLw051Wl0egPpOJ/ZO9MsYvvcDfnfaXMLekn
         RWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989799; x=1795594599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zs+S5yUZxI5UJIwT47i1hdYSehc6gDMi64/ByZlpHWk=;
        b=llBYrtgjQGTD6Pr0YlB5UQs9bz8HZbCsVNX4zDRPWvvvvYURzt9+ymK3D1aRkcmip8
         ld0x2v2DvQxjqvSr0sjRJJXFCt55EaVpcGzPP+Y9RpY5tUPiyDvysgEq4hD/1dlM5foW
         c9OkqfbF7U75lCRnt6w9UwcXilOa1p4d36eVU4RqYQOOFmFxTVQdseuQiupFDsaQx3YX
         Fzhi17baoorYdTnfkWlQWaMU7FB9z+qiWPWVDTykvTnUbaMW6wbP0F8qKgypkXX4c7UN
         di9OfU2GPAQQ+67wzNGwaG+t9NHnFm30ESKVt0Ey42Ar3irSxUFSOD/wXtLP3DVxUk+r
         K99A==
X-Gm-Message-State: APuU4Z+S9eP7aEo1dTi/QEzTP0AlWJlC0aIKs+rKwraUU/9NePEt6tsW
	v04JzxU5kljhiUve2k/IdfXlbQeQbEAcG1t0O/AobNTsM6Gtxv0tun2PAIAfQQ==
X-Gm-Gg: AYBFou1Ik6zo5h/5TIwTXXW0CsZsKhtDJzdemo/DcYvsJrYEGTk6uDu7Z6IA56w55Uy
	fRpHQpsisC1C1wOA+g55g4NTzhH/+1gOWP9e9G+C4wtg4iQgndeAyK7XG957uvUCdhwzHgFJDRD
	fJr3BCdMpqM4RdTwq3r4CJk9yAu0cjiKMTxs3DFWsBLYTzVR+G0l/Mr/xaeVl5/a1B6EU7pkJ7h
	wT0d9jqiegRNJldvYrCqT4ynkWeDlPemrrKzl/eUofhnGGriD43IPXxF5z68SDC0RD058oRoEuu
	ugto7dMq5iG8eFZUCS58xFZfESxEfn7sBB8XGD+08EFeh2QV2+5PsbCH7lCAlHq+x/CLGggHAEZ
	pnIHWXiIOLycaHcpfbhbRHZ6/cb30iAKNuCLkP0Sgz3LRUpI62p8GMxBWH4B8zNTBfkHs529ISQ
	Pbr4RCc4TbCX0bOGwVxHdhKQ5jIUFcdTDX9Ok8f16P7fxRgRphILUl5HOhzZdLSvmHhfUNBLmAJ
	R3tYF5/dVPLzMZjx0AruIjkLN4QL2JuMT8fFu8Msa+20lvvdITz5xTU0iIGV+xtT9x8gv9ekvxy
	Zp377UfrsGggIylWiYwBZ8AtHs07jQjxbl9wVNLHUYAH/U8vAZQHJetidtYzRB44N7rsIxvbHsY
	IDyWvHwsampvo2BBe
X-Received: by 2002:a05:6a20:5491:b0:3f9:3f64:9b99 with SMTP id adf61e73a8af0-3fe97ff1704mr1784713637.58.1794989799379;
        Wed, 18 Nov 2026 00:16:39 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 01/13] mfd: nct6694: Validate the USB endpoints
Date: Wed, 18 Nov 2026 16:16:12 +0800
Message-Id: <20261118081625.2399247-2-a0282524688@gmail.com>
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

The probe reads endpoint[0] of the current altsetting without checking
that the interface describes any endpoint, and the bulk endpoints used
for the command transfers are never validated. A malformed device can
make the driver read past the endpoint array or submit URBs to
endpoints of the wrong type.

The interface exposes several interrupt and bulk endpoints, of which
only EP1 IN, EP2 IN and EP3 OUT carry the command interface, so the
endpoints cannot be looked up by type. Check that the expected
endpoints are present with usb_check_{bulk,int}_endpoints(), and take
the polling interval from the interrupt endpoint actually used.

Define the interrupt endpoint by its number, like the bulk endpoints,
as the pipe macros expect an endpoint number rather than an address.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- Rebased on the current mainline, which allocates with
  devm_kzalloc_obj().

Changes in v9:
- None.

Changes in v8:
- Also validate the bulk endpoints. Keep the fixed endpoint numbers and
  check them with usb_check_{bulk,int}_endpoints() instead of looking
  up the first endpoint of each type, as the interface exposes several
  interrupt and bulk endpoints.
- Take the polling interval from the interrupt endpoint actually used,
  and define it by its number like the bulk endpoints.

Changes in v7:
- New patch.

 drivers/mfd/nct6694.c       | 29 +++++++++++++++++------------
 include/linux/mfd/nct6694.h |  2 +-
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index dabd83b9d455..b7088b2850f7 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -273,13 +273,25 @@ static const struct irq_domain_ops nct6694_irq_domain_ops = {
 static int nct6694_usb_probe(struct usb_interface *iface,
 			     const struct usb_device_id *id)
 {
+	static const u8 bulk_ep_addr[] = {
+		USB_DIR_IN | NCT6694_BULK_IN_EP,
+		USB_DIR_OUT | NCT6694_BULK_OUT_EP,
+		0
+	};
+	static const u8 int_ep_addr[] = {
+		USB_DIR_IN | NCT6694_INT_IN_EP,
+		0
+	};
 	struct usb_device *udev = interface_to_usbdev(iface);
-	struct usb_endpoint_descriptor *int_endpoint;
-	struct usb_host_interface *interface;
 	struct device *dev = &iface->dev;
 	struct nct6694 *nct6694;
+	unsigned int int_pipe;
 	int ret;
 
+	if (!usb_check_bulk_endpoints(iface, bulk_ep_addr) ||
+	    !usb_check_int_endpoints(iface, int_ep_addr))
+		return -ENODEV;
+
 	nct6694 = devm_kzalloc_obj(dev, *nct6694);
 	if (!nct6694)
 		return -ENOMEM;
@@ -318,17 +330,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (ret)
 		goto err_ida;
 
-	interface = iface->cur_altsetting;
-
-	int_endpoint = &interface->endpoint[0].desc;
-	if (!usb_endpoint_is_int_in(int_endpoint)) {
-		ret = -ENODEV;
-		goto err_ida;
-	}
-
-	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
+	int_pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
+	usb_fill_int_urb(nct6694->int_in_urb, udev, int_pipe,
 			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
-			 nct6694, int_endpoint->bInterval);
+			 nct6694, usb_pipe_endpoint(udev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
 	if (ret)
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 6eb9be2cd4a0..a5ad7be47bf9 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -10,7 +10,7 @@
 
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
-#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_INT_IN_EP	0x01
 #define NCT6694_BULK_IN_EP	0x02
 #define NCT6694_BULK_OUT_EP	0x03
 
-- 
2.34.1

