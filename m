Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989819;
	b=1cfU5wPjTGMhVBgpBm5f9etxWF4pygkMK9RNRj1ftfEFHMrE5a+4IPeF70cbNN+jwrwM
	 4OIQkAdTghyi3GfLyTPJ7LTAdCN6ChvkaApLewON+MdHDxpMo5tjogT+h+MplxTyjHGf6
	 6IroFnS18+H3etCwLgjgxqXnRoKlHt9gtxDN52nqkBuZOt+WCu41FpsBmwD3biHOacKMz
	 /wSfgZFIIDtMjdOuMKieFvwMw8MF0hmV6XyLr8fWAN7QmyKvD2CvNPzbPSWT7x11Kvf/V
	 NHGPkDz5XQg5rADcP/wk4SBIRlyxJEx5s/ramz17D/Myr/z2dBejkeAUl4qh0h5I48A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8UkdvQ/elutxVmTWxE/PrRsX/cImSZ9Y8LDw/ueXcgs=;
	b=NcMmc6982Xjpmk1hqTMXmeKeTCOalmL8CB28dWUoktZf8P5KGVL4uxDSqDm9geSKKL16
	 Q1RYgrSeOZVjocYga9CYgnZlEKFCurhSXGmM3BfZD6gApcjWphlWzvjtdtTqjKDuocukw
	 S5I0olt3IF7n9MSXNYILrhOW3uhksLVZNKRzrtqgpheUhYZk1fZW8IZwL/Jjzu3nZ3AtD
	 aE9BRAYuCCspXEOxen0CWJ5ARwkGGkl0jQgFZd7bgA3Xw2tEjQZUfbfozF6t9flboalFL
	 O1QHSYZ3oiReAc+e9K/UkUB7v44cSVmar1t+SmPYBCa3nQT7ztO2YdMKSo7VYlu2F2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiVUd4cf;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15160A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A15160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiVUd4cf
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so391264b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989819; x=1795594619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UkdvQ/elutxVmTWxE/PrRsX/cImSZ9Y8LDw/ueXcgs=;
        b=KiVUd4cfYiRXUDTZu01wgLmpNULGeZjkU8BMA/1CDffMQQVy5r7jLXrHk2t21gZikO
         Mc/BF1/c7k0yZmG8rxUogUM+Zu99dN+cfiNdKWe4JiQkHZMoBi6dy6nlFEYzgWTNbkZL
         NqUyaF4Y2icSx/sNOAGVVgeUKkTjbxS98N6rsF7q64bkWdLeYJGjtd/5sSeF9QE9tXcF
         +3SQX+eIoDVRLwaah0HyMlqueIm6kc7Jy9IxjgpjM5dudxVW73cynRCHGixjWSh77GuT
         dmuM0UHunIFSP0o01nq0gZ2U3qJgwkbjY4J8wy0vtIU+OwA+ukRNrXOL5Li9W4/064/A
         zZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989819; x=1795594619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UkdvQ/elutxVmTWxE/PrRsX/cImSZ9Y8LDw/ueXcgs=;
        b=bfhRktNn875B+gTUWIsi62DuqlohK2Tg3JOQnePP/bKalUgIZjAhvGMPc9d+m4EuUM
         gv6OO6szZOxYx17O0A3AhcaGAPGJ2jvsCxFbPVxnoFvcYb63SYF7lglW/6szb9pDE3Lw
         yMcBD/+6uCRNEJoxKvOKWVn6jDxvBiwgxpjN8r53h4FQprfI5qtfg7WAtLRiALS3Nspg
         KvkqXsfuDyp01MekT7C/wcLTB+oOnq+/9YNytQtci9odgosG/ZtRyDGGxbv/TbPur2uF
         ytwgEbNX3vLYMrElF4Torq3ol9NTHaAA83xA4kCB3iERcoc0f7Fu1cjpWuw5naiiR6Jv
         lD4g==
X-Gm-Message-State: APuU4Z9D4p+0uBeC6TV9UEC2fhTc7GBCan8yQrVJY8V6lVgeARQd0Na/
	t5AT/3XLjwSi7lG8rDYBsmgl2hQ2/hcqZ9Nd9v05Kc2k0ubOzoUSW1yn
X-Gm-Gg: AYBFou3NTsqCUHiw0MkdCvs4BdtKCvs3ImEc30lXIo2NDt8u0yzskJ07eiTVVgJJAUM
	Cedo8ZLDZDSwvhhkyU0QrcJd6rhOASRfGWfji89DcXeWolb1jd69J0wfoKlXmg8BSUTtNEgZQjh
	4LZeP6DTRYTSrf63rYWXYTavsSf+PC7HHoEac/EN+t418+LdtScwEZSLiqIYIVwpCJAEOFTcATl
	82wFrWVtrYx1p56MTwDRz3APpjKBR89LkUI6b4pJeQWEf6OP8PrNlEF9yDQba7QBMFPlB7j5+29
	2lAAlKPIYpLyyphP7e5mW1uQ2XZ2+Za5JY/HFCcxXgfLuH2DJxoqzHg1L0vtqlYios3NBmZ7RhY
	HSrHg+C8ufNt/Us/xoGcSpB1Js+LrigE4zSILDmbdYzQb73sKoKaREswwVgiZj2zxoAvthYBwaR
	Jkht/SuOs6ZFhdSmGO/VG5+RanO0Dv6AswN7y7MX3d/5GmJ/jZcObnkCQYpfArynGTfDbetU/Rf
	PgzhbAOCA6yatqYBTDpt0QqN2TWRy+xglwbLpdI+LM+iCE0RtB2dQPypLJxMxtoT7CsAGxCqxgL
	n6C5c46fWkQgKIVVF1JxvYdaRMKw7VTxcmxBnBE0KOxt6x2vTiGvdMEh7HEt3TKrIcAdYq47bXD
	SveV34E9faINZ7HHX
