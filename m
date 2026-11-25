Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622700;
	b=g9tXlSH0cb3cpFvdK2UO+pct5muK3LNTTXX+A6bvoM+/bBAAkrrsw7M7L4MxcAUrkBV6
	 8pIbAfKgV0/Sg8GSjhWz8A1XXm7X4i8Tdn9PziOLIKm6fQajxPi4UFzUEQ5V2CUbp9Y25
	 C+i3rZh/+UKQDaTgcCRk1bfb/w9mH4LZx28YCiUBnz4KdG9Az2RbYLKPS+68JxFUe9HfN
	 RvS8qZTR+fhJu993FAu+W51az7adXs/Tfl4OZwkJMHIof1xp3d03M6t6NDtjDSGbvHKqQ
	 xJxppxHcIQ8mdD4yt6fMTxy/uH3j1yWskn9GmYYpS6U2pKAC3lhSzYv/znUZBzQERGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nADcz2AeLIYYluSwXvBJ+Ioe3kCEZg2q9tDv5ALaqXA=;
	b=iMhzaRnvSRbq1Z/F5cfEkklEWlKjvDGP/xrsP6RPyfI6zz7bIkyZvAQlL4PuIvwuhJQO
	 yEciytQf/2KcQWuMfhAacEr7U69SKRKJV62CRx+o+xFbQQcDNeNYzqblHA2bMPDT04HIp
	 XeuZ+1DZGcIT9/OntfUlPwxDpLSonR4mqXg4SAnToOKVnMQOj4OnxS6iKy1K9HWOC26CD
	 WAOrwJwj8HSFF6hYwQWpANkbNIoMyTosTd60Qicp6tKSQ8GqhB6RwmliERk0CV65pwTBJ
	 WEiGCC1amqnjlufqmHCupk8QlJCP2cieLrxL4pRt87Vp1XLBQmuun/sTJnzY4grZZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUqAu831;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1301606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1301606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUqAu831
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efe591a1f6so20346315ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622699; x=1796227499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nADcz2AeLIYYluSwXvBJ+Ioe3kCEZg2q9tDv5ALaqXA=;
        b=DUqAu831pb6Qr70E3uaM1vedpSKLdpASgOs6rW8PTmrIqleki1ZQA9n5vRE8N/3fZF
         h3bdEVGZW+0TkQGbtUr0pkSb78zk+ahPBDNSOGZ+7dCWDLfvZCC2t0Y8DWlqA9vbCeiF
         /1FDeLanhOuL/1U5Roqdwx/vAMNQ298MTxTTJk6q9LA0DB5tAtORBuVewiEuAc05I23+
         WxFVBpPwWyXGKvhLqWIgEMnSsQ7xv5TXLr+8PRhDqusWGu6K/FtP/dyU3AD2ob5mDqsS
         zQnjIV2DSUk12hI3isJAw9+43VlKqB5JN+eg8Eu5XuaCStNB/5lj78KsEAzrQFiaYaKn
         Z5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622699; x=1796227499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nADcz2AeLIYYluSwXvBJ+Ioe3kCEZg2q9tDv5ALaqXA=;
        b=Q7gyUiZHcH8+2rtmwxvQUnt+LTuoqXvaYpIGKN/Un8BYno919TPUjjJcdbzUAVFPj8
         oBxCDpZzVoXjgjAAG39pst1dQfsE/i/NU0Su4x495mm6B2jtXLwwdnuGBKXE0pafJksQ
         DRSErVuDC43FLrkPTkm06yj18b1qJd5EK/KL4LqrAAhtoFqzveqhMXJdjkapCVEvHw5X
         1fSq4jUiiV36u+ItdfJgTE25PPHKCK8gcbKmwuaw59mv9c6SHj+uabh0bXmjP/AhgZf6
         ExzbuSxbPv7XIiK9dN+lgYNbegIZ5rQC7UZlg8n1Wo9DZTXb6ORyHdMgAEdk2jpIgxwu
         hNJg==
X-Forwarded-Encrypted: i=1; AL+hErFNsfeO0zG5T4DCCiJl9O4EtqdaMxBZEFqhyYruSFtdGVq8np/XXeKjbtw/OoCN7UYhn+AMQ9C8aqPlI4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yrdDAtRIGW/kF2zRH/6KChhXTahqtxObEOAP9RRTSvUlcwHXt
	w4ELMLEjCVLWv2Gmo4Kwfx+hEJ4CTj0nds6y7aKxW0wyBquaAPnvTlG+
