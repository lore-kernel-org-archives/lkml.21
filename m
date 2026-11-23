Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463054;
	b=gioqB+KwZzhiyd6cx8NagfVwMVYtVLWpNHz1A4hAnHUsECZRuzBPml8sUqq7zEghE6aJ
	 2i1TUoinOnvXvy9VCKXSsmR38Rd6b0W6c7z+Az+6Cc57pCJE8PzCUh5sMbdbaEHkwmLl8
	 l5doLTDQKZ9wfkIz90KhkS+Ps+Bi/uiklGRIC91U3ZSjAlAKSWoVftnb50vld+CDKR8FX
	 PLmntw3WgMZPNQf693na1QsHF24ZgPwTLDLD1Oaf1MKtqRuNqwJ/SqS4RrqBmH33e2xMe
	 F3VNXN9mILo7wZXK3gNHtd/smgvNb/H9acN7PDymTWmRG/yDTaUStGDPqB8BcS0IMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
	b=nn8+SiP5yvZMMQNc10PsdYphIcnaklKSHjhNJmC6SJhIYkXyRFDq7QbgYZOXQsOgBqE7
	 n7mJVYgdG97goYzcR/G8kwhzGCilbMQRrKO7uSkEz0un4+vLeZdbrmlmBm5dJqa5uAG+a
	 pDNfGeAKDObgWg+x0nEdN4qSHOL5OBJ9bPVREHsR1355dGSQmJ+jqb7fpSs+pgQ9Bmgqw
	 rug9A4hyvf0zDkziaqRLhE76dfVfI6VlYsevM7E7Suo8daniGr1adXDIaEbPpTwVBxRA1
	 TEt8bhIiJA4EdKrf6qgazgaF/u2VlUeO52XtUKAoZy+pl1Y/egZ13+okklvx/zAwv5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gpU5hGY5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC5606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFC5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gpU5hGY5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNGqS647044
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmqs384t4urG0xO7kZnecCDg
	SxT8h0KsuOljD4Hr4ko=; b=Yxzx6m9meyKMWzTUoV4ZM00fA/PyHef1MQwgy++0
	RsvNxCLo4tLsnC2untVDjNHHdCQ9VpYwX5wEUV/++y0CugsVH50C62mvbhDkqYtN
	WsObSAYlGtkK8b7emb42vlaMjRZxilMbLZ4afLPRoE51dE8zanhqyuVJnGu20bxR
	tBfO8q37WsXv6bJzgMAAElayDj89NcOUIajq7PWYVdPaXOeMBhaFW54DESkD9qgI
	TR+irxyQpXpqKCFCc0RFn7BepbJAEt/iaiKHZjXzriyAH6D3O0umBbtlDlMsGc8g
	ED3iJAs96p+kHNqiozocaNlcP5qjyjs3iTh+A6kCtoGgiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg2jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:44:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495af07676so575391185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463052; x=1796067852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=gpU5hGY5YSUjFBfP7kSkXwApklIhrQV5j25H00oudZIZt4sz/siIuGUl5gZscQKPzF
         OKfDDrxl3jhG8qKYCQswA/VxqXpE8l1oXUXapJFgmAWcJxRCbP7or6NB8i1H5YWdmuHt
         eQXEb0sqgOC1asT15SwZbhMgbvL+yMAFUSQKT0c/B892ct1eHAIiDwbj9C9233eQMXYE
         rD+s/sI3HQu615IcLTIu+zpNLCK+kF0R9H6liLEc6SQSZhvbowbLYNC+H1RttZnSOHao
         gTY106Z017xyyy8ffQfEski2hFwCATfgX5/LKcTSwT4HZMVNQgAOeUSMsufZQtvpawER
         xpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463052; x=1796067852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=2Hurw/SA/kpP7GE2AStY3AQtG3IY44Rd4a9HdtXwzJVJ5JBZrem1FfF1N0CO+DIIsF
         tyTYzmzHREWrGWe2PdgJg61FaElHH4ebd4ocOoCJIDlaGigHNku8SYz3erJD8KHLL94w
         8q9vF/oSqHIOq5yvi5HwOfKzxz5fsJx2Do3IB62ij5mPxQstgyZhKafJNpvl/KMpCd4F
         c0Ci3Xxogk9w/+yTIXKNZvjYUH5OOCk/cFcq+hKKAFi4L+VRGWiSgQaJp5pgXFqMEw7M
         EKggZmOF5rvIj8qsa7tfGgZmNMVTZpqiEYllWn0yG8pWi/cRL5MN9COZvzCiWDRAwl0V
         /yXg==
