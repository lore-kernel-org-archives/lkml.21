Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989806;
	b=j58GYRGH29RBbFlBSdCXp/4djMZTcDMiSeBfMpUBURzGliPaizj7XNiR6DRV/iM+eSGj
	 OZdubJ7YxSYEJxojWzhNI53J1CSrQpmDoBv1WS2nSnXG284JWeInggpkLmRRPbqrO87SN
	 HYzSRY9g0ZWC44OWz5FvkC2HT/SI0xKsuv62MIMAO0Kwt5EU6wiKpDdYdiNSrQEBHKXOc
	 VAYxYZml2rFS2uBC9x85zr9Trq1bMg5FAR7AGIa6xrddZ0h5u7vzqGYNUElo0RS0y8Ykf
	 LdS2WJosyiGalggjZRKkiy3h23HNcwvQyjzvzIZjX98XUC+lX+MJmePOMWNpRXbBqqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XZS0HWcmO8vSHHGVlkrKX1W6ZW4DC/abk2188dcCpzE=;
	b=FH/Uk7w/ejMwew7P6bspSAx3FdSzAL/sYPa7cJZu3yffn3geaNDT8Rsdw9/v3cidwHt9
	 O9rLWYfp0s8BvaoOrmgmmd4/FrXI+irY1/be+hZcBCYyMZb+zoyQGIZ7Sjs2fYyicqUWO
	 EZYxt/ohjXJqUad5LaHwkWn3czL6blRi2bmbWn6iPoHnh346osuYDZHjkoMZyI4byIfpy
	 vCplpT6vtGfFluT2EM5t5rbHNGikPlInBatwrELyygJnat/Cus2xp4M5uAMS15e6wiFnW
	 GtJO5llphgeyYGeh6vsb1IwSh+M5Ra44ah9J97yHGyLwU7cnT1DMXydXj+/OsjEVOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAL4Zdsh;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F192606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F192606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAL4Zdsh
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so355784b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989806; x=1795594606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZS0HWcmO8vSHHGVlkrKX1W6ZW4DC/abk2188dcCpzE=;
        b=AAL4ZdshcfKvuFCtUhM5RZWDmp9Ygh/x1DuNwwKiLqKICe80qHkPmHCxkQEzGPOhb2
         OuTQcfKuWgxlD3Ka23V1wgIuLPZMqIzz02mAtkDR2unyG3Kf8HiF5tDSw4FPRTR1Od7M
         AvFvG1k5pNaSz78zCaDfLio4kWOr6Rc2Z+zAgll0oKI7iBhlgQykTO7pLeKBuol9DHbe
         xE0V2ydg1ksOufRqv2Tan6skXAyuvASXByALZyb+ZCRI+lSFTVP8uTA3l50Qs60PgieO
         bIeIbn2fUzG9P/Igofj9jvOEh9rEUcDA0+OxqWf/K53078atHHI2UUtB3umCM38jU1/6
         inow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989806; x=1795594606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZS0HWcmO8vSHHGVlkrKX1W6ZW4DC/abk2188dcCpzE=;
        b=i5ABS9CYtwJ2qnHYp1NQjz5kbkucPL8hpTUMn/z1ExFVYXsccRtGpRa+5alakb9ejH
         sj55bEXB1j+cJ5iEhh2XfSzyA24TVrsNlXYhqneFwhkpxmaC8P6HwQQ/7XFTkJfdPOM7
         QeygYpUqySPmxQzwU/RjEarWsk9Lhk+9mnec0TLy3mOIUqnfgTrG2xhuNngBTwQ8c31c
         vGqmv2VBRZmU/53e6ZRXJCPYQl5ELc+0yG9YCaDoHRCc1gX6snN1M9JxCitbwNk28uGw
         +rr84IZUXmi9y4jzY7VcT1SgO/zuGJdhlprWqZjHUWWjW5cczFmGnJQkj4jhqHezSdsj
         FOLg==
X-Gm-Message-State: APuU4Z/iUnN3Od6eFRGkwo+Hthtq7iWmz1aM1rofd8vDHDSWZMfcOxzq
	C+0YUmnprBQFhIYz+KTjd5QilZmsDNZD7ZUv6hrBsDe6bF36wyU3rGhI
