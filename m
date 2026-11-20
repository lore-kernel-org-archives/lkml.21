Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174804;
	b=2kDniQdl/0xTt0/imsoNTbY/PmS5z4u4rxhggptwIZmIcAiDRNvpP3byd11KWDjS/CAe
	 527wHqZqQOzmDaWsTkcBV53CDif4WSoP5g3sysjmOCKk4+uuBOusn7aV9cXcKtpkL4U1J
	 CuejmK/FKs9fTv294027RcXsm4rfL0craKNOoqN2jOqNAWsXfaW8NiOy+z7oVX9XaCPRA
	 OmuOUX8+pVIN4MtGZikBgUVs1zv5WtdolVyAjbZndAIc6XcEH3fhKLhKosI+FjuPBt3J6
	 IuFpbV/NI43hZvWBOLHT4kiFsTFmeiQeA3DMA0wSUIb94GAVf2vzAKUkV1DTTeOUCyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cw32rxb0JMiO3biaJ21jKGN1UmuLPVsWaNPJJq3nW20=;
	b=p5Mcxq4rN77TLoy2TI9wlewHuEYG8HvlcT2QdlbjQhrXXSeRZfTiENGVZ7PMCLESTgkZ
	 IaH4PUVqy6hhUF1Yl/3a9fwyko9cXbaJiHMB7dkqkXlYeMw9mYiOCZXFWhd0rhq41I+Pt
	 71xYJwUe7iVmA3opGrAPUuwN91piSxDT8VjlE5o8EU5KQdRDiybayCD+8Z9yHYzWc7Q9U
	 MiWicKI2OVwky+ngadlIt9XtB8fZ1eqb4WnlH9A1RQ9f+gL4+ndnktVzGRV4MyC9rBsVW
	 OFLpq2oFuxkhMaHld/Eef22w06yJNtTR6ybgHg9zTK7oJ7gcKSy2+tfMdFyw53spZjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lUlAVEGt;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A081C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lUlAVEGt
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so463596a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174803; x=1795779603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw32rxb0JMiO3biaJ21jKGN1UmuLPVsWaNPJJq3nW20=;
        b=lUlAVEGtCzgQoqRaac1b9s6fKHZs3qxeQ9EPPmSA8N9uuHg0iwfUQsKNtKz1c1OLE5
         whOj1BCqqbGngi+8dwLzQ/0+MDnBzsiDBsSn6tQHvk46/J95vSB8A3m5Ylsr31WFry4u
         PKkRVhGqemZNfNRHKuZFQMve81yAhNW6lzGCYIPRjobnJ55776QfXwTAf8L+dj4ryOIT
         mT4oBNfqrbYORbQ6I9SLlP6lzmcIXSrvyiMAhixboxEuviYVNvp3hhnhpx/v0iswyj6Y
         2nFXe+Bf4t0T72YtcRygi23Lbnqx1bY1beSmZUOoE6Ikf2v0e4MNoZjEpEBhataizVsk
         zxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174803; x=1795779603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cw32rxb0JMiO3biaJ21jKGN1UmuLPVsWaNPJJq3nW20=;
        b=nKO474tACYYrZP5xq1o9/zFzQvb6+fy7bsAuU9dfvJuLK4ZUsjOcIqzWLldTKjmbJz
         Q52MCAT81gG17SPS088zpgmaKY6hsHMKX2HTngYG/tqKCb3qTFp/ARjME9HC/MAF9C9e
         Hn1JPBzxw40hAmjDjRmRPm4VPJQg1JZ6KJraBk0mGCMwMKaOSPOyaaEWGsKYxf/2ynxN
         QH8wu1BWtW7juI4F5vLLcwYseFJqah0RMKZnwn4greQpdSHnx3D+rI7IoAaEUzbTvigW
         3vRwRaFEdiGbKs66JW55e/agLgJUYE138QBQb9QcNjtI/1QQ+USA61RYmj1vPkv9hoxG
         ONWA==
X-Forwarded-Encrypted: i=1; AL+hErHrxNgxki25GduTx5u69KpUUPo0P9GhFzW/UgXdIlfajbKHEWVCTmsoQLTnKe23EgO9JyUAwXpducjV3hI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DjpFgP6N8XT3eT3eaqD8YO7cGaysDg82sSOqrwHml2Ep1pl5E
	bNpxZPq2BvyznCo+EMHkLuxZOlrfkpxePAKoOvGtroMqLB5kMkz9hDvi0sR+NCQKIiw=
