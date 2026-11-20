Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195730;
	b=LpOkAVBPerJQH5H9vxn1j4h0lqLq1uo808QVYmL0crQDp6b/oIi1g/IGO1UeF9Aa0gyB
	 Bn703NLm3O1nClfHqs4NkJLyb4wk2hwOmQjB08H+KndWGbiSCrLQj3W9f0FoWUmy4Lqh9
	 7430prdZyOoFR6oP4+Egh2aY9eUGYN/8WfQA2S8CKfaLvR2JZcyBkCputeuj/dgieKtij
	 u3de2BaXqMaXAXEnkwK0iDDtw4aXEt91R6vRrTUB82SjKrJ071L2kHmnJbC/uBUtoUffZ
	 BnniuZ6JOha/o2NhXX0n9H+27wWWtSfYBaUQ3NQqa54Njd5YXox/CMsXqE+HS2YsFUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rrnoTKRAg0KoMD2azH+HMkzH8aAyC6jP47ZOD9hvuvU=;
	b=TBj80ZW8W24Z5biKKhpJTbXdv6MIqasFwLm1pm6YGaH+cCf+FnaDx1jT0SYJQRW2ofWs
	 lnWRXDh/4FavQ5Gx2Rdfwd/DmHLn565Ro7+IbbrqY/hWahGlqX3TTJ+Y7hOGl1R3Gb/lG
	 wTpFYendWLNu+ZM4xlbxCOHvIgc6racVdOF/wR/VWT9bDNPl4VM8cuqmurWK6IHZrlVyU
	 Ha9QloS4iUyyY2HDsIMq8iPXbxYYfwZyxveW7CNrsUeuflLiSVTdBLXATN9IDCr9tuXZb
	 MLKFbgrHIZUp0V0Hw4YaiMemQPrcddvObUdHhVa01Xv5hrEjrSycmU7zJJl1zNSVZnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QzyLgrl6;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083460A260D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6083460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QzyLgrl6
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso1417686b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195730; x=1795800530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrnoTKRAg0KoMD2azH+HMkzH8aAyC6jP47ZOD9hvuvU=;
        b=QzyLgrl61FEAGp5xZAcHw8pkQUXty+pQFGPrpvydaX7fDi58qLheyfmkl+kmJi0Jdv
         K5bXKeOM9zinS8SSkvWVEfEBX/a6U8OAMBEkBLu0l+md9HuOzvdRxnI42ZNfLmYc6NW2
         WU4qVkThOxamcu9YHxNKF9mWkYQQZBw+YiDbGf6sBmG09UsksW35+9eQjk0iutmObq6X
         lJRrUtqX7l9quyJ65ScUKbSg1FwWaCGegKqqPDRNScBVVs8cpJTe07GkeN5ESoGeOO0K
         29LnVp7EUOoDBXMA0mbIVC4Jk4gUgK21s+tzX0AwZsOJYvi+QebcgJ8aazed0LznoN7S
         93vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195730; x=1795800530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrnoTKRAg0KoMD2azH+HMkzH8aAyC6jP47ZOD9hvuvU=;
        b=JYsavn1uMA9gb32JiwmvCKvHRJ7QkA2MH+fP1lSU6T8NBnK+0nTPn6DcErY1ZO0S6n
         p0qy8WyXxSGBPXOjf3nNO2gA9DaOwEHltg4Fi6jLL9R2DMTquGe2bYFm9+D/lxf06OlR
         Hg4s5HI6+Mp78H6ztinGrqlwpxOYl4qR9v2flSvVVDJSNLUXt5rmCySfp4j+48wF6emS
         uokZ7Y1/f1Eh2mlVPTmaf342q+oLcgvXXV4nS+NAN7SR3Qa1/oGc5o5m4CE9QBoC6ujE
         3ELzyUFZknobJl26EeGFjDFeu88eQy2/Z3cQq0fxKjcwWKdsePA6Tfhfzg/88sG5AjhB
         LsxQ==
X-Forwarded-Encrypted: i=1; AL+hErH/L8z00YLUm/1QwfOhEDabill+vxr4gsXgN+QLvJVk27iRq00VU5dD05lJhRo2Ac//+CS3YxZ6tLGg3GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hs5hEHAHixqK4T41UXMCmJcqgwyvu8Y6z8GqhY4mUKvMS50KD
	pUKTFUghpfgq/GB7oMtnz2l73nLc7OGowYqo9bodpr8Pq4mtOsy88NdmIKtSXJSESUw=
