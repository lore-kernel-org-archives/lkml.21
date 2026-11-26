Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678313;
	b=C+kwI5IHoPhwwfWHd/vLad10D2ovMGWfL0z+OhnXZUTWyoPOzjzdT96h2plgErq9eAGU
	 KbUcDdVN6mC04U+EzxzqCblPynQC7CQrn8O5t0rEiROmQZYI9IHNmeV1rXo4V9Tg9I46Y
	 ystEK5YNB6utRuFxpVCqCL3tVy8Kss+yBoSvnmmBm8FN79mWmyabmzCkGLKPEYVRQ82rN
	 plDWrRVajB7LkzvvgqWyEwolwouo05QZOKkUmvsk19Iqmffot1KHkSR2js+yPFf6KQwes
	 Zu8YLx5cQK1ArMf8uYXfufGreIducqSK5vnO2igwcQrIvxfPR9P+SCJZqFwiDZlg76w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
	b=eVEsZUUuo2vTO7iuH5pmRg4Js8Zq5C0/H1AkHbztJGFxZtUoVQzy2higDSNoiZkALIQ7
	 PlL5ctNuUt1e1BIeGFaDZ02XWhYKraeutcbpaLma1olMaGmaYvI7c//03REo64a7EfuT1
	 4/gFrEd/WHoLY23jfQOBTkAsMsSsXV9/IO/wtK7tKpexrLnEXW0fBwSYh+A8z6/kZH5KI
	 D+gUBtOn1N8JOArAKuicKQAGnAKx0sKI5CWveqIkghJN17ld/pulIUO6VS3bkvOzgC+jK
	 n5qGmAq92wT/P4rDML/nqJbIbCGCknqSoueZZQT15VOUEHdwontwTyvzsl/+xiSZ0+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU+vNY8j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D07606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU+vNY8j
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-57e468d51b1so1268695b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678312; cv=none;
        d=google.com; s=arc-20260327;
        b=ofblEmaQrzT0pJU/M+087OocfE0SnjRXemgSWx7NsmXImfBywqzZSgnl7Apx2iXhBP
         rZQ4BQlL9PBJWqihvQf5rzJ1jmSef9LOmDC6mVJqCx19zEWV0C2x6ESRuQSRDl8Qaqvf
         gZ/0gSchizcRm7iLVqVCqxVvjgHunAISbaQCF+rC7X3ohdB7Z9hu9MAdUWuW0U6r6Jya
         LFBUgNc45lngpxvdJ5oqgHcA+9vTABa+NvoAd8QkuR8kZnM+h2Er6C1mSAsT5X/MtbRo
         0AW5GTe6qp1LMIm1wfELKiQa4CeK9s2g7HJD6BmKZ5qswgpcIi0Ax8/XoO1Q+UNlVREf
         uitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
        fh=X/Yb8htDbDLdb3P6D2xgeImHPa4bUyUA4ox5pMII4Lg=;
        b=PVjcqB3Im1TtlP26PBjrop6ipVg8CBWjijRS+tCixqp6nSuXFw88NJ2XscZ6NNu0ag
         aKQd1HJmSGY/sqUt6oUiEetobl6QF/6XufaBLO4Y9twXI1u5BlFWROX2x6hDVi9PO6jA
         M+ETePN2Rztcp6ardX1zlF9ODjGbh4qTT1D/7V7YzrSy++Zvnn2+hzhe2MvgK2xTFp8p
         UetCHk7yCOxG6/Bugpz1h/gEmdktqmexsUa3JPOp/D1o5Lx3+eDYR3xRXHceulCI+rp1
         FDajNDqxo7Q1YlmVMhhvLSNn9edkbb5GBj4u7aCo0HHTYFP0/SuG8/+pJqHLM5m1n3PM
         X/KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678312; x=1796283112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
        b=RU+vNY8jsljRjP1UMdA4zmwXfWpljGfdXQaDlUq07fSvAbSYCc2SwyULiou/PriCd8
         UxjPltJicVRmPJfqNmU1jZzzN5rCBgA73d+7aHMgbq6o6tWghkHG4zZN7shMHza6dUdd
         NlW88YaIIfslZf+HsBxdl1krBAjatqhqwpknVOzbJpjy5F5nfBdtgGzA7E6Z+HaDzHph
         tfTj7biGpLhYLpdMz5qPTqcWqiSoWyqqe1HlgWGgJe9I//VmRHRTqoC065AsIgL7vxWr
         ftGpfBTsU3YWa0PPHkJogyaPCwQ/TiHydqlG71OYJubODPxE1H+wyjXBvMnmudI8/d8s
         CFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678312; x=1796283112;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5E2UbuP+41IrRgcrwHZJc/VzF7oIUWcIzlONNE+YEs=;
        b=L8ClpuNwVTO2WD4LPqSkAn/jQGuM+ONGmq2pgP2zeMixAWY9SQKyzAkqkTvof1MJNy
         LwK1gUDidcQw58ORe68rWqjaMPSZTCD88ga+0mm2rEY9IaehdqPupVm1fde9Gwt38UQs
         1gkAJdXBRIhh3ta0igaRQJ/TG3TBhsgh7hKPEgoAyXuvbbSkczAAnf/GNVEHKoWiYbi+
         F8CMqL4g9IlNnQvgYhRGmf484QTDYwzzm4kwQRPFo5W5McFyFbccFOoZRUBOsmOGfk1h
         c3aFYomvTD5uaYYrkN1ilxJjEOl5M9SbInm2hZE81yDpwT1OEGsKcUvaUVsHn79eqyzZ
         kBZw==
