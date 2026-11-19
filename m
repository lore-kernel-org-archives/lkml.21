Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097211;
	b=msBtkEsYtzBvHRfbkAIMpOh/C4ZxxHLF2K89+VaPFBlh5F3ogncj/FNtQwze6ymXsWh6
	 Q1LQ66FEYb1ZQX40ecQsR5a7A7o8pl3iIuqHU0RqPl1Xh8ANCy/CJss9JufKYPl+dAQiX
	 D3kkngVsXwOtT9SHmWzv4UinVkmKFBFuo7zHPTjvIl2LdwlBVB45VPDvkJIE1hnt9tDXV
	 txJKMB36oQxiT97bKdGyXUo9HMIThuhqgZmedYNw3BOXO8CKpeniBXJpuDfhxcXrVYUSk
	 4VUCqHLd++UBDY7bEyNb8Qpm/ZUCK3jwBL9VsF08SSHKNJ4f5qyo3VoJSk5r6wukxOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fKe6Wwe+uM8ct2ILYG9GC0z59MDxTFu3ZRvOh8CsW+s=;
	b=kdHzzowjsMJnyzYcMC0j82H04A0IUjZpcIL734JOWlCbhelDtJKtWX0wYGTBJbuh0B03
	 JttJCq/VD1dxybGp71LCf1sSXUC0lH2niEGJsI3u8u5uCN7psol1CFLu+/gJepiDT4+L5
	 8Hqaaa7vXkQXDvKhaKQzf0dIi19j3IMeAf7CBTuFSPvvLCQf981fhxadPtyKJdiWLJ8Ia
	 7LOna2E4Moar2mK7C6KuCPYeMRszEE/wibT51OsAultoDC2uTk+USJmIsK5C3AC2Ss5bN
	 2lTfeyVEpWkZ5q2DITKnYHV5ABDZAejh3rBRsyYcpcmsmbSlCXjqk+FLkxdgY7lXwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMGi1RB0;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E54606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E54606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMGi1RB0
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1461699b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795097210; x=1795702010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKe6Wwe+uM8ct2ILYG9GC0z59MDxTFu3ZRvOh8CsW+s=;
        b=qMGi1RB01nCTpeGcD+3NQ8KonAivL3GAgldd75Fc5LllsDJ78EPnPBepVdshc8isQD
         GxyCtBkLhMMfXe7C3p/WEPYBoH/Q6q4JIYQ0hKi0KmIZI55b9tZJCRbxdjkn7yX6Y5ue
         xELcvthzb2Ac9EbY0GOTePQyt7uUJI+U5qE19R7kqhG0TQP7CZZf3emnB0o9gGFMKCof
         OluppgY8UpuQSl78qEYIpYiWqFBxt1p0PQtvAueAoWMtd9gKK9RoFnkD2v05Ipk1JrbY
         pt87+Ej1vdvmWgIli9h1GfqVjit/v7kmR/lwNle5qY2zj8VUW951R9CZxiAXEd6GMhBa
         /QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097210; x=1795702010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKe6Wwe+uM8ct2ILYG9GC0z59MDxTFu3ZRvOh8CsW+s=;
        b=AV1N/D24BztrvNuEExRajOYz/ddwQeV1nKyfXHk0eaWIhnq4qzT9zFDsAWbUSAUN8n
         a4uN/IZAj6agdP53UB7sf81JiTU8XvQFUivlUTnOiFopR4Gp8vGoN4pkQJBhavmMwfV6
         /fcP+WnLhRhbHcise/AlZSP1JzGszmbTzuJTvJ0Yf3UJ8GJwXSXhtq0KCLDoQXlyYPTe
         392kncvRDFZQKlfx5enwUYvM1KUR7dEyz3JGkcEUkiagHlqxYMcYPYOaL/A6vq1G2SrE
         6W+68CRmz2ngI3qD//uNpZ5iiYZ8NkjmCo54dpRqoQ7/32sMDb6kkx0K8kljz2yJyf4V
         jBKA==
X-Forwarded-Encrypted: i=1; AL+hErGJcDeTFvpZu7ihWepl3Z9JMCflf1R7VmdLK9oqAgyFTandfI8FfsrYLCtqo3Z3n7Wt1BDVdo6Q1i6l7Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wOMnc82NWOAuWKYIiFGtwYNI2HA9NUCMdc802BHFy3qPnJLlb
	qXvlIRVqCkOX2IcZzgZR/dkcH/cPG2TNpILnfKo+3v2D8YtedMGm/dH4aQBCnQVCsheodYwtE05
	WupVcDrI=
