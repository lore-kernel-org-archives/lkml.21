Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135035;
	b=aa0aZ8QIurGI0gwySK9N2ikVUwjWdHe0I2FUG8MPe81t5egm6P3KmpYGhlmBGTMgP6rH
	 fH1/5JSAfaK2hIyAkDLeM/5oNCtzDJ5sl4jfaMEhHQCGcVrH47XC3WqZbZB0ZgPGn3iKM
	 gmjvIqqC2Z8Z6mVbE9kftniNSpFZOpEK/LPU2pIngX5RL7vHf4vHJYbMtAJ6TQIFccuKT
	 fkFMcmomPf7nk0pykKsBtVCVdzF/FPbTEzvT19ohHu296BOyJkl9PHGHXYgjgWJ4RR8tS
	 aotasu1ICjzSRzwcrTaBjA4L3fN6UW+V2U3IkpgkrzP2yPxz7Lyy55NdolAknSCnQ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvm7TbZO2dEaCkOK5kw7o++VyiDOkdnriqFs9QSV/HI=;
	b=raCWfAYFa6rRi26uwEmanG4Vrv/9dh0baYRQZr2w8LIf199oOkigfShd4NCH/65LQIvq
	 ZBiMX2KasoVAj1CVNrRMUV2mVweQDDLoHOXsjO+xh+ydznrzX7D0Z0SgTkgJ0x54IsR1Z
	 Fd79Sh0YUG9VXcNbpZ9Cf6Ur8QHs5bEmM3tWezfdQ4XCeajQud0KW5id1ji1hWzdO9EIt
	 7ppXhPxxQ8vtAMeSTXXRG2aMQ2+L1w89Gkf0IqsxmOnsGxwlnJ9863NWGB214vYjU5qFi
	 AN4ru1HnIRSQQLL1P6AnIySPATqHlZ97ZWnd8TkbIHXd1BdGSxjdEJuluD/7GGK+tRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GAZRK1M8;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FF606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GAZRK1M8
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0QxA44059320;
	Fri, 20 Nov 2026 00:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Mvm7TbZO2dEaCkOK5kw7o++VyiDOkdnriqFs9QSV/
	HI=; b=GAZRK1M8ggiwhWspegfWj1cGiL9nBqlSxdxlxBr7Rct67Mi2LmfBLHLKo
	H3NHSJJahJCJIVxqSeA6aEACL2i7S5lQt1CcSBHi2iREVLUuoPZPa2ZoiIabwiU3
	wfA18FmSAWS5ZvbgM8XvKk7YQebqPBwQZV4H/lYCZTjcIodce9aovPf8MX39dtKR
	w0kJg3nVjaqyiaBHB7kuujznTfSjj7kBdjDJDT/Nh7QaXxDKYFbKUQpMt4B/ErPj
	LqZJ5o4C2MUBuVMjnxZpvVrG5tUvFskE9UXMHIaORDzQIkQV/fZ5p5SWx6DIUxXZ
	5dkLavDH1CfaHrDJhL12u8+aZpZxg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105rw357-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 00:36:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0Jw501717744;
	Fri, 20 Nov 2026 00:36:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1hd6yrf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 00:36:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AK0akHg52298160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 00:36:46 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D27A20043;
	Fri, 20 Nov 2026 00:36:46 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EF1D2004D;
	Fri, 20 Nov 2026 00:36:32 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.19.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 00:36:31 +0000 (GMT)
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
Date: Fri, 20 Nov 2026 06:05:34 +0530
Message-ID: <20261120003534.1339296-5-srikar@linux.ibm.com>
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
X-Proofpoint-GUID: MBHENH6tRv9db4lgtJZTDAxH-s4sj5pF
X-Authority-Analysis: v=2.4 cv=e8uT2qp/ c=1 sm=1 tr=0 ts=6aff9622 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=ZsR2dV4RUeciMP3PSSwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwMSBTYWx0ZWRfX9m5lxW2Nixk/
 WtxWUQrsaYwJ4Ws8+tZDdupxAAfdw8duv9JrFrpCO/kj11VGbrEmfFdGrvjnmmvlL2xTPq6R8EI
 MSt9jS7yna6h3AnIDSjXYAMigbc3YqQ=
X-Proofpoint-ORIG-GUID: n-74fVsq8BqOhBC86gq0Oe4plv1a3dWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwMSBTYWx0ZWRfX8e2An6cDrezZ
 i4XLsBbFRXpd2thH0hUUgRnyOi+TGj1dG4rDhedKeFftyfLKG5wwGuM9vzntoj5DcKJbYLxNda2
 LYMYl/VsVgVWUT4CvHHGR/jrLrXrmkQW2ddv6UQbuY1uviPyKAfRBAUX6UV0q+Za7Eb0V4+IP69
 KC9Hs0JCMESF6WMddWTYaEnZ+iqa19kbhuhXIGLxmMVUsG2J2yj4e09lgg/Jj3kEsqOhp/1TRPX
 5FMv9xTPqLWYrc/8d/6UHMVQ3FJjP/M5YVxDXdKWVJpsJcAHoV/V4v6hgzPe53c79TZJ6Egeg9r
 OLzZxChuxDl2EPCqEeoDVpPwwvAHvckxP6zwX0OKXCd6CyK3hz8JOX1v5ELyo8t7W/8MBoGJbUX
 XJC2eGlEAI553cOcnSaUysx9qtqQSIgtX+YgIltFewd1XFHqYN5skG1mlMlctmnN05ESlKD4JdV
 gK68zd8ClTiYD+2Gl4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200001

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
