Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527092;
	b=HRiRdQzCNoCs9DP36cI5h1TpPGRH4bwFG7NqYLUSxgFYpVvpmOfOYaWuDE4iyYncWuYo
	 h2noKV3S1gYvS9YMDdoy103KsbHUL/+HxZzsIh/Fta1k1YoyxkWrfg0Ma49TQ1sTCQW+q
	 P8GkDSLzhxPlSiTxerEvhA6lIoEnVe4CKboIjMtPaxkqFXV+JWPHSlDn++HOZJcvdIIQn
	 WMB/eEabZOy12fAIVfM9vcRMFWdCZQsOD1s/EEIt5qVvU5G5alE92fn0NMREThKTqvDww
	 +cblkGzURWLM4Mk0iXyOgqME/ZZX+C5lHtEhPaIlTtc0HncBl1KAg2eDr672OL26npg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Me8KIRmzXo/bdvyOB/3ftu/EhGKIsFSgZhz0hOWyiNk=;
	b=peYHRDY+zumuEyIcEcda7Ml7jE9MX4qBolMIwiD34jMN6D0zBdEOcoyzchzYQVmHsQUZ
	 eEAQ6O7MeS+BT59Zi45QCHif483Xcn3kucq2IjstxpO9zmkM+p6D1uGOuRUt5Wi6kBVH6
	 mgAq0wA0w8Lj6kVub5lPi3r5IOVEmm2YikMcMk+Mw7pWr1WuTZpE5egli2IJKqnGI8dvG
	 iOazxEBqWZRx8bN6SVpgufnWgryD7/cUQmsnqFzw4+W37xR156o4lSAPQDiIodcPD6SFJ
	 MkHqo+vAQJeM5zLQzrhY68ahiRWR7HRw50+Op9z5kxRfvXFXYmV0NPxraDnAuXnacNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="o0J/MUg8";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0616A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0616A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o0J/MUg8
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f03920c477so38020535ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795527090; x=1796131890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Me8KIRmzXo/bdvyOB/3ftu/EhGKIsFSgZhz0hOWyiNk=;
        b=o0J/MUg8kEZcByt7/7gxRl/wq56ok8ODlCmnbwPh0epBFMblPRwccLkuMZzPBMGsuy
         uzrVKGdSu0HiQS87zUTfd428jE1/KwxXkBKHk59mWgg+u0uFfZ6sI35/IwybiOsphbmL
         rFYFlgxZpmwh0UQcvtrMqpjtHNll1E3PQdZ5bw0pZzXRerc78eXgoXBA5A7T9gUckYIn
         Bf99+/X1mNsE4Bbea/XpVyH4owPv/fmBBb5JkAr3qQyMXlDRNsEqqyMRFqb4YmysX0UB
         gOHL9RsPyq6mdsSWyiMxxY/V6RWM6VmYnFZOiUabfG5eDjweUuq5AJTd6DKTbvAXkuf3
         zhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527090; x=1796131890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me8KIRmzXo/bdvyOB/3ftu/EhGKIsFSgZhz0hOWyiNk=;
        b=sCqsM7hD+XyuUVOGmvUSfHwPaG3jWt3s/DegwH6xJ59nlFGTWOOC7rEd/rUhWPlbIi
         0bqCT5Wc/ucFqt0VH833lBxYFUS6jLoRiYcZWbSIX14cp5bl9rpwlAK8I2Jjj13jbYRI
         s4pinqmVM5/D+GcgqWbHROqVLXI6naMSWt97sjazpMPd0Wr07ubrr2cqcDxw/vcePrOw
         jspfXnMRtA3DZhWU4v6Fo8Pi5bi1WqUpVuhZTe/sDVBUK2W/BbrTzSAKrfmxk8rdzIFC
         pdZ9QKYj4DqRiPIWOp8TI3PiZuePugk/y1IDtLz2sSJQcuy1IZ3MsiBVVkWCrCDPKjti
         VxSA==
X-Forwarded-Encrypted: i=1; AL+hErEoA8wW+gDbmfHoSV2qgCX/bMR0258lnWgczSzDs8G/g02fyo1u8jtNQDO6xuwpX4rEhjAuKYHndKAnTmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gCIE2sAv5C0cpbWSUzuLt0srtRqnhA+HiTMA/ntPHhBLAQQlN
	Sg7hJfrRsBArPTImlzltZVCnAlEx5+a8X+5X+ZQwsyw4mKYmIo95WaIsH+vBv6AWob8=