X-Gm-Gg: AZFdTZcFHGX8kZYJPC4hjlnv/T2sYHkXhzacSAK9OYkbp31096TPapgEfzj4WOw5vKo
	v/YqypT3p2cF7bbpcJwj/iRbh90XJFlQYVGXd72bq009r8yDtpXNtlp+hoF87RSkIaFDz5IzwJR
	1VvvFxJEnLAETRMJufj6bxny2ZdvhTngLPZIky6h+AwY3J8byTYC8XyrB7vXplZwV4eSxwqYRRv
	7YgkJ8NOyhwaMfpzymssbE7+jk6RypfIiGbz824hSUmxmmbZKp8Dl0eJtEiNjFVfVppR6XRvcja
	Uo2kq6mYL2XxBrNAnO3PdcpqVYGwlSe++lznhp3Z76QQ2/LNR/cyYmtLtAd7CXcLYFwWWagX32w
	QBRofJ5ur4fVWAxKx5OriHimu6veAGVZP2DO1nxQHOeg6SItqcvexGfj94prlvdcn0kTYJDsYDI
	jVEfRifzhWSc3Fc94UTGHzwpskKvm5CbxkslmA2j+nXEqMHDIdCifdlpRrybV8LVGBom15d/ztk
	BABBZjk41EDQQ87+pvZT3R41E9yeBwDVVjlZRo+hKGVm6ET6FiYnvFkLQ/3PKYz7aB6Z56GKe95
	bCgSl9Uivuoa9tJr8e/gLlwkbmlSnW2q+QSPN7SyiUOqpY4sBd4n2wdMlV8GsDTohV9iOoeCZuZ
	OmL/relYNg29j2NxQ3hhUwCIdk0xJoTKnaULV
X-Received: by 2002:a05:6a00:2355:b0:878:3704:e0f6 with SMTP id d2e1a72fcca58-8c87d51f152mr2496961b3a.28.1795195729662;
        Fri, 20 Nov 2026 09:28:49 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:49 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 2/3] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 02:28:28 +0900
Message-ID: <20261120172829.3286180-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
References: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
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

usbg_data_write_cmpl() copies se_cmd->data_length bytes out of the bounce
buffer into the command's scatter-gather list without checking how much the
host actually sent.  A BOT host can declare a larger OUT transfer than it
delivers and end the data stage with a short packet: req->actual is then
shorter than req->length, but the completion handler still commits the full
declared length.  The tail past req->actual is whatever was already in the
kmalloc'd bounce buffer, which is not zeroed, so bytes the host never sent
are written to the backing store and can be read back by the host.

Fail the command when req->actual does not match req->length instead of
committing that tail.  By the time usbg_data_write_cmpl() runs the OUT
data request has completed, so mark the command and skip the ep_out drain
in bot_send_bad_status() - there is nothing left on the wire, and draining
it re-arms ep_out for data the host already finished sending and wedges the
bulk pipe.  This mirrors how f_mass_storage stops draining once the host
ends the OUT stage.  A command rejected before its data stage still drains,
since the host has yet to send it.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v9: keep the existing pr_err() instead of switching it to
dev_err_ratelimited() (Greg).

On a dummy_hcd gadget, a WRITE(10) declaring 8192 bytes whose data stage
delivers 4000 and ends on a short packet is answered with a CSW status of
0, and reading the range back shows the 4000 bytes the host sent followed
by 4192 bytes it did not.  With this patch the command fails, the CSW
status is 1, and the range reads back unchanged.

 drivers/usb/gadget/function/f_tcm.c | 9 +++++++--
 drivers/usb/gadget/function/tcm.h   | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 22e57f14e938e7..a8fdb24f9d94e5 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -120,7 +120,8 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 
 	csw->Residue = cpu_to_le32(cmd->data_len);
 
-	if (cmd->data_len) {
+	/* nothing to drain once the OUT data phase has completed */
+	if (cmd->data_len && !(cmd->flags & USBG_CMD_OUT_DATA_DONE)) {
 		if (cmd->is_read) {
 			ep = fu->ep_in;
 			req = fu->bot_req_in;
@@ -1090,7 +1091,11 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
+	/* the OUT data request completed; nothing is left to drain */
+	cmd->flags |= USBG_CMD_OUT_DATA_DONE;
+
+	/* a short data-out left the tail unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
 		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
 		goto cleanup;
 	}
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index e1d5a939161273..50764a33cdf366 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -88,6 +88,7 @@ struct usbg_cmd {
 
 	u32 flags;
 #define USBG_CMD_PENDING_DATA_WRITE	BIT(0)
+#define USBG_CMD_OUT_DATA_DONE		BIT(1)
 
 	/* UAS only */
 	u16 tag;
-- 
2.43.0