X-Forwarded-Encrypted: i=1; AL+hErFqPiNmKniHvAe/drKjeMr2AF5sMy3n1H7FnVvCAefIc3qcCC3wN+mXNPIl0AEL5McFZm7Wrahewu3MWZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LYi7InBshJyiVMiKBIJ4A8/hXiFLEobEQmqu93uP/O3ooP4C0
	97sUZGPTnwVq5DrgYHZu7YUWMPeJrWOrcXwaWjUSttaOrjh59jvPkZ8H/kwuRlsgkST4CjUrxgj
	ZfxBzxzT1i6nl5kLqOXFWoaIuGwnXzolUa3gA+iwI88skA1pMLVxsH3v3kdeYrDmH/ic=
X-Gm-Gg: AZFdTZfiOLotB89HXs6uNUHuPDKCViRs3JnyXYWnHKCSBwg9+xfkr7xRgNpgi0nioc4
	hKZE1OwggfaMov4C5QO1wnMAz/0PVlyGd/sRpcJSjMP09EiuunNkgz09Rqo6Y/YDx8qyJr2Y9BI
	pIbbthTz2PAUy0QTuzCzrWrK1q7s+RdsgEdb8w1t/qXrm1oDPxzN4WRQjALSq0soaxytjsse75c
	J72Kn+U45IE3gIG1DK9XR5Wzvk4ATAGJhk2+FymAO37uzkJtn8DeLYiiqvHvcQGc8YQCHJompGx
	wNX++tWfrB7oLgTZoieHTbWUKCnCqq5oWwTqJ3BDEwCBf1xZPzOmi4n9G5zWIUrCD1myQ3kXE5M
	j1xgJ2Qe4YiSBT55YEIHUDJvAgun7IIddmaBX2Y5jjSBSCPEdwHOMC6cnDsx8zsgc
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063644685a.61.1795463051599;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063640385a.61.1795463051048;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27593394f8f.55.2026.11.23.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:44:10 -0800 (PST)
Date: Mon, 23 Nov 2026 21:44:09 +0200
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
Subject: Re: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lafjekmlbln5uccdgrqqrclgoeu7mrsgxbuze4cu7u7zoyrplq@7qdploxt4a7r>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04978c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX97f05yxXYNoh
 Vq5tq7b82GZlvLuFn9Wny94AJSWKow+jVwI1qj2MTZnqR3kWNoA9Y4l1DMLx29Ek6Y3EHHR4s6c
 T7AHLysVCu78DK2cPsIqfAC2e/wgOPzmr/Y5/i7N03clg0D6bqeNyp8Nzdf439JO5b22R13vXwh
 8+Ak7pc1OroyBhtJRdzmngmZEPPf2Ja9cOjh6Q7tdxe8qORSYO3tWQvv+oCMi5XtnMjIOuDCSv4
 piffDpqVgVDatpn1WX0+UkvsjtAGfJtKyJHnlSRSVHWSdzd2u9AIaWmRllrSAtDiIEinewerS6U
 Gi+KImCTswiaz6Mu6s74ejvv9f+p10xDRCb6HyEQotl/lCUrI5SnaAulm2t33mo3h2SW1fv23n8
 gxGMBKiWRnMro6toI3bU/5cuagJMKxLAcwYS8fR96M/TokH0sjGG4PiV4iud8lHt5Ti//vPMJP+
 OrGu9V7AR5DGks0jjOw==
X-Proofpoint-GUID: nqIrlO6G6LS9E1OrySiZcKOO5M2H_zPR
X-Proofpoint-ORIG-GUID: nqIrlO6G6LS9E1OrySiZcKOO5M2H_zPR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/USqt98rDF50
 mWRe2whbtRirA/ErznEnwcwSfTt90sJ7jwUvo/eJ1AEkk5/KRZ77zVUyWciiup2tsHwx/4oyROy
 Rz8nmkklf3HcOwgBcpOXgZKZ6UZYANk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:51, Bibek Kumar Patro wrote:
> On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
