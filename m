Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179940;
	b=efjjgjcoWXhrcPmGgtRnIhnLPCDSeOp1SO2WzpiIQJYAhjbaqieGpRaMKjAcJLpmXaSQ
	 kt6PYmxrEC4oXvH4YSRgAjzfyb+H6ks+CRlrv+acZGKmqyd1Vc+WfH7MxHEZ7KhLNi9i7
	 sV4/eVfVzRko3tnHX10tp+PX43qoK9Ff71GlE7eVYlJVhDxYtUSP2ALfg0YsOEZAOLUbr
	 +y7QPTgtqooHlLMn3RGc5Rwq1/sXsSJC7tW7TuUcB+mCcIb8MlyqQTtpWt78NZ7eI6GPN
	 IdMaYQwTO4ybkzCAplVCA12lizdwjvqtegXX7VVMdZYgi4LDYbanbaIAxXd2Z45Dw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=tkwbXG8BpJWX8LedIF6eIByfJP+RkLGQQgypbk5rvSs=;
	b=JQ6LjQ35xQJ51TkiAU+phpHfMgNj1WHh6GhBitsnWIN4DMAIV4aZHF8CZYwwYovTyQra
	 oYSxSbYsxFSvhLWrhjUTI1fTLCXNvroSboQIJ09nfY2PRCFTiRGb2TkUoYqpAaRaQ4DYi
	 6E8lICqXnY0xyBYIZjMloIv2wFToW2E1sXrgCziXI8KZ+ZwoD9SEDxczIQKKtMbPKjO2D
	 moCmIOE68UnOrHRuHWkiXdcPKk2F5Lazw/2gCPHNb2xQDJytv+Aw1SL8QDNz6TYAbXgNP
	 ot5ZNocAecB/OCWNaJJy5uHuoqAADVdUoG8nNzzMBd68nDxhce3ySiLSlrgT0cmE+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYd6ISpM;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D7760A380D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D7760A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYd6ISpM
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5126505cb3so124921766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179938; x=1795784738; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tkwbXG8BpJWX8LedIF6eIByfJP+RkLGQQgypbk5rvSs=;
        b=yYd6ISpM6LJd3PUuozARb2aPZ1+UAiNqW8TjXGbGTXhfZIyc9f/un261raUI5ohbvw
         /S4p/D9NdKljgibnzi8tbc7vLT1i4q2oKUaDbV0Fqd7BQEucm189a8vvO6FtT2DtfBMw
         elEbz1wU2KMOf+ow1YZtIeqJXY9Z9XY3ev63p0beCbQaNoasSk6enPRJObhcwBGiEdCO
         bJfuv8J6eLQHUIgvvHFKlMv8FKv0rRNbmRMHbdW+nxsoWEmkwzydeDG6cZ1T0EfV9k5l
         KLrhU/RDn9Ojchtvt4yvzzDY51otHayMK783j/fSk1reraZaqvBlGqsKxAvetXmz7e9w
         ZRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179938; x=1795784738;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkwbXG8BpJWX8LedIF6eIByfJP+RkLGQQgypbk5rvSs=;
        b=1sYCeDUd8XjSeJor/z/+vUsftui6rjrVw13M5WNlczcHf4VzXOOcso6qhnNLpEMWyA
         veXBa5wcqHnhqNJi2QA/5UlPxugaEeoZ541utjH2hFYxfwOXZdeukNr9GYrE69K3SLwV
         ifYjLld1tmFtUuVvDDV7tb8FimDBGQkMST/Usf+pqqpYLPH5vH+jsrdS7ru7dlL7vsON
         ldLWR9rZsmXPWn2O11wmss5qnjPt5KlpVtRpXpfpJWO2Kw+S7CKoXv54uwLuDsFr9Zxe
         YkzLj+cfYSS8Jdl26xMD9mKVneQ8bHa5vAk2UyDnEbj+Ju8PveYTPhQx2sJppuRrczB9
         zQCQ==