X-Gm-Gg: AZFdTZdKZVRs1Y5MrV8Ge3AMF/oXKTx+bTq6/6k3/mo7RS2JZNfyEYb03heGH3z5Yuu
	InEuiW0kcTZxabrv+ysNgFQsEDsWSvqjbNnaTct5AADv3UvCauUyR012Fn23kxBj2U8GL+HdBTc
	W7AeFuzfO3lBqGOZt++kpGNhvcbAfnG5iImiyyBITA0iu0ZhbG94z9OTRTXf/g7dkDW+Sz2yEUN
	Gml3jrQCJgGQMGuglP5KpnGI+4gU7KFTVm3wSZY0G2Du/hjdG78rDYhdNV6sR6PbTH6GIqT67zD
	vnLYCtrMJYw+GL0TLqKB8lQX/FRjb7VgddM197G/Vr0lzGgsSaO9hxjluBEX7BqsoD5+E5w+6yj
	WeSAs2I4tftndtkoUJ24bORG+n0yFDT9uEYl9dMDAWgFAMppzVxhP2j1PnemMxZCHMrdFuTydSA
	UZ+iXVFeg+cyU2DhHakEHUMvGJc/zLp/X/6gQLxl52IOQawniaTFsGzHBJ1rkoxbKA+B3QegQbT
	EGcEtNawqF5ubUTY9U3tLN5EW9CRfdHQpuVqkVUpGQGa42NYNMthwW28zBnMNkz0RL2mTaLxtTT
	1lPI0MuNoc/+HcLrKYtum+VSmJjDL6KtuhwLuhNe4rMhpgwXrRjnNNJeKOnkTh7U3McKVSVWPfM
	X4WS56nFVIzPC9eqxNCCO5kPlSV9snUShkylc
X-Received: by 2002:a17:90b:3fc7:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b41caf5efamr2323448a91.46.1795174802943;
        Fri, 20 Nov 2026 03:40:02 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea748csm1173293a12.4.2026.11.20.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:40:02 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: gadget: f_tcm: do not dequeue UAS stream requests in BOT mode
Date: Fri, 20 Nov 2026 20:39:56 +0900
Message-ID: <20261120113956.3071640-1-yhlee@isslab.korea.ac.kr>
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

usbg_aborted_task() starts by reading stream->req_out->status.  The
stream requests are allocated by uasp_alloc_stream_res() for the UAS
alternate setting only, so in BOT mode they are NULL.

The target core calls .aborted_task() from target_handle_abort() for an
aborted command whose CMD_T_TAS is clear.  A BOT command gets there when
a LUN RESET arrives on another fabric that exports the same backstore
and the backstore has emulate_tas set to 0: core_tmr_drain_state_list()
aborts every command on the device, no TASK ABORTED status is owed, and
the core calls .aborted_task(), where the read faults.  With the default
emulate_tas of 1 the core sends TASK ABORTED status instead.

Return early unless the function is in UAS mode.  A BOT transfer uses
fu->bot_req_in and fu->bot_req_out, not the stream requests.

Reproduced on dummy_hcd in BOT mode with a fileio backstore that is also
exported through tcm_loop and has emulate_tas set to 0: a WRITE(10) has
its data stage held while SG_SCSI_RESET_DEVICE on the loopback disk
issues the LUN RESET.  Without this patch 3 of 3 boots oops as below;
with it none do, and the write does not reach the backing store.

  BUG: kernel NULL pointer dereference, address: 000000000000005c
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] SMP NOPTI
  CPU: 1 UID: 0 PID: 30 Comm: kworker/1:1 Not tainted 7.4.0-rc3-FT9NNM-00395-g8dac6df92a2e #1 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: target_completion target_abort_work
  RIP: 0010:usbg_aborted_task+0x2d/0xc0
  Code: fa 55 53 48 8b 87 e0 01 00 00 48 89 fb 48 8b 50 38 48 8b 52 30 48 8b 2a 8b 57 24 48 8d 14 d2 48 8d 14 d0 48 8b b2 58 03 00 00 <83> 7e 5c 8d 74 2b 48 8b b2 50 03 00 00 83 7e 5c 8d 74 58 48 8b b2
  RSP: 0018:ffffc90000107e40 EFLAGS: 00010246
  RAX: ffff88800540d000 RBX: ffff888006c6c870 RCX: 0000000000000001
  RDX: ffff88800540d6c0 RSI: 0000000000000000 RDI: ffff888006c6c870
  RBP: ffff8880053febc8 R08: 8080808080808080 R09: ffff88800491c218
  R10: ffff888005031cc0 R11: fefefefefefefeff R12: ffff88807db295c0
  R13: ffff888006c6c9a8 R14: ffff888005031805 R15: 0000000000000000
  FS:  0000000000000000(0000) GS:ffff8880f9e92000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000000000000005c CR3: 0000000003030002 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   target_handle_abort+0x6b/0x130
   process_one_work+0x19e/0x3f0
   worker_thread+0x180/0x2f0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xee/0x120
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x186/0x230
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Modules linked in:
  CR2: 000000000000005c
  ---[ end trace 0000000000000000 ]---
  note: kworker/1:1[30] exited with irqs disabled

Fixes: 76003eb6d09278 ("usb: gadget: f_tcm: Handle abort command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..57e2ec81f29a8a 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1614,6 +1614,10 @@ static void usbg_aborted_task(struct se_cmd *se_cmd)
 	struct uas_stream *stream = &fu->stream[se_cmd->map_tag];
 	int ret = 0;
 
+	/* the stream requests exist only in UAS mode */
+	if (!(fu->flags & USBG_IS_UAS))
+		return;
+
 	if (stream->req_out->status == -EINPROGRESS)
 		ret = usb_ep_dequeue(fu->ep_out, stream->req_out);
 	else if (stream->req_in->status == -EINPROGRESS)
-- 
2.43.0

