Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323345;
	b=dC2mYvSVZ2oV1YJdgjUoJoEGIO0mejpjHQH4ZUR3GR6O2T2xB0w42gY/zC459rJQ692L
	 N9d/o9sWPxyyAXvcTzIAvur6QI6TbHcxyHDxcQxWyk34PaHUilX7sWq7HrZyJSDWOY34D
	 B429/sWlFVu/0+C4H9UirBiHUyqF9hwaDnEK2CsydSTo0Yxie4XHxrUS2k1hflqMHkWkE
	 TGp3cFDamtTOLvC2Mpo3cDIA4bVc5AAPvf9AUVMFFfHx72R1aDrkiJPww4DgYqjWEoaH8
	 gIUYeL/iUnr+PPSCuiWEOmzsYIAoIwubvCsGhi20A6azxDp374xNPM172g4OaF7GxmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iRLqjygv2hDYSeqdM+xpW5LlsPFF+IyHh+AJw3x3SA8=;
	b=z6BC6MfJBjHbVz4AaPHkk6FuECl5EM9o0fVmn49gi6uiN4HDaMuljiuUqkGuLC7GJ3iz
	 4JOwFaolj+TFAd53G+buG8wKHHN4ls1r3yLY/bvMrraYfKmLPusyP93Xyl4rqpVmysqDK
	 /n2Okuk3/s3k2xBxvok8MJzqvailjnq0Y8xuUwq5nXLf2F5Hgl/hUTfqLzudet1uzqSJF
	 tUxHbQRe+OrU2PmBg2fsbbrd8oQ5VOFz7KkgEV4OUtObuPHXpYpVHov/UCsx0dGAK1cRl
	 UsQry5mKxHOWj0kW64DP1t9IqvrEqsHz4valG7PWDPSRULOu7Kh9wdwjNko9p6iAb7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNx5Fwha;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF081606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF081606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNx5Fwha
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM44rQf3673191;
	Sun, 22 Nov 2026 04:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iRLqjy
	gv2hDYSeqdM+xpW5LlsPFF+IyHh+AJw3x3SA8=; b=hNx5FwhaZDFklLzx9F1oAi
	uwG5K+eQpBoFFL7Qn3kC5Ma48VCkRn1bkj4G8LL8COBDX7amRhp28DFR15/4x2vK
	W/KWFgB5dBGTcq3/sH/mxH+7yADpOwpQ/zaMcdlur1BHKuAWm+7yJx0oXnZ0qAlB
	r/YTMmuW70yL3SJL7WSQmy9qUYCDT5p1ju8Y6ndKJSRsZCPpO1pifMRO11Ugc+Z6
	D7nRbQYKPw0UQeeVv2sJ5vVh7Y/zkIvYahADZud0ViPSl+PFePgL5kOwrH6wlXgd
	Ih0UhfDEFxGuyvoHsy8JPHUCAwFqFr6IRNOhKFUMfzRxCS7oXPhFdhQliEsBuNXA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34guvum2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 04:55:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3nVPu810566;
	Sun, 22 Nov 2026 04:55:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3q4h0hn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 04:55:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AM4tPuA28639744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Nov 2026 04:55:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6539B20049;
	Sun, 22 Nov 2026 04:55:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3BBD20040;
	Sun, 22 Nov 2026 04:55:20 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.90.96])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Nov 2026 04:55:20 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de,
        Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com, harshpb@linux.ibm.com,
        gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        nnmlinux@linux.ibm.com, mkchauras@gmail.com,
        Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH v5 0/3] KVM: PPC: BookE: Fix boot hang on preemptible kernels
Date: Sun, 22 Nov 2026 10:25:19 +0530
Message-ID: <179532322367.92012.16546400865161170455.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118051419.783878-1-sshegde@linux.ibm.com>
References: <20261118051419.783878-1-sshegde@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b0275c2 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=r65xZNbgYoIxgFmg-xoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxOCBTYWx0ZWRfX+FhUVAV33WQH
 Jme8MeEvt9aPXTkcsrbJxA9SbWWbkj2erpVtw1vusRy9JSwN8tFyPa8qVshmCVZ30fhVpwwguy5
 qOriA4QEI2KDyEWfG0yYM/N4jEyvpok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxOCBTYWx0ZWRfX/8T2QWjO/GlD
 XfcfUjqBctUuYf05qhgXLZXlZCPBJQBaqBZ6WuAN2N7T3fpdjlqwZC1P/Nszbjq15nAxMoj+iyf
 Kc9yCQONQ5MWQCIgn9NdQDNxKMp/M557YKkuxJc08A1zUHJgEQnkaYSjFMT6e6ka6//QvPvJhPO
 iRdqWZkC2R2XFzN4f355AxJPYx05OEexql5dXskfJ33RzJrUwpdB3UbaSnkQLAr9+fhImelQ0mr
 s8IN26zCNx/39tEWr8tyKbQx4noq02hhQcGICYlM8RsSRzqngbLKR2Bfjd8nQt8ZeghEr/hFrPm
 tIe209b8pP7EFnRH6y2nSf2ejRmuku/h6jINiYQd4FdIjqYHtLNKb1QC14ZeLuf2jH9tFc3zeyW
 id8wMIOjH+046GWBc/jVXW94sFjw8fKPttKWBoHYmtAvqMWH9YlRCExaRIQ4kWOv6TpNlEcmwcK
 dwZwyXDy0jcoja7nhgw==
X-Proofpoint-ORIG-GUID: y1uGyVD0I8JUD1Z1q-A2cMojlKBJ_raR
X-Proofpoint-GUID: dODFUbH4Wwny_1OwpgZBPJUEuS-C4MIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220018

On Wed, 18 Nov 2026 10:44:16 +0530, Shrikanth Hegde wrote:
> Christian Zigotzky had reported that preemptible kernels don't boot on
> his FSL Cyrus+ board. The board freezes on running either full/lazy
> preemption and has been an issue for a while now (years!).
> 
> https://lore.kernel.org/all/b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de/#t
> More details in cover-letter of v2[1]
> 
> [...]

Applied to powerpc/fixes.

[1/3] PPC32: Fix hard_irq_disable to follow tracing and lockdep state
      https://git.kernel.org/powerpc/c/2672bdcc7857073722c4772831a24b14832ee88a
[2/3] KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts
      https://git.kernel.org/powerpc/c/cf2e6ef0a39e0682d22292f1b9e9cd865482e86d
[3/3] KVM: PPC: Hard disable interrupts before guest entry
      https://git.kernel.org/powerpc/c/d0160f6470d1b8a4ce25d98bb8d1b0495a922d4f

cheers
