Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170294;
	b=uKz9wAF1C4xWCXkiO5qLGj1Xbi+9BNQMTmg2Q/730pnrayoY+VXKFRmQ6y4gTunb+6P4
	 QCho+eI5VsdrHWkuIvdbLtj/bkxz2gju1qkWcKpHUo1PwQIwSsIPax8Ma9JYjNViNSzgJ
	 beBnNamMok64EvTHZcJU+sTCQu1Qi+HUNTabgd5rpMqyFgqdw3FBiA68kk/UOCUQCx+4J
	 bCIFKEA+xSv7E+ozNFYV1SU601Gj/9HiQ8ZDIFLVpX2mQ7YdbGbBNvnswYKZYyG9qmtiY
	 NuGpO/Hup0fdF68BipCjdhH/1/USxhxLx3vioUylgVNNZn/XxujpsVd+7u2fk71OeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
	b=UibU2/aXQlOiHvyNJxK6bUbSQot8M6GnFZhAMwV4x46VYHN7dZ+3P9hamCEs9vW7/6on
	 f1EqfSWEyvjWRUFt/q/sHtsBWR+1FFe4qHNQxaaQngsw4gsFlje8CVd3cK6NFUug8NNjl
	 hklyAq8e1lG9ZNooRrdtCT2slFQskACWhJedaul7S4CoBAKPWxvdQpvI3JkALbHw4Nkf/
	 2L3OPgR+OE3qRbK336CK7gL4L0IXCRzqIPykvnFQnScEYpReHo3jUtyvazfzDGsCAlbQ0
	 Q0274/OuxYEEP5GGrwyTWKrN1lXBQzLp3gnwnO3hFwtuCAT+fgkJ4D1OM0T/vCoQYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFDD606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFDD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZGJSzlK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvlrrT+t
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fE2t758284
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nzLBBCOxZ1CGRp+RMhrY4PNI
	yoFdbWP3uo3fOhLpR+M=; b=SZGJSzlKkGJfixKeNEsPTNljyBzvJyaS/5hdSHB1
	9rM8ZtPGEkkj8in3rfofoAdHvBmy8O/+607Gbc1oVWBDKXuQcu1aHQut77IsvCyO
	OXtg0eiJFci7SDAP+SiqwYsDmRq3c5AZwa5rXmZDcFQA4SWMnXK6WD+HHWBgfF9p
	2P9UX1NCgJ1oj9Pa17Skn0rGtocFp6jpBDduNPmsbmVzld7ERlR0sscD1UwpXkTz
	aak3cfVzsIKdNYkWDcfN9jRvzLZl7u8ZcCs4veNBs6yW415KblBsbtK67hEf2Y/A
	W67b6VS89lHcr5JFAhTHp59U1mpRFP19clbxirUnNzXSVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5u832-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so81813485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170292; x=1795775092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=YvlrrT+tqMldMGT6Q5jM7N6X0ZbDeEq7oihb24FRMFkYw61On/GcXeLXl+ZCVn8nzU
         /CM6reVFGVhwyf62GfRc6Zgz/D9b9fOvmBkjhmRiB2EY9nEfFtrXxvmGqwoXG5kdv8R6
         vg9nur+K0Z6H7DOCjnS/c4k64M+/rwcmdB31W5/SJSNft/PDlpypgaZ3txb3Hn7aShcG
         IXCPWRZtm8IQqWHa71cJLMyTj2JbsCSxj1klrDBVCn7hLLyGqiWyjwD/VK5E/R/wlYMp
         /dbkoEokIZkHc8H4FdSVAdcTCDPRbef60m61K3CpUBZGAv1rDqFaaGm2nGAsI+XRC/y2
         BE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170292; x=1795775092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzLBBCOxZ1CGRp+RMhrY4PNIyoFdbWP3uo3fOhLpR+M=;
        b=0vfldWEgyHdGjlQgvnf8tv6+mhlqgDXZDhs7XSQyyWLLYwlLP0zF1r7qZaH9jdEHuO
         /qh/6KGjQbzaMq8qANnyDnfBl6HswiJtBfYPnYizSbEfKOSsbDFQ6Mh1YpbnEkyo/vt+
         m9ODp22tiZjar25t7TU1P/pizdLQdL/5VYDE133WGc7roTy797frU3Yu8LGtvIy7gV0n
         PUnaKbFnR0NZ9pkKdCeThCkgAUErNOzXs1XSHggX4rEEckBLhIE34W5Rkc+lh4hFfeyJ
         Wb8zRT4rRXnI5SU8rBKuklU/du6MQjoYSQs6SgPya0iFpvvWnp/KafmexpTFsxUKjtna
         IYOA==
