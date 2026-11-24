Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543218;
	b=iSkUFDj06czUDiSLMXaSoIE3i5j4mxx2+cgyfRPAZ7cJ0td/aani3QScyK3/E1Fyyfr8
	 PwKtb5ulEM5PzTC9DTtQ1tUPxRCPavXgG6QhgBvK2pv6h79xCawG0yPJUJ5BsvQ0oXM5R
	 wq5Ha2YLjNqfezN8iqNTV8slz6evyZrR6jkooCgzU033A07tpDQuN8lZlHa4yDV9qRTyq
	 XsBhIl7ImAU0WXMH4hos6xALHl//o+uZxo1k35+wK+sqBPJ3MO3Fji8K8cgo9xFhGT1yc
	 ynMTEkDL98G9MRkVuYlgAm/s3yd1WzlSoN4esxcrLD4ubhV+j4tSORfxO/4EupR8B4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543218;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AoPzp/Ou306p3i5aT8nSpnfYM+aKi6gbHSodX7L0Zak=;
	b=GT/5da922Msfz72Kv/iFTU9eFvtMJGz3AYmLvPReq1FR6+oOhpMGWyUgKKJM5g0t7Nha
	 r9lmerlTUXmmlhI/hgJ8SnKIh83iY9FHCLifRdT8BenQyhIwkVXjnQ+vkrdivXUf68WJd
	 4/6H7wK8v3x8nrTSlAFK8eAohG3awpz85hWRbdJRDGA0SeS3wLZ/Y3IIAHYMGBCMSGfDF
	 kcgKOBQYoZMoHUN5uRiZGhodjntEXWRiV98II5ufsIb/oNrpZPL+3cOMg52PcmCXSNllf
	 3L4uotw6Aby1PwCRCKS50zLL7KnzDXWz3QPpBwHmZzzTpOqLQlFnGKr2lxTwrg6A16A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=arTkdEOL;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B0E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=arTkdEOL
Received: by linux.microsoft.com (Postfix, from userid 1127)
	id D169220B7166; Tue, 24 Nov 2026 10:00:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D169220B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1795543213;
	bh=AoPzp/Ou306p3i5aT8nSpnfYM+aKi6gbHSodX7L0Zak=;
	h=From:To:Cc:Subject:Date:From;
	b=arTkdEOLd0wuM+VvXH9cdpUNVsczXpyeC60GQdVYSqwk29H471sh6YGOpbuF+FNDf
	 xkunyu3FpaXCHwnNw7Hh/KHlL1rtSwgw7MHrCcO7XrFyYy+Gt8rzHH/RriBDsiUImG
	 5Zo+yBxFa/Aapi49Zhqu3qpkxn2L/8Xdr0RqTgnM=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: tj@kernel.org,
	jiangshanlai@gmail.com,
	linux-kernel@vger.kernel.org
Cc: ssengar@microsoft.com,
	Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: [PATCH] workqueue: Skip redundant unbound updates during CPU bringup
Date: Tue, 24 Nov 2026 10:00:10 -0800
Message-ID: <20261124180010.1505819-1-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
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

Before workqueue_init_topology(), all CPUs share the SYSTEM pod,
which contains every possible CPU. The effective cpumask and the
per-pod cpumask of an unbound workqueue are therefore identical,
regardless of which CPUs are online.

During this stage, workqueue_online_cpu() walks every possible CPU for
every unbound workqueue each time a secondary CPU comes online. The
pwq mappings cannot change yet, so this repeats redundant work that
scales quadratically with CPU count.

On a 640-vCPU Hyper-V VM, each of the 639 secondary CPU-online
callbacks walks all 640 possible CPUs for each of the 8 unbound
workqueues, giving 3,271,680 unbound_wq_update_pwq() calls that took
about 975 ms in total.

Skip these updates until workqueue_init_topology(). The pwq mappings
already match the effective cpumask, and wq_update_node_max_active()
does nothing before topology initialization. workqueue_init_topology()
will apply the topology-specific mappings and node limits once ready.

Keep worker rebinding and restoration of unbound worker affinity before
the guard. CPU hotplug after topology initialization is unchanged.

On the same VM running a v7.3 kernel, smp_init() took 1054 ms with this
change, compared to 2008 ms without it, a 47.5% reduction.

                                 Before    After    Reduction
  smp_init()                     2008 ms   1054 ms      47.5%

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 kernel/workqueue.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index baadc7815585..a3767dbf77f0 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -7252,6 +7252,14 @@ int workqueue_online_cpu(unsigned int cpu)
 		mutex_unlock(&wq_pool_attach_mutex);
 	}
 
+	/*
+	 * Before topology initialization, the SYSTEM pod covers all possible
+	 * CPUs, so CPU onlining does not require updating pwq mappings.
+	 * wq_update_node_max_active() also returns early at this stage.
+	 */
+	if (!wq_topo_initialized)
+		goto out_unlock;
+
 	/* update pod affinity of unbound workqueues */
 	list_for_each_entry(wq, &workqueues, list) {
 		struct workqueue_attrs *attrs = wq->attrs;
@@ -7269,6 +7277,7 @@ int workqueue_online_cpu(unsigned int cpu)
 		}
 	}
 
+out_unlock:
 	mutex_unlock(&wq_pool_mutex);
 	return 0;
 }
-- 
2.43.0

