Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621680;
	b=Dj8LFguUycVXIX0y/nzpremNwpXRtLrzTyFw2zy9w7Ln1yYk6k2mbzUl64KxQ7hVATQD
	 dkvqubAVnSMdWyhDB1LEtFOTMBj3CQt+4DGWBSxc1jYrAUMrUrMwwruTbO4xvRMc6Kqm0
	 PYzCKhhTIrDf9PUXet97ZaEnBW8VR8O2vhkba8yk7gqHsVSch5mzmtuzFghODrq34HH77
	 I8WIbvdXODqYHIO/Bo+/+6tvn0CcatV+CT/FHHZIrRMIOfmNSblRRkn4veVIL6cu5NAMm
	 NNcyrxxIuAy4aJ3DJkjqNXA2T4nBB02ezT5J9m9944lF9q/cgRQRkPcu9vm7sm7yoQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TR+BkqZ0wzPR1hXMpUZpCPJWpr8qSPiKcy/tgdqGx7o=;
	b=a303szzeBI2QiXomGTWZUdyCZl4d0M1FDNjo3iTUD4G37OMuVNo8Yy68ADX3QhNBQIxn
	 LunYK7kwUWmN/0XXZpz4rMd5Eqdnz91H0MYrLDhlOX1XMU8pm6f8Ex1kOJ/tnY8Kh61+A
	 zpPjB3Z/+9eLGuj0ZY78L7vrXMN1uoA5bh3IUXkS5EgDTxVDYJqatU86ZS4XZZ0h6h4tb
	 ZSH/3pxaxgD9Q0/KvIS8o96fpehDOZtunj/Ej5697DtsAMCswZGmzTAxv0Nebx9kWIfDz
	 wc0rQYUglxRZU/p6g/69VDTJOjnqyWnH/Gj5lkMQqKF7+jC+fbkTYnwaSJk3vBYlilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="QGG/3+rd";
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BE606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QGG/3+rd
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEYWTc1602243;
	Wed, 25 Nov 2026 15:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=TR+BkqZ0wzPR1hXMpUZpC
	PJWpr8qSPiKcy/tgdqGx7o=; b=QGG/3+rdXHbWzy4jvxrOe1ZkXWoqFwXYBqIDy
	IO88T4ce/cUgeBsM2RlgHnM1X3FIADVoyum7VJVWrmUtAAsgq4T3icIXOAvYje2A
	HC4qJ3AshYAGvIDz19HRo0f+ooMWi0u63Rvx2PWdNbhw3HV9eO6Z6weqoFGKr8Aw
	bwiHzOABilmDhajBxfYxqX308UZRdT59LKgezc2FMJ2djWbcjyT9rrbOEWVB67n5
	o2EDFitUTn09HsqYYygMfUYhTBZ+sFNcMiOpGAhNjrt5qYq/mffk/n/IS81reXDe
	TGx3749u4RL2goBgbMpmtw6Fxy6CcwmHkMUiJlUhUdM5bW99w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fkn77u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 15:47:48 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEKGYf3937612;
	Wed, 25 Nov 2026 15:47:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfa2mr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 15:47:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6APFlhYG51511766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2026 15:47:43 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B8F520043;
	Wed, 25 Nov 2026 15:47:43 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F05420040;
	Wed, 25 Nov 2026 15:47:42 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 25 Nov 2026 15:47:41 +0000 (GMT)
Date: Wed, 25 Nov 2026 21:17:41 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "scripts/faddr2line: Combine three readelf calls
 into one"
Message-ID: <awcDHUb2adnEr_8H@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20260905012449.3872882-2-srikar@linux.ibm.com>
 <aqhDm60zSZIazrnC@jpoimboe>
 <aqiqScJg8Ey5QnKl@linux.ibm.com>
 <arObLLalNd_fMi2u@linux.ibm.com>
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
In-Reply-To: <arObLLalNd_fMi2u@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MiBTYWx0ZWRfX2hORbp6zqXI8
 E1K2hUrsVTbEAqTqWTn0sCVAGDL38S4LI4EO6CEmdCkZxo0G0iRde6oFk66hOfmbWyUsRLGhrs3
 qiYzw+bxO1hOyigNJskzMm4o4hYxY5m8P/1eMJbtYCW9OETG/c/lfSAf8p2oycwJ4nyZncNtZ42
 6EEPZ17mg9caYvABAApUZAY8UNI6z5xnUwDoWh8snXD1SOo5OAJxfoSIHFwzISiB/2roiam1V+R
 tgwLyEhjxiPCvNdBFd6UXyvl2O2Lsy4Bd5/SOXbhwJlYU/PfgKSk9aA36RQoPqVNKKhAO845rq5
 RzJ7XbRX5bTMJQwHUIXNF8VF5Fh5P7fMQmm/u1tO+elaRsce8VOzJy6NenUtqQI/06GtUGWfU5f
 ynp86kD4chNqN1WV1SdOoTt3k2a+TAPzSHqFMWkGvEoVekWKtrVWkD0jmUkhVab9crEHEZiEGD1
 dwPr2ydn3jLC2JY+1NA==
X-Proofpoint-ORIG-GUID: 2RBVoU_kJsnrxlHe_JH1_7v9Ed-AtgiL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MiBTYWx0ZWRfXytAkTUkRBiM2
 6QQcAiNFwyxNAOYcaVP1dh73XVla9PmojbNNQ74uOvu9CgS/JZ3kIOnlbYFQBbxczfjYt7FHgRP
 JoZvS5WdmlLfeqG5+ntCCJpHhCaKIDI=
X-Authority-Analysis: v=2.4 cv=A9z5rKWG c=1 sm=1 tr=0 ts=6b070324 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=68dHEJwyW5P_m6s-iR8A:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: Uux9732_Mo7R49yy0vZXwPu10phWBcSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250062

* Srikar Dronamraju <srikar@linux.ibm.com> [2026-09-23 14:56:04]:

> * Srikar Dronamraju <srikar@linux.ibm.com> [2026-09-15 07:45:37]:
> 
> > * Josh Poimboeuf <jpoimboe@kernel.org> [2026-09-14 12:00:26]:

Hi Josh, 

> 
> > > > With the revert, we end up calling readelf three times but this should
> > > > still be fine since calling faddr2line is a debug tool.
> > > > 
> > > > Fixes: b8d9d9496c1e ("scripts/faddr2line: Combine three readelf calls into one")
> > > > Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > > 
> > > Can you run
> > > 
> > >   bash -x scripts/faddr2line ./vmlinux need_active_balance+0x1d4/0x21c
> > > 
> > 
> > + set -o errexit
> > + set -o nounset
> > + UTIL_SUFFIX=
> > + [[ '' == '' ]]

Its been 2 months since your last reply. Can you please look into this.

-- 
Thanks and Regards
Srikar Dronamraju
