Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596642;
	b=hcfavf8SIynIi3u2lTShdJE2WKtYSmM0s+Zclqyjq8UMZqy2ezWC4GtoX/Gt385iKEAm
	 r9D3TBY9/DJ9uWzWUqO1TXVJB5vjYE6wOglrLsSU1h4WgaIZPTXSMS96TO3YmGAZwhcsz
	 uWWj6V+Z2/thUFMqZim62tLZDR3qG+KRVYGhvElyR0gjrmYlzCWSnw9zfSl/Urx0xfH6L
	 ZbGpjM7ehcEUad/9s7XzeNoYq1sTvXP+7H4C2ykw/DITe6T7DQ99aSrlhTm9BEpLY9/ia
	 UUh22gOiO9TUOnct9+fb8wkAA35DmCbhDFk0OGUmjfMSya+ds3WUJJ0AW/XEWC/4xWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jAXF1iU14qqHaUZc04NyH6q3nfEi9VdvI6B9iqAoq1M=;
	b=NHWfwGhVTO8Q4xlsPKvFRBA2lNuBvVZDt90qdCeTyZZz3k831p74PtcIEz6GURQY80jT
	 1mI4lnscmiTpYgwlgxRd+6XioZLQ/apmkR7tSGBvF/gx92hwwUpecE3ybq/TzgytX9Jsn
	 DRBZhjj9dPEdDP05k7gZxwZ4FRCxtnVRQtckTzBuGCVRdLw53KwlN8Z/BDscj75yI23AQ
	 A71Hv9jc0JGKMizPbMRbi/JO5Gzd92X/dz749HZCqjohaqblG7/C5Y5bMSN390lBxgfiz
	 5+UvPxDjZ84ngljPtW1WqCBJH7lODX1D077/a8jRDc/7Q7mwrsBTZalPZNNehQFjMlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWcp0Ha4;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E91A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E91A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWcp0Ha4
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP6Ys9M532464;
	Wed, 25 Nov 2026 08:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jAXF1i
	U14qqHaUZc04NyH6q3nfEi9VdvI6B9iqAoq1M=; b=WWcp0Ha4r4mGg8kEdSwszP
	F8qTZamwxZGVuAShqhc8a0Eh3YK3cSLuXMfICO/lhFZU4I+on0gd4zPoEtkgiYuM
	V7gYdcCVa4lUOsya4iX1yzUAcIJVhGWOxO+v6LLDN3oyFGgtS1PDjtmh4rx7/zzb
	OGiGHDDoQHrC3ZeqOjoHmk5Kv7UW1j+ZY+3CWQ6AJvL5fc1m0Fpy0iVgwi2q4Nly
	8v/7axZrPuYNROS3U2xZhly9ajfif2r3eSjm5gUmb9OgWg4wx0A94tFpvKukWZqt
	de0eeqX0S6lbRxBYgyRLHmgtOd92X1+VUXNM5+69GsSP+KWm8Vff/Jvn4fzRaDPw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fkkjbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 08:50:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP8BbVc3967663;
	Wed, 25 Nov 2026 08:50:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j5uxx037t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 08:50:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AP8oDaw47382960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2026 08:50:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 664E82004F;
	Wed, 25 Nov 2026 08:50:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83C662004E;
	Wed, 25 Nov 2026 08:50:09 +0000 (GMT)
Received: from [9.39.29.113] (unknown [9.39.29.113])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Nov 2026 08:50:09 +0000 (GMT)
Message-ID: <298e965b-6de2-43b6-a6c0-e844b115438b@linux.ibm.com>
Date: Wed, 25 Nov 2026 14:20:08 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PREEMPT] Kernel panic - not syncing: stack-protector: Kernel
 stack is corrupted
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com,
        amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Damien Stewart <hypexed@yahoo.com.au>,
        Christian Zigotzky <info@xenosoft.de>
References: <D0ECD6B8-7F15-48C8-87A4-DFE5F35A42D8@xenosoft.de>
 <EEB13352-2FD9-4169-B709-FF7822AA591F@xenosoft.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <EEB13352-2FD9-4169-B709-FF7822AA591F@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX9PSc71lOnPjU
 m8/O9MV9dJAk4XpNHrs9S5LE15oDym16brkY6ro7yYMA+qL6XIr/rqtBl3fNyUyR2fznB5x5VII
 TEKlBthG5NhBXHEhuA0IdTvwwF1eZlwCvH/vtGh4pwQ5SMSyPYaiz7Q5FeMlDJN9uv/3lI8sAdk
 sfLDj8ATx92KSGdIBTyzi95uKYzQnOc+bJWwQfopS+Ph/L72/OO3qRnOa1i7luKg3dF/5B6OQ1J
 4y/NB680Jh9pslai3iaIiISxCYDKddC2k0SBZrm+pK5Um3LmAq+hlNXYDghxypMPK4J3gABCZeG
 +ZeEX8I7w/DL/xGtgbaZS8VG8xrR6gSdh8hmFMRflmgT5Gf0yReXicjUfAvak682g719mFCTuHP
 pw7/QwbBqXVJuuegiEG3ab5tWreGmz+cwTrNK7oEAIop53G5L6nkk1G4pvZq/BpvSGwNRbmXWpK
 0tU1MHoL23Ww8RWkD4g==
X-Proofpoint-ORIG-GUID: ZKznimse3gQ5bR5x74fEz6vR-q5T1Uqr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX0sc8dcAkNfFQ
 hT/u/l10Jv2SoZP1ISuvxsigg9wiySVbEbHI4bR0/6PGw4kX5J63sz2fWt2QDwGddcfEFgBnE5S
 x2+fzPnWbCkup2siH1hqznSvT32Q77Y=
X-Authority-Analysis: v=2.4 cv=A9z5rKWG c=1 sm=1 tr=0 ts=6b06a14a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=oxC9TbpiAAAA:20
 a=OuRNIQCiARzACWCb_SwA:9 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: OiJXjawNaA8bwld_nRVqb8fr-ZaBIgxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034



On 11/25/26 2:16 PM, Christian Zigotzky wrote:
> On 06 November 2026 at 07:09 am, Shrikanth Hegde wrote:
> 
> Hi Christian.
> 
> We had one known issue which michal had brought up.
> Do you have tracing enabled or running a bpf/bcc program?
> 
> - - -
> 
> Yes, we have BPF and Tracing activated in the kernel config.
> 
> Nemo kernel config: https://github.com/chzigotzky/kernels/blob/main/configs/x1000_defconfig
> 
> Edit: I have deactivated tracing
> 
> Link: https://github.com/chzigotzky/kernels/releases/tag/v7.4.0-rc4-3

If possible, please share the logs. Lets see if it gives any clues. Is it while system is idle
or running some workload?