X-Received: by 2002:a05:6a00:2e9f:b0:89e:db6c:f199 with SMTP id d2e1a72fcca58-8c5d305331fmr1252703b3a.14.1794989818963;
        Wed, 18 Nov 2026 00:16:58 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:58 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 08/13] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Wed, 18 Nov 2026 16:16:19 +0800
Message-Id: <20261118081625.2399247-9-a0282524688@gmail.com>
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

Add a _usb_ prefix to the USB transport functions, tables and driver
name to mark them as USB specific, in preparation for the core and HIF
transport added in later patches.

Keep nct6694_{read,write}_msg() as static inline wrappers in the shared
header so that the sub-device drivers remain untouched; they are
reimplemented on top of regmap later in the series.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- Reworded the commit message: the wrappers are reimplemented on top of
  regmap rather than removed.

Changes in v8:
- None.

Changes in v7:
- None.

Changes in v6:
- New patch replacing the v5 function-pointer transport abstraction:
  rename the exported I/O functions with an _usb_ prefix and add
  transitional inline nct6694_{read,write}_msg() wrappers in the shared
  header so sub-device drivers stay untouched in this commit.

 drivers/mfd/nct6694.c       | 40 ++++++++++++++++++++-----------------
 include/linux/mfd/nct6694.h | 22 ++++++++++++++++++--
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index e2109deb001d..10d08ab50e16 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -49,7 +49,7 @@ static struct nct6694_usb_data *to_nct6694_usb_data(struct nct6694 *ddata)
 	return container_of(ddata, struct nct6694_usb_data, core);
 }
 
-static const struct mfd_cell nct6694_devs[] = {
+static const struct mfd_cell nct6694_usb_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -85,7 +85,7 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char err_status)
+static int nct6694_usb_err_handling(struct nct6694 *ddata, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
@@ -110,7 +110,7 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
 }
 
 /**
- * nct6694_read_msg() - Read message from NCT6694 device
+ * nct6694_usb_read_msg() - Read message from NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
@@ -121,7 +121,9 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_read_msg(struct nct6694 *ddata,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -169,12 +171,12 @@ int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd
 
 	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
+	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_read_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
 
 /**
- * nct6694_write_msg() - Write message to NCT6694 device
+ * nct6694_usb_write_msg() - Write message to NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer containing the data to be sent
@@ -184,7 +186,9 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_write_msg(struct nct6694 *ddata,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -239,11 +243,11 @@ int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cm
 
 	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
+	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_write_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
 
-static void usb_int_callback(struct urb *urb)
+static void nct6694_usb_int_callback(struct urb *urb)
 {
 	struct nct6694 *ddata = urb->context;
 	__le32 *status_le = urb->transfer_buffer;
@@ -373,7 +377,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
 			 usb_data->int_buf, sizeof(*usb_data->int_buf),
-			 usb_int_callback, ddata,
+			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
@@ -382,7 +386,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	usb_set_intfdata(iface, ddata);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
 		goto err_mfd;
 
@@ -416,20 +420,20 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 	usb_free_urb(usb_data->int_urb);
 }
 
-static const struct usb_device_id nct6694_ids[] = {
+static const struct usb_device_id nct6694_usb_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, 0xFF, 0x00, 0x00) },
 	{ }
 };
-MODULE_DEVICE_TABLE(usb, nct6694_ids);
+MODULE_DEVICE_TABLE(usb, nct6694_usb_ids);
 
 static struct usb_driver nct6694_usb_driver = {
-	.name		= "nct6694",
-	.id_table	= nct6694_ids,
+	.name		= "nct6694-usb",
+	.id_table	= nct6694_usb_ids,
 	.probe		= nct6694_usb_probe,
 	.disconnect	= nct6694_usb_disconnect,
 };
 module_usb_driver(nct6694_usb_driver);
 
-MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_DESCRIPTION("Nuvoton NCT6694 USB transport driver");
 MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index b0c42341185a..24cfe6a03ef0 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -89,7 +89,25 @@ struct nct6694 {
 	struct irq_domain *domain;
 };
 
-int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
-int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_usb_read_msg(struct nct6694 *ddata,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf);
+int nct6694_usb_write_msg(struct nct6694 *ddata,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf);
+
+static inline int nct6694_read_msg(struct nct6694 *ddata,
+				   const struct nct6694_cmd_header *cmd_hd,
+				   void *buf)
+{
+	return nct6694_usb_read_msg(ddata, cmd_hd, buf);
+}
+
+static inline int nct6694_write_msg(struct nct6694 *ddata,
+				    const struct nct6694_cmd_header *cmd_hd,
+				    void *buf)
+{
+	return nct6694_usb_write_msg(ddata, cmd_hd, buf);
+}
 
 #endif
-- 
2.34.1

