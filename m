Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774514;
	b=lDKh2r7aNRfKGQa8i1UwZ1OR3v3/PJnc3shrX/83kj2ZYrkauyeEMwrUqjjb++u2pg1j
	 j82yagDCtdb1Or20mzgIDxOIbtw3kaszXhQaYvH3VE6nvhyHradwlio2gOai8iaP9F+Qf
	 wU47Ud1KVVvLoKCvQ6Q4XpZ8p5mq0GdwpMnqobl84bkcAM79p4/97vFsVUBZ3ziMIIHlV
	 KhIveVHQqte6I/MywDjrpKfTdBitUxA661ETXW5imhdlHcRM/RPeW6u8SHMYP+GXhzEO0
	 sE9JeWMBMoVjot9t5qUXrlNGoFyHCVDG3SAON5xPTxYXfkU4aDECsY7u3INdMbGcAYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774514;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ahp12j/l79oVNsyCK4DSY9H1BKE/rYbJLsWY+j1li04=;
	b=iqFlGRC9Hv9ngm/bdeNa8G507b/ORHj3ProgPd1SdYALg1g/3nEwVdMeoKLlDdCaY+0V
	 4K02A5Enl76rNyGBdbLPr1vCATUVXbMoolCmlqrAXLpz8r+qEIwTepmKPi1SIZSNIpKQ+
	 mVQy6i+iC4GMRKEZkD/W2rcjEtAKVHUvxENlq4jD5+P/OQBOJCG8A4bPKl8Kq4FI+neLP
	 w6Ylya1cDJMCqBa35n4wtTbDaAhs3RMltlod6PWSyyMk1D6ogjVDRwTXnsXSawv9LAWO/
	 zdd2X49568VsQ+LP8zf3zB2N/3kJrHMkVwdqpPSVjjWj5Wjugx7xx0AsfOLtlhUiO6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.50
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449F606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0449F606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1358479|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0079735-0.00296835-0.989058;FP=16133574452848433362|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kBReDAU_1795774501;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kBReDAU_1795774501 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 18:15:02 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>
Subject: [PATCH] sched/fair: Reorder variable reads in get_scan_cpumasks()
Date: Fri, 27 Nov 2026 18:14:44 +0800
Message-ID: <20261127101444.4162-1-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
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

get_scan_cpumasks() reads grp->cpu and curr_cpu, and derives nid via
cpu_to_node(), before the pref_nid == NUMA_NO_NODE check. However,
these values are only consumed after that check. When pref_nid is
NUMA_NO_NODE, the function exits early and discards them, so move the
reads past the check to avoid the redundant READ_ONCE(), cpu_to_node()
and task_cpu() on that path.

Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..6c0cae6c8eeb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1934,11 +1934,6 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
 	if (!static_branch_likely(&sched_numa_balancing))
 		goto out;
 
-	cpu = READ_ONCE(grp->cpu);
-	if (cpu != -1)
-		nid = cpu_to_node(cpu);
-	curr_cpu = task_cpu(p);
-
 	/*
 	 * Scanning in the preferred NUMA node is ideal. However, the NUMA
 	 * preferred node is per-task rather than per-process. It is possible
@@ -1954,6 +1949,10 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
 	if (pref_nid == NUMA_NO_NODE)
 		goto out;
 
+	cpu = READ_ONCE(grp->cpu);
+	if (cpu != -1)
+		nid = cpu_to_node(cpu);
+	curr_cpu = task_cpu(p);
 	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
 
 	/* honor the task's preferred LLC CPU */
-- 
2.47.3