X-Forwarded-Encrypted: i=1; AL+hErEiwevOFqdP9T3gOjyx0SngCZGANyNaqj14wTsHsMZN407MiBuQevfqBT2BsOwhcyZU1xT7K+quGK8X5ZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XyFTvNXhpbLmQ1XvlpLqbK3jWkAm32XlCwte+KExeN5Wc1Nyb
	lLyzp6H1WZI4RTrnsuDW07wPHNmcIHW5BlQz8o3D/H+NbKV8kfKnnVeRWKYYcbURo62/Zc0ae9S
	3Mw464MmlbOpQy30Thiwpuojk/gwA0IM=
X-Gm-Gg: AZFdTZemZ/glyg+PZk8MDtk/enLqkK60l+VdTgNBenBlrDtL1V0THsQ9zkhVZjojR15
	sax9YWA+TPcPmcBT8gMujWpdMzb5Hy3pIeVf0GQMeZa3WA+mQ3nWfiVzMwdX4QNX4ibcNJ89ljc
	PAazfpgrrevTh7hOjaFkzpsF0Iq1uhi3nPL51FmO4zZ7wluCJfoC75zvIDcmAk1ByA7RHDseUHv
	DWssjnjU9E/AstdGyKBG4dfRUNnySpNjIP+eZQqbwPVJ8O9/+kUYe6hfeXqmw/xBT+nDM3memrf
	xD30YXInigXDT9r8IK1dZ6jJ/E3789mG9VKu5WbjJrA4fr2TQlfUY2NnbdZkYbNnqKyPXa6qyE1
	RGFmkxDFbT0NWbmtn8rTNw/tcw+v6rEiU7yhLWkImPqjyrCS8pHvHF4/Ae0jxvu2O0g==
X-Received: by 2002:a05:6808:17a1:b0:571:7f0f:924f with SMTP id
 5614622812f47-57a0c6b7286mr21919451b6e.63.1795678312136; Wed, 25 Nov 2026
 23:31:52 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:31:51 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:31:50 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 01:31:49 -0600
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
References: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 02:31:51 -0500
X-Gm-Features: Aa3M54oA9oN8u4sV-Du88QoM3YccpjHOJyvBkBEekJZag8MEC9gciwwnBEJGyKA
Message-ID: <CA+m4KrCZLr77+p4afs28pKy11GOVTbLmKyqHmPOpD38Lvodsmw@mail.gmail.com>
Subject: [PATCH v1 1/2] usb: typec: ucsi: gaokun: Distinguish empty updates
 from EC errors
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A failed port-register read returns the same sentinel as an empty update
mask. The USB notification handler then acknowledges an update even
though it has no valid register contents. Refresh also overwrites the
port count that bounds the array allocated at probe.

Check the initial port count against the register layout and retain that
count for the lifetime of the device. Reject inconsistent counts and
out-of-range mask bits before updating a port. Return a connector number
for a valid update, zero for an empty mask, or a negative error.

