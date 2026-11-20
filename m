Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169278;
	b=Vrx4TVWRv3SWZ89BGV7kx8z/efELbGR3uN18fo/PdfrPDncT6tX1N5D8WFsZaXBFOKnd
	 0MaZja4yqyHremJa3wj88s3Suy6qHQUGv7OX1qB2A+p9r5cd/CtDx0WQpWrt4yAIvEvjj
	 byw4GhkK6Fn71LmdHGcXkRjqjRC0U57RYbkNbtorWbsdud3XnkS7fX5BgyqoJJ1Bdew1F
	 817kqs32Y3QaR9FyDl4dOoDPlJD1QrIUUV0TbdAWeYTTp8PnLN/PtjUVhodYe44Aqmylh
	 pWIVNRYg9NLKZSHRMoHjp+k/5UKQWVnxL1OLbkmJUrBKiYe93cowOk//RqfnaLPrmCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
	b=MG/qF7TY0Lf246nEZLwLy/SnB73x6gzOfnHf5g1q7ZEf46eU6d6ZuRNBXeWT2V1PVxR5
	 RH+PfEhXFPkhitn/1h/oVVRqK5Y1MoYDthKnQf4KPL2cwMv2m+qU+IOvloXka4yz8gJ1j
	 pd2NovpZxxWVO+gIokSJgm3vIIXJ4jUsIrp+gF+Os/fE7BP5v/xOx4Hmj7DcPs/BgdlWo
	 qiQ1oAMttopGShEVBbvS05fWvnvpCCgfprkgC4ZJNhvoHSStfrJvbtNEo24EIWuRDThkb
	 p8ifEb0+CT0bmbi+AEdvrMILcWyUH8s981uJPDSGvn1kKBnXFiWbIYQB9n6LtdHcCxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gR/nZ5lW";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1F606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB1F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR/nZ5lW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f9Oc1742339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mG/rT4UghNUXT3K+3KmB2T5h
	Q5j4h+o5zz/Q6dODnAc=; b=MqHRQxxiczegEAQZBfwxNU22C/SoRCgiQ0fJlCqv
	/czQxgk9Dt6LpUggnt5Eok/C0MnS3wuU01IFVPJSnQUJ8fLmi9gy1cQBnNGLF0PE
	1exYOLwsDYM1VmVyAHfEoF5b/dCiXq5ULZPb7FrzG2sWwsJk4EC7+wCvAZPvj6Ij
	tkJrZSBk+4X3/JDGM4LDTyzF/PsK4Z1Dc17+AXr/sCi+VnQaLD2Nja+qpUnVkNsx
	DbOZZiPjmFXpUaDdB5AddWMI8UI1zOxNwiOcZB/zxq7Ccl0pO9xvoRyBKPtHLiQ3
	c2cdxHU/B3rpF2ArVOJMXHBA7+xNE3DExLwrbJ5Ta6XYsg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhbhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:07:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92134f1eb00so11568626d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169275; x=1795774075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=gR/nZ5lWSjrcMVuk7HciyFObAo/bq4uwaY0xR+5vFDlj88VX2vqb8CELmVMI+E6DbL
         M1yTLdwwCtisZ28m+jrobnLwAATeXa4g5nWL4a9ssDir5yhPmI/vEDU7VDlcBbH0CW9c
         2vXSpkqo8Vt3LZ11jSTOfIX5OB3TES8emh42t1B1ASUy4UU75tOQjlc1B9xAwrZnueJ6
         5EoKyFT1cmug5yW/TWFSu5v13z6mMz2hwahxAJSp08uxizNfXehGrgiaQv8hDqnG3CNt
         x3esoPtff44qxh79jt3AXMaeFfGTTL1ONZDWbCBsl3urtfer267CZ6qU+HbuNpPmR74X
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169275; x=1795774075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=XxoCi+KfzQCHT/3MtkPt3fZijzJUcruV6RPXfCYHNZ64k32Bc4WRewsNl00HpwiDbN
         i4fWhy8z77mpmWXtqabOvCF6UwNzytaCAwShKFYFTP+B2X0xEw83z2XWe5A/MY/rCMhX
         jmKTlHtetkru8CBjCerKR4xL8TIelI1yIPHCeje7QwcqJnvBKNTQu2o2VIVyL/Cs+2Wz
         ZeP/cSpTmC2nkoea6FmzK+LxhzKV1in+bRKd1dL9zJoskhfgCLuIYJj3x/k6P6Xj+dJm
         Av/pECAbs4W7a/kNq+NZ6JJwye0DcaM/PmRsZ5nxTcfmFLvLbX3Xjxtd4fiqmbMt7AE5
         S8cA==
