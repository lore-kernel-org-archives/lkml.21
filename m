Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462882;
	b=ZGTDCKFFeOiTA9wq54skTGdsed7lAQ4haIUmy0DFEhpi6gDQ97TSnCoC9oZY2yhkteiD
	 5G0ek7WvQKnGbesQyIu2+9ax+wLX38e7NDNolb/wJBWBCpoTnW9pM7uCVdEBJUV+g4MhK
	 46dpH8QfHaIlqMZP7jIciL/1rU0amYdT0bE1F02++UTnBzu7u5cOJeyNgCqo3juG48Guk
	 x+8datAiYjHr94op+Bg4TcPIFPjr7bA3weUL+2pAdiX1GWuSmy9VlAZ39bSX9C0eRTNJ7
	 O/4OWGJ/vaANmVDdwu7w5s02UZi2m2XRnE3kJgGrEnOckM53Fkl0rPe//daU2SMLsJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
	b=Mr+Ldyy2uxOFHOoEb5/Snnlm2Nrvc9/wJjwAtOavovcg5jc3GCjCtVHNw3CSJVkwSLlY
	 OhjrQB7HY9pO35Bxi/5sNDTbn4R/BGEpfOsSYClP1YpHu1SrwgfiIVx6iPWR0dLMrEAJ3
	 cdq3SXHLRNyKbEHsJT+yrGrwc5fOXGM9kSObsBqlgMD2SMdynUlTzS8qMUU9uHxDCgTu3
	 gybH4F/OXFYvjdrUh5RE3A1HIXTdt57B5D8jFrQsmhW42+jKPSSuaNz/F1w/lVtzdRKSM
	 axAqZgy7/xtHbChAfec/+z7qTI2KsuSwz3tdbnEjLA5yHNFG8RAJiLkDBRi2zC63ztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNEm+xyY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB06606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB06606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNEm+xyY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxDF2377199
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vUxC6ouspxhWBpss9anyN8/b
	pVZ3ii1paTC8Jy1Fd2E=; b=gwmsFTUb59Zlc/gg1IMdg77AcKGA2SPYuhe1s2Nl
	e00LRSFZUHuu92szoKHByqwXiKxGIB4AQNljm3o49yyhK8/9ImAeHMGZcLVvkmiM
	ti6br/HGCe5iVbeQ7ldCmOhUUxf6v/MZlWhkgSRGoOlB5hYQFQisbuj2GVIZvjxS
	C4HaAFhERQAAYk2ktkBBn2itn2sydqBOzcNvDrN/t0X3n0EzYiesLa3uVmxIiN7o
	XjaNwU8jKPfBwO1DMbNj5DZ4PzBDla/MFvne+J/fZyYgUHEvqbT0NQ7NoE++VACe
	I2GHZuAK+4p4lNdv90dhhaBhJ5FnFinUWCFrJtnKJ+9VNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut4e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9213730b07eso65342626d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462880; x=1796067680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=PNEm+xyYtYD3WYMLO4JiGXPnu//+YIHMGSP6TKR7ESKmlF++vtlKuz549mAwXbkDK8
         /Q3S2UbOeR2y0qgJq/fBTE2orlnkvvBK+qmzFc9oJv66PZ7cAbuKT1wsD69oc5ic0EI/
         18wuE5btsqgKpHHxD3aYzIlbzE1GKZbBdBe8DVSjzLOC70vbEPmPJhB3k29RsBASh5B9
         dFmBlPdA8/vmHN++i5wJu4Ynzs0TLmMqcPwf4SjC7amcNEJ+KCfdjXg++UNDJwtBbXo2
         XgXD+JPbYEXJQClqP9awtz71jEl0pxcimi4BypKXPfVCuo5rWvn7Ce/nJanM1fnvCsh3
         09Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462880; x=1796067680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=xGYP3QnDZPZ0OXWkOl5WIy8oVf2eDhChfJ3cCFjWXHlEq09HTQ6SV0tsSKXWLqh61w
         TjY5vNAXjhT0wGtYvkH7ga+eWmH1GGQsRef68BhOPk+9p689X3SPLZ+yS7NdGwVYmSSq
         +LXqRQ4t63ns0DJffk0+fcxbT06o4Had9iYVNUsQH+cOODoK2TAsqmhhuOt4eAwPuluU
         uoCYVxH75Myr1gDXi1xBmW2rahTRNIbWxcSmQc6Oo18Sn3L/wbvMJTJlH1Npc4dqbx7K
         L3qYkRCF0TpUzoT2WfixVIjY3P9zVM2Cn+lY4k1f8MmkwkDD9wVSTJ6cY+BNqq0fjox6
         Y/rg==
