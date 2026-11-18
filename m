Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989817;
	b=3Sj9uop9S5K9Ty11WXhOLfPyNZaKFA+N4v0K/9qD4iU8xstE+zGWH/OSCV4ezZPRMjTm
	 CCz/7GKmKHdBluYr/if74seVg8+W1dXlKD4q5JEnki/h8gqWW6AGQMGr49T9CagwQ4eC2
	 21wS758+UdbGAW5Abie6GMWFtJnw1VV/idoislNMw95PleFtBEpenKTgE2Lh2KqIF8Idy
	 7wiAbsdWdinqeRy9mbdJopqWGrjr2WCUZTEq9KbY0Z6q8adlkqSWEr5BalZm+EiNsn01E
	 C61AE/trYozGuhwjiWm5bhGLsT8KovaY9kHHDgVkxZ1ejdq9g2VjeByDmS+FCis9Wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XJ/5yCTIwjwL8htCl9iM0hVJlcLh5sTamCTEiTZxZck=;
	b=E/AhnLYNwSqF10XpVjIvm+eToWFv2xmkh4ui0Nfp5tpzR4HBcijwSZy0eTsi7t0IQlO2
	 b+kOKPLpOfj/kh0Hl3RS2ARL+1+RKUhvGP6YI9WF4nY90WagKco3Tijhib4GDOJM784Cm
	 b3G5T8krZ89o9tbiYnTVXdcNJonHwB/pE2keaebkyoas0ZXbUmivm05DuR5IFEyeW7Gh0
	 MAqoTnnNPyjl7yyZzoTWK/5i38mtpQgpo27Q6G+P5ap2DuhR/Th4keVDEBur7QPdASGjV
	 22jMOJ/L+TICcLh4Zgdkt7hm78yV1qQsa+C896MviM13bTm8ef7T+a5I5CWGMs/oGCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o4kp/I0b";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D13260A381A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D13260A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4kp/I0b
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so355933b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989816; x=1795594616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJ/5yCTIwjwL8htCl9iM0hVJlcLh5sTamCTEiTZxZck=;
        b=o4kp/I0b8kDAaIPFtMbnM0uJ7P8kVoiOVl3127hV/lIsdBxtx5cgLhZFW9TveceIC6
         9uMvonsR/ZarCNNwNH5HfagiR1KPGHcTkY5GurAT+kLs1ozwAw4h2PpTXgzBIGQ9H+zZ
         +auyBNp/sU/fWvm1gQxOk53xrIZCy6HEUNXblPZ+EAVd54SKIb5XtdMdXw5lNPA8DL8T
         5FZ4NWb5nDngNV5XrqH3ZvOjgYMtfLAjYASHXm/PIyte1lLNc6AsQ0W+YN6WOX5tOWRU
         pvC6svqoiFKGy+Mf6ll7BcU9U4kLm7yNrMZP/jGk/Ij1G2qcFMsYmEXXsmN/Z6kJICcj
         S+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989816; x=1795594616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJ/5yCTIwjwL8htCl9iM0hVJlcLh5sTamCTEiTZxZck=;
        b=YASqCF5dK+DHxpxnfqTo3BNscBoEQj2T7+gTbkRvvRaedQuX8PNPZI4hkrl6zNZ4Hx
         5ynwk5maHgViJ6oHQFpIJ43G/lf/CiE2Gz5XEjBQNlEjeOsKltIKYoRw11sB2ZScnPnv
         IwTzQDYV7cuU0ZTNVKe5hK1giRyUhpX80URd9+vGz0XzwHdU/gmtuMt0C371eZoRol3F
         cZDV5DXr2I8SIvxD2vhXfRS2jEz102TKOzAQjJjgB2JUHbAd8kX8SgoX06rbcBuIy9nD
         rWbR2Cy8pVNj2OmAHTTJDcCiGzgi2ZktyUcNmpYCu4o4MShZkONZqu7KEYqBOAJTxxnd
         UBAg==
