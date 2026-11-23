Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462955;
	b=z/o5Qi0Q3J3X/0+X5q+qID3CKRdGs28RvxVWXaDAoi2lM/+milIoDIoW5dyEIIA5Bs2i
	 Aivyo6C3yYzVsv7f4c1A5vbXj1M/GQ+ZtCUCJ2/RIfkFWVLeBC9/UuMrX3LMYHybBLyTu
	 wlHKbWi67yGDZU2j5peP7TUoIODSCvYxy98FNjqOos8/Ps8qj5XmWXZhaAMVosD7CVhhN
	 I0Q/0Vp034qtzDRgUNcli6uxACirfz4RwoYWIaw0tlqk4nwqePw47oP2Z4Z/T1ep2APbc
	 ifA2jQ7+KoY8yju5k6WbpzYnULYvykqRTCEAzG78GHMNRpnwgJXS4NSgu5uVLxwvQ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
	b=XUPy2TYTdgJOZa198JLSg9MCUxu91Bl5U5n5APhXVAQRgN7PioaA/pltyOfNEZkdJWIz
	 LMPNEHPAV4Z3M+jLXOfjotd83otDm+Z3Re1A+JLiX7KaLHIRphtbKLFTb2n0P+23bduX0
	 TTlz+ZCv/YfLx/TRcQY4hRJUNDUHTM6WnGocUq0M5yOQ/Zbjoxji8oqrXzdmIjUHedHg2
	 bQsl9KTkYbSoibiEi7EH1inl/FIC7AHON/OUp8m+5ZxYcIQg71aA4Su6NHMHI67rQysLV
	 qluMPQY/Lgp/sqLMiwIqgahh8dzdqcvfjBr2/aYgYmwHPf1XmL5PhUn4xAaD8oMrEXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNIqRFor;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD55E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHD4ndNq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CNIqRFor
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlbC3730161
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FcFkDguCD/ilInffZmCjUgAc
	HpkPgkVvkAaNeAEJ7sU=; b=jHD4ndNqjnzEpOp7UspnMzN5/djWeqmgMuO5E9ho
	DLvkgeW4Dt6EABFF3O7vVtIUcdoVCjho2j362cFdBBbWcpiXdASJz/jJ5PGtw6Mj
	xndbTqmmmiCl3X8ZKTrvuMQFrad2NuNRcOkOnRI8k0WmaO6Rb/2x31Vw8pZ1o/U5
	hwlQApGnztlZ7nQBBb7LuV11IgUob9XhYF56Q6ZzflQ04tLdYXc85XxqY2zN31YS
	1agpdCiZsP7kgh8Uy2MXjNmEmpvXmCpM3iGIOnEsvmHtja0DT6IItDUC976Q/98G
	wZv+JGyxNvSiQZ2XKOug+BgkuPRxKqLDY3Xjm8N9adRg9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd36jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:42:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so692759785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462953; x=1796067753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=CNIqRForyG48SMWcdmLVp4x/M11woHQsgCXYsfV20VuLwlJupVemYIZPh3f7PSI95Z
         JQpa3B/zxU3+KcwKwXuzSzlxLWGyQkaITl2qiB+KXo/IYRQX9Aa3eB8mIo6pbtJBsH1B
         XEib8KLRjSKMOUQYGPP3pATRiCoP/TAiC8WzDJldQNpveRIkNU9htr7u40+THbAGuXu+
         i8PfYB517gbQF94Z5W53q6046kHqXmALihVpQb1OCayFMbhLiSw59XX0nd0Kbx20OeUa
         IuJ9X96zJA5GCPwLnao1f4dwaDJNMUMRBK26HdONzw2Ix6b+kKly9NJsXVF20d3HmCtz
         lMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462953; x=1796067753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcFkDguCD/ilInffZmCjUgAcHpkPgkVvkAaNeAEJ7sU=;
        b=UJoOlfEAM0N9xNREVorO0HVYm4+f8+yNoOczEyBx8hnCXHO7H7eiWjknKWhoUKKgB4
         R3odPa35si+KFgaQq2RmGbflbjTrzwjIwGxdvPmsVmSt1sTIZOdQ0T0PmH4hjrTAhtEy
         4ckoK9pbkReusBZ/JQCYTpNUFNQ+Jc5x3FNW1IR6mtLbeuKqtMYCZ0pMS1Gn8lOwnkUV
         GijayXP06jv9d0gpZPepkBoHNs3msK4b35CxIvXjVyr9CYzf4/0uICeZxQYh1/L8Dg1W
         HCfUKPtAmdgqKmGyZK6GdbxI9Fl6iUBB2DfsSrHZx2YpNVa5R5qcEAbKFDcBVumyOyYu
         FllA==
