Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612761;
	b=XWcYGyJNERRYjEZkNS0OcehSzTwC3EnOuXiCIA3H1oXXXPaLYWOL3OKRWSmPax4YD3Ti
	 zrah78agIzmh5Hjjstx1Fg2dgWTrzmIgRqq5EGNi43tikhlSl+8l1HUeu1mnVgvU5/LKQ
	 ieyN8K5kr8f4K7tP8fql5pjGAz2z0JpFTl8GmI0Vl0tuUY2caToLdFxJOOMzAIfpwNKwn
	 DEhPEaGdBEZU0Ti41/9VXPUbWapTHnxQCcAsztNBFL3xdL11KaJAzglWzPQwggCJL6/L+
	 ufSFXggBL5pqatbRyKC8C3OTmDfHiB3qQaKx3fdNu7EeZNY8Ymy/jwddgljJp+FTelw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612761;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=OMZrACG4YzEG/R/0w5Y8GlrwQuGotNE0xJ5Hbu+8idU=;
	b=YxVqjzXFd5OA/Wka/JrbD9MUJJg0v+GvrNtkGr6AHJEb/tJBG+bjFFZ7iMBnstfAQOeQ
	 AiUrLhXGqxN4kX/HGWU5UnYooFAFVrT4Uxw1Dpgdyf4pd+XZXeAQhehmksAZ1+chtOT7D
	 WyKc031LtuZqqKINeiVp9tq1H0ZpCrhBDUjxrrVTwenWK3f3HUlv3AWo/Zbrx26xvgeOi
	 h6ThG9FEaLb4+23SpHOe7/E6rqafD2V0Kzvs3WLLaojWSNGYRqqaBpZuGY1l25H0t91Pp
	 eYZt9wv5m347sZq+cTb/uL0zI+PVzXJL90yEnAq8kNGjnFxBPDe5NOo/D85YfPo0RDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HobQnCPa;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEBC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HobQnCPa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r6bMD448NDvDe1of8Gbg0ox46SMNpQsOACqhflsA/30=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795612759; v=1; x=1796217559;
 b=HobQnCPaX/h4ix05V5kJI9RGD5W0QBFpQBrILKF5eLqy4Z3wZVWFmvKpmQe21wwS053gz7jl
 cw+UrzDEw0WOhuvN44Oovgey+xNEfzyk00kkSY9lVvJ8Pn+cSEw0RxF33sWk52MTA2JxgqRX1Gy
 WZEdzb8cOPeTSK83GB8IcNK0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27078477fa6da1e4;
	Wed, 25 Nov 2026 13:19:18 +0000
X-Mizu-Trace-ID: 27078477fa6da1e4
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 25 Nov 2026 08:19:06 -0500
Subject: [PATCH] sched/topology: Count LLCs per node from the sched groups
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-feat-sched-nr-llcs-v1-1-05f8e23a5f8f@linux.dev>
X-B4-Tracking: v=1; b=H4sIAEngBmsC/x3MMQqAMAxA0atIZgNt0SJeRRxCjRooVRoRQXp3i
 +Mb/n9BOQsrjM0LmW9ROVKFbRsIO6WNUZZqcMZ5a12PK9OFGnZeMGWMMSiSpcF53zEFAzU8M6/
 y/NNpLuUDaYZoYWQAAAA=
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>
Cc: linux-kernel@vger.kernel.org, Li kunyu <likunyu@open-hieco.net>, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

adjust_numa_imbalance() sets imb_numa_nr from the number of LLCs under
the LLC's parent domain, so that tasks spill over to another node only
once every LLC of the local node is in use.  It estimates that number
by dividing the parent's span weight by the LLC's.

The division assumes all LLCs in a node are the same size.  On a Hygon
C86-4G 7493 each node has four CCXs of 4, 4, 3 and 3 cores, as two core
slots per node are fused off, giving LLCs of 8, 8, 6 and 6 CPUs out of
28.  CPUs in the larger CCXs compute 28 / 8 = 3 LLCs and the others
28 / 6 = 4, so CPUs of the same node apply different imbalance limits
at every NUMA level.

Count the parent's sched groups instead.  They are built from the child
domains, one per LLC, before imb_numa_nr is computed, and give the same
count as the division when all LLCs are the same size.

imb_numa_nr per domain on a KVM guest with that node layout (2 sockets
x 2 nodes, SLIT 15/25/27, fused-off core slots offlined), read through
a debugfs file added for the test; change is for the 4-core CCXs:

  domain (CPUs)  before, 4-core CCX  before, 3-core CCX  after  change
  NODE (28)                       3                   4      4    +33%
  NUMA (56)                       3                   4      4    +33%
  NUMA (84)                       3                   4      4    +33%
  NUMA (112)                      6                   8      8    +33%

Fixes: e496132ebedd ("sched/fair: Adjust the allowed NUMA imbalance when SD_NUMA spans multiple LLCs")
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/topology.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 99878da03bce7..7efb2cde5534f 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2893,8 +2893,9 @@ static void adjust_numa_imbalance(struct sched_domain *sd_llc)
 {
 	struct sched_domain *parent;
 	unsigned int imb_span = 1;
+	unsigned int nr_llcs = 0;
+	struct sched_group *sg;
 	unsigned int imb = 0;
-	unsigned int nr_llcs;
 
 	WARN_ON(!(sd_llc->flags & SD_SHARE_LLC));
 	WARN_ON(!sd_llc->parent);
@@ -2918,8 +2919,19 @@ static void adjust_numa_imbalance(struct sched_domain *sd_llc)
 	 * enough logical CPUs per LLC to avoid SMT
 	 * factors and that there is a correlation
 	 * between LLCs and memory channels.
+	 *
+	 * Count the LLCs through the parent's groups, one
+	 * per LLC, rather than dividing the spans: LLCs
+	 * in a node need not be the same size (e.g. when
+	 * some cores of a CCX are fused off), and the
+	 * quotient then depends on which LLC the CPU is in.
 	 */
-	nr_llcs = sd_llc->parent->span_weight / sd_llc->span_weight;
+	sg = sd_llc->parent->groups;
+	do {
+		nr_llcs++;
+		sg = sg->next;
+	} while (sg != sd_llc->parent->groups);
+
 	if (nr_llcs == 1)
 		imb = sd_llc->parent->span_weight >> 3;
 	else

---
base-commit: c47af85667065c6dd5b79564203c2d29948ef60e
change-id: 20261125-feat-sched-nr-llcs-a1a82664eac0

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

