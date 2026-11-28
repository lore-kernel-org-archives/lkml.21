Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846826;
	b=vn9u3SKu1NWQcYcW9KuVIPVVzsNCWaW2wsMQO68IXmSy/D39NN0QgO0vk4P2Gaegtz+i
	 Ye9YmgoF0drBh+hqxTmmhJig0+TCjL4v4jgvZDNHACEm55Heo9mSobR26dsb9YMdi3RaK
	 eeDXCJ/BDLHtBIaolmNihDL2l5bOTuCQpCg/fSYezxBam/qRYEIk7O4DCKgeq/EdmORMF
	 Cs9T60w32LkoaFLzifvVb/USVC9jRXYYBD2s/UXQC3HIA8By0bF6pwj3AoFAWIbbDB32H
	 G1YWwU9wZyMFw8iQ6gMgXxIXN0t6t5/wfYbMZcq3rupFF+VxIjW8HZ96xrD/jUsrqHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2hMGbCM5tB70FBdwb9zAs1NZJOT/JT/9Od6CekBUEzc=;
	b=mE1WuYQKmDlRBtDm3xgQtHmwZNJegu5zFQScTIOlWLjfCZx6h7e2lTFEqhDxy9/40Egt
	 2OG+/f+WHGfNVGdb4FwgCEe/WrYiGw86qYtNoHsm3woq5G36564paElYVZTQaegE3YFC6
	 3Qq3Kkgc3Qs2GPCfiZiRGD+8trxz72IMSyABUgJH5DCCK6hfOEHthwI0V6aPRV3+IX4Ys
	 hygldy5ET+LrwzpstTW3rm1NW5TWBtYdj0nwVXVhcfFUCH8Ff0dkwJbFEFk+KpzWoyBfu
	 mjeE4uwkozx9dWCgcZzJeZN/HpfYm1+JWTfJaIjfdSWFtHxD2MdHiqCyP2k8Eth/05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Prak9o+R;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E86606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E86606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Prak9o+R
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso4125378a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795846825; x=1796451625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hMGbCM5tB70FBdwb9zAs1NZJOT/JT/9Od6CekBUEzc=;
        b=Prak9o+RMwLOyAisXlGs9WAiPIXX6RSG2RFdsICD7cJpTtubAiSuZz1Vksg4WpjDc8
         BRWsJaaPbG7XoLe92Mv+C/BXf8THgs0uJ0uZpMFeYYhUHMm2p7WO+1mbddZvAj1uVVJ3
         SP8VWqY8VwZKpE0PqKNsQpvxDLHd6PXX1bq77qBbAzFGACnrS4/+biDTl57BCbmMSdNI
         mkohNqR4Mh0GoyX+Z+O1XVXXk+1QZxEPIcjWEvf7aXM3MyLwFuWYndrx5Ty9MFquX0y6
         0/BlJHEo615HqfrTEsJvEwTRL7sjxW1TPCqsWclVlmktRoBMt8foNPajsfbDGUDqn2/o
         n0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795846825; x=1796451625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hMGbCM5tB70FBdwb9zAs1NZJOT/JT/9Od6CekBUEzc=;
        b=K+5YgTAjv/G6mH5QBrqsa11CR7Q1zkV32XDDt+vD4ZzpTcyThruhv3msq7Ax6Ww+hx
         xPwkis4aTM7y7G2UWHJoWR45KDqhEH9T24oqGazrbE7ynX2xV1YegKJcQt/AIKZq/RC6
         bJlYcVn1a/T8wNvthc4s3pmEPa9YtjA8knnCxBPfs7rRQeQ/2/A4bY8V8mndYGWTG9Gj
         fB26M1AAStyCw3bqTmcfAW8UAgx/0wILee1P0X6p2gWix7TAuJbTiXYKuKHXMpdaqt5b
         kTXw5b+pjC2VDwV+ncef6zB5dosOtRJ/CuQre8RLmedtchCbjZHTpWJFzvbHcPdWVfKu
         HyFw==
X-Forwarded-Encrypted: i=1; AL+hErFwVzrBG4psLJe492UUbszfmw+dCkEW49Pa0IfqT9VUcBIOGfzYgMBNWf0ljmyKEy2RweED40Ze+gtN9V0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hjcx3G6qDf3M29Pt6Ir1W7/4MkBC0qPcqzByh409ZwCM9WEKl
	FP5YVi/PqV5me1JRuYVt4/nIDAocSxQe/3SO/QrhYoGq4wwzT9iHSJSy
