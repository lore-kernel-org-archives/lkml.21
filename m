Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323320;
	b=rCQ+ajSWN7MGvumdza0d5aKQRCLhJY8FR8VHjasO8N46nFc1HHs7fq1jxUgl86KTVB4V
	 eazy/1RdemoY6EhBNEPnv63owXxyj2cLH6jKVaCvCYQqw1i+jscNioV2Leb9PcsQb3LxM
	 urls+u4n4K6o1t+Dr80JR6HiSX+m8eDfkUGrEqFetc80JpRbhysJHn0+xwYX3SPg3zSoX
	 nib/nWAyyUUUrUFygvouXB+/Yx4eDEmDofiEZWDhOeopXMSLf2jBQZya4YLKJPq5stCbw
	 kgdynf5V0fWc6w6x6eswwtNhA0xuh+vX6MdWn7n695eUihewHWXfRTrCkBrORzefqkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EK0jv9/FYi6mnSSoEXq7VhsZ5ab2p1zC6SEtkNO32y4=;
	b=YXsZvN99OLa+ehy1QPSbym5K8MwZOm0NFUxAsMK2Wct33QGib3nJnv4rj1pEZPw0yF84
	 QGOQvy6vMEqRlWZ4kQHCHv0QLZF57RRpy0SW5wbyx2rLodmjzxX9SSBBKpODXHS95gNnz
	 SE87bJfm/Rs5xGEMiUfS2EEUua9j3o6Oxaiu5MLheojWkCI7W6/4qR8fsIqxhzJsufFPr
	 dQD+JK00Q3V6sawVdFCspLXtWffvwG/PioNQlLMw7Xp70krSas6qhT+j84Q9uAIJb1wew
	 YhHRfK2nJSZM3Z7geDMBMulhHRYeJm98lT47eQxnWIGHKMJWbeF7CK6Lq5E1PL8xqWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rz3SNs+e;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC4606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15EC4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rz3SNs+e
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM44h5O3736652;
	Sun, 22 Nov 2026 04:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EK0jv9
	/FYi6mnSSoEXq7VhsZ5ab2p1zC6SEtkNO32y4=; b=rz3SNs+e2PeE0QwllPHDRz
	saeomMCQZXCHQW20X/VAo1PDe5G3n6J9TH30qK+KjAIVpb0tUjrLsE9gieHJXJ4x
	XMon22BfN8b5TFqEDazpdEFTcJ7yNm0g7rJVNWrpHRd9L6+evkwiJuadqgjGy+nX
	ULOwCD948NkhpsURcJb2FSha4ivwicqXPBQ9yX958R7PYHR+R1TWugp9rwInjtee
	YGZhRxyB9FKHDrmNao2OUVIsm64392szlBu8rrt1HoIfqucTXCkgFmUV8FMedLDI
	0JzQNVEsWwbYij/IIeEauGKouFZUDOuYhMJyMYJWc3EkSeTEPxo7bAURzTs6bxIQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g0vuq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 04:55:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM3nNNZ2767042;
	Sun, 22 Nov 2026 04:55:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3qufgedf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 04:55:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AM4t7u347055206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Nov 2026 04:55:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 551A22004B;
	Sun, 22 Nov 2026 04:55:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FC1220043;
	Sun, 22 Nov 2026 04:55:05 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.43.90.96])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Nov 2026 04:55:04 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: Update OCXL maintainer details
Date: Sun, 22 Nov 2026 10:25:04 +0530
Message-ID: <179532322361.92012.16012080655704451145.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261028041217.499673-1-mahesh@linux.ibm.com>
References: <20261028041217.499673-1-mahesh@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: xlGOsnSWayZGvlx1u2pT0uBgSu53Tp-8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxOCBTYWx0ZWRfX1FP2MQQc9Hnd
 ObzkcVk/2WQJaE0DUYp9nMC5IlwzHzKZUCHDVFETIf8hMkVNsTMllGs7EUfh6H5c1JBFcYMgFRf
 X556XYrqYD5Tzrg+oH0DQHBzHlCw+80=
X-Proofpoint-GUID: xlGOsnSWayZGvlx1u2pT0uBgSu53Tp-8
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b0275ad cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=MCxz1IDTg708q_snVY0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxOCBTYWx0ZWRfXwkw2pdSRa2aJ
 stpk84Ih9cOMln7bssLEQmfV/ckxBYm0cfgtkDl6CIa8Y5npMUq76E1+mcxSq2H7FhQLLTBgj0i
 AxYWaehOQk7m5clRl/RGRWmzdT75/MDf/psNCahK66w8Qib7nJ5TsQQrX+T3/4vJ5dVVLBu0/jX
 z+DBGsEFajmdOmiMXx4Z1m1XvJIg8+1s2WbrLhBpimiccJCoJmkNcGWxseIdZPE3iJ0eH3w/I6R
 yqUBL8bpfYugb+B1TTpI/gC03nYBjWni/jznhzQmLH5F8bEigYdheEITCW2t2stqilm5jfuAlM4
 6CPpEKTY8ObfQnZjOrtsoqjHRErYbW8ClW0HsvDgXerlW5x062VkibiS1VEHBdJNMgErU2kNjp7
 2UOceVLgyzIomDqpXI90DTj2O24WbpzSFrsUkxI4lqaPVkeWr2BeSqxRAsAsuxY4WJzTAGh/nXC
 3Aa8gsibK9acUCNKI/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220018

On Wed, 28 Oct 2026 09:42:17 +0530, Mahesh Salgaonkar wrote:
> I no longer have the bandwidth to maintain OCXL. The powerpc maintainer,
> Madhavan Srinivasan, has kindly agreed to take over.
> 
> - Add Madhavan Srinivasan as the OCXL maintainer
> - Remove myself from the OCXL maintainer role
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] MAINTAINERS: Update OCXL maintainer details
      https://git.kernel.org/powerpc/c/d836398542f1e11a8b5191f9e50c0e4ee9b0b13b

cheers