X-Gm-Message-State: APuU4Z9BxjLuEJzAkTTKRdhAfROMDaYgnYO90G/2P/ezAue3DrBSH2by
	yohogHePJ97gqoSFGYzHaVuUSxE5EcfcJu6drEIAPacEiXkK6Jeeh/4L
X-Gm-Gg: AYBFou1mUCd47d3xnxD9h7/OPJq63GZZf2rbLBc3hEhFcy+zvw638tY3xLRlXr+CIPx
	q+QPuOJpTn/ooPsFP8SJ57/Iy31Sg+T++f3aQ9xAzwUDqPFNtg7qWYFTES0esRoM5dAoChp/Gqi
	VZHXCeCDZTZ8m/Qn5MJS3huxAIT5UJy1V+vGI9a84qtSJki6JamQLajOoelT08/Kiptd78zvbhF
	sh538vsPyT5GmUJ4yXoi7KLbYNpP35h2Vx4MpveJTxA2JfdjyiQQzOE4oULxLo8MdD8j+0PfqvC
	dtC51lRE6JyRf+yrjkzreh+WYxamG9sfwqJHcbGDaaKdsAVrDcLO0y8/w9MKp1uQUr/flOJS6pz
	BCeCGbOamDl4mdoOTz7CyFjQNxTG2zH7sVSnbWRT1EidAxM45N4yhtmFdq1B2A7Zg+HdxByprtA
	hnEB6yAfs/HTBZ2QqKoUuzk//HcQRWucbNKGkF1LCGI2j6osS7rgzFK6SJcY8D2dXhYijiqiiew
	BIKw59W3l/bsOQGTC2bWUlVXLEsiQqQRr8u0dsIDxJ8g0cDVjZAAdvJDeLQXDloViOKnsdpB6JM
	SidxGKpSOkMpFiloakjuA5ravBJ88mTHpsLt05El/Yj2I/notm0Cfw0B+AOHbByG2i4RoPw=
X-Received: by 2002:a05:6a00:178b:b0:8a0:20e0:b11f with SMTP id d2e1a72fcca58-8c5d2a74bffmr1464427b3a.20.1794989816311;
        Wed, 18 Nov 2026 00:16:56 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:55 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 07/13] mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
Date: Wed, 18 Nov 2026 16:16:18 +0800
Message-Id: <20261118081625.2399247-8-a0282524688@gmail.com>
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

Separate the USB transport fields from the core nct6694 structure into
a new nct6694_usb_data structure, which embeds struct nct6694 and is
retrieved with container_of(). USB-only definitions are moved from the
shared header into the USB driver.

While at it, use consistent names for the USB device, the buffers and
the core structure.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- Rebased on top of "mfd: nct6694: Drop the unused IRQ enable mask".
- Allocated usb_data, hdr_buf and int_buf with devm_kzalloc_obj().

Changes in v9:
- None.

Changes in v8:
- Embedded struct nct6694 in nct6694_usb_data and dropped the priv
  pointer.
- Renamed udev to usb_dev, udata to usb_data, usb_msg to hdr_buf,
  int_buffer to int_buf, int_in_urb to int_urb, and nct6694 to ddata.

Changes in v7:
- None.

Changes in v6:
- None.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 drivers/mfd/nct6694.c       | 229 +++++++++++++++++++++---------------
 include/linux/mfd/nct6694.h |  26 +---
 2 files changed, 136 insertions(+), 119 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 27e9effd68a7..e2109deb001d 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -21,6 +21,34 @@
 #include <linux/slab.h>
 #include <linux/usb.h>
 
+#define NCT6694_VENDOR_ID	0x0416
+#define NCT6694_PRODUCT_ID	0x200B
+#define NCT6694_INT_IN_EP	0x01
+#define NCT6694_BULK_IN_EP	0x02
+#define NCT6694_BULK_OUT_EP	0x03
+
+#define NCT6694_URB_TIMEOUT	1000
+
+union __packed nct6694_usb_hdr {
+	struct nct6694_cmd_header cmd_header;
+	struct nct6694_response_header response_header;
+};
+
+struct nct6694_usb_data {
+	struct nct6694 core;
+	struct mutex access_lock;
+	struct usb_device *usb_dev;
+	struct urb *int_urb;
+	union nct6694_usb_hdr *hdr_buf;
+	void *data_buf;
+	__le32 *int_buf;
+};
+
+static struct nct6694_usb_data *to_nct6694_usb_data(struct nct6694 *ddata)
+{
+	return container_of(ddata, struct nct6694_usb_data, core);
+}
+
 static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -57,22 +85,22 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char err_status)
