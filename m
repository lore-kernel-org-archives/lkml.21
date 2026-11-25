Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568109;
	b=s4t/E0KpqF9AwFHe3UOI3xb++5OQm97rKtnEbelNMWxvAT4/Ia9vTAksMYXMV92b0fai
	 nBNPq5P27Ld/2uuYIrXYOuSOhaRSSFaKe/KosmCHi3fIVPYg0pVcf68llwaxZLmgV1Owd
	 zjfDZI/d93GTo+R1C5fUKHEpb6xNArBmrMvixf55y00lie74VlsikQthiFhBICf7vAZ+7
	 iRSKmrnUHysl0XWYQXMN1Mc7AQRwEb8Wsq+422C3FfSS+bQKg/IhwxETu3uEr/CtCnIQp
	 JeNb4dJd508qgmR+Kno8N6uLTSVBZsZiImpROFt4xEpmH90IDsbBjKO8DiFVi2Ihwmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568109;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E5SleL/D/bwy5VuTutvusTooKYh/FqUrYbb6lCyeHTY=;
	b=TfwU85e7jOfgLlbnQCgui0tWMbZgBG8sWG2tmi+dyuAZiSe4ciC6oF/DktHz0o3rRpRo
	 Yfdm03qADGqP0CigGex+2Ppn/VMFAtGKtbgkMSca+Z4pqBsIcbhtXnA+CrDWIl5IIK3iN
	 lZhfXS/Y4vZ/RlHLRFqlojXu1aOjujmLNabuN+vrFhG9b3wtOGBDtLCjGxLhJOcQb94LX
	 e1vu5xcPuAEAicfPqIn4+rxBA4Ww5FdUCmQpGYcvx3lfddL95WBCA9FWAjgwimq1RRqd3
	 wZ3GNc+qXfwJFC7audEYZpTQHD+xTkfJLyK0eIRW89sRJtC5m81ukonXzGvfMGsi/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=o8cJ8TaX;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73925606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73925606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=o8cJ8TaX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E5SleL/D/bwy5VuTutvusTooKYh/FqUrYbb6lCyeHTY=;
  b=o8cJ8TaXsxh654/6QS//4ZV5pM/LxzoxMHF0EtKupjB3UsKZKGKa1ecn
   3tUZFTMdmHiSfWgK4m13oYsG5j7dJgAA+I50ifX//yS94HlvE5T1O1kyz
   cv820Ivi8UZmjIkSYMd9RxrUNfDzf4z88AbS+wGHRKvRTjZ4r59RM7Eud
   0=;
X-CSE-ConnectionGUID: fo+JcSMDR1GHy6lN2B0hwQ==
X-CSE-MsgGUID: q+xBdkGKQAi9L+Fmt629+g==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,231,1787004000"; 
   d="scan'208";a="163787638"
Received: from nr-lil-536.grid5000.fr (HELO grvingt-24.nancy.grid5000.fr) ([194.254.60.35])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:54:59 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	jean-pierre.lozi@inria.fr,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH v2] sched/fair: Don't pick recent_used_cpu if target has no sched domain
Date: Wed, 25 Nov 2026 01:36:54 +0100
Message-Id: <20261125003653.1264087-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
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

select_idle_sibling() can return recent_used_cpu if it is idle and
shares the LLC with target. However, it does not check if target is an
isolated CPU where the scheduler should not move tasks.

Consider the following situation:
* isolcpus=1,2
* recent_used_cpu=1
* target=prev=2
* affinity=1,2

When CPU 1 is idle but CPU 2 is busy, select_idle_sibling() returns
recent_used_cpu (CPU 1).

To prevent the scheduler from moving the task among isolated CPUs, check
whether target has a sched domain before searching for an idle CPU.

This bug was found with the help of verification using Frama-C.

Fixes: 32e839dda3ba ("sched/fair: Use a recently used CPU as an idle candidate and the basis for SIS")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
Changes in v2:
- Return early at the beginning of select_idle_sibling() if target has
  no sched domain.
- Instead of `per_cpu(sd_llc, target)`, use `cpu_rq(target)->sd` to
  check if target is isolated or not. A CPU might be in an asymmetric
  capacity domain, but not in an LLC domain. In this case, returning
  early based only on the LLC domain would miss the chance to run
  select_idle_capacity().
- Rewrite the explanation, because sd_llc is not the main issue anymore.
---
 kernel/sched/fair.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..9746fc55241b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9155,6 +9155,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	unsigned long task_util, util_min, util_max;
 	int i, recent_used_cpu, prev_aff = -1;
 
+	/* Do not search for idle CPUs if target has no sched domain. */
+	if (!rcu_dereference_all(cpu_rq(target)->sd))
+		return target;
+
 	/*
 	 * On asymmetric system, update task utilization because we will check
 	 * that the task fits with CPU's capacity.
-- 
2.34.1

