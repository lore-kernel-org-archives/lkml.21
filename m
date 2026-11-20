Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139433;
	b=4vfPLGbFXt/9uEzd0dPvv75AZybOsbfBedKkMojs4iQQmX0fiap3hwb24t1TxImEqijb
	 0Nz1Vv6lkbBizokgfRFKJBx+MuIa5JXHQ1SVrLCPMv9LpNX3Yila21BMztghoRtiSln6h
	 TMqErOA/mDtzKLpDcKKCMXMR8l0ZV3rONPt5gZ0e/aOxdSZdEt9voXAYAK35M80YUXUA/
	 Z/xfTbAhqsoAHJms4nX/8HsZ+uJtxyIXFfap8bIu3iOa0nromktkOrGj7alaM4KgAvmD9
	 QAPLNn290pUnvx0QzqXWUk2JJW0+ak+VDIB23ewDhQFG/84KHTiJiGxIIE17NdCYtnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eDoMjseZ5XyPgJH6d4QU/kfxDXkFBIVIyyArge5bPwk=;
	b=eASakv2RTxIjw8FDJmJN4h6+zuxORDYI6mWK1BHGed+9IqF0+jzvTCqR/POp8CVcM5BA
	 HEo3rTqjOTTmU7D6lykVF2foLv+Xgc+JdKfH3C1IUc0t6g6hOncen/CbDxvm6toYvSb/N
	 jhW0r/uNNaTZu9Jb5iOFrqllr4CrDSzM8zvIikdshqHGg0Q51Onp75cZwIythB7XX6uqD
	 hHg48CTxK5/igpSAMtsidYccmARLQiId2sVWPf3cxRWOsLrnulNB6DRYkOeiz+WVovpZ5
	 AQGIIIs6savdtrwVQDauz+B0XWQ879oU+oVPjQ6jmfOpzEhBhCDYR3KS+B5RNz38nHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GE2DbN6J;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8F606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D8F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GE2DbN6J
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0Qugx293763;
	Fri, 20 Nov 2026 01:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eDoMjseZ5XyPgJH6d
	4QU/kfxDXkFBIVIyyArge5bPwk=; b=GE2DbN6JpAd9cD2d1WpblrFbvY0YRIu50
	diBhFnznQ0xtsFW6IXN7pnxdq2OyY+DKaZmJ6bUyTPFgS5v2FmzhB/NvQyaaLM1f
	Cu5V1Z+KqbJHqm1LNjQrJjG43xfxWRO5BZfdJ7r++RWB963EcR4jEmZV0pJ92TK2
	eIuLNUcPD+mTyQ2LPfLjsaOXE7fA65PaZWHZh1VE4Qp6R87xR5QibqLcEdp+Oob5
	3GsPPzAcMYY7x02Fl8R0cmyWNHnGmQdOrHR0iIVjSj+kY55nGB7X0d6f2Uy1q1/y
	zgfnWcNndqyF/CZ9tZBYz6f3e2wYFTlOlcEw3/y0ySQCQjqMMkgQA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105w50ta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0Ju6O1428636;
	Fri, 20 Nov 2026 01:50:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1m3hyec1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AK1oEwY46006676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 01:50:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4245320043;
	Fri, 20 Nov 2026 01:50:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 143FB2004E;
	Fri, 20 Nov 2026 01:50:11 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.19.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 01:50:10 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH 2/3] sched/fair: Use runnable task imbalance for asymmetric groups
Date: Fri, 20 Nov 2026 07:19:49 +0530
Message-ID: <20261120014946.1355234-7-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120014946.1355234-5-srikar@linux.ibm.com>
References: <20261120014946.1355234-5-srikar@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: o6Mhonx0hFuobc5Rvfc5m1Z8H7m8-zxq
X-Authority-Analysis: v=2.4 cv=Z8x5j3RA c=1 sm=1 tr=0 ts=6affa759 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=xyBtkvn3SPqT6zWXz4QA:9
X-Proofpoint-ORIG-GUID: R2ruwleR3IMC-3P2VxCuHy97YOk2-J1s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfXxNSm6ym7fjx6
 F55t2yQe3yjecgeqGqnVWhIOCu9ug39mVuAqhIn52LrN/7RT/sx6rLb64QJ2XOLz5+1GKAgwjiL
 vYT921eme225zi/yIVZipDqVTTJMSUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX5hwgOKpJStxN
 Mri+hjt7v2GYj1xFjkMeFbhbebZ8xBkX5uCdbNeA3pRMmP/VhjjBuGW6RpADK4y8504oJHIpw3l
 YrwyCbE/iJw7R8RLvXwvVq/5Pv+Y6/9He7Mehfy8iaUJ7D5l0vlQx87JJdhAFQn40qFE98o/BlT
 RmVE93MCwB6lAPELUiGyo14jwIP78aotpmd2gMgaLw6ciO5nZ8MXOVcSdWJE0v2+w+QGZgoZm6P
 VfzHnFFKvDXMXZhFDDXoKGl8c4skDWEx1Y1hR3eL2WJ30O3O9RRrujwjqPtEfesKcxCqRut9AVz
 +btPWczLezB4R2F31JRQ1U+gHHYHRaEkoPFuBb3K108npHA1qG0DhfGwHP7agR0Orq4vB11eI62
 Ikm2+7KiQZ43mcHk+Vmfxvz0+wiapu9w8HcrP3SpRRujTuaP4R386hRLL9sh0kCAFuN1bp6FtIc
 7myy+cKVSh2VT9sC51g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200005

The current load-balancing logic uses idle CPU counts to estimate
imbalance when SD_PREFER_SIBLING is not set. This works reasonably well
when groups within a sched_domain are symmetric, since the number of
idle CPUs closely tracks the distribution of runnable tasks.

However, idle CPU counts become misleading when groups contain different
numbers of cores. A larger group naturally has more idle CPUs than a
smaller group, even when its workload is proportionally heavier.

Consider a sched_domain containing two groups:

  Group A: 2 cores, 1 runnable task
  Group B: 4 cores, 4 runnable tasks

Although Group B is more heavily loaded, it may still report more idle
CPUs simply because it contains more cores. Balancing decisions based on
idle CPU counts can therefore favor the larger group and pull additional
work toward it.

The scheduler already uses runnable task distribution when
SD_PREFER_SIBLING is enabled, as this provides a more accurate view of
load distribution between groups. Apply the same approach when groups
have different numbers of cores and calculate imbalance based on
runnable tasks instead of idle CPU counts.

This improves load balancing on asymmetric topologies and avoids
overestimating the capacity available in larger groups.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 kernel/sched/fair.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 21f2b17894e3..f5fecbcd2d84 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13164,7 +13164,8 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 			return;
 		}
 
-		if (busiest->group_weight == 1 || sds->prefer_sibling) {
+		if (busiest->group_weight == 1 || sds->prefer_sibling ||
+				sds->busiest->cores != sds->local->cores) {
 			/*
 			 * When prefer sibling, evenly spread running tasks on
 			 * groups.
-- 
2.55.0

