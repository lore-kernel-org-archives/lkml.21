Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429594;
	b=mp+2cKYqUQmMeJKUFswGaaR87f5DU8ugS7U6S3j0wckeXWhMet33rkCVP3aNYVQ8C47c
	 Con5Y1Xf99TYXmVrmEjZ99Xk2dMnBXXl607uXV2g8GEcvCVd0I93RwOSgA39Sq71woURz
	 UmUAre1lMHyzk8nqiRkgJWIZWYHaYFhVaBJsfcBk/72XupOEAEWEOuTC2YNXn9yrMVqEt
	 GmTTiuvEhNNsIDCIzXW9YuexLSIbDFaGrlSVTyI0FxRaPBgX2439uTh9Js3F07Udrschy
	 wHc3suxcfF993N00mGc/TCQVSXYLGoeC7O+Sx12b3ugde9fICumzUVKFopuNmpGdMEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4eN50aRSkmuIllrAwA3eGaHbWzAQeStB7tViCqukEag=;
	b=FO6O3Xw8dwJjygHBVTNsntfLmmSQWVrhel+kISu0BgI+Qe2QH+3efUsU4y9oZmnyA+NG
	 ydzVu9qViH3SgbyPcoqa+GXOIIR2KviWRzV7oEwjWKcs4sw4R8kuwVK/G8sgo0R4gZYtK
	 8+BcQEHtVDe6NpYwBrNOScEDpH06XvrtgWMnJqim6S8WXj6B8P3t2v/i3SOAqYwzXUBOA
	 mdZ8/jmWHeS4b8366/qRIclFvPCp4vG9kLtoWLVJy/R3jwyakn0M4FA4uPD4V2O3JFXuK
	 J3IknnDvzONvjVAtOeWzbQIyHN08ws04p8oGCXtvHCUegoGChEHE8TszNMVbGFr29MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s4L9LCAE;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80693606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80693606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s4L9LCAE
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Yn3E3194730;
	Mon, 23 Nov 2026 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=4eN50aRSkmuIllrAwA3eGaHbWzAQeS
	tB7tViCqukEag=; b=s4L9LCAEzjKgMrwDPzRHyjSZoIPNB0oRW8iASDgA/u6kaL
	Z0QexILtrfzpAWswFrUBj/KXtDttE01I1sbbfB7j5s+kP8puOqSOrr9iokkgtrdF
	bMaqAF6oyiCGearONdNrNETC2JuwS/OATIEEMauR2UR1FeVpD6V/GhxQSTYM2Nz8
	yul94VihBV/QFmeHn/C1weM3mTU4xGU9AknqjZVWMV0+S1mV/LAckuCvPGrKFpT3
	lxg9cKdm8RkpPuc2t10kXZPLevGCyKk3PQbMck39yzrvth2mR37DsxI8DfM0mcrJ
	H5Tn8bWyCD9cCFdA8gyrbNST4vUIQpV9FJlD4qFg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2ber-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:25:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JLQU2758544;
	Mon, 23 Nov 2026 10:25:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3q4h68v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:25:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANAPrR330933680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 10:25:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E35D2004D;
	Mon, 23 Nov 2026 10:25:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A39392004B;
	Mon, 23 Nov 2026 10:25:52 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 10:25:52 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:25:51 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 3/9] arm64: sysreg: Reject a Sysreg and a SysregFields
 with the same name
Message-ID: <20261123102551.20959-C-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-4-fuad.tabba@linux.dev>
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
In-Reply-To: <20261123075219.369042-4-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b0414b4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=7CQSdrXTAAAA:8
 a=VnNF1IyMAAAA:8 a=vdi0Nw9sCHi2PksTQLIA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MCBTYWx0ZWRfXxawTwefiZEFd
 8ki1jNsC0l/e000dPN4H8gPLAmAvCBVANmdQjH+VkVi0tCPWYLN+SMW/xA3jgpb362UtZpdWIG5
 d6lrM+jrPtJkjJCPmI5CX0de0sPgKkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MCBTYWx0ZWRfX4C3zhOnZ76ch
 lHVHDp8PDppBymVX3vRw8rTXr8NJ1yIAUAP/LZSnM2g1mw4V5wyMoX8hGeoHwhjFicEB0/xLhY8
 qWEk2meOQVsXRss0LlABSRKHy09z9s8CQdhDsCaGoNIXv/zR5pvDn5H6tD3uEmtZQ04kA/JGg+w
 z7Y2ksTt/Ro17Sy9LNWYE9Ipt5cq/yT1I3KKLWp7CKS/B5Bkrh63WvThTGUyfqcFXfOYrTN6fib
 cs7IXN/Skx/9nu1f4YG9Lqzex1MfK/4KTqpKu+NIIydcQPGuw8EMYHfr5KWwPO41M3R3OXxd4Lq
 xncBbUtzrF2txfDGZphUP8mUTEKuk+byPP/N2MxtCmi0TarJOAIN+FaS7jatZjVMEgQ/icXvnrK
 3vxkhhvUEjF2u8MOd0WJbYn+LXYhk4FsjRDk+fx36fQgeM3H8SvSeT+dCRyic3JcJ+8TSvh8yHk
 gnPBdmgqnPZDgoT7zKA==
X-Proofpoint-ORIG-GUID: ufQakVupHdAEZCAbNSvHXbnQpvA6LqrO
X-Proofpoint-GUID: h1tNTLxIi81xYYOSn31DZ0z_mQhtzQzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230040

On Mon, Nov 23, 2026 at 07:52:13AM +0000, Fuad Tabba wrote:
> The generator rejects two Sysreg blocks, or two SysregFields blocks,
> with the same name, but tracks the two kinds separately. Both kinds name
> their macros for the block, so a Sysreg FOO and a SysregFields FOO that
> each have a field A both define FOO_A, as well as FOO_RES0 and the other
> masks, and the compiler warns only where the definitions differ.
> 
> Track both kinds of name in defined_regs, so that a block is rejected
> when either kind already has its name, and leave the kind out of the
> error.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

