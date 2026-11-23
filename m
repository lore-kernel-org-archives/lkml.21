Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462910;
	b=lFwHYZFctZVd8prhW5KTuxyOVF3zWacF/lT2Y/h3MyjdNG6J4A4Ls659OxTpfne3euoA
	 wk//lWrgGKT8VxBqHh3j1E+hN1J/y1llhjnEmy5560WKCHFMdshSL0MsLaQTjFRmPBXfL
	 t995VpNUUMrqpxLoLXfrxH5GWHL/ghbeUd6B39EN85EicAZdXzhVO/pDUyr5pssU7A6JB
	 txAMIHht8t7bQ71eYLVuFqP80VIUN0EKnaNhX/CiPGRcE7/q5ZDJR/XIyna2nj4bLLtfg
	 JZzGj/pNzWsER11Rrm/9TjzQizjzOTUnkxR1UV4JGeDW1zOClUrImHtAD/7nJF7m00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
	b=Vf5xZZF4YGsfnChLHNAZVHqRKs6AJ/PPJEpIiopB1OVOuJRqHlgQ+REyzqPZ2Te9eyV1
	 71zUUPK+JiC3DOo4WFkCAq/SpHkJaKhHR6Kr0YwBdprVjADRsiUDVHx9ZnyIR1sHb//mD
	 meWSBr9au+p04y0RTvUCyfsGTt8EmkYNboHLZo6MrU/nU88k8l7Rv1e/YsulKS+s/Bm4E
	 +HqpJAIMgSJFyXzIEutwxmGf36RlTGh3RPTDfPlJp8bhi7/NEyDwUix+dqu9d3X0uSWXI
	 nXcdtVJxtYy3yw/AjyMUidRXUV10CZI8aevaGG9cSo1Rt4WY49ARGFpFTPIOD6pE5uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KS/fv4TS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F085606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F085606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1IV8A8d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KS/fv4TS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGv3v846669
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fhajorqknMVWTu/OeYgSDpH4
	HYLQIjY1Z2rYoHbqGco=; b=a1IV8A8daf95qZ2Odpglrdwrbg8g+pmFIBoDfUk1
	Q0hFEqYN75XFdqNfo6dwlXNLnzXuupGJiWHsupkEx++C6a609ZowOUiGrbl0OMw+
	+prfpJWpQqZOjBBYexySVC9ukblS8varamMvEPEeiLra1Bc6qe4McaS/VoBMJr6R
	a227v4puWMSArvQL7YtxaqByK60q22kvzZePpGbI0wRB0Y+9hCH6vmhL5r8Vxc8w
	QAVi+U6rMANRi3mpcjSXrcg6gUfgGfjaZL2WHPia4wVEI6qDoz8NoVMASTBNyd/C
	FAB6qw4wqzzbccvlfLftF8PZQNn90/71gkTIJ3qNNB43Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7436fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fcso656776185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462908; x=1796067708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=KS/fv4TSwsZZYV3TrdJVO02d8FRjg3rHLxxFtd+kRJo0rJW1kZUUJVo7+Q8L8CRNdq
         zMv35/8LGT75VOeDMfMeALfuNd690Wjtt6XamktZiFT6MPh6InnwoKeuXeKzsC64+17A
         4uZl77ymooMe6+7m1nDWuiSGBWcob+sS+K6CpzqKQxr1/43oZaCId3bjqr2YTSV9ZkZL
         ac3yumDqWSOsz3In3JcpRkTjJzqY47ylVLre0HvH2TWTTb9jFc/7EDSRFWwRrhdivBqV
         RS301le0s3QO0bk6tpW7xH4LtdTm0uvfiSiCyCO6049mXsLhINAwzHMIPNNO4S3PeF6b
         lGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462908; x=1796067708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhajorqknMVWTu/OeYgSDpH4HYLQIjY1Z2rYoHbqGco=;
        b=EulCifrDxQVcfsHrGPD3R+TE/yah+qTkGfxTUEkc9P47bg6cpUJrzdHutEhD0kGoqc
         E5UZfSITvjC9tfoMC8PGmsNw6YQG5mXL1XSI1vUF/vbFoVcmbXbHkCpQWYqrTudRDlJd
         8+Y6yNknpq9LqLwcV2P4RIcHChZlfNf77BF3sa80g9gHf9MJhUQxnc7U6pAF5vJPuyph
         IY1jYHMGPYlMIVbqgpl5/MvT0nAACd+W0UWqWplF54jzREViDn464zxiZjDib6/nb4Ke
         bV1xP9QyIk+AWaoGatcggDpcK7/y+X+mOWyiyJWVTlREwPobBeoVXclkoChokbz/XFd8
         8o1A==