X-Forwarded-Encrypted: i=1; AL+hErG/h8kgh25HWmLA0VQH4HRVlytK6oLqWlrH1mis0J2O1BBoaMjEmv9SOuGg/gSXDtAjziVoTuTjfS6K3eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fJ5UflhMvS9Dnh5fXdVhHE6l522bNCTcGzVRiAV/7ItWotzBu
	unxdBnvvmikDzH1Tu0QxQWQOIqsL37WIRU4vt7DpCYG3iCMVSZjt8Vw4t8YD+qasDVkwCvlNb5Y
	zu8bcdfa5K13kUnRsNvTNm3e4UtNcJdts09cWNykhiR27mbZQVTIR7s2rF8Xn3UrwP6M=
X-Gm-Gg: AZFdTZczVm+0FB1hrfKMMPrabTs2LRYUyuo5q0OMoC9OIjuYfTS2P4geohrcDG43AFt
	G7r+iwxMBDotkNs96g8Uj+NRTBOvaXIhryHVMlETlvtk/RilEOJVsnySE5Lm/osrGa//KtA6ujq
	IIFb3EKgrmPCB2H/u6uAHhvHnKeshmQSyqzCIBR1vLk371YweC0sAYi3pjORirqzBkxC0c5OUj8
	l8J/m++WU0huuv6xdfSoSUdGYb50PEuRkwjLDmRLfw1S4vf9tNn7bKD2N9XNDrYl0xV4p+/qcnt
	fJyE0E3Ow3FITUfGWJTa0BKJ+Qdkk7d1KH2/TUj9JxqI5f4QgB38vl5NNvu4j73iO1gh+kvnmTg
	7sh8hYSjR/c+r1/IJUn15OKIgwqdjETLqD1oKIWQeM5E597KF0LGGiwmK1DLikv05
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832795285a.3.1795462879721;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832790585a.3.1795462879048;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23327384f8f.20.2026.11.23.11.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:18 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ytqrakhhpmy6zdsdpqglpkm657ymg35xuhnmukifcwzowdokqg@2c3dewjxefcm>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JxSLjyzMKL8KR3VFa87QB9fZFreVBY4c
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b0496e0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: JxSLjyzMKL8KR3VFa87QB9fZFreVBY4c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5AfNjd21gsOi
 EvsNK9/9PDNT4JnMc33TuXgJCxBkd1qZ79AHZv4I268r9DlbkFK9q0i+REGtJEpgPXXAwpH8fPM
 5JQ9dcW6uaeVZgFbHxMCDsBjNyVjTWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX085ZrOPXcnG0
 2K+piJiOmkSAi0miNdcxvj9lhlzHvliHDDqoE2Avs80CvdbT7yCW4/Y1ckOcWb1ohgL/Rambaq7
 eqf76iqN4q0J4HUEdGcqKFxbATjVYDc8Cpbqxy2mh2fYhLrzPZ/ofjeZeIybIjuoVZMXZUkZJSc
 2UcqhCPC+NJcD0hmm0JAt8xB2ay0/WaSAywyn00OWRzvIkt5S6/F0RNAEJiiuf0y5dED9tQkAbx
 t0YcHY6rzqEyry5jBQpbCauItmHd12utBgxuoOBEwEbwkV3DW6gzyvlSUr5bFSGrzh+xreXOZnw
 eR4R22GA6hgjOqshjVV6ndjHBKIwgvf7LCNL/ZcVwZLLTcrWsu9/yGLvf6M3ODfDG+DQbk5ZVNb
 WmcPMYs8HTim3nlnINZxn7doOggH5VwJGN8ajK28ecPBAAHVZ3+auYqET74jG5wbn69rPHIG78A
 Cd9vh+W3zElztJ3yBVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:44, Bibek Kumar Patro wrote:
> On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