X-Forwarded-Encrypted: i=1; AL+hErEVyGefrq5cFmiD8eKclE15E/X5Ra2BZXkIEprMmYSJAur6tyqqx+Qz9Vol+OOJPo5mzkvU9KfsUQcXFHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sdBAAxOah9S/GE7KrkKcMZOaBCebw0eu+mIGhBiM7jYDrElWQ
	o7On4F87impe/smMP+YAAoCdkWrEJRz7oWXSxVDU0sqXeO3vwao64hqHaQqFdqoDMrC/zn+SQYC
	GKqyVZ/BI//aW6g+9wR5QTSwb16RA+7hEDHHoSdHgqM8EB73AmxvJb15HlEtsEDBtQoiUIqgPPL
	Y=
X-Gm-Gg: AZFdTZelCoB25cRYtqsmiC+3IB0AcALdmUaMJp8PuBuWBVzgHBI0yP/qjjb4nvK8EKl
	Q5/IDYh5e0IswgTBJm/DBkVfUy/UupTwfVjXOiMIcvH7bNYXblHWivoEKMwI1PRaWaUvXR5j+3Z
	bGcvWB7+GOGXnsfCZ3EE2gMK1k1c9sMvz0xY5/jHgXPcDOxAG8n2U1wopwzxnaBFDTyuW9Q0jzK
	BDIEU0pdwhRKvWYdn9WYuY8tUEkTqt0u0rSqTGdDW9BYwkkUhyL1rEK1/UKHQ9tNDKcUD1hZ1CF
	y50xN4gwdWL2bT38rRFNStwlB9RkuUfmKbSd/1h+jnOCYBsB8nOccV8FyqCjq1FWogJK4RlS1dY
	bW3WZHgzUzYMotbPdMwf/Pn4kdoMeJ7DzslGx/ujM886A06AAI1AZgN0EI/JAqHlH
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148821585a.14.1795462953037;
        Mon, 23 Nov 2026 11:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr2148815185a.14.1795462952408;
        Mon, 23 Nov 2026 11:42:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm374404505e9.7.2026.11.23.11.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:30 +0200
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
Subject: Re: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <2qyauqpne4p3a63jtwvvsbeyulgitvjrqmdija6pjkgh67m6c6@a5qe6jfxerga>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 17USn2UE7D6xizTYUVX5N5OGKnQz0C6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5NSeXRzYabTu
 weWwGus0EIsPUflZVK3W0pdzq4xAnrd7G8UPqHQys+QYILNAETGQGnpuXWYePo02k95/1L1uYaq
 1HiCkntAoNEbcNYgdudaEFAsD6fQNgyf+6/PaZ50VJRBHmQb2gwDgK9UUQ/5gXXUnbx9V9oTII6
 CJpaAHgDgM9Jb5I0X9Kxmgc088awXAPyoog/A89yQgEgvWQmDy72egqpDHgXzOcRHKAmCqLy8/Y
 PCry8LapSbQrOY+RAI7sP7CxJ00iUZh5OZXv8pqLNcQMMWJxetGaSDBLhFsI08oPRn2ksZzWQM1
 yN1CIFVZhoRxsY3JVTwssyc1KI7w9uxHGZuugKgnwl8SkLl+bYf7FRFoEVfH8VMQx6KXL9kub4F
 H35n537qod1y7+2anCQkdmApeb3FF20pM6zRmAt6lnrT37VtD487Cq+xPyUVlJOduRrEt4eB91L
 GkEDxXSZKnyCgmrEpCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5sQYaxhZ4XbM
 /DWj0/At9fYULMy1CDoOD6Pxg4YihuLenkfHSWLktgXW5hFO2LhBRY5NZ9uG95qDIqjrL0fPXHt
 1qqqwnwN1ktHBP4g/lyfFND9QBP84vE=
X-Proofpoint-GUID: 17USn2UE7D6xizTYUVX5N5OGKnQz0C6l
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04972a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=II2oZZyV4uo1nSvD-RkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:49, Bibek Kumar Patro wrote:
> On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