X-Gm-Gg: AZFdTZdy205PIW7hBXa2a00xP4+ov7jo7hrapYGVjNe29llmxBTsb5V60IfozstGQgQ
	6L9//z1mTzX8WTrhfYlzQDHQ8orONXPWJ/yUkkHCXhLthsID8RDfbjAUq3djb8SY7u5koTD4p9n
	XSpISjSLazQv4byUHwySnaO82ED0Uzhfq/9mpY8qzNcLJztgvRnOYTpYvQBiLS8fMB4UJetlKKZ
	wmrC3fdkqjnJu7rtNMzfz8sAChnRd6A6Ovwb8/mnhVUwwLi3KVwkkZmZOtKnfwWLv8PcHRaklPL
	UpMN0L8DoPM99KOuSJp7C8/sEr7int8c0GkMJx6VmGsoYbZ+iSsu5G3WsWpOsr2D3UBvc712BwB
	xfWc7CC3kT2vw9fhc3FXzQolEPrw+HlIiPSTT3NdyWyGfVXsgdKpHVY6cRZOynkQP7zuPVNaWMe
	CDz5gl9sBUlnt5Nje1Eu7Yzjwe/SSYGRJSqyvHMCMzFDTMS7UwTVHmxAnpVEYDOP8mFHVtx2e6c
	3A+pTlmlBuWGihe3C5y2Wr7DpIlC4zmApLX3BQuBlFvxQzx9C0ZCcl5bPSYRNs05luhd8OfQAOe
	Cu7iQdAc4+1TpjZ9+feuY9lw2FK+bxPpZpGxUN5qqL5Nw3COXoSZ/Rly+CNjnQvP33QE9L3+/tX
	571J3oPbfrCquIwPoeqxkYFk=
X-Received: by 2002:a17:90b:55c4:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b41c92ce42mr16574121a91.28.1795622699105;
        Wed, 25 Nov 2026 08:04:59 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm3913712a12.26.2026.11.25.08.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:04:58 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	co+018500376d4b835e@bugs.sh,
	stable@vger.kernel.org
Subject: [PATCH] nvmet-tcp: reserve connect header digest and align PDUs
Date: Wed, 25 Nov 2026 08:04:20 -0800
Message-ID: <20261125160418.1518007-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

With CONFIG_NVME_TARGET and CONFIG_NVME_TARGET_TCP enabled and a listening
TCP target port configured by an administrator via configfs,
nvmet_tcp_alloc_queue() calls nvmet_tcp_alloc_cmd(queue, &queue->connect)
on accept before any socket read. At that point queue->hdr_digest is
false and nvmet_tcp_hdgst_len() returns 0, so the response, data, and
R2T PDU buffers on queue->connect are allocated at 24 bytes each.

When a remote peer enables NVME_TCP_HDR_DIGEST_ENABLE in ICReq,
nvmet_tcp_handle_icreq() sets queue->hdr_digest to true without resizing
queue->connect. Subsequent commands handled on queue->connect, including
Connect itself, then write 4 digest bytes past the 24-byte allocation in
nvmet_setup_response_pdu() or nvmet_setup_r2t_pdu(), and
nvmet_try_send_response() or nvmet_try_send_r2t() sends 28 bytes.
Because nvmet_tcp_alloc_cmd() carves PDUs from queue->pf_cache using
page_frag_alloc(), those 4 bytes overwrite the next fragment without
triggering KASAN. Replacing those allocations with kmalloc() exposes the
overflow:

  BUG: KASAN: slab-out-of-bounds in nvmet_setup_response_pdu (./include/linux/unaligned.h:38 drivers/nvme/target/tcp.c:341 drivers/nvme/target/tcp.c:604)
  Write of size 4 at addr ffff8880230f2818 by task kworker/1:0H/26
  Workqueue: nvmet_tcp_wq nvmet_tcp_io_work
  Call Trace:
   kasan_report (mm/kasan/report.c:595)
   nvmet_setup_response_pdu (./include/linux/unaligned.h:38 drivers/nvme/target/tcp.c:341 drivers/nvme/target/tcp.c:604)
   nvmet_tcp_io_work (drivers/nvme/target/tcp.c:641 drivers/nvme/target/tcp.c:866 drivers/nvme/target/tcp.c:914 drivers/nvme/target/tcp.c:1519)
   process_one_work (kernel/workqueue.c:3495)
   worker_thread (kernel/workqueue.c:3578 kernel/workqueue.c:3659)
  Allocated by task 51:
   __kmalloc_noprof (./include/linux/kasan.h:267 mm/slub.c:5531 mm/slub.c:5556)
   nvmet_tcp_alloc_cmd (./include/linux/slab.h:995 drivers/nvme/target/tcp.c:1549)
   nvmet_tcp_accept_work (drivers/nvme/target/tcp.c:2023 drivers/nvme/target/tcp.c:2105)
  The buggy address is located 0 bytes to the right of
   allocated 24-byte region [ffff8880230f2800, ffff8880230f2818)

