Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179935;
	b=Hq1SGtjFKfRsKfsJ2pwuBBHuqQnX5xACUjVaqw0rbX9tsEBb1HKqeXV+HbP+/nS4SIDB
	 FynH8hMS1R/2/9nd2J0ei/e3xSFJPoO2WotyPhpL3L4Kt7mX322GcuIB2GPg1YgQG1dSR
	 lb1vi+ZBVNyyuLJ1PJ0Zx69Hu7tQv+YlGzHAnxLQAxGB2Pxd9PLvlt5+2LoSaDQeyTdcF
	 NEiHtuX9Bca41me3Eiy2PoTUJJYC3p/isl6gK1J2x1o7jKKBMNG77B58O+hAZGV0XHxxC
	 yRFhA9M59e46/IkJBHMRFOyOZMmkKWvYqwjSI8mMqAwP/3cLB6uwuaC0g/koFZ2KuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=aqFedasepLygS2IUPZDnNsrI+C92D/iwPAwXbq8eQRI=;
	b=JLZLMyp2AW7hHSFtTlLSv1C1dXBGWJdVOYN3JtrTeGoiMWSfNqHx9UJbce6o1+Yley7G
	 kzAyUpz7NFUrJT1bGkDRnGBPeS5XfU0fe38gY+/f5D6Qof2EfQC1F5x84S0A9y/qb4CoX
	 Up0w5mnjsUZbt5cWna2FSZK3zwxteDcBqLsvuJGLqBmE+yBEJ3k9rdHE3yzKdLg6YNp7k
	 vvJiwDYxEwZ2exSFpJB16SF2sj7Pm9r0YGa0dTMULUQYK+qWdh39OkmnmwN5woHQym65+
	 7gdlchT7U2sEM5hwS2hq/FK0mOkx+lY6cQVU1R5QrR+w3bBMuEiHJuimlQ1D5Jdlu2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGi6R074;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8A560A2639
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8A560A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGi6R074
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c51373ae637so133805366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179933; x=1795784733; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aqFedasepLygS2IUPZDnNsrI+C92D/iwPAwXbq8eQRI=;
        b=mGi6R074+MhCKVEk7bYU8gmWCWeLelOCtiFs8xoVMa6fYHPe691NZJ5fy2rxyT71+d
         jSHbeu7JRSk71r7G+NdAuoRM0wqHLv5mrIW7naa/n7OzVJxZA46KvSRvYaG03x4nngaP
         7GHEDGN7hl0sVRmUHbD+UFYEN0NrjWTu9HO3XlsQAKfN+VQyo5thq4JMyZ6N43gDNEtO
         sLKYif83uQz8ARB0fZkDE29ZZ0L/Cka3mbtIjWVCSYbt1jBUBWgltmGK2iDk3YLGoy8e
         AREyIpercwLd2iiKdvu3rNJpJZLG7vR9RgOVrUipEDJM+Oudrh13XzFoO5HKUnRky0aC
         GDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179933; x=1795784733;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqFedasepLygS2IUPZDnNsrI+C92D/iwPAwXbq8eQRI=;
        b=VEZx6+sCT5ELaAp5Bnf+vicI/Nb28kNHZCzAtGoR3vRqmmqZyeu73mseqRAorUVHXe
         ocE02miKb/zNp2eXpYdfDxSuDoY+iF0xRR0Ov3ynR4/YtjfAsE8xAbGWDuX2ibr+9EZ8
         QgEjdwmYxJ3ETujyUSy1FsZ8vdHoxyE+xqKZG41DA8heev4+YtGoLsikJ1qGfGsf/mEB
         42EWunNfeIRXOz0X/qw2WeJ1Fxse0Tj8T2I7yGmvVvWRTDD0XBySrn3WCYRQ874/9zAg
         WMFGjeeOvWla5XID4pezpPrfKNnJblw4aLbAP1eY+kakxPVC95gW2g29yoOOAlDq4ouh
         VH7g==
X-Forwarded-Encrypted: i=1; AL+hErFAoJoJkvmp+xaaA1wJ+EaJyl5RvMqq2roiyPtTfXhFN2kGbwc63CcrN6XSJ2ZiZ9/R12qlZAUh2ihBTcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zev1RzDRBmH24YoVz0dvXHp+ZxByynVFOwys+lr7Df182JGsw
	6zTt3N2+vk+3V3qzc+6Fxm/NfeTxbuyyq0v+oKd+9rh+Wj5whIdk8YI4