Keep the empty acknowledgment for a genuine USB event. When handling a
connector timeout, consume an update only if it belongs to that connector.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 55 +++++++++++++--------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 56f8bbab9..d4c66de48 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -273,23 +273,29 @@ static void gaokun_ucsi_port_update(struct
gaokun_ucsi_port *port,
 	spin_unlock_irqrestore(&port->lock, flags);
 }

-static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
+/* Return a one-based connector number, zero for an empty mask, or an errno. */
+static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec, int expected)
 {
-	struct gaokun_ucsi_reg ureg;
+	struct gaokun_ucsi_reg reg;
 	int ret, idx;

-	ret = gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	ret = gaokun_ec_ucsi_get_reg(uec->ec, &reg);
 	if (ret)
-		return GAOKUN_UCSI_NO_PORT_UPDATE;
+		return ret < 0 ? ret : -EIO;
+	if (reg.num_ports != uec->num_ports)
+		return -EIO;

-	uec->num_ports = ureg.num_ports;
-	idx = GET_IDX(ureg.port_updt);
+	if (!reg.port_updt)
+		return 0;
+	if (reg.port_updt & ~(BIT(reg.num_ports) - 1))
+		return -EPROTO;

-	if (idx < 0 || idx >= ureg.num_ports)
-		return GAOKUN_UCSI_NO_PORT_UPDATE;
+	idx = expected >= 0 ? expected : GET_IDX(reg.port_updt);
+	if (idx < 0 || idx >= uec->num_ports || !(reg.port_updt & BIT(idx)))
+		return -ENODATA;

-	gaokun_ucsi_port_update(&uec->ports[idx], ureg.port_data);
-	return idx;
+	gaokun_ucsi_port_update(&uec->ports[idx], reg.port_data);
+	return idx + 1;
 }

 static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
@@ -324,20 +330,20 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec)
+static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec, int expected)
 {
-	int idx;
+	int num;

 	if (!uec->ucsi->connector) { /* slow to register */
 		dev_err_ratelimited(uec->dev, "ucsi connector is not initialized yet\n");
 		return;
 	}

-	idx = gaokun_ucsi_refresh(uec);
-	if (idx == GAOKUN_UCSI_NO_PORT_UPDATE)
-		gaokun_ec_ucsi_pan_ack(uec->ec, idx); /* ack directly if no update */
-	else
-		gaokun_ucsi_handle_usb_mode(&uec->ports[idx]);
+	num = gaokun_ucsi_refresh(uec, expected);
+	if (!num && expected == GAOKUN_UCSI_NO_PORT_UPDATE)
+		gaokun_ec_ucsi_pan_ack(uec->ec, GAOKUN_UCSI_NO_PORT_UPDATE);
+	else if (num > 0)
+		gaokun_ucsi_handle_usb_mode(&uec->ports[num - 1]);
 }

 /*
@@ -366,10 +372,13 @@ static void
gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
 {
 	struct gaokun_ucsi_port *port;

+	if (idx < 0 || idx >= uec->num_ports)
+		return;
+
 	port = &uec->ports[idx];
 	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
 		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
-		gaokun_ucsi_usb_notify_ind(uec);
+		gaokun_ucsi_usb_notify_ind(uec, idx);
 	}
 }

@@ -383,7 +392,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
 	switch (action) {
 	case EC_EVENT_USB:
 		gaokun_ucsi_complete_usb_ack(uec);
-		gaokun_ucsi_usb_notify_ind(uec);
+		gaokun_ucsi_usb_notify_ind(uec, GAOKUN_UCSI_NO_PORT_UPDATE);
 		return NOTIFY_OK;

 	case EC_EVENT_UCSI:
@@ -411,8 +420,14 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 	int i, ret, num_ports;
 	u32 port;

-	gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	ret = gaokun_ec_ucsi_get_reg(uec->ec, &ureg);
+	if (ret)
+		return ret < 0 ? ret : -EIO;
 	num_ports = ureg.num_ports;
+	if (!num_ports || num_ports > ARRAY_SIZE(ureg.port_data) / 2)
+		return -EINVAL;
+	uec->num_ports = num_ports;
+
 	uec->ports = devm_kzalloc_objs(dev, *uec->ports, num_ports);
 	if (!uec->ports)
 		return -ENOMEM;
