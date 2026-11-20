Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139431;
	b=OSF7ZC3U9J24F4CrxdPvX4ujZ8NsrZG8aWTbyElX0SHUYUD/dgNRZWA8CiNmrQjxyLNj
	 4crNZZTAP2lLW+P5phFT5pjtUgTr5PgqdJp+RUGq9Qpfh8XdwA7XTZtYluNA05Esuxc8R
	 J0hbWcE5nR0gB7K/rMbll0aY8HBka17XTx8Nj2QP2qqYoOBZiDfQ42HIg5AE//Vsy0PFc
	 rBXg1j9Kd0/xIvoG9Qq0W2z7Hr+fnDqOP+VkOwkK0K589KFQ9saeXdpAY06rKPngbvItA
	 J+5jz6Z+5jVPllAL/hiQD50CvtiziWHpMKJuxlDmds0fnc3FAhXeXwAtQUL9PrF6p+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yhEGrBHvYpkALotgdH3KuUTldvEOKTaOWrTrcm0MdtM=;
	b=qIg+9d8Ab8NwTPtroF2KGSU7UOLW/864Nkg9ZidrP0LzlsR+fPRabJ1Ll6JtGA9Ej/ER
	 43LstHwJ1deV6IQsubC2m9/OXoTtbawMaMi7oeThoxF/bcdgq8/ZbUsvSbm+EqA8YUNHa
	 ihyWa6VON81mb21901wdF252sTYiYacFpZ7OZcyZ5Kr10f5fNh+qOA+fMxldqKHjfHbp/
	 a6XZkckkHNoi55XnVbpqnLehECfz6ID6Ci47eddQRds8qXRtwAxw6pZ8ftHgUNLCZcxyW
	 m4fmwGwtaKphOnjV8u6ovue/v8TSd+W8qbBntbeqpTAwbH9oJjIzHrDW9FP6a6l8GHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FTHWvd6P;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB946606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB946606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FTHWvd6P
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0QSh21482554;
	Fri, 20 Nov 2026 01:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=yhEGrBHvYpkALotgd
	H3KuUTldvEOKTaOWrTrcm0MdtM=; b=FTHWvd6PKunoW/VI77c9WVAW5bOVbXH5d
	zc6OqmTI/NUTQPY5axjEBe1WbgyWLhxTWUJlKO2xknoJGmjfrfIwVYB8HyaMwuS3
	r6Fv/nHqlOGrPUa0cDlJruFofVeVC3NnKos6Adg96gVpE5c2YAZUL7aZrw9mwwgq
	VkPcOqudaKaVcHYGxfYQYosNsDLH57Bwqka5dbeQqXfD8HuDZwAAcE0ufTvUJMD6
	GaCr3ZFCkwzkO/RYxAeOuQ5vUNctIyMq0cKwHHLz5WQXejzR9RdSROJ+OXOxSEkG
	ht5317+l0AhdAvp24lL4T5Tymtyjf/06OBQAbXs/+mzOw0I2o4AsA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105x52cb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0JuxZ1428620;
	Fri, 20 Nov 2026 01:50:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1m3hyebd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AK1oAbl47579510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 01:50:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 498DE20069;
	Fri, 20 Nov 2026 01:50:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EFC020040;
	Fri, 20 Nov 2026 01:50:07 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.19.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 01:50:06 +0000 (GMT)
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
Subject: [PATCH 1/3] sched/fair: Exclude delayed-dequeued tasks from sum_nr_running
Date: Fri, 20 Nov 2026 07:19:48 +0530
Message-ID: <20261120014946.1355234-6-srikar@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: lFAQlZN9KwcUO17xfVRpERmDbmlEGaWR
X-Proofpoint-GUID: 0ZX7TRtGqws3IbiwTjNYtueKefWT_qPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX/JugJXUEZa2u
 uKeWbBiNPk03QaylKyPols+iLvspKwtYJi/41c4DjBJW2hI8XjLgnr+CYyOLOowcPwvJ4UUMu8t
 klxnZNnRIP9KjwcN/En38Yo0w8x92y9GNRORX4IbvYLw3RaKqIvx0XaXBTLvXpjhJ9UA5rOgbSf
 uGSnLcSsrx+b0kmG8yfpd+OCnSY/7fYIibL9U/n2+h42cwz7DIgs/DPgi1u7sq+im15zbfUW69z
 89SkIeGMQ+Ue5HwUfqnGXoNw8ToUMDur+h8SyVGXAVwFu7j/8nv5d4OJIE4gLy9Z4UVMvA7uq97
 SojmY+0O/Q9T7VsOPe2myBLcefwBNWWVeWUXrq3bTJnJ8Z9IRBirhCkoLjNxtVeeekVJJ0kd7TK
 MgMM9NqBcETGckPidm/k3W3w1zYM+9EAKfRoIcn1Xo2hwYXsTdnheeYiwCzCqhnel1XxXHCf8L/
 lvwBuekpxcTEqXrv61Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX3LefharWedBP
 E+QNs1Fqw5/xveuiyTvbF4DqZu1UT3z5wCTjMlzEBZdpHGo5pK01DuZKMWTCBzh0D7hjQKnSOeR
 4aGMjZLTRw+uffFTvo6QnkLK0B+9fG8=
X-Authority-Analysis: v=2.4 cv=K+m3jCWI c=1 sm=1 tr=0 ts=6affa755 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=yVW1hHiVOh8D95WwWEMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200005

Delayed dequeue keeps a sleeping task on the CFS runqueue until its
accumulated lag is repaid. While such tasks remain accounted in
rq->nr_running, they are no longer runnable and are not eligible to
consume CPU time.

update_sg_lb_stats() currently uses rq->nr_running when computing
sum_nr_running. As a result, delayed-dequeued tasks contribute to group
load statistics even though they are effectively sleeping. This can
inflate the apparent load of a group and influence load balancing
decisions.

Other metrics collected by update_sg_lb_stats(), such as group_runnable
and h_nr_runnable, already focus on runnable work. Counting delayed
entities in sum_nr_running makes it inconsistent with the rest of the
load-balancing statistics.

Exclude cfs_h_nr_delayed() tasks from sum_nr_running so that load
balancing decisions are based on runnable tasks rather than entities
waiting to complete delayed dequeue accounting.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4cc0caee626..21f2b17894e3 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12296,7 +12296,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
 		sgs->group_runnable += cpu_runnable(rq);
 		sgs->sum_h_nr_running += rq->cfs.h_nr_runnable;
 
-		nr_running = rq->nr_running;
+		nr_running = rq->nr_running - cfs_h_nr_delayed(rq);
 		sgs->sum_nr_running += nr_running;
 
 		if (cpu_overutilized(i))
-- 
2.55.0