X-Forwarded-Encrypted: i=1; AL+hErGZkwYr24pBAcbNitC6jR0LTOgJg8ibAPYABe8V6SLhO/vqNrZiNKnm4LElAuro0hu8auKKEp1Tzf1/sCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IHG4CQQvSwPfV3UgFAnQwu7hiacTZvvBani26sZAQqDaSZcb3
	DDXx/N0KuAGQsFy6GeUeI2YF4/wUXZ9phLInOrHl+om+GaVxBH7rZF9O
X-Gm-Gg: AYBFou0CxqzCOktB9I2dNpVypuoNiKHiicAjirHtpGIPwxL8nCk7N0rhNq+lGcusywU
	ziuS58GlKGhMbe1NJKs7EqN/DLrkC0wLqjuyi1RtG7MMvq5x0ZXaQNVRVgXHmkDmIKcPxvLjgIU
	JuFmf3C+kDs3RyVc+vQFQzgGe9JOmrSMLzPecDOVMXJ0CnReiT9I2kirozVnn8KK9niPEYfeceN
	zdUDVUOUJ/7UKhy+J3LjlftyhoLLcb9PZU+f1pa/7MrJvanZ7KELJG/xXe0r37ov+X1C3IGgeS+
	KkxmXovGhpwvVdgVnZ6zDbogZIzGhlfbHimcDYEY/tLVv2gcsxdVIHXNj2QtRY32SfiiW/ARaOs
	1nqVV5Zi5JmAcsdA6p2NqjvzofrZVIocfIeoH2x1+362LHGieXFrXotx54d/GlWVohuVSei9SrC
	xu6xaxFQh7YXIWuh6c5gvVc6jV+qU1gqLox483c4K2jJNgj0fiAGBwOYTvsolpnmKfM9pdclf6g
	bVE2Uxe74knNqLYUs8YPD5NirLyd5o7yzbR7/q6hHvSGE3ErsQtgK/wr7U3bm7U5wmVu2FDh+65
	KZNu3k5nv5eUMyunm2U5h1mDT0yi83HLk6z9dDcKMFxHGjCqTKqFUfa8
X-Received: by 2002:a17:907:2d9f:b0:c50:f0f9:ad74 with SMTP id a640c23a62f3a-c513a99aa4fmr323650066b.9.1795179938041;
        Fri, 20 Nov 2026 05:05:38 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm92781266b.73.2026.11.20.05.05.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:37 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 6/8] char: xillybus: Correct handling of wait queue
Date: Fri, 20 Nov 2026 14:05:00 +0100
Message-Id: <20261120130502.17056-7-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120130502.17056-1-eli.billauer@gmail.com>
References: <20261120130502.17056-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Don't use wait_event_interruptible() in an infinite while loop, and
replace with a non-interruptible timed-out wait instead. Use wake_up()
instead of wake_up_interruptible() to match that change.

Also, use the correct form of wait function in the disconnect method.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - No changes.
    
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 49 ++++++++++++--------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index decc87f8e059..fcac39bcab4d 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -41,6 +41,7 @@ MODULE_LICENSE("GPL v2");
 
 #define XILLY_RX_TIMEOUT		(10 * HZ / 1000)
 #define XILLY_RESPONSE_TIMEOUT		(500 * HZ / 1000)
+#define XILLY_ETERNITY_TIMEOUT		(10 * HZ)
 
 #define BUF_SIZE_ORDER			4
 #define BUFNUM				8
@@ -594,11 +595,11 @@ static void wakeup_all(struct work_struct *work)
 			 * processed.
 			 */
 			chan->read_data_ok = 0;
-			wake_up_interruptible(&chan->in_fifo->waitq);
+			wake_up(&chan->in_fifo->waitq);
 		}
 
 		if (chan->out_ep)
-			wake_up_interruptible(&chan->out_ep->fifo.waitq);
+			wake_up(&chan->out_ep->fifo.waitq);
 
 		mutex_unlock(&chan->lock);
 
