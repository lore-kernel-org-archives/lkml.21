Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462846;
	b=MMFIiRnM/9on5FqtDthk/U29hYrEDT3JHdW/GwPPmfJvanIF1EHY+q94YDW7FK9g4qS+
	 HDwQagJqb66r+yqhj7/SGYmBkhj6fFYx69gcBtJvhrgAEVoE832Gze5rzUGRmzhebtRBm
	 qfV3NR6h8kyQGKzdCY8ANO+aFZl9KIY8xc0mCAh+2xSfVc99Bd4hd6Nw+apmvASkSzwBy
	 VPPjfxrqDBQuR+2AgQWSMAZ8Hwz2Ja91zBIz3E2oe5nEN87L1BlsMzoGm0HLjOsioGZhQ
	 bZ5vFbb2ZG3DqQSV6mjl3ES3SOUGUyXoWIo4agJtHODBEM/sWhrH63xU0yRXax2uT1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
	b=kvm0zJhxZYefJEucFl4IZjCNEcCsEI1MavADTwpRUg0grR4PF7LTKLZxqJCXMasiM1Qf
	 bb0iA4HUSvj34uq07Dzf8FIDe1eJlTgIto9Vmro+jf8TYKjRufd0DaR0YD70vxL8rSgUv
	 4G+ShWXaHIIUR3rA83GgC+HAagMCz0JNLci/nvEt93Ntskbyi+XRdNYSIVF6F9EAkJXSZ
	 6dle4whs/7UX4hybTxb9cMtTdU35KE1avZZsUTbHx4zkAwBCafTSpAiaWl/0R6F3RFQPB
	 kvoUB71Xr3JllJXW7116WZlwM9OfFwG4Vd/tvKBcqkHAt9ktynHPeJabPPFNjH6hMAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La0mMGbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDkAbAeY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B66C606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B66C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La0mMGbc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDkAbAeY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmHO1861196
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=63/5soKOfoo4s2XYSXdk8j2r
	ZkMsI8L/GaEuPyPYmys=; b=La0mMGbcDjyRM6KXJZm4Sev/JOtC6OOzb7kNxA7J
	iBvGE0jgSSgg+XzZ/vmXHAQjgvscl5Pn0/AQGorYnlhsTzCpuCbcS66h3yorSYZn
	cU0MIRcbKG6hQHlxVx0EzJryehosH7vGqRnOYCr9jaqxIOwA0ElkT2MFCDD9ycIq
	ccEoQ3tiyhG414G+PFhkZUdDSpWfOzsamRqBYaFGNtzV80IhPcKzch1UD17wiqCr
	wLSemY3/km6mytfTXmxEJ0bvMM71W4FmEPJblxG6RcdbmqcrU9Zkj1RikSUoQa1q
	IzNfVIEfbB9yAOfaxA2ydIaCIg0ePI+eGq/20b7NB0F0Aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3473-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso712180485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462844; x=1796067644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
        b=dDkAbAeY51UOYl3QjyDm+kqqaG6ok66AvWE/dXGcyeabB6pUN7j5/OD4gsP1DlH6AM
         PQv46avdMN/CCANdg/+jx53LakpuQ3ZfVzOx4mYdzOxr95ElZxmVTMgDELIjmW8Y2ALX
         P5TmGFnELJmSsGgTX5tX7A9RSnkzOze394lC6jvQDtxOqzFSPN0I6xeVDCYx2wYzRilx
         f5jYwFyI3Hf2l5P0HGADBBW3YUp4ksmiDmY9+Wj5rVFJNIVR9M7qv/RHWTzFYNgSU+Rt
         DyLiBEc+GE5fRf2XHeQuEMhvtyv1okjsYJpZXW5dU4rJNMn2lrEKivJhsfY0pgzW4LBJ
         z8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462844; x=1796067644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63/5soKOfoo4s2XYSXdk8j2rZkMsI8L/GaEuPyPYmys=;
        b=R4Rnfoj2ypu2fAm3hp1BmDX8yPd+ZlHJcwtbYJUMjs+TiuNVhfkk4CbkJGX0hV7kYb
         dreTJrsl461FS2784VfPykAzDLLRXIIWeLNVlNaDETZUxAlfR3rw+u25bnFcf50MTMOl
         pgmCA+cIuNLX0TJrSBLqlcjwgr/UUN7Q6nS4UlQtrz1G8+q6/5UJJhpfX6e/p6HDj3+d
         0616HTADfcKihYsMcbzbpn74wr7wdhtwToJtj502KNlpS9eFxVi+M8TMk+BFzHlqmh5U
         otH7OcMl+XUmlwKBC2KAlSK4oef/acu1+6Tc9ssH80B2jB37In1ZE+sky6VFlMGQXptr
         mdJw==