X-Gm-Gg: AZFdTZcUohvPePSMmlwQHnVv5dLQNjwNLaHKy5Z/MqWuipWBNeR6fmN+FbSeLTY4lDB
	THVWj/1MpWEUgE/bMtA4Mhr4hWrQtIFxPUEvo2OLNalrk6kG8wOtH1jEJuTZVnSICSS5jLr9nwF
	f3HxJf/gG1p0PVWvqRlCxHiWse9/8bpEwAzrmy6En3fWaViJeAFgXb3WAXBWxThsQ5yRhbx+a8c
	ku4IlL/0mbF4sAJkLGXXCIg6UdYuE2acyd2Z8SgU71gAj/DV2jEd0xeXs1yHdw4BSc7SMwbLxqj
	DH3gttPGRltwQXTO2g/fJNe18TLSjqNdBJp2EEyTkW7g9pMiIjm+t5c5YXlZ55gaL/VkHvKF71M
	YLUkRAY6fPtCUephgXrztfjUZZTIfGhyHK4SwK4Bb/dqx0J3wWzGW7rZBwElbggOfNaKuhYQ70r
	gq5BF5TVHrkIGdu4GFjtDobQ1Ni+6DPjfR7JFDAiPxhLjrjQJREjSpWGM8aOJTOICupjoSuosVY
	L0lIoA4rRJ2XLAggy98g64xdx6Q1otveWPzFirnh+S/qO1gF/dAt/LY9qvBhA2eNC4gx5SpkdfX
	jf1VR1vEwFYZfHS6rSEzBlQtUYP7+CGzGNlGmnSXee2RaSWmYeULoGWzrdRfGpyc
X-Received: by 2002:a17:90b:5350:b0:3b3:b414:9aaf with SMTP id 98e67ed59e1d1-3b41c93b4admr17215431a91.27.1795846825015;
        Fri, 27 Nov 2026 22:20:25 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm32008126a91.9.2026.11.27.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:20:24 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <jfern@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Bradley Morgan <bradley.morgan@linux.dev>,
	rcu@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] rcu: Mark rcu_read_unlock_special() notrace
Date: Sat, 28 Nov 2026 06:19:26 +0000
Message-ID: <20261128061955.174288-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The BPF trampoline takes and drops the RCU read lock itself. When the
outermost rcu_read_unlock() finds ->rcu_read_unlock_special.s set, it
calls rcu_read_unlock_special(). If an fentry program is attached to
rcu_read_unlock_special(), the unlock on the trampoline exit path still
sees .s set and calls rcu_read_unlock_special() again, which recurses
until the stack overflows:

  BUG: TASK stack guard page was hit at ffffc90001657ff8
  ...
   bpf_trampoline_6442575622+0x5e/0xac
   rcu_read_unlock_special+0x5/0x490
   __rcu_read_unlock+0x9c/0x120
   rcu_read_unlock_migrate+0x93/0x220
   bpf_trampoline_6442575622+0x5e/0xac
   rcu_read_unlock_special+0x5/0x490
   ...

With fexit it recurses even earlier, from percpu_ref_get() in
__bpf_tramp_enter(), which takes and drops the RCU read lock before the
program runs.

Mark rcu_read_unlock_special() notrace. rcu_unlock_needs_exp_handling()
also runs with .s set, so mark it notrace too.

Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
v4:
- Go back to notrace as in v1
- Also mark rcu_unlock_needs_exp_handling() notrace (Alexei)

v3: https://lore.kernel.org/bpf/20261125055359.2715140-1-rhkrqnwk98@gmail.com/
v2: https://lore.kernel.org/bpf/20261125040106.2200628-1-rhkrqnwk98@gmail.com/
v1: https://lore.kernel.org/rcu/20261124185659.1370644-1-rhkrqnwk98@gmail.com/

 kernel/rcu/tree_plugin.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 3500e4874833..9c1b227f5fa0 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -689,10 +689,10 @@ static void rcu_preempt_deferred_qs_handler(struct irq_work *iwp)
  *
  * Returns true if expedited processing of the rcu_read_unlock() is needed.
  */
-static bool rcu_unlock_needs_exp_handling(struct task_struct *t,
-				      struct rcu_data *rdp,
-				      struct rcu_node *rnp,
-				      bool irqs_were_disabled)
+static notrace bool rcu_unlock_needs_exp_handling(struct task_struct *t,
+						  struct rcu_data *rdp,
+						  struct rcu_node *rnp,
+						  bool irqs_were_disabled)
 {
 	/*
 	 * Check if this task is blocking an expedited grace period. If the
@@ -746,7 +746,7 @@ static bool rcu_unlock_needs_exp_handling(struct task_struct *t,
  * notify RCU core processing or task having blocked during the RCU
  * read-side critical section.
  */
-static void rcu_read_unlock_special(struct task_struct *t)
+static notrace void rcu_read_unlock_special(struct task_struct *t)
 {
 	unsigned long flags;
 	bool irqs_were_disabled;

base-commit: 2348d158c7fcc2c9557b2fb550ee841c62942fbd
-- 
2.56.1