+static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
 		return 0;
 	case NCT6694_NOT_SUPPORT_ERROR:
-		dev_err(nct6694->dev, "Command is not supported!\n");
+		dev_err(ddata->dev, "Command is not supported!\n");
 		break;
 	case NCT6694_NO_RESPONSE_ERROR:
-		dev_warn(nct6694->dev, "Command received no response!\n");
+		dev_warn(ddata->dev, "Command received no response!\n");
 		break;
 	case NCT6694_TIMEOUT_ERROR:
-		dev_warn(nct6694->dev, "Command timed out!\n");
+		dev_warn(ddata->dev, "Command timed out!\n");
 		break;
 	case NCT6694_PENDING:
-		dev_err(nct6694->dev, "Command is pending!\n");
+		dev_err(ddata->dev, "Command is pending!\n");
 		break;
 	default:
 		return -EINVAL;
@@ -83,7 +111,7 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
 
 /**
  * nct6694_read_msg() - Read message from NCT6694 device
- * @nct6694: NCT6694 device pointer
+ * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
  *
@@ -93,60 +121,61 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
 {
-	union nct6694_usb_msg *msg = nct6694->usb_msg;
-	struct usb_device *udev = nct6694->udev;
+	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
+	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
+	struct usb_device *usb_dev = usb_data->usb_dev;
 	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
 	if (data_len > NCT6694_MAX_DATA_LEN)
 		return -EINVAL;
 
-	guard(mutex)(&nct6694->access_lock);
+	guard(mutex)(&usb_data->access_lock);
 
-	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
-	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
+	memcpy(&hdr->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	hdr->cmd_header.hctrl = NCT6694_HCTRL_GET;
 
 	/* Send command packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
-			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
+			   &hdr->cmd_header, sizeof(*hdr), &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	/* Receive response packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
-			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   &hdr->response_header, sizeof(*hdr), &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != sizeof(msg->response_header)) {
-		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
-			sizeof(msg->response_header), rx_len);
+	if (rx_len != sizeof(hdr->response_header)) {
+		dev_err(ddata->dev, "Expected response length %zu, but got %d\n",
+			sizeof(hdr->response_header), rx_len);
 		return -EIO;
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
-			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   usb_data->data_buf, data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	if (rx_len != data_len) {
-		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
+		dev_err(ddata->dev, "Expected received length %d, but got %d\n",
 			data_len, rx_len);
 		return -EIO;
 	}
 
-	memcpy(buf, nct6694->data_buf, data_len);
+	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_read_msg);
 
 /**
  * nct6694_write_msg() - Write message to NCT6694 device
- * @nct6694: NCT6694 device pointer
+ * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer containing the data to be sent
  *
@@ -155,67 +184,68 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
 {
-	union nct6694_usb_msg *msg = nct6694->usb_msg;
-	struct usb_device *udev = nct6694->udev;
+	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
+	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
+	struct usb_device *usb_dev = usb_data->usb_dev;
 	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
 	if (data_len > NCT6694_MAX_DATA_LEN)
 		return -EINVAL;
 
-	guard(mutex)(&nct6694->access_lock);
+	guard(mutex)(&usb_data->access_lock);
 
-	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
-	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
-	memcpy(nct6694->data_buf, buf, data_len);
+	memcpy(&hdr->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	hdr->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	memcpy(usb_data->data_buf, buf, data_len);
 
 	/* Send command packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
-			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
+			   &hdr->cmd_header, sizeof(*hdr), &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	/* Send data packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), nct6694->data_buf,
-			   data_len, &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
+			   usb_data->data_buf, data_len, &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	/* Receive response packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
-			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   &hdr->response_header, sizeof(*hdr), &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != sizeof(msg->response_header)) {
-		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
-			sizeof(msg->response_header), rx_len);
+	if (rx_len != sizeof(hdr->response_header)) {
+		dev_err(ddata->dev, "Expected response length %zu, but got %d\n",
+			sizeof(hdr->response_header), rx_len);
 		return -EIO;
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
-			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   usb_data->data_buf, data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	if (rx_len != data_len) {
-		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
+		dev_err(ddata->dev, "Expected transmitted length %d, but got %d\n",
 			data_len, rx_len);
 		return -EIO;
 	}
 
-	memcpy(buf, nct6694->data_buf, data_len);
+	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_write_msg);
 
 static void usb_int_callback(struct urb *urb)
 {
-	struct nct6694 *nct6694 = urb->context;
+	struct nct6694 *ddata = urb->context;
 	__le32 *status_le = urb->transfer_buffer;
 	u32 int_status;
 	int ret;
@@ -239,14 +269,14 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_domain_irq_safe(nct6694->domain, irq);
+		generic_handle_domain_irq_safe(ddata->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
 resubmit:
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret)
-		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
+		dev_warn(ddata->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
 static const struct irq_chip nct6694_irq_chip = {
@@ -256,9 +286,9 @@ static const struct irq_chip nct6694_irq_chip = {
 
 static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
 {
-	struct nct6694 *nct6694 = d->host_data;
+	struct nct6694 *ddata = d->host_data;
 
-	irq_set_chip_data(irq, nct6694);
+	irq_set_chip_data(irq, ddata);
 	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
 
 	return 0;
@@ -287,9 +317,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 		USB_DIR_IN | NCT6694_INT_IN_EP,
 		0
 	};
-	struct usb_device *udev = interface_to_usbdev(iface);
+	struct usb_device *usb_dev = interface_to_usbdev(iface);
+	struct nct6694_usb_data *usb_data;
 	struct device *dev = &iface->dev;
-	struct nct6694 *nct6694;
+	struct nct6694 *ddata;
 	unsigned int int_pipe;
 	int ret;
 
@@ -297,56 +328,59 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	    !usb_check_int_endpoints(iface, int_ep_addr))
 		return -ENODEV;
 
-	nct6694 = devm_kzalloc_obj(dev, *nct6694);
-	if (!nct6694)
+	usb_data = devm_kzalloc_obj(dev, *usb_data);
+	if (!usb_data)
 		return -ENOMEM;
 
-	nct6694->usb_msg = devm_kzalloc_obj(dev, union nct6694_usb_msg);
-	if (!nct6694->usb_msg)
+	usb_data->hdr_buf = devm_kzalloc_obj(dev, *usb_data->hdr_buf);
+	if (!usb_data->hdr_buf)
 		return -ENOMEM;
 
-	nct6694->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
-	if (!nct6694->data_buf)
+	usb_data->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
+	if (!usb_data->data_buf)
 		return -ENOMEM;
 
-	nct6694->int_buffer = devm_kzalloc_obj(dev, *nct6694->int_buffer);
-	if (!nct6694->int_buffer)
+	usb_data->int_buf = devm_kzalloc_obj(dev, *usb_data->int_buf);
+	if (!usb_data->int_buf)
 		return -ENOMEM;
 
-	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!nct6694->int_in_urb)
+	usb_data->int_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!usb_data->int_urb)
 		return -ENOMEM;
 
-	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
-						   &nct6694_irq_domain_ops,
-						   nct6694);
-	if (!nct6694->domain) {
+	ddata = &usb_data->core;
+
+	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						 &nct6694_irq_domain_ops,
+						 ddata);
+	if (!ddata->domain) {
 		ret = -ENODEV;
 		goto err_urb;
 	}
 
-	nct6694->dev = dev;
-	nct6694->udev = udev;
+	ddata->dev = dev;
+	usb_data->usb_dev = usb_dev;
 
-	ida_init(&nct6694->gpio_ida);
-	ida_init(&nct6694->i2c_ida);
-	ida_init(&nct6694->canfd_ida);
-	ida_init(&nct6694->wdt_ida);
+	ida_init(&ddata->gpio_ida);
+	ida_init(&ddata->i2c_ida);
+	ida_init(&ddata->canfd_ida);
+	ida_init(&ddata->wdt_ida);
 
-	ret = devm_mutex_init(dev, &nct6694->access_lock);
+	ret = devm_mutex_init(dev, &usb_data->access_lock);
 	if (ret)
 		goto err_ida;
 
-	int_pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
-	usb_fill_int_urb(nct6694->int_in_urb, udev, int_pipe,
-			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
-			 nct6694, usb_pipe_endpoint(udev, int_pipe)->desc.bInterval);
+	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
+	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
+			 usb_data->int_buf, sizeof(*usb_data->int_buf),
+			 usb_int_callback, ddata,
+			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
-	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
 	if (ret)
 		goto err_ida;
 
-	usb_set_intfdata(iface, nct6694);
+	usb_set_intfdata(iface, ddata);
 
 	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
 	if (ret)
@@ -355,30 +389,31 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	return 0;
 
 err_mfd:
-	usb_kill_urb(nct6694->int_in_urb);
+	usb_kill_urb(usb_data->int_urb);
 err_ida:
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
-	irq_domain_remove(nct6694->domain);
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
 err_urb:
-	usb_free_urb(nct6694->int_in_urb);
+	usb_free_urb(usb_data->int_urb);
 	return ret;
 }
 
 static void nct6694_usb_disconnect(struct usb_interface *iface)
 {
-	struct nct6694 *nct6694 = usb_get_intfdata(iface);
-
-	mfd_remove_devices(nct6694->dev);
-	usb_kill_urb(nct6694->int_in_urb);
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
-	irq_domain_remove(nct6694->domain);
-	usb_free_urb(nct6694->int_in_urb);
+	struct nct6694 *ddata = usb_get_intfdata(iface);
+	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
+
+	mfd_remove_devices(ddata->dev);
+	usb_kill_urb(usb_data->int_urb);
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
+	usb_free_urb(usb_data->int_urb);
 }
 
 static const struct usb_device_id nct6694_ids[] = {
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index d752708c2a8d..b0c42341185a 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -2,7 +2,8 @@
 /*
  * Copyright (C) 2025 Nuvoton Technology Corp.
  *
- * Nuvoton NCT6694 USB transaction and data structure.
+ * Nuvoton NCT6694 core definitions shared by the transport driver
+ * and the sub-device drivers.
  */
 
 #ifndef __MFD_NCT6694_H