X-Forwarded-Encrypted: i=1; AL+hErFXSCVfJxFecwjmFZ3ntD8MVn4+KOU6AplyycwVHXPjOyyWSmfuM/+VjxiRW0B70E3OKMhYYFIlx79gh7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JsDdAsHf1KfuZf32ip9FScWgzEV8Fe2ia05dLkMlONlovIYNF
	iKfBvx6RGOMnSW1EBGKGrJMpNeI5IdHHX0ZyFDlJXkM4fkynuq1hGTX58E5japlWSOYugVq06Mk
	4l3YcdYisQMtTTUWs93t8tUzE2qMkWuieXeJoVDPINsrhkEl40Cwm74qMVPAXgYYeAHHkb2RBc5
	Y=
X-Gm-Gg: AZFdTZftqIxJom63LnRc2OxeHgNlt4aXwnf/InTEtePOx+/P+noVHcpNIxm15c28lAk
	JgA8YcGfGjxCZULQhD7R911ioT+KsXCsfeq2XhFfQ+NP4oAk65XRQn7gREV1JWZG1J2pirxNgSH
	UmHJsSjldyG6tnClpgUdKuchbjf6JNrG2tz5Ph1wA8MOLDmsBPsfcksYcQtq+j2kCMk1bmWlzi6
	svc/RgNua1kLY9UOG5cFV0TBIeatgxu/5dgRcc2K3lJm0wmoABIpwXmvw+yS0Otu6/ZNQLs0GE1
	138HztUoz55t+5nDStlzBJ1Hwdyob1GP1yJyqMQWYiKK6Hm0s/pdroblTV7PF27XDSwbaC4liUU
	HLxnV0ztVscb8ZkEfVxUG4ZfxZN96atW8UGGW3CLTHKK7MpiiESW7E7RJWnhpM8wW
X-Received: by 2002:a05:620a:318e:b0:93f:59b8:e28a with SMTP id af79cd13be357-949ba9b8046mr2258826485a.28.1795462843760;
        Mon, 23 Nov 2026 11:40:43 -0800 (PST)
X-Received: by 2002:a05:620a:318e:b0:93f:59b8:e28a with SMTP id af79cd13be357-949ba9b8046mr2258819585a.28.1795462843184;
        Mon, 23 Nov 2026 11:40:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm25447645f8f.1.2026.11.23.11.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:41 +0200
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
Subject: Re: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <izxzijllmqsw7hswyhtyir35dltvgue4ahwn56izi4ez2p2nv2@qyz5ugzrhg2y>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/IB0X62dq6Bv
 ZHNVZzsFFAq0ocMOAU/gRMVH9DsP+Cui7w0z5psaDINisTBdR/CHkiqcJ4DAQfP+foUZEaS3ijs
 6mn+OLXihBZ2b7l/owLCBByF4Plxt4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1Df7W+QfOIkF
 DKoJodll0phKhnBxh46BclrJQ5LAs4t9qTZfls9uVu9RtQm/oKX78/TxlqVY//oHWKL9wSItU3k
 7mJcDRrcZwa4DYi6dP/I5lQ/LvGNteAK9a7IlcWxDnCJ8PpLafqHw8bhXGTq7tL8h7iZPPJiGaZ
 /dTKgOtuihzvpoD0nn9dskVIbmCs1EJvlIxzeEKbnZi933iIosBQbBRwcTdi35VHVzijEJgMldV
 t/oEn7PTjpKAPiHvbkdW2Bw7ppYy8ulBDTUndpK9GdqyffdybdS/1VxGXm5it8006XTyJmke+e9
 E9wfMz+hnEP6WfeOgGkJ+d83j/xMPNjUzT7WhwWPPiwDo7w+7GfaZ5MeRi1NTlLXVXnJCGSJrZM
 inyBcRA8SSNuuSuFxROTqf0QTAVZd+Wo37fEJqAZkzF7gehlGbaBMtVUpFgcQb78EBR6Xj9SzLk
 8/ZKhQ4tUvBOFXzlYCQ==
X-Proofpoint-ORIG-GUID: j1kMMeaQCJjaeRji0WldrJHHXviarDxL
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0496bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: j1kMMeaQCJjaeRji0WldrJHHXviarDxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:41, Bibek Kumar Patro wrote:
> On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
