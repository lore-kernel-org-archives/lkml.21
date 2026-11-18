Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978892;
	b=ZttXMXXMT21y2ZQK+ZeGbzf9cQ/+AujZCxMFeRS2NRnc9doSy6826yjYIaztUVS19d2o
	 tXA+pQCvODk6OBoYD+mWIETopMTXSS2Q7Rqfw4O5Rjpp+DSMVBAQVxqP32L5BkfRBWvYi
	 nU+HvO8DWZ8vT+9Hn7Te5U4zFbdotPaI6gEMyGOvag0o7vKXgwdhakzXjc0N+Lxbiu38J
	 gQQWYwj0oK2oa/TPO3SRYeWVP+TGD5IHQVEIAFTwQ/wNtHOOaY1D8LeUcNdD9cRUHDLzB
	 JnbA5vb+myDZ94X1dQB42dG10Oh9CO6eoulje9UfQv3Vx09B50e0Ke3bXUEOGsDHhrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ComRRml0ZzynV3ARoUry0O9EESmxNStjxfOKpHuXfew=;
	b=VpeXMjdcCnvwXVp9tY+YqfVHbmh+CBovLwjY/rTy44KfAyxZiB7BkKc16t1bob4uJnZN
	 /2UQCb0i4nF1stvigpAPZQOTyjlDnC3dowRqVehqDumX5tjsXSEYSFZwP8U2M0JEA4Y0d
	 ohmAoH+7U1Enb5KWo1IxsqRZ9VWXbKGBxztr0JUrfbTTVS0ajSeO1n6r4YvDYStUgE49/
	 Hc/1TdkPTHh3sDQ55m1YeypZkhEIV330FSfAcHj2u8ptK1GrWBp2rnc7OgAloEJ4zcNPS
	 ABS5ya2qEPootoQNOSnfWH9mnkDNdKCDkXwDwdVh0nITn5JNoZ/cZBGnFOpvnK5N4Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="on/4JbEu";
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC95606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=on/4JbEu
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2RuAW4062985;
	Wed, 18 Nov 2026 05:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ComRRml0ZzynV3ARoUry0O9EESmxNStjxfOKpHuXf
	ew=; b=on/4JbEuoL/+CjWlEo00BA0nJGe7N0+ZWo3zhzBU6ObdwxoHmv+sks8I0
	gUW/4jVNnK6l98F/UFyXOVaUeALJ8uN/nPnL42/uJNIWycugL7BwU67sIJ8NdVuf
	xcsjCb875XAS225Jlu3wHLYJMSyXdAfI193vV274rv8F9oqkaZ3eR5NNA8lMDGTM
	LHFDqjphg+OPk62C2WbwHf7+sR4yC1RyIk8847p/ufL5NCPI/BthrN0NPg3jJ/5+
	e/lXIl3zGEXlKYlZEQOvJs6SmdRvJpmUlqJskF3mqz8+oLz1OfQ3FXtzesm2Oxhy
	VGImPISD/Z/S3Zsp8RwNPoZPFr6fg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105t0yp1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 05:14:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2nt6M680839;
	Wed, 18 Nov 2026 05:14:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hy2bvgugx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 05:14:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AI5ESLC39059904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 05:14:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D10AB20043;
	Wed, 18 Nov 2026 05:14:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB59120040;
	Wed, 18 Nov 2026 05:14:23 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.10])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 05:14:23 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: [PATCH v5 0/3] KVM: PPC: BookE: Fix boot hang on preemptible kernels