X-Gm-Gg: AZFdTZcOeXrWg2UcscD6sIHl/FebdmMW5O6amWwGbC2DF53hfrPK8b/j7ZjQrYeDn8n
	6PeyDZH67rVmacPKTdspQ+B4EP+uGvgGJ0JugsUNl+ETfbCMeKGhlFsfk7Wb88C+KyS8aVv0kKI
	gqs9Qni8o+4nv9bQLECuwE10bu5VGwJ6lOtvW4wC5faoaTOVnkWcHDIRmyVnl143B7fFtYoIWfX
	xZ8VrufHaTWqKMbRc9/U3C1FKiqfwtqEz34yTGbJEjPBAthX3ADf4VWmikLvS0ycDDsA/gydN0+
	vt+toTVi4iCI4ZJWNcM5jxMMZYBewg/yoXPN7u6uHmhtvjUVpWzAVBw9+hhej6fGkjX6aWT3wkm
	Y5kmo0klXzW1YZPWgydpk9kjkPteezbtw9wABZu64JsmoucHPdvXrbTLXVKxQMB1HI21vGAWA4R
	BYXrn0eoOqWaXBvDu16hw0Rmw/gAzj1RrFziz7++TYHW7Lxmp6aK9cv7KcEeOPXtEvBQZhU49lo
	bG3HTqBwmfyp7JgmO3FFPLANkj8T9pUVYucK6JVd51iQvjgstqmfNobzsxtnQoUux4TTKEyduab
	dYiSqNQd4WxaV2cqcg/ifxBMCazwjhFj4MnJwHZF0R+wdMTickgF/a7BgMCEcnDQWLtSxkkv8Zq
	WLLPnXbewkG5TwojOtx++2OgKgkiL8Sy/CkOx2w==
X-Received: by 2002:a17:90b:3fc7:b0:3a8:5cab:1009 with SMTP id 98e67ed59e1d1-3b41cafe282mr14638129a91.46.1795527089980;
        Tue, 24 Nov 2026 05:31:29 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:2bd9:e105:537c:ed15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm22800276a91.8.2026.11.24.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:31:29 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: hch@lst.de,
	kbusch@kernel.org,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kamaljit.singh@opensource.wdc.com
Subject: [PATCH] nvme: reject an administrative controller type on reinitialization
Date: Tue, 24 Nov 2026 22:31:22 +0900
Message-ID: <20261124133122.4167640-1-yhlee@isslab.korea.ac.kr>
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

nvme_init_ctrl_finish() takes the controller type from the Identify
Controller data, and for an administrative controller it overrides
ctrl->queue_count to 1 so that only an admin queue is created.  The
Identify data is read again on every reconnect, so a controller that
reported itself as an I/O controller on the first connect, and whose
namespaces are in use, can report itself as an administrative controller
on a reconnect.

Nothing absorbs that.  nvme_tcp_setup_ctrl() skips
nvme_tcp_configure_io_queues() because queue_count is 1, so the I/O
queues that nvme_tcp_error_recovery_work() freed are not reallocated and
queue->sock stays NULL.  The controller is switched to NVME_CTRL_LIVE
anyway, while the namespace, its gendisk and its tag set are all still
there, and the I/O queues have been unquiesced on purpose to fail fast
the pending requests.  nvme_check_ready() returns true for any request
once the state is LIVE, without consulting NVME_TCP_Q_LIVE, so blk-mq
dispatches to the freed queue and the send path dereferences the NULL
socket:

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

The state it leaves behind is stable, not a teardown race: the
controller stays live with cntrltype "admin", queue_count 1 and the
namespace still present, and every I/O submitted to it from then on
takes the host down.

So only override queue_count for a controller that has not been
initialized yet.  A controller that already completed initialization
with I/O queues cannot lose them, so fail the reinitialization and let
the transport retry the reconnect or remove the controller.

An nvme-tcp controller is a remote network peer, and the host driver
already validates its response data as untrusted input elsewhere
(CVE-2026-89481, CVE-2026-89973).  This is the same kind of validation,
on one byte of Identify Controller data.

nvme-rdma and nvme-fc gate their I/O queue setup on queue_count the same
way, so they are exposed to the same sequence; only nvme-tcp was tested.

Fixes: e715b8733df60a ("nvme: add capability to connect to an administrative controller")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/nvme/host/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f43582e5f6c4a9..831f4c184ddc7c 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3826,7 +3826,17 @@ int nvme_init_ctrl_finish(struct nvme_ctrl *ctrl, bool was_suspended)
 		/*
 		 * An admin controller has one admin queue, but no I/O queues.
 		 * Override queue_count so it only creates an admin queue.
+		 *
+		 * Only do that for a controller that has not been initialized
+		 * yet: dropping the I/O queues of a controller that already
+		 * has namespaces leaves them without a transport queue to
+		 * submit to.
 		 */
+		if (ctrl->identified && ctrl->queue_count > 1) {
+			dev_err(ctrl->device,
+				"rejecting administrative controller type for an initialized I/O controller\n");
+			return -EINVAL;
+		}
 		dev_dbg(ctrl->device,
 			"Subsystem %s is an administrative controller",
 			ctrl->subsys->subnqn);
-- 
2.43.0