X-Gm-Gg: AYBFou33WRgtGuc0xvzw/QJ7idICsQrEWJQMwNckZ9v5NXO3azRkujSjouMwfRf280s
	Net0Wp4OqZWCbnGdhvgq7uc9Ndy5WOt4ZayjKnihoiZJ8n5EVeQPadKg8rikesrwiDFKi2Z+emL
	i3jSz9zr5xXpFjv9wvm5lVTdDhUNtgbYLnlDsUrHrYrVHvmJZQY7Pj2L4aD2Ymt+gQGR4ni5h3i
	/XPPqfaW0hE5K2UhfiqqF/n3eJ7KQ7iPmIrpcmCO+s3ipzwbJkec4lSFYUP0IGr7yPgGtG+u7Jb
	E1/uIAtUOqhkZ1l32v7diYDuPdb2kDWST4a8uDCpeIKPF6gx411Bl9kdA8jORfidJ7eNMLFSqKp
	SaEvJ9FGhTT6D9M48u6rdJUNxvwP8Psaj0abdX4g858GIQaRK/sGqnWlp+gyyKe1UazjNUEYMBE
	IrehK4Mhxf/c2fUOeTUIEVAUzVYl5bdrK5HpG8asLnwmYNPqeRb3OBIMkDYTpQjvfyaqojG4mPZ
	8XSQLKFXNAP4f7LGVJUYbCtNwoH0wcGV3K8H/o92zST6tc1BFQuNmLd17sY6ec1p38C0nESaTEt
	bMXIPWUFxnwBvF0rd87mRjMMgcNmQ8+IxfuW1yOwUFoY89Wcaw6sV+WWJ5COvQRIRnWq4Lg7tco
	QFA==
X-Received: by 2002:a17:907:3e9c:b0:c41:6de7:7dde with SMTP id a640c23a62f3a-c513a41f0b0mr326952666b.4.1795179933440;
        Fri, 20 Nov 2026 05:05:33 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm94726566b.40.2026.11.20.05.05.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:32 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 4/8] char: xillybus: Rely on FMODE flags in poll method
Date: Fri, 20 Nov 2026 14:04:58 +0100
Message-Id: <20261120130502.17056-5-eli.billauer@gmail.com>
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

The poll method of xillyusb.c previously tested chan->in_fifo and
chan->out_ep for being NULL in order to determine if the file is opened
for read and/or write, respectively. This works incorrectly if two files
are opened on the same device file, one for read and one for write.

In particular, if the release method is called for the file opened for
read while a poll is called for the file opened for write (and vice
versa), a race condition could lead to access of freed memory.

Relying on the FMODE flags as a guarantee for the validity of
chan->in_fifo and chan->out_ep as pointers to allocated memory is safe,
as the allocation and deallocation occurs with the open and release
methods for each file.

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

 drivers/char/xillybus/xillyusb.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 1aa8e7303ad1..f9c8591a679f 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1853,10 +1853,13 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	struct xillyusb_channel *chan = filp->private_data;
 	__poll_t mask = 0;
 
-	if (chan->in_fifo)
+	bool open_for_read = !!(filp->f_mode & FMODE_READ);
+	bool open_for_write = !!(filp->f_mode & FMODE_WRITE);
+
+	if (open_for_read)
 		poll_wait(filp, &chan->in_fifo->waitq, wait);
 
-	if (chan->out_ep)
+	if (open_for_write)
 		poll_wait(filp, &chan->out_ep->fifo.waitq, wait);
 
 	/*
@@ -1869,7 +1872,7 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	 * wait queue.
 	 */
 
-	if (!chan->poll_used && chan->in_fifo) {
+	if (!chan->poll_used && open_for_read) {
 		chan->poll_used = 1;
 		request_read_anything(chan, OPCODE_SET_PUSH);
 	}
@@ -1881,11 +1884,11 @@ static __poll_t xillyusb_poll(struct file *filp, poll_table *wait)
 	 * which it may not. So make it never work.
 	 */
 
-	if (chan->in_fifo && !chan->in_synchronous &&
+	if (open_for_read && !chan->in_synchronous &&
 	    (READ_ONCE(chan->in_fifo->fill) || !chan->read_data_ok))
 		mask |= EPOLLIN | EPOLLRDNORM;
 
-	if (chan->out_ep &&
+	if (open_for_write &&
 	    (READ_ONCE(chan->out_ep->fifo.fill) != chan->out_ep->fifo.size))
 		mask |= EPOLLOUT | EPOLLWRNORM;
 
-- 
2.17.1

