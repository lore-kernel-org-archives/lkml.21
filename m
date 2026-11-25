Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621794;
	b=POtOUZ4F1nvsyFc7iHCfjqsN4t3mu1oPRYH4/dXbKCHpX8ZCgnitAmfZGDVngeBwmNHd
	 DdDE9DczeGNkuyQHmYd+yrRYFnkHe8rHK03t+LC642IhHmm6jdCAU8KfKQGNmOszWxxuN
	 58dbzxuvPBGz5fYGotHxXbApaMUVpnQzwJCGjF62pf8xjsRteXnn/DvvysD428n7KV9N1
	 fVgAbWmIC4dJQRS1Kf9iQlaKgkcyDtPwbRoogPK22MEQhdJkmJhR7xfBayyJSfFlp3Imy
	 Pn7US5kl5sVScqCSNPJBsA/a5quM0oIiD+Mob2OsTUdwxZv6sPZ36Oce3Bgz3EdMMlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HzcAMToS4VrRcrH4TKkO/AAbJxnB0tOnNrCWssv7Zng=;
	b=sHYZ6oEoDcG+N0bMUJdjhF1jU+LZTlcHOxiBHoLImUjEjIjcClqnGOUI6OCCF3i+RvtR
	 RERG7j5DO19aW/VMwgSCsh2v4HmXEMtALmWJsHe8OVy1Gvw6cFMuEH6tm/mrF7spiUXLB
	 aG4xnULphrqfQsJADKswp9sIrPGERYDKhhDgQHAbHoh1HfSGtIWWiO3o3lzy2ing97ayq
	 PEttty+iM24TZXLRsCa9PeYf8uTYd9XO7JKNk7MQZ1JhPxjnNl/7ogFGY/UtWBPmsy+wN
	 ZG9cr7/yj15/LILhveV/QJuM0/41ijTiv7LBk66xPWVDurb/VEtWb8UIfQ8wOSW+aGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kedTehSW;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE11B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE11B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kedTehSW
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEYxGe1554329;
	Wed, 25 Nov 2026 15:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=HzcAMToS4VrRcrH4TKkO/
	AAbJxnB0tOnNrCWssv7Zng=; b=kedTehSWaS9wKOU2oN3jOd6sgFCYn8mq0Ya0v
	jWScGwU+RV3g/KnFhqqhfFo94S2jFoL945QSD/lR9g2ULZzumTkyWd7B7AhgQjvi
	8Zu6jEwWh1Pw2dtoGWsESxX1UmoY3aggKaJr5VpUkTotdPkuNIdIIovZmtBQ0qpW
	GD//uGCrrUXa7bZkP25lKeNFHWcdVNCNzW+cB1GvN+UC7aQAx/ss9U5ZmNurBkwY
	VnNvQg3pUKajN/P4pGkYNDG2CU6XoNnoxGfoyyzoyyufABK3/v+E8PxtH9oKv6jq
	i6uC7/09dYQDNzISHD9gT7qGKfsZxMbaj+dx0V05cEnBuAcEA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gvcs5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 15:49:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEKLBY810390;
	Wed, 25 Nov 2026 15:49:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5axkvdxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 15:49:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6APFnIJC39780796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2026 15:49:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C92120043;
	Wed, 25 Nov 2026 15:49:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB81020040;
	Wed, 25 Nov 2026 15:49:16 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 25 Nov 2026 15:49:16 +0000 (GMT)
Date: Wed, 25 Nov 2026 21:19:16 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] powerpc/numa: Enable coregroup support for shared
 LPARs
Message-ID: <awcDfKYFXE5PnT8g@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20261016110412.1380298-1-srikar@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20261016110412.1380298-1-srikar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b070383 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=cLZJDPjSj-JHP7X_EOMA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MiBTYWx0ZWRfX83Ufs+jM9w1y
 ExEJWurIsREy9e+I3sicIZKB3fFgUTgqGAUu+Sbxd1820qdYYTMy/SnL7TYBdOQRcmVx9tKtk/8
 4umru4Y5gUMpXHXl3e6kvMeOaiZIsdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MiBTYWx0ZWRfX+OQp+YK9oJkS
 jo23RAnuR5ZgqemIiHaif1eCaIMUqO7myFgWpOF0RljwtEJMNUHtiTcfzcCb/buzqhZ68GFWmoB
 7NBNO7BjuN9kB8yiHRMqXbhDHvVzYvx6BXgDp2r7OvNkVFIBJAcPvDxnlGHOabfWVnZHQU1fiW8
 gqt1j7ehcQ5VPLSKnoqrR6ukM8/GluB39ifRvObHgBklisjF/RkgmAcaqmeWExVhV2mcZ4pVTKq
 43piMrQK/QhRfJO1N7WLudHjsz1IIW/0uhhjpI/f1JiWShu7vvv5mG+k7SAPV7y4vbFxE+5pU9h
 o2CSdoUJE113HWJ7GAjNV7VVPlK3w+yReiYnqvFwRD1e9sWaCFpV6/eyX51E1gh6J/UVIxoVc5M
 JvFKD6fAp3mfDMJK6vngO9Efy1ils/D5V6gmERM0znGjIHAd3Mj8FPWmLpeHBrkcLaJtm7KtNp9
 gCah7TFYBijIu0+W3Nw==
X-Proofpoint-ORIG-GUID: yHCNmU_841g_QdozevFzWgBgRmpYfOAF
X-Proofpoint-GUID: th5fT9aRIX_xd3J2ZJi6ukSmY4y-mnm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250062

* Srikar Dronamraju <srikar@linux.ibm.com> [2026-10-16 16:34:05]:

> Coregroup topology is currently disabled for shared LPARs even when
> coregroup information is available through the associativity hierarchy.
> 
> The associativity hierarchy differs between shared and dedicated LPARs.
> For dedicated LPARs, a coregroup level is present when the hierarchy
> extends beyond primary_domain_index + 1. For shared LPARs, the hierarchy
> has one fewer level and coregroup information is available when it
> extends beyond primary_domain_index.
> 

Hi Maddy,

Did you get a chance to look into this?

-- 
Thanks and Regards
Srikar Dronamraju