X-Gm-Gg: AYBFou3Kpf7exhfxYPfXhO2TRA7SsLnu6GpBKX70BoEB3VUHYkP1KhAb2SNfDEGovn1
	6C2Z/ayLoEkRXnTnBVQdSriPD761jdbH6Bu18HkI+rU1wwTimMAGpE7oPMuhYd86OmQgBcRGQ4R
	FMan86DDEEoXqfycCQHzvNqAh6NLmF+5qQFBiP5JKxi74Zt5EULOoxTC/z5Oa7WXNP9S029hNqN
	K8r0bxFc9JUo3AScEhmQ/2EwDWWeDGnLrznhA/0YDXu4OX64H7gUVbLOccvkEm9KgqT0T+Rg9Xz
	C8/dvNgDwPrM1B8agxQtexGVNbXS7bavSYZ+t9677GA4XGpkyMJkXPM7WLP9tiRJSvmkv40e2wp
	2h/SPvGkoU0z5lgwBJUwItnLZGH75th8Qs5R/Ej6puFq7RwUsstAB31l8Kd8vTKH6b6x6Fa7xc3
	RiWinQBRiQ6uvb3vZA5kh1NSlBcd1JZWvCAL68clt70MB8fms4jM982yGxmjJXKkMLDYsKjnRoz
	AQNYtkV2+nsfncPuZIkawnfwxGOa4fZqljDasBLnQ/Cur2wfuz1ZB7qeUSvMWlDwzKjAQZmv+En
	YIEJvFA7gJ1TJgtTf+fCjmIgX/7Jcy4dhTCyM25v+hRxiVf0GZPNe1jkyGqODidE2Px/DejTdHQ
	ljFfr9eAF1WWJ8gS4pRSpa7shzP3z8LtykF/ObA==
X-Received: by 2002:a05:6a20:c90a:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-3fe8b6e5b13mr6374216637.66.1795097210065;
        Thu, 19 Nov 2026 06:06:50 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:1076:1f1f:dde8:a816])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaadasm2808154b3a.13.2026.11.19.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:06:49 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Thu, 19 Nov 2026 23:06:40 +0900
Message-ID: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

When usbg_cmd_work() confirms an overlapped command tag it returns the
duplicate command's slot to the session tag pool and cancels the active
command's transfer, but it never hands the duplicate's own request back to
ep_cmd.  The two sanity exits just above it pass that request to
usbg_submit_command(), and the status path gives the active command's
request back once its response has been sent, so only this path drops one.

The request is not leaked - it stays in fu->cmd[] until uasp_free_cmdreq()
frees it - but it stops being posted, so the gadget can receive one COMMAND
IU fewer for the rest of the alternate setting.  There are USBG_NUM_CMDS of
them, and a host spends one by sending two COMMAND IUs with the same tag,
so the command endpoint ends up with nothing posted and no command is
received at all.  There is no memory error to catch here, so count the
posted requests instead: on a dummy_hcd gadget in UAS mode the count falls
by one per overlap and reaches 0 after 32, and the gadget then answers none
of four following commands, while with this patch 33 overlaps leave the
count at 33 and all four are answered.  Three fresh boots per arm.

Take the request pointer before the slot goes back to the pool, because
from then on it can belong to a new command, and queue it after the abort
so that nothing else in the path moves.  A queue that fails leaves the
request in fu->cmd[] for uasp_free_cmdreq(), as at the other two sites that
post to ep_cmd after setup.

Fixes: 29ed17053872 ("usb: gadget: f_tcm: Check overlapped command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..4dcf2ba0083848 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1275,6 +1275,7 @@ static void usbg_cmd_work(struct work_struct *work)
 		struct uas_stream *stream = NULL;
 		struct hlist_node *tmp;
 		struct usbg_cmd *active_cmd = NULL;
+		struct usb_request *req;
 
 		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
 
@@ -1318,6 +1319,12 @@ static void usbg_cmd_work(struct work_struct *work)
 			return;
 		}
 
+		/*
+		 * Take the request before the slot goes back to the pool; it
+		 * is queued on ep_cmd below.
+		 */
+		req = cmd->req;
+
 		/*
 		 * The command isn't submitted to the target core, so we're safe
 		 * to remove the bitmap index from the session tag pool.
@@ -1333,6 +1340,8 @@ static void usbg_cmd_work(struct work_struct *work)
 		active_cmd->tmr_rsp = RC_OVERLAPPED_TAG;
 		usbg_aborted_task(&active_cmd->se_cmd);
 
+		usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
+
 		/* Send the response after the transfer is aborted. */
 		return;
 	}
-- 
2.43.0

