Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618754;
	b=fOmy6f0APto7drScdJsadlh8pnMn+Rg9vGbhhznvdOAbuwynv+avmHG+Emk3F9t43op2
	 ni1jSkWefY9dEozwuq1FxNr7t1KQsXyk2cGgqsKtBCFHe1/vAweL3TbtoIT1/xRConvEk
	 vAU2f9kf1D590C5Wc8AgzEJmtXeMDXfH/hREfJed4mg0RdPuUeUFT33hhJwcUgRycHD/2
	 l5G0VwI12M6q6zVL2CcUxQO+YHyxm0JrE4uqqC8eHdYBs2DqvVY4mn4Bf1XkII1mQ7GW2
	 VpXOFsToSDNWJuzr+MheeQTLs30SEsIqGe+A8d/+bB/h0/SMDWszTOKkY0SBuByceug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4OeI5EFvoaAXtoZ5Eb5FS6GHhurfl3MoetK4e4Eh3dw=;
	b=OjRrSdG2FPqG5XyxVDwTWQYRcd7+od7ZROJPCUz01CjnRV0VNuM5QEabMKw1JFDgg+hU
	 Rmw3I6s/NDhFEqbnRoILNrjA03VAl/t79pOyE/YgYwkjT72r8SWA87nlkvuaBMo0Qcxya
	 kid+A8fKDlHlxA5iagFj3pQB520/NRvoaPElDUTDeigZT1hMTuGWrr4gL5AOYXVEzuU38
	 Pevz09wlaxtoDL6o3pfz1JG6om4G5XETXWQI4jiYk+Z46WZ0iCLso9AebNA/O1lzHITc9
	 ij3st5+ViIMOP6O6l/3I6OZkr4NsqSTJAuxhovgGjVa1cge5LVleWHTH5cPzCp57KZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CBhd6DgH;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E898606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E898606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CBhd6DgH
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso4066629b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795618752; x=1796223552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OeI5EFvoaAXtoZ5Eb5FS6GHhurfl3MoetK4e4Eh3dw=;
        b=CBhd6DgHuGdiZI5Oz0U/8bGNQ9GMoNWd4ttlUDNJcJSuZadOjCzJZlKhRZlVst6LLF
         ndNXo84hT8haJN1EhEialmAmTjK/3GyvlUkpjcvNxVYpIgloftCal8dYNUjdWD3HoFQs
         Np0kWeLl+c/IjPaCrnDeqRqpCZYXaYxR0mUsMvXuZU0DB/kK3C3Ewgaur9QsQblzsHQR
         96MJ7XIqYc23OrERRq8clgqpzgUAfvqgdqNWqL3N/X66LZaJ3cVhtb28s5qj0gfbS0wk
         hX1yDaiKha0NPnkrbE4aZeHHI996JOG4q+GpgGI38mKSgj+nY4XnG98DkzYtYQTQc6g/
         QaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618752; x=1796223552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OeI5EFvoaAXtoZ5Eb5FS6GHhurfl3MoetK4e4Eh3dw=;
        b=BaRaeCP2gYoV0lvB/5R7QkTTnElsq5+2nA0lpC2hVihuB2MiUahdOmSxIYQUwxlAM5
         BEr8GMDb7uNlaQkuHgpN8AhD6Uif0fuoOvec8+gJtgbUc9sxGK5lU+ZCak3RroGNX+Xg
         c4NHP4xGBCp83+bj5LRpslsmWtgaSzjImkR+206w/K4dvLls75uoTglH+uzGQBks4tvV
         +zvzsix7b1V6lCoY2KTMrsE7uswRkmrJJR2anE7kGFjLHHvuhEjCQ+w0zYe9bo0R7/VB
         cJVuwuJUVCv5hzYX/0re7e9P5I9/7Za+wcdcHom8I0UvzhjCkV4Gi3CGprGrNfVr9eBf
         GkfQ==
X-Forwarded-Encrypted: i=1; AL+hErHknEvNgJiajhr4QwJW/dawGqwTxZk6prpWyL4N8zvx+U7+ezAdOB6TQAehZjgqFaAVryW2mIeKGQMT9rE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oyk8MWbSJSOyxMNJ48IIB8wqr09hr2ZJK+rhGq2tgS92RaKj7
	CzxN9gfv5VpHipIJ24DXaXA62QumNbdfiAvLitBatSVJnNL92+SMerWpBSPwYJYzP0VRc4MF9/K
	zjDXCRiY=
X-Gm-Gg: AZFdTZeODkpytO4Bt/zl/BNduKBZWZGKhwe82DiWjVWeonR8xeMZm204MW+9Jkh0lxp
	nLS2w2LBP5KizQb2BGgSamSGSIZYvq1lSABKB4bxBfopskR+vXOUxt0ENS9WXt9iENvWX7OxgOE
	lXduDFDKwSKXdyRkei2L6Ds81u5JZZesC6SgIG0pPDHDVaNWHEit3uiPYWvyYBE4rzhTL2S7BmV
	BYLjNhR7bRG5IHEgFtvsDdiQh0zA5JWZvQBr7250J0TLsrVw00glZk91vroeq07RlyJ0uqcNodG
	m1VQqMeZGMyH4rM+o5SSK/Bfb4tn1D6sQUwKQLoNRCmS4yqe8gff+Rj6tT+7S+NpuY3RyX/gixt
	CAyiYxCCle0Olt28J0Jw4/hy8HUaCdRT3a8hp2O4UhHdrr7YlNBFv2/YdFiN2d1/a1jC2ktXEKS
	/p3dLAx0V9hsWixkP8pAivblyK1elSm7rWdf5X3v7ghwsKfMlZ/gu68YZqVTZ9Ryqv0e9x71uho
	idzPGtfI1Xy9PrQ17zat6CJZHL/18hjqO56Enhm1uzRTzSp3z41HDSRchQEYQOCstOwvY+Z8WZk
	7JFp7pPJ0KxKXXtbpTy8/qkOM86wXyrWNv9S39UFAFlBucySlPsAkb2d3Ryhn1j4i6KASTYuAe/
	eDglC6nbjNj5DdzKiHRmCQv0vEstiqmkQmNjaWA==