Date: Wed, 18 Nov 2026 10:44:16 +0530
Message-ID: <20261118051419.783878-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
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
X-Authority-Analysis: v=2.4 cv=IouL47/g c=1 sm=1 tr=0 ts=6afd343a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=4M4rjlPIC_omUXLxwSAA:9
X-Proofpoint-ORIG-GUID: _FAZnjFIzeN-a8vdkVqegOlU-Q2ZS0UB
X-Proofpoint-GUID: AWPUZCe4tdD6RDAW4nXxPz1YetxgyF0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxOSBTYWx0ZWRfX/4cOi/7WqLDI
 DoA813Z8croph3KK8Po1k4KC32DNEpAx9sACtFZW6unOpdg8XCyKEFpggIm2VINjNF4xmzP0wIr
 yJuR3+UGs8H94ZNBrvXMcJXwBPaL6Swb25PDrd6QHJGxkuwr4X61MuQdtVsWqbB8PzJGae4+C2v
 ECoGWVAubGV5TwqebemkXhNWhu1CG/fkJYuxCRckPb8ltkj++NGnQ1vudBf+QOpqTcVXDsyJWwR
 p3n/by5ADr1vgUT9KgfarwkSSJD/20p2qE6ObJekRzmsobm3bd9hvkEe+qNMb3PAs1Bq9Nx2jgl
 SXNd2nH/5oB7og0BPLjBKS9GzWr5RID334oL0Lvszx/Dlt92cNWbCM/fd1t/LqIng7B8nYt5pCU
 prAgSrHpdT7/Ga2L5nPP6EpxjE+L114UYE1tAZmjTRJhMnm5oylBz1At+hlrHKJPSlhfK+g2nBH
 r2H4sZV+WEKFTpbvtsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxOSBTYWx0ZWRfX2vs4yp0Hw8Gy
 tmc7RygorD/sn3Tgt7fmSsxUXmQHGOqzqmRIA8zm7MkypBIkh9wF85KZDjpOHBh0Y4PvxhetJIL
 LwfDTy7kl5bvox1urOIe/sBvp8TZlK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180019

Christian Zigotzky had reported that preemptible kernels don't boot on
his FSL Cyrus+ board. The board freezes on running either full/lazy
preemption and has been an issue for a while now (years!).

https://lore.kernel.org/all/b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de/#t
More details in cover-letter of v2[1]

v4->v5:
- Removed fixes tag for patch 1 as backports could be
  complicated and added stable instead.
- Collected tags.

v3->v4:
- Modify hard_irq_disable for PPC32 to simply call
  local_irq_disable which does tracing/lockdep in addition
  to actually disabling the EE bit. (Ritesh Harjani)
- Modify the guest entry code to use the above (Ritesh Harjani)
- Collected tags. Thanks to Ritesh Harjani, Narayana Murty N.

v2->v3:
- Comment removal (Mukesh Kumar Chaurasiya)
- Add missing booke change (Sashiko)
- Collect tags (Thanks to Mukesh Kumar Chaurasiya, Christian Zigotzky)

v1->v2:
- Re-order to avoid preempt count dance (Narayana Murty N)
- Do only hard_irq_disable on PPC64 to avoid second warning. On PPC32
  use local_irq_disable to acheive the same. (Ritesh Harjani)

v2: https://lore.kernel.org/all/20261110053238.3794500-1-sshegde@linux.ibm.com/#t [1]
v4: https://lore.kernel.org/all/20261117131612.707038-1-sshegde@linux.ibm.com/

Apologies in case any nitpicks are missed.
I'm surviving on half a night's sleep these days.

As said in v2, remaining usecases of hard_irq_disable will be taken up
later, which are in:
arch/powerpc/kexec/core_64.c
arch/powerpc/kvm/book3s_hv.c
arch/powerpc/platforms/85xx/smp.c

Shrikanth Hegde (3):
  PPC32: Fix hard_irq_disable to follow tracing and lockdep state
  KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts
  KVM: PPC: Hard disable interrupts before guest entry

 arch/powerpc/include/asm/hw_irq.h | 2 +-
 arch/powerpc/kvm/booke.c          | 4 +---
 arch/powerpc/kvm/powerpc.c        | 8 --------
 3 files changed, 2 insertions(+), 12 deletions(-)

-- 
2.54.0