X-Forwarded-Encrypted: i=1; AL+hErHF1AsgCIaWR0HKWF8w5YeIGrB28l8FVlpMzRJ9eVNR8q0SkEACIw3Knn/+ov07g0JnUB6b3cRxni3wv54=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ldEyjdm287wubs5XwQy5qB/yN5UUEFNnANGLL4fjHABY+JHdR
	Cak/weqSDmqZSHqZAFAzojdO0tNUGN74p2Ub3sNhTqbuX8k+yVMz2LRCotXRbdDA4UjHjMId7Xx
	4dTtQzlkHd4P1Q1sKPCsAzvA22hjtKH6IAAR9mY93ZwVrQzVf4e+fxrQZm0r8aNAiSGA=
X-Gm-Gg: AYBFou1CY5YvESQHbHzLJtrFHGOV10cZSSZ/pzEpdenM7AL1noojQ7TqieFaX9DRQD9
	yb5SZ7TZv51yTIeunyDPuE64kKJ6kgmkEyIEUYsryvlKdJrEy/uxNRg8L0bDdFDx8vztL1MPJjD
	qWzg7ruh6Ld9SIHoxuYge1ayYZr997hZnXMcIRV33nyXg4E6Awycv7omYlaKm1G+U4W5AiSLxnj
	hBMUH5jZHWDp34U4PTAfzIHMaxQJ+evfmNicoPBXiSTcgGI4rq+7nV1eqjHqF1fcuLfTOInvcS2
	RCCgepE/xTp2NuTDn3tZsq0+N3pPBcsRc/dMBz1wIdZqdlKxihKsZFqZ7Qsj5+4A9a1zl9VpVAK
	J6F/KUu8v0BM+vHqwi6e4Bp9D8q/jcsxFDgxGOH19O3q67VPa5nJ67BvWu+gBg7JR
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449683885a.26.1795169275057;
        Fri, 20 Nov 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449678985a.26.1795169274365;
        Fri, 20 Nov 2026 02:07:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4306233f8f.25.2026.11.20.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:07:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:07:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
Message-ID: <6r52ghmfpdspeeh5ucxbcbcoir2fti4j2pyptdomgwouudpo7e@qsspx4h6hjmc>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
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
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b001bfb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX7vvPvf4DEDvR
 K8qbjS5DZ8Qrx3qN0G+BziDxl2FM6vZDaxIEt4+H775oxrxhRqL5nib8q7N9tRm6iqPDxVb0hAJ
 B9Lvha6ceJ9bP1pkBlnUqIpzQH1BNx/hWYk+FIcCO9/38aIMPhtVo5Hlhl4yWGbWCGp1wtAQi6g
 B3oXiz1gn0c6h5ReJOi4CaG/LN4hkghCi1b329ress164yHSG3g3jtWs5lisajuV1KKN5Wr+I41
 bTa0/YdGuUCxUEhDGKG7e9NC7E3U6t8YgN+s/rbGTK+pI9gEXKvfGVZTTWAgFv7cBK8Gjfa2vGA
 A8O/C1QPF1tf/MOW5u8OoJnsuLz2EN/fmsPXMWDHwtfFY1NEp2YW+BroNl9Ei0zY8HMXRxEdCeu
 kWDiY+HGwgz9SZtUIrGIXLgNJHbz7yQMISnqLW7ng0iKSgH4bmRgjlHeKXYKtwU/vIn4Nhalfx/
 FVuJvF/5PtdBspLprrA==
X-Proofpoint-GUID: VifQWnk-uCZnDFf5qMYHQEclG1YCsWvt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX/OQ/IP4M4clT
 FtAHR01X1HM6sTyMFNY3wvc1rkYRYNFq1R8fQYnj8HiHB3Zf6tbenyvIQBivo4HHE4KFJuGGs5S
 CxMR0ds3U7BxRVp0mVJFTUlsAPm/8jQ=
X-Proofpoint-ORIG-GUID: VifQWnk-uCZnDFf5qMYHQEclG1YCsWvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-19 22:34:21, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
