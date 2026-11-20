Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139440;
	b=zUUM80SWKvYlJuYD513X/deyaBdVc2ikYi21MOp/96/cn62AUnQ8N1UeR/CWNJHK7kK/
	 Vvu0GpbVw1ySAdKtXEioE9byzOiPd7imU55cM6fFQ5uXY+cdxqtxV4sCq1PngsAb8fxY8
	 0+w73uEWk6bvAAXTFRkquIKbPoeKW9HhERmrOIk1mdjFqF3CTkQ4thBdCACqcesGY6jMz
	 6uKRhZNUhKZ3JUA4hz0HsQuxwklflCoY88/9mOp8r5kaI8cOSZkXa++Dbm21la27uWMcs
	 DOMBc2MeomqtEOeUFXXtmoj8F1ZZCnRv1NIfB/Kqa5XYyIoQy6dN8n8bMiVc2Y3NjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tzlDQj0f/vJ+y/DQnIE5DsPiCJecj6j+gSmMXEYHqX4=;
	b=ifk2KZOCiYJ5aOJG4cZqSceN2EzjGWb9fn0piqFGJchMCCjpT/r54BSVmD6nqdI8i8fB
	 Ut2RshaliBBSDJQt/6mX0OKa7RkMn5NwAOjbByjxiVCxPyy7bUqOc6l5RfI6BeMacNiJC
	 ZERQRq4xArrMnamkRG3uoe1iLAYuQqefQRKpu361lCbIQ3Zn3jMY6BhH368KnNiEcE0+x
	 Kr1oUnK2/0FBARTbIawG2qXeg8MbJfVAY7LY9L2wlt7qWFPZRPoxzol/4WdNN2rjzQtGg
	 YAjOaNTTHTBZxosym3wf6hc7iRGhPVUxF3p7XHrEDpuEHJC2HaWXe2iGv0DxvbyiTqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gjW8Lc+s;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B12606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B12606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gjW8Lc+s
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0QLoW1653605;
	Fri, 20 Nov 2026 01:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tzlDQj0f/vJ+y/DQn
	IE5DsPiCJecj6j+gSmMXEYHqX4=; b=gjW8Lc+s7mrE98qdIKpkF7v6LBcbk3cEO
	yyS4e9vb7iXCYfhh2e4S1rAQwfSTEz5kZcAfpBgV5j1KPR2+GBgVfnu0SI5vELb8
	2HHjleVS4HGepnJeshgEQuKLH10ngK/Obvfz8wtCaAft1KyRvIO2toxH+87YTdv2
	jBJv6dm74vBvmGEcfjFYyn8CUBz+84d8Nb3dzRXYeOnR7bgeU7V8mR6N5xAIDYA9
	SgMVPg+sM8N0Hp/m7ZknrzwsgT/KZOsXKU2Gq+bUheFEVgW+3Dqp6jFlXDuVFcUR
	EiBnFKdiiccIyZdBHXowmzcZBMYRiFdyV0eBLrsfqplbc4R+WUoBg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105nnd75-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0JuX0302710;
	Fri, 20 Nov 2026 01:50:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j17c5257w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AK1oITZ40829378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 01:50:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E43320065;
	Fri, 20 Nov 2026 01:50:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AFA72004E;
	Fri, 20 Nov 2026 01:50:15 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.19.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 01:50:14 +0000 (GMT)
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
Subject: [PATCH 3/3] sched/topology: Simplify cache_nice_tries initialization
Date: Fri, 20 Nov 2026 07:19:50 +0530
Message-ID: <20261120014946.1355234-8-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX25pAwHPgJYYK
 hb51KSAU8YCjAqmWsmxVsL7ggvpCElV3fmoM68+r5uudtZWJ5lnptNvjU5bKpCDuRFajPp8v3iL
 xE+bil4zF0CheicCwdAfQFocp9O4i02q+5/ShPSbxOP14Mf13FPlhS6Lv6ns2au3dRFcAgwJy7T
 /BKDlD+ec58/XcEbZqXOAq75prfjYOb7Ec7s9xkcXUWD1wNGGzm8QvBu9LNnjozdLndwglEK9bM
 L226j3lJKmHqUGyF91X3R6AgkACh5l4ttHvgvalx9aym8+hka0tZX1tYsC9uP7Unt47ZNwmq0OV
 Jz9LiiQ8rw2wdBq2oztHxwWZ4LT6+gPz+1W/2IDkjxDxOKw53bPpP2mxyEn+3LQ0Vbte2WWclx7
 dNqZB2HID5zNPvxP51Td1Jze4KqBgKqcCi7hsJDcrZbQkDVfcTUSgzvOpp0i2GDhbFXjVbTwi+y
 JYpfvOqe8k9tMvqVdjw==
X-Authority-Analysis: v=2.4 cv=HN9WhYtv c=1 sm=1 tr=0 ts=6affa75d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=SzBnzi8YTisCr0rkP6kA:9
X-Proofpoint-GUID: LQfpZSY2N-Tg12VCfQ92PcWMjPsIs45D
X-Proofpoint-ORIG-GUID: 1tidZ5fWlm6UyDUDEfMMWCaGyUEYTlbl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX09qjj+RmtaOq
 W8DDln7CSMjGQ8XXEqxrAArAXTKt2zMJRJ7rie67khPXIedJHVCbjPWmItpII2kOkhsw3jUvuzg
 WDgw282Lo/gGxvdZfx4wHawlgVoL/zE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200005

sched_domain initialization currently starts with cache_nice_tries = 0
and later updates it based on the domain type. Most sched domains
eventually end up with cache_nice_tries set to 1, with LLC-sharing
domains and most non-NUMA domains explicitly overriding the initial
value.

As a result, the current code initializes cache_nice_tries to a value
that is not the common case and subsequently reassigns it during domain
setup.

The only domain type that retains a value of 0 is a
SD_SHARE_CPUCAPACITY domain, while NUMA domains use a value of 2 and
most remaining domains use a value of 1.

Initialize cache_nice_tries to 1 by default and only override it for
the special cases that require a different value. This reduces the
number of assignments required during sched-domain construction and
makes the resulting configuration easier to follow.

No functional change is intended. The resulting values remain unchanged:

	SD_SHARE_CPUCAPACITY : 0
	SD_SHARE_LLC         : 1
	other non-NUMA       : 1
	SD_NUMA              : 2

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 kernel/sched/topology.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 99878da03bce..da4f1e127341 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1979,7 +1979,7 @@ sd_init(struct sched_domain_topology_level *tl,
 		.busy_factor		= 16,
 		.imbalance_pct		= 117,
 
-		.cache_nice_tries	= 0,
+		.cache_nice_tries	= 1,
 
 		.flags			= 1*SD_BALANCE_NEWIDLE
 					| 1*SD_BALANCE_EXEC
@@ -2018,10 +2018,7 @@ sd_init(struct sched_domain_topology_level *tl,
 	 */
 	if (sd->flags & SD_SHARE_CPUCAPACITY) {
 		sd->imbalance_pct = 110;
-
-	} else if (sd->flags & SD_SHARE_LLC) {
-		sd->imbalance_pct = 117;
-		sd->cache_nice_tries = 1;
+		sd->cache_nice_tries = 0;
 
 #ifdef CONFIG_NUMA
 	} else if (sd->flags & SD_NUMA) {
@@ -2036,8 +2033,6 @@ sd_init(struct sched_domain_topology_level *tl,
 		}
 
 #endif /* CONFIG_NUMA */
-	} else {
-		sd->cache_nice_tries = 1;
 	}
 
 	sd->private = sdd;
-- 
2.55.0

