Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437969;
	b=oJbkB/xn+ASgeZxfkLqi/8CJndXaSWcDS4IiuxnDeE2AZe7Ay4ywIIOW1PX3Fe8qBRIj
	 KUi18QAuM8i0ID86UYGs6gNhgn5hwjJsogZQZcRe4rLbnMtLJdmSa1KG9/WynUgWFdFnY
	 IIm/kNFd7B0XMRvJdb3FVbLs3yfzEFWGYlIdFXi7lqTWu4qfQMYNTZBuKw5XyHfXY45ku
	 jgX1k5NvQQoW599bzLqoXOAAIUWH9dyn+tZDNHwEqunaaQdC1pfyVJBl3YmDr1iVtBq6e
	 jwtIqmub/8T5fC7dfgexifhoRm/ux/8ryvP/55SG4BUY6dZC8l3Uyt6iNplvYikz9Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437969;
	h=DMARC-Filter:DKIM-Signature:Date:X-Mailer:Message-Id:Mime-Version:
	 Content-Transfer-Encoding:X-Original-From:In-Reply-To:Cc:Subject:From:
	 X-Lms-Return-Path:Content-Type:To:References;
	bh=1jPn1Cv8ov2Ee6V24tjfKPjwRVPwP5LxYtZMRWySgxE=;
	b=TwKoCizx4V48YqF93AoiepHaoZrRKrW/zJasgRxFTruwY1rf1syxFbTt2d9uwdwFHO2O
	 hlu3ZoIkw+2VldfEvn4sKRPWeeg74PQ5nt048d2WVfzTG9PoKNsQmi9K2lDBounk85UUA
	 VwSYeYOfEbVT/QUnLIHHyM6Fdg1P0yob3EwWZivydbad2rgTbQTwR8x6lPZSpsG8dRTZn
	 X+a1h2O/jXCFuJTVmEpcyYS+JlfO4KYW1czZfi/1kQKjrbTt+aCVsq8n/eE93oj2yihq8
	 LM1+znh721j7/69HrPSrT6tSRtthNGcyz+rgOltYL3Mcsb5Xymnic2SQH3OzU302QYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="nD9ifS/q";
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9216C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=nD9ifS/q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795437963; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=1jPn1Cv8ov2Ee6V24tjfKPjwRVPwP5LxYtZMRWySgxE=;
 b=nD9ifS/qn5aPBXAAJz2uNOuC0pN+2b6sthv0s/aoW3EnK3Sk5wff9hSqsRdIBdXb/WcuBE
 bA8civsaJBFK6tXf1XnXm2ufbzaO3uRroPfD05lNAtcCKFmVjob8IInVKVRiEqc2DD+znk
 S5Q6drhia8reIIBMN+01pBsbdye2HLrw8g3Tx0xEKqjFnDnFPuPVyzg5W4+o0pwSjCDsTd
 UAKuqpN+ZoEhw0B0Yxc2NRs8UxK7hR14RKVzs7lMpGenSUdyZRw5n3z+BJL3zW8M5zPPk5
 NmH7Qz7enjB4iC2us16C07AYZcn4aByPbqeeTgrR5qPcWU7y0HtRf4Xq/4X7xQ==
Date: Mon, 23 Nov 2026 20:45:22 +0800
X-Mailer: git-send-email 2.20.1
Message-Id: <b32bbb1feb9721cb58f756b43c7d53698b7fa03a.1795436486.git.zhouchuyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <cover.1795436486.git.zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 1/3] cgroup/cpuset: Skip the sched domain attribute allocation on v2
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26b04358a+a28025+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <longman@redhat.com>, <tj@kernel.org>, <hannes@cmpxchg.org>, 
	<mkoutny@suse.com>, <ridong.chen@linux.dev>
References: <cover.1795436486.git.zhouchuyi@bytedance.com>

Cgroup v2 cpusets use the default scheduling domain attributes for every
partition. The scheduler treats a NULL attribute pointer as the default
both when matching existing domains and when building new ones.

generate_sched_domains() allocates an attribute array for v2 and fills
each entry with SD_ATTR_INIT, even in the single-partition case.

Return NULL for the v2 attributes. For N > 0 partitions, this saves one
memory allocation and N attribute initializations per rebuild.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 kernel/cgroup/cpuset.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index c7b3a734cda8..633fd05f513e 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -867,7 +867,6 @@ static int generate_sched_domains(cpumask_var_t **domains,
 	struct cpuset **csa;	/* array of all cpuset ptrs */
 	int i, j;		/* indices for partition finding loops */
 	cpumask_var_t *doms;	/* resulting partition; i.e. sched domains */
-	struct sched_domain_attr *dattr;  /* attributes for custom domains */
 	int ndoms = 0;		/* number of sched domains in result */
 	struct cgroup_subsys_state *pos_css;
 
@@ -875,7 +874,6 @@ static int generate_sched_domains(cpumask_var_t **domains,
 		return cpuset1_generate_sched_domains(domains, attributes);
 
 	doms = NULL;
-	dattr = NULL;
 	csa = NULL;
 
 	/* Special case for the 99% of systems with one, full, sched domain */
@@ -926,15 +924,8 @@ generate_doms:
 		goto done;
 
 	/*
-	 * The rest of the code, including the scheduler, can deal with
-	 * dattr==NULL case. No need to abort if alloc fails.
-	 */
-	dattr = kmalloc_objs(struct sched_domain_attr, ndoms);
-
-	/*
-	 * Cgroup v2 doesn't support domain attributes, just set all of them
-	 * to SD_ATTR_INIT. Also non-isolating partition root CPUs are a
-	 * subset of HK_TYPE_DOMAIN_BOOT housekeeping CPUs.
+	 * Non-isolating child partition root CPUs are a subset of
+	 * HK_TYPE_DOMAIN_BOOT housekeeping CPUs.
 	 */
 	for (i = 0; i < ndoms; i++) {
 		/*
@@ -946,8 +937,6 @@ generate_doms:
 				    housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
 		else
 			cpumask_copy(doms[i], csa[i]->effective_cpus);
-		if (dattr)
-			dattr[i] = SD_ATTR_INIT;
 	}
 
 done:
@@ -960,8 +949,12 @@ done:
 	if (doms == NULL)
 		ndoms = 1;
 
+	/*
+	 * Cgroup v2 uses the default domain attributes. The scheduler treats
+	 * a NULL attribute array as SD_ATTR_INIT for every partition.
+	 */
 	*domains    = doms;
-	*attributes = dattr;
+	*attributes = NULL;
 	return ndoms;
 }
 
-- 
2.20.1
