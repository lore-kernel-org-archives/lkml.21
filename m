Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515294;
	b=N/RKrdnNGzuJxKXKOW/uRIOccigFVRluGjuHAwlkClV8maGtg/kgrDBM19VPz6Qk374C
	 otHI0Q+cQ2AXLEz0dlZ+3NHEeWkqt+if1kM0Jqbtab7PkxAVGDrd3xPiSRsqlDhQEIg1o
	 tegWhKAFuH3O2MD6OK+AY6g9pIIDQXwFPt+v1Jn7aXyHqDiiRedRf9aKRGmyrQiJWS4SW
	 y2HrA6LHQcfXeRGyktri36De1a+349tldPZaIxcOKsJNUI3sHduAzyyO8T3Jh7boWblxG
	 CaSfwR3aI4jqXGEAzLIz8MZhACZDa9FeEicj5DhyDOAP/uDnambOhn8ZxxF+DP+oLTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
	b=qJiEmMB6FY77k/l4e4yMt8ABgGlcyqyxw4bxJ7Q85U5GGp/UYOzpgP3NkVZtKGZ6gp8J
	 m1rpYRmqX42GTPg2iRdWK1V2VlLomOHmHW7Xex8JvauglIHb9RiyZ4sALcei62JhrXqH8
	 LsoYtaR+zuurKXBze5+/dV+pLB4QLcglP7SESwZ7AhwX61bLXjFMTNC098FREKc3tvTUq
	 gfU4jCO6jdOjnDgIIhMpmwbtxfbzBkWbbv2R5h6ZYeSJtvpBE+TnmooLmtfn+X+ZFbOrO
	 WSNmPbORKdV+mYoMgHzWY801Wt1lYlWCWSl8ZpNSx+s07kNye8nDT/PPyRpYfn8Lq2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCACF606A69C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCACF606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO87Jrw901866
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qk5z0LMGZDeAjOO0is3KJcdY
	LiEOWcWt97+nTtdMwHo=; b=VFR3B1R2Td0bQsw1M1DnPcEQpKrSI4aiQmj4+Dgq
	palLmVfgzbVR4pKHEFZI4XMw0Q0KOGuiVjjVBG98f6F1wMaNpzj++zqSufU/JLNc
	pvfDtW0fz5OygALJ3Fa0v/s0mJjS3kNSklZOj8UHj6Ux0hwf2LSsW9RdZde3nyeU
	dbnOpF8YLR7KMxajzIdIK3sjm3B1DpiipLPqDs0q3Gq5A8DFKcH+7nla1Hx/x5Sp
	7if3aSkguDALLfpaD9iNarxrXUU5M5AJgemnZErBDx1cbpcLlNDD73hRZQimNpfk
	EFJm+or5mZI7fk6TN5gfG+Bv5rhU8fPYthNUH3h4yoej+A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stqem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2321800c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515287; x=1796120087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=AIRDQFzC6U91Eo9MLbSCG1Gn0VN08OOH6jlM/Ti54hjIYmsmj5OIGymJBQMkFm7KXm
         AU8tXHOfl6c74hnOPoVsMDiMnt1zsFTrMko3uiyOAUTaPr+5QHUyYUgk2GXVXuM+P8ri
         iQLPl7wPBsisiJxIKczmfVw2ImMDz1KCf0SiADDtABNSfXBTQ7jIKOBsIEc4Lp3qVf8Z
         yP/jpUuhd+CXwRxTYd2av5Z8e5knOTUyiJjSQlGrvOcNjecudY0iD9n0TH+8mI0OYtvV
         E5vIL4V6D9gcajujn2XQZX54nnzcmnMP64pnxwk3EZWZNCoq/EYZfePHt+/t3/fK/MgB
         ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515287; x=1796120087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=BniBe3zYnSSLix/q84iDqs9R7kIwTOzLrx2jrygsalnmMDgt+arSPNjCAeA+ZXQG1i
         uGbvVHZJo8GclGJLzSCNl3QuRC4DNn7adP5eGgwGZG4tIjFOdKWEx2xbvHZ/MAJy2WlA
         DVOI3JxSIqT/6VucqHHcVCdNXf5l2xJ0jpDZkP7ZLi0SBBHqsFp4K6hvXHqHdJ21I9yJ
         oiSjaRMw8v8NhmSKc5RSgnnV1ucCTGIfSyqmbymjI4eCN/ztSqQQgbpQtgfQvoCFO4f/
         FPnEHzVis0f9SQ6IHboUuBFcD5hnfA2BQ1K0zfg1mbgDfZ8Wwgov4XvAwmuu2RabDJ1x
         g3fg==
