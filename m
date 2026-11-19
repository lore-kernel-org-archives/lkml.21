Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094244;
	b=wb10IQpofC7PYe81EsrmpYNiCPP0BTUv66zETIAFRVLCbZHu11drx3HrJdCerbGwca97
	 PuQVVF/qXk9f6afAV0+9l3Da5fPgcYhfnufr8Uuf4Z6oQE9cDF9e0MT3q+9JZc3ml2oA/
	 TajuPGYMEbMna87IpRRvnymhV+JyTAm/648pr9LhZO/M0Nr+ZNsIMj0mmfgd34wbjzk6j
	 GZK27/6onQ+1bWgnx04zNJuPzX5atx2Di11MiWU0CFu7qeTUXLASg0imUcrZOWlL2RYtw
	 KzoqVtO8c+ieZG2qloGA8LkKhz63Ey+2fnUMMGjNToiOzlio6cQV19rVGlLH4ry5RTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
	b=u8SIUpP5A+VGnatJMUzG3eJwm6IKZF/hXlYnqbgelNGCV1QSD15ODWMOsYNky+tDRbS0
	 5S2uTqMCasuMUoX+v4mIgkOIJlG6XRLgsp+58nOp7KuMY2JMm9lcMONZBTjD8nIechcW/
	 aFP2hx1qHrbHMXaQBlL1tZMTm6hEKATzu06vDWW8LVzEv52VTj5mWZaTruB0wTNpuHlw0
	 wV2zMOjPzj/f+lCe7ZQ/lhJ9/ZpYKcZqJcK2opiSlN8VCZ5SDR/KQDxlnOiq0AIn0pgO5
	 oJ0SMUWYLnMHWW6zKgvFGP/WmCFcyzctBhvwjk5QAzRW4FCS5S7gWM+aUmulaDXSI0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="dMc79+3/";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2419F60A2635
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2419F60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dMc79+3/
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a07078200fso1246071b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795094243; x=1795699043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
        b=dMc79+3/bbz2dq/bJUjd6kyg4QIMok8By+PE3QK8cvP6ZawvYbZUM2YRgN4WmchUGo
         9cMCKmDqt7cBFOeH6A4qxfuGvgJnyvlamjSTmtMkbWxM+xGEcWswf4ZwbqNsl/SvPaXy
         zPCk6pxp4IBpZa9hNMp3Davj09P/kLs6qcW89RuyrDEv4GBJLHhEgHUb3s/9QOeiRu10
         +T1LfJVBnstPqqdz/eTr2mBE0x3w+PivdvlePMqVqEjGmyph0JKJ2Bjvo5h4Ir/IXDbs
         wEqNgxOUUlKXDZICvVHa1OEPQ2Gdn3oAoytRqBZpg4RRBT9Zd6vWlCR1UIjho5DM5SX5
         vbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094243; x=1795699043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1F5PhsVSMvlAKbqeP5i5JDJo+bg6gq7qbiCDaCKQio0=;
        b=Qk0ujMF3hZbKK1/6ToEgxqI/EA1oCt6727R/i+iAHlV7+X8ulouk+Mb9GkAFskqx+S
         H1OTcvp8ctHUIlnCFPlQGV7OTYc/yrP4Yz/yL9OOyfxVDYd51Ao1PGBOw5d+8cIIt1/D
         VXUe5MYewh+YG5SsR6vYDZ9JLqvWBDx9eikOPO8/0FN1DoYXPl/Icl7pgBy/0kSzUhO8
         Cvk14xpTlb3chZoypIrTIbU8JpJAOZ3vKVp9K9hH8q9ojLRBJJh29t+52b9rvMthg0ad
         NkTv+oAlrQMhehH9+RW63kt+mFB/obEdAkUt9/CExCyGq1uj0R+FMaut8nSkr/PEyXoL
         0djw==
X-Forwarded-Encrypted: i=1; AL+hErEuTbmSW/LD/0gNpcXK76jeiNL6qbleZ1SQXPD4iLDSsD1rNYiskAnwly11jD7xgYbJP35w30WclfZ39+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tUvn8kC9XHTpNgbpU14qcd2iKGTsEZ1k45zJVgzGqglP7p+JO
	T9RaACAJTDcaLr2rD72DHbA0e01mvfZIaq8aD66q05jeWzy3utLqsaqDUjaZXJZA/nU=
X-Gm-Gg: AYBFou2Yx2YEYiC3wNCbfRIQ/8RGJ/1i5H4VORWt4mA7F53dN4X9IxXa0oaAY8gan//
	6TWRgKcAi5iCT7ksBicOKdVNtdFtp7RnbwK0qDaI52ReQ/poL3E0fbOlJh1M/ob9nuY8NVUxFJ7
	i+QCG4b3USlrCBxu32ZYBnNnpPcXRM22tPKqBT6riDY+ENTeL9GSj2MhXIHvVw7p92aAI9Cj5+U
	yRwK7KXkO8Piwe/MZzVtDX85Y1jiT0WieU5tmzFis9OED+fPFmXYAmMjGtMMsXQL9P2tzzFeZcq
	04o0IuRsCBuOrqMVIn8aYA1A/IaPUks36LDvxzp7nhpd3t7B7FBqOrfuqhbL+2DTTP2VYSvNvxO
	4U+Xwd+MOByI3wfrbfpcihHRc0Gh1BjFnjDnMqzGDNRHBucEsilaUZDxOqovrD0bATXOpvWtQhn
	TbFwMHbvJJPew4W0K4Jael7aGPW/6X+g06kqgVsZmsFLH9EDDpRHmIGI3jc6Z1kAbaX5fdIqhBs
	QiS0IFBcDp7XzJyTr8lZaT/GvstU6AENbluxtiUfZuyM0ohpP+GTelYrUjvGXdj/48lMC9TZ/Nd
	SKH3MKWyYxL7MCqERtEjArbDh6Jl9TVlXaDWTIYwDjyQ40aWgFoLI4YLAvBr160zMArq5qIGgwZ
	I5LjJgG8p5b9KePA+8/JxK+7Q4cJw1bjnlEeHWA==
X-Received: by 2002:a05:6a00:230c:b0:8ba:f51a:1bc1 with SMTP id d2e1a72fcca58-8c5d3639dadmr5519001b3a.24.1795094243488;
        Thu, 19 Nov 2026 05:17:23 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:1076:1f1f:dde8:a816])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm2809467b3a.5.2026.11.19.05.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:17:23 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sagi@grimberg.me,
	jgg@ziepe.ca,
	leon@kernel.org,
	mkp@kernel.org
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] IB/isert: do not leak the receive descriptor of a dropped Data-Out
Date: Thu, 19 Nov 2026 22:17:00 +0900
Message-ID: <20261119131700.2722108-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119131700.2722108-1-yhlee@isslab.korea.ac.kr>
References: <20261119131700.2722108-1-yhlee@isslab.korea.ac.kr>
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

