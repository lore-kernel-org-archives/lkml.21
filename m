Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043032;
	b=W+eM8zPmTNCbg+2meT9usBEY/zq1u/OMh1EboUrTf3zYP6thO6J5oOUOjs/fTMV2CSoe
	 kT9RMEhwJklkXu1dFRBEGJPv8zY8d21aVIOAiYN+7RDLEhVUAqNMS+z0vvCCaTCK+QNev
	 zpuhgbNJS8wR3KHXubetrQ0cDcECjYAbeR7BuWHD1Ep9tFLbRebu607j8bHfbBE9cWj2M
	 t6jx2dZmnFJxW/VMrYe1nFPbCf59xqBquHUMi0TXsWBGrKVt7Kq4LbFOVvwIubgdQqdOR
	 xYcV73k9hTdnPv/Avhb1pTcuUVlWq/O0mKnxgm2KxXectSO4v27+3/XqBpo+qOmweUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043032;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=rQxsNyOvQHOwVFt65PvoUK5jvqQgcEPQjw5gOy3ki27i1G7LNDOfwfTCJJOI/4KQLrJI
	 hjD9DpxGp5phnvjAOb0HWV3Wzk/HAMPbfQ7DdcQ51d6SDtE8oxFCb8FZAYgJ0Z/sHR+GH
	 XTxpEsh7mh5iX4qjXRiCYloWKXmUX/qLUTS3/DJok5vexSPc/yG/o2CnThMn8j+7magYR
	 Ot8AHiT6NWN6qvl/fVar7Fy1eBUp/lJiayXjSXc7a+PWlXXlAJz0/BKvBRzICDnypA+uJ
	 IrbaccC1j/zbxH6heuBnbpm1qLmdJeqzQbuZMqrijt+KQ9BCRxpTG481QoSnobKflsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kGvYBu+Z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oTYLcZxA;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76260A2624
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C76260A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kGvYBu+Z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oTYLcZxA
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795043030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=kGvYBu+ZCD0gFf4HuhZ/QIvcMtNPRb4PfCnWC2KRWN1lOWJRpcakghT3OWuPkfRDKUQEG9
	uXNVCesUBpsxJ0FkWXq5QXaHm96DbL+DH2ye37F3BcqQygsnmgvD3nc1gz1P8wpP8Vpe9J
	BogmE/75LFALbc2MPC0xDHefurulaSni8IntBEdU7IHektsaL95yQ9mf58X+zz65ahHi2Z
	TvjlYGGhahIelEDo7TnJtQZG8JKpGW6swNgOMB7zc7M+Cc+cJWLER9IWSlZLfowjJehQJE
	o43N9DIWZ/OztO9+DnATG7wMwPC8aesmz0JPfl6emZbQNteK71j2XABbmul29A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795043030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIeG/X/94duY8UPmUKyn4l6H/vTS0d4bIEK2ndG/QD4=;
	b=oTYLcZxAsZhZcGO7nA9CN/fclc2HgQP+za1A3bMn7e2yVvneMLb/FaxSPqUB+Z8NVhfezk
	htwO5HAn/q8IxfAg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Bradley Morgan <include@grrlz.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	kexec@lists.infradead.org
Subject: [PATCH printk v3 6/7] printk: Add unsafe flush points for panic+kexec and emergency_restart
Date: Thu, 19 Nov 2026 00:09:42 +0106
Message-ID: <20261118230345.808560-7-john.ogness@linutronix.de>
In-Reply-To: <20261118230345.808560-1-john.ogness@linutronix.de>
References: <20261118230345.808560-1-john.ogness@linutronix.de>
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

During emergency and panic, nbcon consoles transition to atomic printing.
However, there are consoles that do not support safe atomic printing
(CON_NBCON_ATOMIC_UNSAFE). Such consoles will only flush when an unsafe
flush is explicitly invoked and their unsafe policy permits unsafe
flushing for that context.

Call nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART) before performing kexec
and emergency restarts in order to allow such consoles to perform an
unsafe flush (if their unsafe policy permits).

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/crash_core.c | 1 +
 kernel/reboot.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf8990..79a67956743ac 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
+			nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART);
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
 			machine_kexec(kexec_crash_image);
diff --git a/kernel/reboot.c b/kernel/reboot.c
index a93c23b9e1948..b26d131c54151 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -102,6 +102,7 @@ void emergency_restart(void)
 	 */
 	nbcon_cpu_emergency_enter();
 	printk_trigger_flush();
+	nbcon_atomic_flush_unsafe(PR_FLUSH_RESTART);
 
 	machine_emergency_restart();
 }
-- 
2.47.3