@@ -17,17 +18,9 @@
 #define NCT6694_RPT_MOD		0xFF
 #define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
 
-#define NCT6694_VENDOR_ID	0x0416
-#define NCT6694_PRODUCT_ID	0x200B
-#define NCT6694_INT_IN_EP	0x01
-#define NCT6694_BULK_IN_EP	0x02
-#define NCT6694_BULK_OUT_EP	0x03
-
 #define NCT6694_HCTRL_SET	0x40
 #define NCT6694_HCTRL_GET	0x80
 
-#define NCT6694_URB_TIMEOUT	1000
-
 /* Maximum data packet length the firmware accepts in a single command */
 #define NCT6694_MAX_DATA_LEN	0x3F0
 
@@ -87,11 +80,6 @@ struct __packed nct6694_response_header {
 	__le16 len;
 };
 
-union __packed nct6694_usb_msg {
-	struct nct6694_cmd_header cmd_header;
-	struct nct6694_response_header response_header;
-};
-
 struct nct6694 {
 	struct device *dev;
 	struct ida gpio_ida;
@@ -99,15 +87,9 @@ struct nct6694 {
 	struct ida canfd_ida;
 	struct ida wdt_ida;
 	struct irq_domain *domain;
-	struct mutex access_lock;
-	struct urb *int_in_urb;
-	struct usb_device *udev;
-	union nct6694_usb_msg *usb_msg;
-	void *data_buf;
-	__le32 *int_buffer;
 };
 
-int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
-int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
 
 #endif
-- 
2.34.1

