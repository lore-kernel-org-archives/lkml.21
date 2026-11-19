Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105303;
	b=oC8dq3bGjP6YDB3N7mpPlH6SWVsSN5K1q0FP7FczXMy5zjAN9F6juEtleaY4zCGCcbkQ
	 pwreJYxlfJS5bck/ZbrlOS5rlme0iEOGH8UBskeztybiSaxTTHdr82mFaMRFjvjVE8VHS
	 p0l0a1ip5Noah3ksehDM2Vh5fFDV66uqjwqYIhTYs3yYbiXqsOzf26wjU8akko9gh6N/c
	 8Yal5545nfBB+GZhOMusxeuOaGx63M+4Iyja69IzcmZea2m0o1z80SAtgfWCCYiWEZb7w
	 3I+A7K8CDKCPSguS/soaPEaF36vPf5UUzrk/1AxZL+fdE+Y09lPJbeYFaYHsWiidC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105303;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6c2WfmmuO5OP5xCe2CrO1/Z/FsV4bpBjjt1tFRNTMew=;
	b=FNn0XjqGv570kIPu8WhB2LD3qn4aRiyfMqCJqnOW/4O5MrFZoeSQAovBzff7Ck0Me1Sq
	 6GOfUqhPl6LicOmoEIVTErGq4LhtP3kopUhuL2O0XskGu83X2DL2kAEuwabo5VWioC4m2
	 bjboc+rThK/jmToXGynIQYPcUgX17reZ6Kp3z+2eF0DfNwAElKwYO0l52RjoCFbtYpBFk
	 x16sxjnSdVI8YsceZcjyy2mdGH1veCkvnQHJAnLsX44f6K6Qya1BOJFy5exACvVW4wxy5
	 1hcw2a7uiXQkjTenWqlxFAGj7B9xZWT4PNWAKrZO1yVrOUZLFm8SjSy9yJKQlRHUYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=k6uGmwKd;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584060A263F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3584060A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=k6uGmwKd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795105301;
	bh=6c2WfmmuO5OP5xCe2CrO1/Z/FsV4bpBjjt1tFRNTMew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k6uGmwKdJJjrj/nJ/y6quB3OQROjb5IMXcbF859w1Rv3deGoCPCjnpP37coPTlZRM
	 n7jfQZCiiEGrQ61eWGIxAnwOUGyaaQN+l7bgEkGbK8B82cYLGLL2qHeDlawWsy1wsm
	 8rILj1nxNpMBZZepRc+Vs9yEpX7/8szo6cJ79POURVW6PwdkJqlt0vyy9OxkT7g4QY
	 cRjQEWW4vvN9m0mOg0sPFTQwoA2zxuYfuw/VxAV7WugbSXT/BDY6oFEbpXG2qGQOMP
	 0wFF+86mIfkxQKVYlO4cnIn28icBQxQw6r1FdKMw0ocTRifeNYSk01H/mmVFsBHm0P
	 qq8s7pUx03TgA==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jVkHn4WXzzSSs;
	Thu, 19 Nov 2026 11:21:41 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH v4 15/17] sched/debug: Show the deadline bandwidth of each runqueue
Date: Thu, 19 Nov 2026 11:21:36 -0500
Message-Id: <804f19feedc793d7cb668337f998cdaec2857cbc.1795103339.git.mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795103339.git.mathieu.desnoyers@efficios.com>
References: <cover.1795103339.git.mathieu.desnoyers@efficios.com>
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

For each CPU, sched_debug prints the deadline bandwidth of its root
domain. It does not print the two sums of its runqueue. this_bw is the
bandwidth of the deadline tasks assigned to the CPU. running_bw is the
part of it that belongs to active tasks.

GRUB reclaiming depends on both sums. grub_reclaim() takes this_bw -
running_bw as the inactive bandwidth of the CPU. The more inactive
bandwidth, the slower a reclaiming task uses up its runtime.

The kernel warns when a sum wraps around, and when running_bw exceeds
this_bw. Bandwidth left behind in this_bw triggers no warning.

Print both sums. The deadline_bw_test selftest added later in this
series reads this_bw in its params_waking case. It checks that this_bw
is back to its first value once the tasks of the case are gone.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index ddb382df454b..2c373adf3196 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1175,6 +1175,8 @@ void print_dl_rq(struct seq_file *m, int cpu, struct dl_rq *dl_rq)
 	SEQ_printf(m, "  .%-30s: %lu\n", #x, (unsigned long)(dl_rq->x))
 
 	PU(dl_nr_running);
+	PU(running_bw);
+	PU(this_bw);
 	dl_bw = &cpu_rq(cpu)->rd->dl_bw;
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->bw", dl_bw->bw);
 	SEQ_printf(m, "  .%-30s: %lld\n", "dl_bw->total_bw", dl_bw->total_bw);
-- 
2.47.3

