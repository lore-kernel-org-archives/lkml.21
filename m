Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001967;
	b=h5eJADgZ5oNBE4AJd33x3o4g8ZQuf3YnssvLaYsPMYotr9o4kqyIePVzMfghAJbtjB0C
	 zOO6wVeGbHOhSTZ+X6tP2qExFH3TDhSZaL4GPD9+NUyYthBP32WV2vPywWIX6TldiFFZd
	 X5TnG8cgzLd1GmD/f3efRl9Vy32WqSJWtu96OtN8CgVbL9Cr4HHRVtEwKaLdSAzOibHBl
	 Rp7TlnTXA9t+JrDtng1wyGXLOihrhmNQxcVAelBcNg7s+xkB0AnV9e6K4qMuoXVgSZe7a
	 OgQDkZmQJKNtSHipE7cf5JmOMQalxoPbTdS5WnSDcQSB0QBCXbuDubo4rowCJ9NNoxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
	b=4RNcYLGrXz2xeR0EioRIzZDi2kejthxaXCnlpZ31RSxgPFdFdUapD/WwpaJ90Lo/Sj3U
	 8aZRprhIpLarNFGJNksNxK60XIEoP5BPxkEofv2Dh08gr1YFjIf6QQImMaKv+DP4/Hr5/
	 UDBDPn4/rw5nbS7CFDHxY+sA/djORI9vR8YP+/wbFKOoFaioTH2T9FvL51cemAi4FlxzO
	 d/az+S2mv+8THV0XCTAHFuNXA/2s7dh2exQpSu0nprmL4xwlPpb7MZ+s1gudXKIPIasq0
	 VnhF3+CFridFFjGMjGV8XEfwRLocLDe7jgNnMuK5noTBCA/dEr6S7txGxRq7Bgl+Y2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q47akWcP;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59A460A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59A460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q47akWcP
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so1311942c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795001966; x=1795606766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
        b=Q47akWcPtA5FiPd6ZuJYeD3bZtbUIIDPkSCk+a0Ar7dv6cLiUvyNqhidnDc8QI/d//
         0WOL3fLcco1KOikDVg4p2tKn59d8u9TbkiMLb5FBoSS0Fy49p3PxtcMkVkk4WzUsGcb0
         y5h5gmKD1Gn/hMF0R8gqLXou/uVnQrx5LNIoPDEIZyjtIK/fNSk4aTCAAMrlacEBh5wP
         3c3WNfS0I9lBNriwo2iS84p8ENJUu+Mhfp00C7fbtc2hMpmMqnO7++0LNP6MBL6Al0sv
         Xr1cOh8eYDJjJ4mX1k0XaNphFuicghaf6M6FjXjKMOAdX3BJYfqmCnol7xUwTdQ9oX7o
         P3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001966; x=1795606766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
        b=gIxtlT2dWs1rmmBWUiS4gzpd+MQxAnXsh7M99JiHen8pFLuHuoD8C5uAm2pZDudbAM
         WeEwwP6KhiB4Pyz33hNZ2FP5GYvUwjZ/fRUUptBlF6Oxzhj087A+aNlBub958VeAbmyM
         4A/ndmE9yeGuhCSel8ayApU3ZpCzopakFZWloo4jbEVw4rk1TKabtkS//b/gz4dndoQn
         YTuUfAf/6kDpux87PP1ZW5gwIMrOo6NylYth/JfoSqpsNz4sFmfKfP4PZndkytFGyjDt
         Xjy2Rk9TkDORD7XWu3m0UKfboPf5dMO7nCgkC3UMk8Ev1BgBSLPMukRLHD4o50uSMy64
         IarQ==
X-Forwarded-Encrypted: i=1; AL+hErHYaw89j4UN4rO9WF3WOCxaCRrct3baUJqXTe22etIoL9KajGaMdcFpafQcZO9RQcOcBNov6gNSurKJO3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oW+fk1pQeHbK8XzWhcutkBykw4uAXcotQa2RGtMdmrdth8NWy
	16GtFcTnnBv8K3PItOAAr7h0Rt4R2xZMizy9wccPIMTUQlvmKqiTBQlE6DvBlSUd7c2KKQUCwAw
	/qLDxM3I=
