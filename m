Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771198;
	b=0ckIrJwmTdp8PuK27B60A21SKWe8AeA8bHalDbB1YhH8QG+hTvOw5p8u/8D7MOTizs/X
	 w9yZTPKFpQvTMCIZuHzIomYVEXJyCBHIf1cT7EkeGUWR98YFqNkq4YVfdsy/z4OyRaO45
	 vxY8YceCiZH724OMa13Hafg4o2pmAB6c1+cbBsIIqsPyFiNvq5bGGKennixRk43UCFivX
	 bs09fV5l8cM5xfbOT60pBhaob70SYOEq7Tuf1dvnZSnUdW6BUaUVL6oUDzKrOCi3Vi8FK
	 q58Z+9ctA5jl7v2LjcNDb6TmXLW06GMVd+x1bQwYye5mpv7FuhvzcKU/iZnKGJJhkIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UV7bRKr4EmyRedHiTpywUdieR2Ox/33Ouk5Pyy9wuac=;
	b=oB8EUBN6VcQhWhNfzvBnNLYv0kKWXIMi48F5c22oWeR4JBo15g7bEtjNrGLpRW3NERg1
	 hvoX37pRod6LBb8fiXRca2xVTfG40yfFp5mPrSjgteDixmssHC4/NWEoZmRy2XfmLFs80
	 17M/iZn5AtBvoOiEZ0NYv+n4fmlhO42Znp90zYZQ1SLpQe08+W+9ZSdUpH4tRCk24Elkw
	 MyJ4X676Tlna+4aalyhGQBMuMLpdpjTBceJt6Wk09bT82bu2k4vdGz824G0Wkh2KKlnnH
	 jhif6SCpXTFdaJzfFl0UQT8UTaZG96xFCXN+h111nkHhTNT79iQlLEiHg7+MUX95MxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rXoBp1vU;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FB8606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FB8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rXoBp1vU
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7YoVa2642822;
	Fri, 27 Nov 2026 09:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UV7bRKr4EmyRedHiTpywUdieR2Ox/3
	3Ouk5Pyy9wuac=; b=rXoBp1vUqeEA54A8cyzh/FSQJnVIi7KxDhltilDnUagixy
	xw/+S4xhZqJk8hcubiO/xrSDfYRWmMgaGc9sfnTkpGXsQB5g0n58K5FavrkjPSbR
	mloT/PGcsimiemajjk5nnAUBHqii3AphyQHrmQWstt+h1hqE8UXOXlb19Flx7V6h
	2Wvp1rtD+YDQO14Oj+gfNejafE8zXaxu7TKEPgyfNQQYJb8skxBkLKCLFRfXAXMl
	23+okPJI5sIz+pNkpuvXC1B2UAthpeW4QP4bd2m1LLX56FC0svrI8mvTFPnrOk2V
	2lE62uX8ywh7HXu3qKT3/9qAS7faNT8WeGyIGYvA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fan4e4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 09:19:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7JSbD2384610;
	Fri, 27 Nov 2026 09:19:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfa9n3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 09:19:30 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AR9JNWI31523362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 09:19:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D059120043;
	Fri, 27 Nov 2026 09:19:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA9312004F;
	Fri, 27 Nov 2026 09:19:21 +0000 (GMT)
Received: from li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com (unknown [9.123.6.5])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Nov 2026 09:19:21 +0000 (GMT)
Date: Fri, 27 Nov 2026 14:49:19 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Sridhar Markonda <sridharm@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
        sshegde@linux.ibm.com, ravi.bangoria@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/hw_breakpoint: Fix NULL pointer dereference in
 thread_change_pc()
Message-ID: <awlKzM0YWWrCueMi@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
References: <20261126230422.1533-1-sridharm@linux.ibm.com>
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
In-Reply-To: <20261126230422.1533-1-sridharm@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX/MZFAHphplan
 O88pzBlNyYQid03ocXE7HPSBfqpAzAbMHdcdXPTkbYAK4ViJLN2gM5dGbs31hzBbKxXlZRsQlzD
 +jsyML5UA0jFthrqsrFjTorHbpFbF3Po2IhvdVSwDl5h5+2duX2DHBC9AoXlFw5TrNRdb1ZKbZg
 2xxuS8s+8ZW4bV2ThFcapia8oV7a2O/rIn8vN24L0N+Pfy26pPWKvZdhCIKYbHRMpeexKYLvjk1
 9m6VxPhfDQ9Pblkz3Lrr/DtMtaFFpk/5vAyz1vEJTMIuhfRrxI4bnN68H61lVFNkd5EDnx5dFrR
 RHpCjwv7Ya1fwCry8W3RCc3QiwKmbIcpitXyk/z4dvDCqxKQ6eDpU5awd+xcylVWQ/AVgDXni1e
 op9xfhdRouQA22rhgLAbiRhi3xnf81CtfBP0SqJlVZiSFEei5wsyHXQny6xyH4DrEA4eEqfbCTI
 WGfSTps10d8lcvLbvSw==
X-Proofpoint-ORIG-GUID: 56469NUjvRIz9lnV9qvqw7KoaA9Wrd7W
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b094b23 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=-KWNbHr87wBw-rPjBFkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: RECGKMkPj-g_ccDOShB1LNK9Mq0gAowr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX31bq+7PN2f1z
 SVmbQa+yxMl2hkKTeoU9U6mFWFJjed+P72KwDi4D8OCTS9ck+Xyt77k3GC7xQD1dzsa2LN6RYdf
 Kp8JHdADbEnoXF6omIBMk2/A5AzYsEA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270036

Do you also have the reproducer for this issue? Also if this was
reported by upstream syzkaller, you have to put the Reported-by and
Closes tags.

Thanks,
Gautam