X-Forwarded-Encrypted: i=1; AL+hErGE5UE/wtw4JzrkRa1VcGmH4/V5/nE0wd0CDgIa34EqeZdcQ03JqBL2GUj7uFzXC8ds9jiO8puOijSG2u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mdW9rh0g8gAaEzwB1f8FxcWMVgu/ERvGvhaeeFl6Jhv7dxarz
	FdWJfLX5gRm6O3cjld1EWwjGpzG0KcnVIlDEvKOGjcJb5UG0viAg35AeWCeq0pBumEXxf7E3W2I
	5aQdQPaPi//k9daJctv3LQHiGJfOzWT9BYbSsfG1Hgu2PraxwzE7Vo71GuWZPK8bEMU8=
X-Gm-Gg: AZFdTZfE/Pn+ntucb1Y6MW3SLulJaDjmJlZYfGcXVvF9UPIjut1Qgla2I4/I+tYju7t
	sQLitdbcZtBE+o0qBPI3b/tysNnUvYnwEea90VDoSF3SeiY7HFLFQl040E/ipmgycsMek0JrU1P
	gSZ34NIJTKGOuQrPycqOHScsjmxv1M7mWDo6KcexYLaVD76iuYMIvAwKw4to9HrDE1rOTc2f51b
	hQltPXnYln+1G7mgZw4BosJyOKrZFVHzjlh62cAKPxMR7m5kVMNQPnLYDlSeHbrWP6iGr6eonG2
	upTW/76QVYLTlFtjhWYBR5xAB79D2QTKFipT9PgKaHLCvtv+bDD1V++XlFgy4hRCalFir68Qzft
	Fqo8q7zjnIhsqRtC2TSu1mJ3oE67H6d3UIGZzOEAp++KnDeGvFI0YuKu3lObziXd0
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222150485a.51.1795462907695;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
X-Received: by 2002:a05:620a:132b:b0:949:52b7:468a with SMTP id af79cd13be357-949ba9e0e0bmr2222144485a.51.1795462907102;
        Mon, 23 Nov 2026 11:41:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm535153725e9.11.2026.11.23.11.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:45 +0200
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
Subject: Re: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <q6s4lgilunj3pikw44icbwuwq3cdlk47uw4lg7iyww6eaolzie@vaux3olznlsr>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: eJuPK3HMcfZbBsbeGKm-YvxTkePvukb9
X-Proofpoint-ORIG-GUID: eJuPK3HMcfZbBsbeGKm-YvxTkePvukb9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3ai3XC5wHrYg
 luoHhhqSSQjzpCuWJfQHhjWDRkG9fV9AhQqLHy+vB2RF5m2+fv7iieGBZWzB1t6TtxjXvSjn7qH
 DHrhLBW0Fro5eURTa5GfS9tiQAfPZBQ=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0496fc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GtCB4xAyANLfO_zL0oUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXyzJ5ZWsk/DDl
 7r914Do3ejcVP1hXGR1t98w2HD6+3XtA6+KQXGKDusYqY5+pwg4eiBwc/SMm4jitbPmhTk3NWqw
 rEOPhJb/5pEXfLJ9yiQsIWJV+vukn0yCeBanrofdWqxuFMFPDJuwSfYGLwXsPMDWm/RvCYV74um
 sJFbxgDosXl40khjI/x47D0hpYmf1rjvwvLVnpSVpBdq13FMvyEFP/p1sHpqoIGOnDAI55q289p
 84Krr38uB5fYuythI9202Ec6+8wwsVcrnO5ddcWi+YI5yOSCydpSwIyTX1/9LAgiH6j6VUMiy8q
 xCKESrYAl8zdNxcW3PwAWSE7oc4Jq4ER4szgfSOp37xd/smzZyCepqT6GcjUFJ1WoxzPBE2lr69
 Hdcr0uP+jlk/3q3oiGLsd6AZuwFBY5ROd+b1bJkIVj5hJCHhvUSoCi5Ep0ocAOhi/iuXybtysj/
 CElhqZsxXykKbbxYouw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:46, Bibek Kumar Patro wrote:
> On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