X-Gm-Gg: AYBFou1DQvMaUBwgLUNndjCD+8nkIqD+sflZ7JDKS3o8t+Gkbvyo5SJWAMy8HbNGzRj
	vMkd3aQxqJr9oRhBSjc8NFl9MLWKnmLYXaVfcLclQCoOieSWwpfJ9KtQvBryR+7vxc7/HnQAU3E
	Ep9SsYki2Drm4y+PoSn34YPW5kJ9P9rYTh0zdrMRORQx0NSXE8Pu/Zehcr86HYo4JlOEgCmNT4k
	1rEu1S8hWOaznGXLxN8bQGoGtIGS2efcFCRWP+8shz4TqJu5hE2qlIIBtHsSW4ttp+cqdL0De1Z
	QnalMsXBMfk300EgzSXRKE2oOINcaIls1ESu7SybppOlZxYAAwbIva6cRpS8J6h2ENX3uxJIJvZ
	MqopIkTufYc5vhavM9tuN1HhEV9h4GI8EmJWhZlpkNGPAkcO964+9hD55FfqwS4rw0HbueuFgJG
	lJY2J/cSkL5b7PpOdFZ//v6t1svSPDkZKnvZaUKliNh4cxOnLr+JkcYp/HpAAElnTPBy5Q6dzaz
	ToOSDr+8pS7OZxqUonZIpTRcqvQulIMRhqmNnmlAd/ohaFHyJLlHw2JZ9eYj1+Fu3/mCcE9FM19
	6qcvW/5A6k7nY0QhAfwojU4PlM64sYjpCYE0H+RZaTthPbQfSRJrRvw7pp5QbbCIoxGhq20QCEz
	CSWuG76YRuspcqnRkU15AtIBmWZ+WNBbRa3XdAg==
X-Received: by 2002:a05:701b:21c5:b0:1b3:aee5:20c5 with SMTP id a92af1059eb24-1b543d02824mr2306544c88.22.1795001965044;
        Wed, 18 Nov 2026 03:39:25 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f954dsm6044662c88.2.2026.11.18.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:39:24 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] IB/isert: do not leak the receive descriptor of a dropped Data-Out
Date: Wed, 18 Nov 2026 20:39:05 +0900
Message-ID: <20261118113905.2361969-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118113905.2361969-1-yhlee@isslab.korea.ac.kr>
References: <20261118113905.2361969-1-yhlee@isslab.korea.ac.kr>
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

isert_handle_iscsi_dataout() works on the command it finds by ITT, which
holds the descriptor of the SCSI Command PDU and not of this Data-Out,
which is why the function posts its own descriptor explicitly when it
succeeds.  None of its other returns do, and isert_recv_done() ignores
what the handler returned, so each such Data-Out costs one of the
ISERT_QP_MAX_RECV_DTOS buffers.  That includes the returns where
iscsit_check_dataout_hdr() answers 0 without a command at all: 200
Data-Outs carrying an ITT that matches no command stop the connection
after exactly 128 of them, with no response to a NOP-Out sent afterwards
and nothing logged beyond the per-PDU "Unable to locate ITT" message;
with this patch all 200 are taken and the NOP-Out is answered, in 5 boots
out of 5.

So give isert_handle_iscsi_dataout()'s other returns the same post its
success path already does.

That one function only.  Everywhere else a handler returns non-zero, the
command isert allocated still holds that descriptor and the response
posts it from isert_post_response(), so re-posting from
isert_recv_done() would post the same descriptor twice; the second post
is skipped only while the descriptor has not been refilled, which is not
something the receive path can promise.  iscsit_handle_logout_cmd() even
returns 1 for an ordinary logout.

Fixes: 4366b19ca5eb ("iser-target: Change the recv buffers posting logic")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/isert/ib_isert.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/ulp/isert/ib_isert.c b/drivers/infiniband/ulp/isert/ib_isert.c
index b7dcfc5f88b916..804148ace398aa 100644
--- a/drivers/infiniband/ulp/isert/ib_isert.c
+++ b/drivers/infiniband/ulp/isert/ib_isert.c
@@ -1141,17 +1141,16 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 	int rc, sg_nents, sg_off, page_off;
 
 	rc = iscsit_check_dataout_hdr(conn, buf, &cmd);
-	if (rc < 0)
-		return rc;
-	else if (!cmd)
-		return 0;
+	if (rc < 0 || !cmd)
+		goto repost;
 	/*
 	 * FIXME: Unexpected unsolicited_data out
 	 */
 	if (!cmd->unsolicited_data) {
 		isert_err("Received unexpected solicited data payload\n");
 		dump_stack();
-		return -1;
+		rc = -1;
+		goto repost;
 	}
 
 	isert_dbg("Unsolicited DataOut unsol_data_len: %u, "
@@ -1169,7 +1168,8 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 	if (page_off) {
 		isert_err("unexpected non-page aligned data payload\n");
 		dump_stack();
-		return -1;
+		rc = -1;
+		goto repost;
 	}
 	isert_dbg("Copying DataOut: sg_start: %p, sg_off: %u "
 		  "sg_nents: %u from %p %u\n", sg_start, sg_off,
@@ -1180,13 +1180,18 @@ isert_handle_iscsi_dataout(struct isert_conn *isert_conn,
 
 	rc = iscsit_check_dataout_payload(cmd, hdr, false);
 	if (rc < 0)
-		return rc;
+		goto repost;
 
 	/*
 	 * multiple data-outs on the same command can arrive -
 	 * so post the buffer before hand
 	 */
 	return isert_post_recv(isert_conn, rx_desc);
+
+repost:
+	/* Nothing else owns this Data-Out's receive descriptor. */
+	isert_post_recv(isert_conn, rx_desc);
+	return rc;
 }
 
 static int
-- 
2.43.0