@@ -607,7 +608,7 @@ static void wakeup_all(struct work_struct *work)
 
 	mutex_unlock(&xdev->process_in_mutex);
 
-	wake_up_interruptible(&xdev->msg_ep->fifo.waitq);
+	wake_up(&xdev->msg_ep->fifo.waitq);
 
 	kref_put(&xdev->kref, cleanup_dev);
 }
@@ -870,7 +871,7 @@ static void try_queue_bulk_out(struct xillyusb_endpoint *ep)
 	mutex_unlock(&ep->ep_mutex);
 
 	if (do_wake)
-		wake_up_interruptible(&fifo->waitq);
+		wake_up(&fifo->waitq);
 }
 
 static void bulk_out_work(struct work_struct *work)
@@ -916,7 +917,7 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 
 		in_fifo = READ_ONCE(chan->in_fifo);
 		if (in_fifo)
-			wake_up_interruptible(&in_fifo->waitq);
+			wake_up(&in_fifo->waitq);
 		break;
 
 	case OPCODE_REACHED_CHECKPOINT:
@@ -1016,7 +1017,7 @@ static int process_bulk_in(struct xillybuffer *xb)
 			return -EIO;
 		}
 
-		wake_up_interruptible(&fifo->waitq);
+		wake_up(&fifo->waitq);
 
 		dwconsume = (bytes + 3) >> 2;
 		dws -= dwconsume;
@@ -1087,18 +1088,10 @@ static int xillyusb_send_opcode(struct xillyusb_dev *xdev,
 
 	mutex_lock(&xdev->msg_mutex);
 
-	/*
-	 * The wait queue is woken with the interruptible variant, so the
-	 * wait function matches, however returning because of an interrupt
-	 * will mess things up considerably, in particular when the caller is
-	 * the release method. And the xdev->error part prevents being stuck
-	 * forever in the event of a bizarre hardware bug: Pull the USB plug.
-	 */
-
-	while (wait_event_interruptible(fifo->waitq,
-					fifo->fill <= (fifo->size - 8) ||
-					xdev->error))
-		; /* Empty loop */
+	if (!wait_event_timeout(fifo->waitq,
+				fifo->fill <= (fifo->size - 8) ||
+				xdev->error, XILLY_ETERNITY_TIMEOUT))
+		report_io_error(xdev, -EIO);
 
 	if (xdev->error) {
 		rc = xdev->error;
@@ -1711,18 +1704,12 @@ static int xillyusb_release(struct inode *inode, struct file *filp)
 		 * If rc_read is nonzero, xdev->error indicates a global
 		 * device error. The error is reported later, so that
 		 * resources are freed.
-		 *
-		 * Looping on wait_event_interruptible() kinda breaks the idea
-		 * of being interruptible, and this should have been
-		 * wait_event(). Only it's being waken with
-		 * wake_up_interruptible() for the sake of other uses. If
-		 * there's a global device error, chan->read_data_ok is
-		 * deasserted and the wait queue is awaken, so this is covered.
 		 */
 
-		while (wait_event_interruptible(in_fifo->waitq,
-						!chan->read_data_ok))
-			; /* Empty loop */
+		if (!wait_event_timeout(in_fifo->waitq,
+					!chan->read_data_ok,
+					XILLY_ETERNITY_TIMEOUT))
+			report_io_error(xdev, -EIO);
 
 		safely_assign_in_fifo(chan, NULL);
 		fifo_mem_release(in_fifo);
@@ -2232,9 +2219,9 @@ static void xillyusb_disconnect(struct usb_interface *interface)
 	 * but somehow the message wasn't sent. Should never happen.
 	 */
 
-	rc = wait_event_interruptible_timeout(fifo->waitq,
-					      msg_ep->drained || xdev->error,
-					      XILLY_RESPONSE_TIMEOUT);
+	rc = wait_event_timeout(fifo->waitq,
+				msg_ep->drained || xdev->error,
+				XILLY_RESPONSE_TIMEOUT);
 
 	if (!rc)
 		dev_err(&interface->dev,
-- 
2.17.1