X-Gm-Gg: AYBFou3CYMxF5s//sPDvfzHfYYmk2uKz+MaKQgUX448dubo+CTHngMQ60fqBJdIf7dQ
	Qbd9yV8Ctwg1pDpjsBfoWznxOC9YQKK24sjb0tIveFOU6TAoVOCvOGsZrQtk+71xpB1q+EBjeiU
	2PSGet0BjLQIUkKHSCpLyozay7dmtsj/e0dfMdX9Mm6PatfXFDJqAc3222CH6YSdcBRM2wlLSW8
	xoCCgbqwkuW11nx2UwEqiE5diCHA5JqZNQIdXOm4FtcBYe8r6DKlPPWQqRtXBRrQAoQ2UJL3BCX
	gnxeT5WYZTP+iJjd3ku6cqsj8Yi7TtCvMD78Hvj/OL5IyyVuEmBzXsI/O4ZdvvD2VFYFvj3bDkK
	l1JSUWd1C86k7OOjbbSD9+FbwQyoISYpqI6hU8CYp71r6zLN4+anFykH19hpdE+6WGVX+QTaNO1
	ugF/V1rQNrTpFdld7jazBwcNEFleg2JDTM23Cyt0ULbG7xveK8gayWxBG76BsB5gsDfSENu6e6u
	oEisW8ql8gRriuUBB6lQuYZP0Pbjm4AYkhLILauGbp2rFoF6PX3+BZNwq450aMfS/XtuYv24/ez
	/XqRU4jugx1ZAlT0mOZQjuiXUzkiAZfTTrRw5CYpZqOeYFXlYYAJgWCrq/EzwWX8PrGrGxM=
X-Received: by 2002:a05:6a21:3a94:b0:3fb:a69:8480 with SMTP id adf61e73a8af0-3fe8c4db153mr1750034637.87.1794989805939;
        Wed, 18 Nov 2026 00:16:45 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:45 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 04/13] mfd: nct6694: Transfer data packets via a dedicated buffer
Date: Wed, 18 Nov 2026 16:16:15 +0800
Message-Id: <20261118081625.2399247-5-a0282524688@gmail.com>
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

The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
drivers embed those buffers in their private data, so they are neither
cacheline aligned nor exclusively owned by the transfer, and mapping
them for DMA can corrupt adjacent fields on non-coherent architectures.

Transfer the data packets through a buffer owned by the transport, and
reject commands exceeding the maximum data length.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- Rebased on the current mainline, which allocates with
  devm_kzalloc_obj().

Changes in v9:
- None.

Changes in v8:
- Moved before the refactoring so it applies to the original driver.
- Renamed xfer_buf to data_buf, len to data_len and
  NCT6694_MAX_PACKET_SIZE to NCT6694_MAX_DATA_LEN.

Changes in v7:
- New patch.

 drivers/mfd/nct6694.c       | 37 +++++++++++++++++++++++++++----------
 include/linux/mfd/nct6694.h |  4 ++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 048de767e543..6b8b951f0166 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -98,8 +98,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 {
 	union nct6694_usb_msg *msg = nct6694->usb_msg;
 	struct usb_device *udev = nct6694->udev;
+	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (data_len > NCT6694_MAX_DATA_LEN)
+		return -EINVAL;
+
 	guard(mutex)(&nct6694->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
@@ -124,17 +128,19 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
+			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != data_len) {
 		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			data_len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, nct6694->data_buf, data_len);
+
 	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_read_msg);
@@ -154,12 +160,17 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 {
 	union nct6694_usb_msg *msg = nct6694->usb_msg;
 	struct usb_device *udev = nct6694->udev;
+	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (data_len > NCT6694_MAX_DATA_LEN)
+		return -EINVAL;
+
 	guard(mutex)(&nct6694->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	memcpy(nct6694->data_buf, buf, data_len);
 
 	/* Send command packet to USB device */
 	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
@@ -168,8 +179,8 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 		return ret;
 
 	/* Send data packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), nct6694->data_buf,
+			   data_len, &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -186,17 +197,19 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
+			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != data_len) {
 		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			data_len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, nct6694->data_buf, data_len);
+
 	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_write_msg);
@@ -315,6 +328,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (!nct6694->usb_msg)
 		return -ENOMEM;
 
+	nct6694->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
+	if (!nct6694->data_buf)
+		return -ENOMEM;
+
 	nct6694->int_buffer = devm_kzalloc_obj(dev, *nct6694->int_buffer);
 	if (!nct6694->int_buffer)
 		return -ENOMEM;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index a5ad7be47bf9..69e4652cf16c 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -19,6 +19,9 @@
 
 #define NCT6694_URB_TIMEOUT	1000
 
+/* Maximum data packet length the firmware accepts in a single command */
+#define NCT6694_MAX_DATA_LEN	0x3F0
+
 enum nct6694_irq_id {
 	NCT6694_IRQ_GPIO0 = 0,
 	NCT6694_IRQ_GPIO1,
@@ -92,6 +95,7 @@ struct nct6694 {
 	struct urb *int_in_urb;
 	struct usb_device *udev;
 	union nct6694_usb_msg *usb_msg;
+	void *data_buf;
 	__le32 *int_buffer;
 	unsigned int irq_enable;
 };
-- 
2.34.1