X-Forwarded-Encrypted: i=1; AL+hErGpmIUdPZCV4s7lRHrbtIV2hB64YSHAAaLB4lvGsG1KZ9OlNhms4eb1g6ZZtaYZQAAFpAv/amLT3MzPrYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9amNEXEjBrfKGvJvOQyVgxgE0ODZRgOes+iL0lKpDfBzChBG16
	AVA34HyPcxYAXiZ9dS5sE1OpeMnRBPGNNXsBVA6vpp8E8bTeUWsgPmntxIJMG3rqLLrANT2Md9e
	bZz6fwQRkj3YKzgVtkQsKQ1Dk5v6NQca78hBKOyZmVvG+1Iy4e/kzivfcgRR0Qu9W314=
X-Gm-Gg: AZFdTZc0+4XpVHp7iXYneNCuMdgyJTsYWEKGcXZi0FyezTWfS3qQcFEgeHLCWljvbQa
	g4vea8aFLHnsO7SDnhfFHuxzChRCKFoUmAj+PJihp197SE57MHUsGcscwynUpLXhON7v5QCs4RN
	EVCi2+GLodMvC2VlQCxOQkrngnItt4LR9LhhCP7mvUnZPhmXLdJtfmPNkA9xDT/U9TGvZ9ilZhm
	aIIrhixIMkrslKu+6Jq5+5zQviTasoy4OoPrTcWx8gT/+pIWz5A5bMp3w5EdH3JrlWbHhNFac/W
	2Sw4Ji41bAzjAJj9lDwGP3veomvRuUYj14k0VHd+4ElokKbUYkiHwCgd3uqXQWuMubc1YDGzdRC
	ISUbOzb9r5dgTclU3a78fXclIEuppenTD/yDQO41SMyb0u3BO4LrN5GBbmvLXuunQA5NQL9chft
	/a
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255579c88.4.1795515287218;
        Tue, 24 Nov 2026 02:14:47 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255550c88.4.1795515286532;
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm37791810c88.6.2026.11.24.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Date: Tue, 24 Nov 2026 15:44:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
Message-ID: <20261124101438.n46ncolgnghojved@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-GUID: OqYfkPGlzUYOpotRCuwc59NC2zfi8V-P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXw/ZShR1ulL3x
 B5//0jejZcDfQyuyQa5LbOiLCK3bpJMqUbJBWW+mjQlPOgQUJ5r7q8NHnqwaQ/EYIldQXbanUud
 zWdzffPlrjdFyhgX6fercSkmZ7ENpz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXzecP7k+gcfdH
 kMYqtP4gN+9MPImRvuRcVYPahKoFgU6BFYPfN7UsaFZwr/cRgl7I6ziGMClbyuaNg4XnKL7WKAr
 OmVT0I6MsklLBZl7DzUgJ6mOUszUwvZQVT7DwffnbUsX7tGIB5/UVe+/H6UMLVf92R/MTev7Ado
 nCFTzNubsw1zy09h0/LluwyJ1FtbNPGS8X3zyOVkgvmXDuXXVLrplO+Oq5Eg1ZFFOV8Q1PJ4b/6
 uzPVh7DJLOK2z3KjZZiqWKxY/2cvKekeVSDZ6Az5HydLIXPgv6YVMM7YHFyzVnTk2ED4kqYPDwJ
 ls7mRPwKhKeR0+NF9b6dAiM3fnSjam32dTMzmC08yJr1RDJrttQt5lW6j4uZWRm20bgBB6yPTqO
 JwduCcp8FA1zPMmc0Ber/LyRKXjoibnC0pBP+5bVf5lzQDZAB6p+64sOVlgzXWlK7U+AXkD677r
 y/9BNcSaDMWDifg1/Wg==
X-Proofpoint-ORIG-GUID: OqYfkPGlzUYOpotRCuwc59NC2zfi8V-P
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b056398 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RHyrlyLPk3cZOz1Q9CoA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:51PM +0530, Komal Bajaj wrote:
> Remote processors behind an IOMMU may use multiple firmware streams. On
> SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
> currently allowed by the binding. CDSP uses a single stream, while MPSS
> does not require any.
> 
> Allow up to six iommus entries in the binding. Require six entries for
> qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
> and retain the single-entry limit for the other compatibles.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