X-Received: by 2002:a05:6a00:410f:b0:89e:71df:d6da with SMTP id d2e1a72fcca58-8c8796a7bbcmr14809643b3a.5.1795618752315;
        Wed, 25 Nov 2026 06:59:12 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:6ad4:29a9:2f98:35a3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm9117488b3a.27.2026.11.25.06.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:59:11 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: hch@lst.de,
	kbusch@kernel.org,
	sagi@grimberg.me
Cc: kamaljit.singh@opensource.wdc.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nvme: reject a controller type change on reinitialization
Date: Wed, 25 Nov 2026 23:59:02 +0900
Message-ID: <20261125145902.254297-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124133122.4167640-1-yhlee@isslab.korea.ac.kr>
References: <20261124133122.4167640-1-yhlee@isslab.korea.ac.kr>
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

nvme_init_identify() caches id->cntrltype on every initialization, and the
Identify Controller data is read again on every reconnect.  A fabrics
controller that reported itself as an I/O controller on the first connect
can therefore report itself as an administrative controller on a reconnect,
after its namespaces are in use.

nvme_init_ctrl_finish() then overrides queue_count to 1, so the transport
skips I/O queue setup and the queues that error recovery freed are never
reallocated, leaving queue->sock NULL.  The controller is switched to LIVE
anyway with the namespaces still present, and nvme_check_ready() lets any
request through once the state is LIVE, so blk-mq dispatches to the freed
queue:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
  CPU: 0 UID: 0 PID: 81 Comm: kworker/0:1H Not tainted 7.4.0-rc4 #1 PREEMPT(lazy)
  Workqueue: kblockd blk_mq_run_work_fn
  RIP: 0010:selinux_socket_sendmsg+0x76/0x2f0
  RSP: 0018:ffffc900008ef528 EFLAGS: 00010206
  RAX: dffffc0000000000 RBX: ffffc900008ef730 RCX: ffffffff822ab089
  RDX: 0000000000000003 RSI: 0000000000000000 RDI: ffffc900008ef738
  RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
  R10: 0000000000000001 R11: ffffffff84c14740 R12: 0000000000000000
  R13: 0000000000000018 R14: 0000000000000000 R15: 0000000000000000
  FS:  0000000000000000(0000) GS:ffff8880e6931000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 00007f52b4001b78 CR3: 0000000009275003 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   security_socket_sendmsg+0x6f/0x90
   sock_sendmsg+0x117/0x390
   nvme_tcp_try_send_cmd_pdu+0x4b7/0x9d0
   nvme_tcp_try_send+0x20e/0xbf0
   nvme_tcp_queue_rq+0x1148/0x1510
   blk_mq_dispatch_rq_list+0x3e3/0x1e30
   __blk_mq_sched_dispatch_requests+0x218/0x15c0
   blk_mq_sched_dispatch_requests+0xd7/0x1b0
   blk_mq_run_work_fn+0xe4/0x190
   process_one_work+0x747/0x11c0
   worker_thread+0x57c/0xcb0
   kthread+0x327/0x430
   ret_from_fork+0x394/0x770
   ret_from_fork_asm+0x1a/0x30

Reject any controller type change on a controller that has already been
initialized.

Fixes: e715b8733df60a ("nvme: add capability to connect to an administrative controller")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v1: https://lore.kernel.org/linux-nvme/20261124133122.4167640-1-yhlee@isslab.korea.ac.kr/

Changes in v2, after review feedback:
- Generalize the check and move it.  v1 rejected the change from inside
  the administrative-controller override in nvme_init_ctrl_finish(), and
  only for the I/O-to-administrative direction.  v2 checks in
  nvme_init_identify(), immediately before ctrl->cntrltype is overwritten,
  and rejects any controller type change on an already initialized
  controller.  That also covers administrative-to-I/O and changes to or
  from a discovery controller, both of which v1 let through.
- Cut the commit message down to the basics: drop the walkthrough of the
  resulting state, the CVE references and the note about the other fabrics
  transports.
- The subject changed with the generalization ("an administrative
  controller type" -> "a controller type change"); say so and it goes back
  to the v1 wording.

 drivers/nvme/host/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f43582e5f6c4a9..ffe6a63d24e1dc 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3736,6 +3736,18 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 	ctrl->max_namespaces = le32_to_cpu(id->mnan);
 	ctrl->ctratt = le32_to_cpu(id->ctratt);
 
+	/*
+	 * The controller type fixes whether the controller has I/O queues,
+	 * so it must not change while the controller is in use.
+	 */
+	if (ctrl->identified && ctrl->cntrltype != id->cntrltype) {
+		dev_err(ctrl->device,
+			"controller type changed from %u to %u on reinitialization\n",
+			ctrl->cntrltype, id->cntrltype);
+		ret = -EINVAL;
+		goto out_free;
+	}
+
 	ctrl->cntrltype = id->cntrltype;
 	ctrl->dctype = id->dctype;
 
-- 
2.43.0