X-Forwarded-Encrypted: i=1; AL+hErHZDx+C2dKgis92WEbKqKkxeJLOQbfUjxzPqaKZVYxeEEYtVd/KDYMoFyC2rbnCRGHPhxjXeLbl4sUdTLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N4AfDZFt9/gDYspIcgL15y/F9DuEDu+hyrzToECPBntLHWkTQ
	GsXOKaP+m/8BjkPl6EG4USzvAUkUl6r1jJWAOc5pL0rJCtFIQS9WROscwHdngyrCr27XlRl2HSe
	7HWf2olNY9sYrG/j9WXfiGcLnUoVgida5qL8KRncz1FW+yF1yerOomY+Szf9r/fYM7oU=
X-Gm-Gg: AYBFou1ROEGf05+lZ170tjiuP14AKCrLGwA21XVSs8jEM8265u2sc/9/4FBQEtbwRpv
	Le3OyLaXDWB4XJm/hT3yp6rvZM9aT6CvA0Ph60TK2C9Hcn2P/kPNoPHUYwa/Z7wn56+k4NIQHL3
	L+4160dqauCCD1yRGfCR6mt8mC6pcYQd9YaL1YpRmQ0AiXD9520tXTUqn4RY8opGLPyltes1MZu
	E5JzlcrFVDXkpDQitCk19UI1IxaWA8MSzB0GSFX2v676ynVAqyXKe83kcE88dqeQwbocWj3JKWk
	RjWHv+lITKgjDvPNXSXx0PZKjv3sHq2aFxYhnKtSKi5MbLHhSUWgIhtS6XV1wpQrzP3bmIURTbk
	u2maGe76fw7XnDN8xNtntTlSABII5Bagc0VGA8z0MZBJKIdirEr4rssbVkGa16i1M
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462892785a.4.1795170291770;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:949:7069:3faa with SMTP id af79cd13be357-949ba8246c8mr462888785a.4.1795170291117;
        Fri, 20 Nov 2026 02:24:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5f081sm84205905e9.4.2026.11.20.02.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:24:50 -0800 (PST)
Date: Fri, 20 Nov 2026 12:24:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: venkat.yadlapati@yahoo.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Add support for Molokai
Message-ID: <ru6sqipsa7uv2schc3eejuasbk5pqfhpcac5eyq6wjbea6ryy5@7lu3miauiivo>
References: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
 <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
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
In-Reply-To: <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX25BW2hlpphp3
 ceDyTxoWDav4ayQx2CyZ0zUYBua7nSSfyml40kdJfbSN55jGU3DBeOdwaQXi8GTc7qX9UciMRq5
 f0uzrYNg3rz81vPA9m+M2Fa8UT0T9mI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX9J++OgEsZgoe
 Y9tN56lgEaN9rv++DCx5YwywJjbfAen+Qz2SBST0sK0byZWzLEF+FsNPSeyEcz7d5h8ULMVHpZJ
 +zl3Mky4IZ4t8m7ioigPD6Xt5CAUEHnE32feqqj78v7oWagJNxjrUmVCvawBH0uYdIECtyJE9EV
 SKLajv58yhpgwIZyowrggAGOxVsE+tEqRLmcGMTxpmBNG+BYGd77ef6SRpPEIl9tmpFBa0RToY+
 CY3g7uPPmyOgFJ5McOTzUjlZKadl7y+/GtnWo0mDxbqwcY8mrcLShig9fYzANqwNAmcBkitCjqc
 fLZj9laXgfo7NdqOlZ/O79izSOi/6dhhvWArQzvokTIWjW0UDhng5idfOtxZ7WYnn4vSJvD4GRq
 Q1jSgWYwqO64vumtTdZqbF1Jz7oOcj1oEPVKXEBHxjHSznz15OcWUyczwQLn/FrnNuKUOi3/XdI
 Dm4sqr1+7Y0p54a/2OA==
X-Proofpoint-GUID: 4CmnkvYDNPhSTp93kWHajO8Az4C3B-vt
X-Proofpoint-ORIG-GUID: 4CmnkvYDNPhSTp93kWHajO8Az4C3B-vt
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b001ff4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CjxXgO3LAAAA:8 a=EUspDBNiAAAA:8 a=8lLAj3oif3jFirTb06IA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 01:49:28, Venkat Yadlapati via B4 Relay wrote:
> From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> 
> The graphics clock controller of Molokai (SM8845) is the Kaanapali one,
> except for the PLL0 CONFIG_CTL_HI value and the CX accu shift, DPM and
> MEMNOC GFX branch clocks, which sit one register further. Handle it in
> the Kaanapali driver.
> 
> Assisted-by: LLM
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
