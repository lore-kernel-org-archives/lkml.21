Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139430;
	b=p8I/lkh//PqkR+rJ2JUZ58UttZScycvmwdrABgzhY7T2HfEuOeQDdOiXULESbtayRBIM
	 z6+WKiEwflgXrf8Kw4racjxbVsVwY1xHhZ9TNr76nrDfD8Pba2f3mzkug8XKU+nbu+vOF
	 L6Rtlqay+vT/xlDYmZ3vJySgjD2JlHhc4rTr9+wi89CgwjXdYSlwD3E+eVr49MEfAKX1Q
	 4/1vqt15lMwTVYQe415AEqPWnaArNc2tBlOqVVhZ8UVkWBRSUqCs6v6/pM57CWqL0zp/u
	 f44PqkQMA7hIJJTYK3S/ETHG1Xo77mHCvWO/yOZr9APPm4nIIinCxGkUjIsIG8sqwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvm7TbZO2dEaCkOK5kw7o++VyiDOkdnriqFs9QSV/HI=;
	b=xNuMYSymqUhXufcS4fLK2SR0Q6anmAk92nH15Y3HCzkeq3itfyWRudjpR1q42M/DU/o4
	 wluL6D8sXyLhbOE3pMcwwoTABkrlOOHAU66hMj1e01zHA+/2BenPN194yGs5879TEpcRr
	 EPX0UmlbRe6Zk64dA/00LiouYrEraSLmX2xw6c8yoNmRqNA6Wkqhpv9wd8/Fcwr4L1B5l
	 Y1pm3XylBRQc9TRAKo5YrjZroEx3wB4elgnsNWYmRgn3I8rSSBAacXD89bgv488Ag2oAG
	 ORjWGd5hSRU5Lp5WsbdvUdfi/8h88Tl3WYys0UseX29OpXcfFNstLwKD0gP4U9wWDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hnX5E93t;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88249606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88249606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hnX5E93t
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0Q0Cb1652855;
	Fri, 20 Nov 2026 01:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Mvm7TbZO2dEaCkOK5kw7o++VyiDOkdnriqFs9QSV/
	HI=; b=hnX5E93t7lBSqPD2G666jrY2UrGcypukclSsNurZI8NZe3STDNHPiEDGt
	6VGvmu6e3CDvdC3m9Dlja0d19MlxgfWB2oyfIw9lG/1dxK/0/oQ54I/cH+vVDK8C
	5pVjNIBnNv0LpIFISvrLwSNSvjkalFv+HsOLt0dYdeVcElmKZW5hMlCj/gd6Mz8w
	E05+lcu8TV1+CQ2TbtFbswREqcWlhaOecdxR3j6PHeSPzb07luUXf6fkNbk8DjCT
	nTsddar82nyDYtiDYtNG2m1217AjGMEnDGNnmEOQLGyTdD1cMGcrGJOuAnSb+cha
	pbkqxpe089CI7ma4Wmnggbuc7kInw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105nnd5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:09 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0YrdH3818092;
	Fri, 20 Nov 2026 01:50:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j23dwb053-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 01:50:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AK1o6Kq46596442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 01:50:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4434D20043;
	Fri, 20 Nov 2026 01:50:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B83420040;
	Fri, 20 Nov 2026 01:50:03 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.19.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 01:50:02 +0000 (GMT)
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
Subject: [PATCH 0/3] sched: Fix load accounting and improve imbalance calculation
Date: Fri, 20 Nov 2026 07:19:47 +0530
Message-ID: <20261120014946.1355234-5-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX0CNzLYwceCFB
 heY93fgLZrFEnJTZl23zHFBrOgR+/yK7jaJWZEynLOXWcISIGqJ9uqZmQQNAjacXD3xD3iCluOg
 cC5SN3G0kE1A626HSyXOqDzNw2S0Fu5kfS6iO5d2RASKxaXDEXCf4MzS/Iow+4P7K1b3OYTqWkE
 2NQmBqFcj8w3Inh+Gp641c417SNeXE+OHcaPatUCkzR63IT9SokawlJYKbBPd5uAEvdlzwUb27m
 55nY+ONBcknTN5BDacy14x5tjFKhLK0+PAqwDGj8MnB0arYpYrlVvU3jaFceer2W2qMesPg8khh
 IFnFaYNwdr37jA5VFuqzPVPTUYrg8jsf6RGghRdVXeKDhAErpyiMYW/LNY79McDsYHZ+D7g58/W
 QWRn8e75iq/ljkrsp+C4nI25lOBwxZKmbWvjBldBSg+ehdlf4JpTKGks7ECiIi0mXV8HYqxISzx
 i3y/1AAowY9sn/0Y3Ig==
X-Authority-Analysis: v=2.4 cv=HN9WhYtv c=1 sm=1 tr=0 ts=6affa751 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=ZsR2dV4RUeciMP3PSSwA:9
X-Proofpoint-GUID: TaoWGREDGrn9ydsmZuE_aiwt8pxXvSOK
X-Proofpoint-ORIG-GUID: aToj7GbR02NeQ0wg70ZWDuPeEDUPdj7g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNSBTYWx0ZWRfX777FsL/zLZV+
 UsJqfr0uo8911KqIdpZglozewth08TaObwE6D1OsNj4wVkyksfb56XC+6H/uzpJiTxvupU3UWGi
 MoEajDdvLhXerKbpLeqVc736l5vCBXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200005

This series contains a few independent scheduler fixes and cleanups.

The first patch corrects load accounting in update_sg_lb_stats() by
excluding delayed-dequeued tasks from sum_nr_running. Delayed-dequeued
tasks remain visible in rq->nr_running even though they are no longer
runnable, causing load balancing statistics to overestimate runnable
load.

The second patch improves imbalance calculation for domains containing
groups with different numbers of cores. Idle CPU counts alone can be
misleading in such cases since larger groups naturally contain more idle
CPUs even when they are proportionally more heavily loaded. Use the
runnable task distribution for imbalance calculation when comparing
groups of differing sizes.

The final patch is a cleanup of cache_nice_tries initialization during
sched-domain construction. The resulting values remain unchanged but the
initialization becomes simpler and easier to follow.

Patches 1 and 2 contain functional fixes while patch 3 is a cleanup.

Srikar Dronamraju (3):
  sched/fair: Exclude delayed-dequeued tasks from sum_nr_running
  sched/fair: Use runnable task imbalance for asymmetric groups
  sched/topology: Simplify cache_nice_tries initialization

 kernel/sched/fair.c     | 5 +++--
 kernel/sched/topology.c | 9 ++-------
 2 files changed, 5 insertions(+), 9 deletions(-)

--
2.55.0
