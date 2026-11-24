Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518309;
	b=AtIcS2SLImA6Hyols8FkpNstjudu/c3REiSRIq3tEgtgGp40Bq9pnm4yAv7i9e7dOQLb
	 LVHmB1yxb2yO5lTys7sVXJvIo/6nvtQnFNH0fIrO63+l+C1KFtMM1sXYw/A2cv/7RXM3b
	 qy+0dj6TUzaM24fdPO0QrRzzeTv/m0SEWJvFo1raY5E1hztuDSymxJaG1VA8YIAeYMiZY
	 zos0FQzsIBFbU2P9X5HSmShKxYGC8mKpQ+0J5CzcntIJTv06kl1y6zGQmQH05Hn7UqVQl
	 64KkRojCru4pIF3WO0EPcDrHaTRjCxoHwo/24wV0P9BhBonbDXP9yRGkM5Vt6Nog4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UW5f9/wqMd0LumKW7HI5lbn1XdvYmSsV8Ic0juiG2Ac=;
	b=lbuojJoNV7TNxIzIaug3khmxgjrwqoDPaYm/hUYXMvMSAXrBSwwvS3Z1CyCOPtt3f7En
	 mkebuN2xkBGmG8zBpyvS39AtRm+bgGHijn4940VhOV1c5i1lf4X4zqSLp97nfzpVpJIB9
	 soVOC9qi66ClckHZz3WEj1JnSKLaApVOQhpvk0qEqHJvlwvq8GggohGGAc/R1/BgKfK8H
	 Yp6qLJ5vgHycBiXBQtIL+1PaZWehEpmfWIyTfbpfLqPFH7isav4SqUvkJN//AGnSHeq4l
	 r3x1/1jErOxfHz2onT8v86EwtmOrDQExfK8hEu57EZKDWMMzppGLaB8Fu/OVP4VKmZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TrX7ljuY;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A321E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TrX7ljuY
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOB4sqX615697;
	Tue, 24 Nov 2026 11:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UW5f9/wqMd0LumKW7HI5lbn1XdvYmS
	sV8Ic0juiG2Ac=; b=TrX7ljuYOlBSLges6I7KDRX1/OpLfR2703AkpFcg2zgpNm
	EFe51uvX+Vely/JPRpW5QsAozTk5S20pukFWcCGTCo9oxrJI9y76s2ohKLJOPnm2
	10A3JsBFbKda/Xsok1VRFepO7x3vXfzF7Jhs2sKBXpH0/rTsDty1/gWLx0PWF8uW
	BtOezyZ54VuORWPdj0QqnpSOmfr00ovqvKjxeKtaf015a1G45e162/lvbZ8f6Qtp
	u5i9n1o26/WQBakteLphny+qEiVddwJzWkhdbKqJIsPWJHNJkFhQ8wBNpeoadCja
	Eh7A4Zke5ttc2GF9DUZugW5kYv3ily2MQ2ALrkVA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g37bpd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:04:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOB4IGH2194682;
	Tue, 24 Nov 2026 11:04:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3quft479-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:04:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AOB4m9T40894880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2026 11:04:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 847FD2004B;
	Tue, 24 Nov 2026 11:04:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 718BE20040;
	Tue, 24 Nov 2026 11:04:46 +0000 (GMT)
Received: from li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com (unknown [9.123.6.5])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Nov 2026 11:04:46 +0000 (GMT)
Date: Tue, 24 Nov 2026 16:34:43 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] powerpc/configs: Add debug configs for debugging
Message-ID: <awVuscVoXvUvlT8V@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
References: <20261117130508.521098-1-gautam@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117130508.521098-1-gautam@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b056f55 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=c0aZF5j2F7ri9LcLqCQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX8sGHro0T3SSg
 VHKnv5nxo8HxEcabYmts5vew1GglWNTxGQ/3rg5qFhq3X21RmVDUrAOKKSje8hbknCjLw6+4USb
 F8Fp9AVx8xY6/q3GWj6CSeHat9c1/z4=
X-Proofpoint-ORIG-GUID: _P1w1F_AeBaocavjdkc_zj8iK_mKVqEP
X-Proofpoint-GUID: afN7aq1gMPuGY0hTuRZWTDWcIGDxvE9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX816E6wpDC/yy
 RgvPUqCaFcs6uGaSpZM0rvWGBP02UzIADPgrVt11nH6y8mDynCRmsaC93d9jTQslETc0aOTD2Eg
 /LcWoHwvMjZp9+AnOUFlqOK5SJihIByCkvVo/2/LXTmgvc5cv/j1x1TKGurAR6sLSQX8WPTNKxp
 52cVBFjNNHJMFq3n27ghjr/avCCZFuNEYvM0+vRS9Z/XfzwSCRIAX2q2Qhde2sxB0LfzLkMEJDz
 vCr3IZigB8iUGRQhGkP2xYKxNd2snwsORkwhhjANZdStQeCA1GArngTMSFkboLNq9vA5O/QBLaZ
 kUo81iI9Az71syhMlsqoLlo0Du3YC8QDuy9VGD9CRGus27JH5VUpQuZ7ccUGts127dWQNkNITuE
 WQ7UL6cEMkc+qz258Aa4c0v6VpDa3+PoRA4XurqPU0jul/RQig5g3y5RKS3JCUvXOiAqCFXbLVH
 RihEiGt/74Xr4DhKqSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240043

I just found that there is already a config that contains debug config
options that we can use - kernel/configs/debug.config

This patch can be dropped.

Thanks,
Gautam
