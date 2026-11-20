Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169107;
	b=MZKS5XnIH2ZhxLf7FJhCUKTys99awGyTW79a96EhIJgiCI1HltesqQDoS03zuvjO5+HM
	 e0YqITo5ib6oyNENP0Oez7iDK8fRIEzaX4kHc/fk6wlJy2st8L+38LlaIFkhqIexGQwOa
	 b04ptIXqIY3Ue/mj++sYXLW0m1f3vmWqXC6/EjKj1RgG88WAYlzCySTjYLJjIjQRm9sr0
	 5bqoHpSvyetWmTWPTWuogvkjzqGS4sCoI5v/jKZV2ySxeUlsBCb7Tpte82/WcI3dycd9a
	 2fJheUak610B7LbGxfDsmGlH/XURHvz+mLK2lGdmQoupur3HjurPTdNZQesH+PTTtTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169107;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References;
	bh=V1bletBBmFzgP3KM7Pmy8mcz2DisqJPVmCiDTj4GpQo=;
	b=gjs7OUfHv9TYd8BccGKjhcMOZHjQEO7SZG//ry/AohFFR+Qf3c88Wo/Uf3UIN4bDfNX/
	 upZSaDr17QxDOQ5T5iRj6MSSjQmxVcK9RR1ZvCzEI68kn89CpsL3MBabfR5aDF2ZtKYNN
	 hmilQXm8wpHVU0BOtTVSTiU5IknHEUn+jyiiO0/Y50BC3BUDVwRrtAkw6UpUjB9ipb8jm
	 OVYPkRzpf0k4/gsMMn0crXj+xq6FzNAzEVF2/gjCDiZvIzBsZB/3hPkMHoQPERqE7jLWT
	 xdVmgE+BVC1jG5Y3Wm/V/2yyUejfI0DVqHrMAGY6tpx2+oQtovtlJdJsIK7HEnEl9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q20HoGJv;
	arc=none smtp.remote-ip=95.215.58.55
Received: from mta1.migadu.com (out-55.mta1.migadu.com [95.215.58.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31F606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D31F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q20HoGJv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ng/wAh7AewkOw7mNZFYHbrZ24FFhrffZjL27PnC6qkE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795169104; v=1; x=1795773904;
 b=Q20HoGJvLYhtk23nGSHzTh50XD8L+j5lDYFcEINFZONArHVYz819eodQcDbe1E7wZ5lsnvFj
 dmWQrRqgzvIo6tAGH2reiCAd4lftlLcG1ZWSL04hQZ6+5cenLyUKe/5/GASLcDMKzeNzsEc4Qn/
 yUjekj+e8mVnPNzU0jdw8bQA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 012496df1f2cea66;
	Fri, 20 Nov 2026 10:05:03 +0000
X-Mizu-Trace-ID: 012496df1f2cea66
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	urezki@gmail.com,
	boqun@kernel.org
Cc: qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rcuscale: Disable gp_exp when cur_ops->exp_completed is not implemented
Date: Fri, 20 Nov 2026 18:04:52 +0800
Message-Id: <20261120100453.5826-3-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120100453.5826-1-qiang.zhang@linux.dev>
References: <20261120100453.5826-1-qiang.zhang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The tasks, tasks-rude and tasks-tracing scale ops provide exp_sync but
no exp_completed.  Passing gp_exp=1 with one of these scale types makes
the reader, writer and kfree paths call cur_ops->exp_completed(), which
is NULL, resulting in a NULL pointer dereference.

This commit disable gp_exp in rcu_scale_init() when cur_ops->exp_completed
is not implemented.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---

# insmod rcuscale.ko scale_type=tasks kfree_rcu_test=1 gp_exp=1

[  957.313922][ T1311] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  957.315073][ T1311] #PF: supervisor instruction fetch in kernel mode
[  957.315918][ T1311] #PF: error_code(0x0010) - not-present page
[  957.316649][ T1311] PGD 0 P4D 0 
[  957.317082][ T1311] Oops: Oops: 0010 [#1] SMP KASAN PTI
[  957.317799][ T1311] CPU: 3 UID: 0 PID: 1311 Comm: kfree_scale_thr Tainted: G        W   E       7.4.0-rc1+ #118 PREEMPT(full)  d93f260d09ad39f5830a6d4abcacc3510ff31cf2
[  957.319925][ T1311] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  957.321343][ T1311] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1 04/01/2014
[  957.322763][ T1311] RIP: 0010:0x0
[  957.325961][ T1311] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[  957.327030][ T1311] RSP: 0018:ffff888110a67d88 EFLAGS: 00010246
[  957.334010][ T1311] RAX: 0000000000000000 RBX: ffffffffc00b8d80 RCX: ffffffffc0605ee8
[  957.335015][ T1311] RDX: 1ffffffff80171b7 RSI: 0000000000000004 RDI: ffffffffc00b8db8
[  957.336000][ T1311] RBP: ffff888110a67e48 R08: fffffbfff8017068 R09: fffffbfff8017068
[  957.337000][ T1311] R10: fffffbfff8017068 R11: 0000000000000003 R12: 0000000000000000
[  957.337973][ T1311] R13: 0000000000000000 R14: ffffffffc0605da0 R15: 0000000000000003
[  957.338979][ T1311] FS:  0000000000000000(0000) GS:ffff8882658e2000(0000) knlGS:0000000000000000
[  957.340092][ T1311] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  957.340884][ T1311] CR2: ffffffffffffffd6 CR3: 00000001caaec000 CR4: 00000000000026f0
[  957.343924][ T1311] Call Trace:
[  957.344354][ T1311]  <TASK>
[  957.344739][ T1311]  kfree_scale_thread+0x19c/0x5a0 [rcuscale 4b3bd1c4339388c164c4923083b9e192f124c200]
[  957.345977][ T1311]  ? __pfx_kfree_scale_thread+0x10/0x10 [rcuscale 4b3bd1c4339388c164c4923083b9e192f124c200]
[  957.347251][ T1311]  ? __kasan_check_read+0x15/0x20
[  957.351496][ T1311]  ? __kthread_parkme+0x11e/0x230
[  957.352127][ T1311]  ? __pfx_kfree_scale_thread+0x10/0x10 [rcuscale 4b3bd1c4339388c164c4923083b9e192f124c200]
[  957.353924][ T1311]  kthread+0x3ca/0x500
[  957.354484][ T1311]  ? __pfx_kthread+0x10/0x10
[  957.358092][ T1311]  ret_from_fork+0x7be/0xaf0
[  957.358652][ T1311]  ? __pfx_ret_from_fork+0x10/0x10
[  957.359209][ T1311]  ? __kasan_check_read+0x15/0x20
[  957.359737][ T1311]  ? __switch_to+0x199/0xe90
[  957.360224][ T1311]  ? __switch_to_asm+0x39/0x70
[  957.360725][ T1311]  ? __pfx_kthread+0x10/0x10
[  957.361207][ T1311]  ret_from_fork_asm+0x1a/0x30
[  957.362616][ T1311]  </TASK>

 kernel/rcu/rcuscale.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index fc19366fc3a6..c9d2a898777b 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -1186,6 +1186,9 @@ rcu_scale_init(void)
 		if (kthread_tp)
 			kthread_stime = kthread_tp->stime;
 	}
+
+	if (gp_exp && !cur_ops->exp_completed)
+		gp_exp = false;
 	nrealexp = nexp;
 	if (kfree_rcu_test)
 		return kfree_scale_init();
-- 
2.17.1