Reserve NVME_TCP_DIGEST_LENGTH for queue->connect and keep using
nvmet_tcp_hdgst_len(queue) for queue->cmds, which are allocated after
ICReq. Drop the unused digest space from c->cmd_pdu, which only receives
copied commands via memcpy() and never holds a header digest. Round
every page_frag_alloc() size up with ALIGN(..., 8) so 28-byte PDUs do
not misalign following rsp_pdu->cqe or cmd_pdu->cmd allocations that
contain 64-bit fields. Using page_frag_alloc() with aligned sizes avoids
page_frag_alloc_align(), whose fourth argument changed from align_mask
to align in v6.9 and which did not exist before v5.12.

Fixes: 872d26a391da ("nvmet-tcp: add NVMe over TCP target driver")
Reported-by: <co+018500376d4b835e@bugs.sh>
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/nvme/target/tcp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 8a2e0e056131..cfc0e462d81f 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1532,30 +1532,35 @@ static void nvmet_tcp_io_work(struct work_struct *w)
 static int nvmet_tcp_alloc_cmd(struct nvmet_tcp_queue *queue,
 		struct nvmet_tcp_cmd *c)
 {
-	u8 hdgst = nvmet_tcp_hdgst_len(queue);
+	u8 hdgst = (c == &queue->connect) ?
+		NVME_TCP_DIGEST_LENGTH : nvmet_tcp_hdgst_len(queue);
 
 	c->queue = queue;
 	c->req.port = queue->nport;
 
 	c->cmd_pdu = page_frag_alloc(&queue->pf_cache,
-			sizeof(*c->cmd_pdu) + hdgst, GFP_KERNEL | __GFP_ZERO);
+			ALIGN(sizeof(*c->cmd_pdu), 8),
+			GFP_KERNEL | __GFP_ZERO);
 	if (!c->cmd_pdu)
 		return -ENOMEM;
 	c->req.cmd = &c->cmd_pdu->cmd;
 
 	c->rsp_pdu = page_frag_alloc(&queue->pf_cache,
-			sizeof(*c->rsp_pdu) + hdgst, GFP_KERNEL | __GFP_ZERO);
+			ALIGN(sizeof(*c->rsp_pdu) + hdgst, 8),
+			GFP_KERNEL | __GFP_ZERO);
 	if (!c->rsp_pdu)
 		goto out_free_cmd;
 	c->req.cqe = &c->rsp_pdu->cqe;
 
 	c->data_pdu = page_frag_alloc(&queue->pf_cache,
-			sizeof(*c->data_pdu) + hdgst, GFP_KERNEL | __GFP_ZERO);
+			ALIGN(sizeof(*c->data_pdu) + hdgst, 8),
+			GFP_KERNEL | __GFP_ZERO);
 	if (!c->data_pdu)
 		goto out_free_rsp;
 
 	c->r2t_pdu = page_frag_alloc(&queue->pf_cache,
-			sizeof(*c->r2t_pdu) + hdgst, GFP_KERNEL | __GFP_ZERO);
+			ALIGN(sizeof(*c->r2t_pdu) + hdgst, 8),
+			GFP_KERNEL | __GFP_ZERO);
 	if (!c->r2t_pdu)
 		goto out_free_data;
 
-- 
2.56.0

