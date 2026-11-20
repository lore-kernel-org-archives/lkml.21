Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167962;
	b=WH5fpppCG6uZp5vmSYfKweApmHg2SCC2J9lqOGc62/+VBUvpHEL8PaE3l6o0LCJxEzA3
	 Q7lgfOzCZ7MN6TXytgRe8ZQuMKVwmCXm1jjrnjUy82lUxT7uQFQUn9Fhp+O3skvWViDtD
	 osScgh2GxGrbb9X7AU3N9rVG8TG4hoaY18roBqmD3sFytXJe17yp0Zk66xWvQ8HEhvoN/
	 gytMlraWYZEzwAuq6nV77PN9fdM0JNS9V66URwMiyBJM7FXnODDfIWCI3nBMuVHOD/lLT
	 kkA9/Twi2Ast2V238mbINfEK0Y6MwfSQ0wr3sr51h86VOAws9ogSAIYLQ/ndfkMmr0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
	b=yhDYi0xVyIZCym5xVhgAiBjkcYS0EKmWDqhjpJz5EnqEjm0VH96gfAhQxtefnT5WHnE4
	 xAmsTBHhkPHND6W57ouSguDvJpkmq6mdJafYy1xBQ45amwYLRj2zfpvLEuHQU0Pqpv9EA
	 ApfZb4vTUZJ3GteD1Q3TRUrMzIQdhiesvzA/DCr003G8OcgPc+FGugIZaszPz5ROp/iDs
	 Z9IiCFcWsgBBnEGiP8t1SZNj+BsDLYpu+BVOopuk+lvzcdOUu++TL03/+1iFzJy5Iwf7S
	 EKGiThAJtBSfiZYKqdAodk/m/MMz13/zd/FXkDHmIVC39SbzgRklkyuCXOr5fIFgtVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNgUScH/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cunAVU4/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE7606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABE7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNgUScH/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cunAVU4/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etbM1048843
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QMOQyHWGFl1egjU4MIi5naii
	YRrUSwo/0LdsRuAGp8I=; b=kNgUScH/89dEhe5udhgT9SLv2tUYQiSlZO72qVxD
	OaIOrfiaoKU5JiXC6b69czxE59qo2WfjGbKFhkpr5LBypSW9wzLDUmxA8J/uqKFv
	R56Bf83Hqyz4Xy9Kbiy2c9c4X6B+whYiCmcxGDzNWjhYZNfeJElg2FQqRKtsR81J
	Cj1hwKTc60rAPdhQRwLx+oC5KsPUJW/meOtfta6RD0iOg9plL3jt8FKtT9VWmx+3
	U6Zi9r4cFbM+YohbcrVBMx7vO+pvY25yoC4NcJ8n5gbKHFiq3+zGRx8biVmfoxjx
	io/KVPmW+V2MeRz33o1I8zb8EiNHL6eYQT1Izkh9MKtTBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagumu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:46:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55c644cea0bso15692321cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795167960; x=1795772760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
        b=cunAVU4/+qmZSiAgzBMbX/04tZzcwpkGu457bJPjfl8OJHV7EgK9UtKkF31I3yn4AQ
         tNtkYOv0wlV4b62qhei3mdyxcD17pE5TDUgGubERo8nIqRFb+LT0s8zwLDjYyk9gHsiG
         cJZqpKe7QZMlTWvlFCzP37Xxjnr5ZasHG1RdcYWlzteS7R9meUC1Bhxsszi7l/r7YI4K
         lykqij07IeMx2ScYt7R2XBD0MWA9Z/ETaWLiiQdP3qpTGf5AiILNwOMbAnEM3/LerMWL
         JY2NlphNRH79wW5oiWaV/0DL29DC5g1Lb/OhDvtmQMkYPc0NxibgNAsCJDlHA0D/2Pl6
         wDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167960; x=1795772760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMOQyHWGFl1egjU4MIi5naiiYRrUSwo/0LdsRuAGp8I=;
        b=eKZ0lpoXWXeGMOEJRFDVQEVGHZ0bP6KOTBavRDSWBFmHj3sBDMcRRvIYR3dEFqrEoP
         SqYKIyZnj5CYwu62oMBktbJhbSX+ePV/otSKIM2bHy1Fd4s43nrNoezyQGexlchzM3mV
         a+BRkUoDggtrV5cg4/nrzHy4HSQTxg3b6mWKu1aFrghtygYxBeoz9tOImtyK1DwOe0ym
         jB2Mj1r0c/am+Mj8sRFhxSmR2WCV7+pFc19n39v9uzBjpRYNqiPKS4s3A83WQ6r8Hg6+
         gPgiIVByjQfjz1dbrrF13WR2b7rJO6oyKU+9BCTBZv8ZQTJt37KJBKU1TExImxSGyTod
         L7tg==
X-Forwarded-Encrypted: i=1; AL+hErFWloceyNt1L5NzK2ibaczVHK7+Qo3+agg/d/5yJ7AP0whMlk+3gPdxHJr96jaro7hRg5DDG6FcXW7xPKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D2LfgIt9d8NrVAymPMW6dXAJUZJADygHgdODMw+RJuEHIH1gj
	XUGtKt2LyCTFKX5So02ZsOlsoUIMwqgl3BJ3+Dw476oR2xc/9jmYbb468PRTrGqqXkDd8xvBQzi
	Gn1sNEtJCmYKXlcmE2UTgs9cOveFUe+zTpgw/LSDjI5kkit6gLVTbUQYoYbdtxoQAovs=
X-Gm-Gg: AYBFou0vnXIe6100Og7tcchud+DzuH7vxjPALUZ7BaibPsC3VPl8MYrIrCfSU7z2feW
	JuTWyMTg8ktXWq5F62hbLOvkOXNU3d5zTaF+zvYBnzjt2MkuXwdyc8BkvsacXxsYD1IUXmZG9AT
	YRId5ti68d2TJLPu2zmkeXTd23iOoTYqQ6nZJjzNog1lCIMTKMyQfjaHh35pfFuYdfiaZSnSliA
	Qdj5qs6dCjiWdu3qAewBOnl25te68fpvuDLlW5aV/rmhK8u4/Fywp8+0rpPbruya0BzHKmK91a0
	3cHmjgXT5uwZDy5m9eXVM0EdI8j9j6EsYvxk21pWa/zwKS2uORtY3edwFpH5zDB1GTAidnoVf3x
	zmlHLxbuv1UmxVsKvCYmxKru0BHB89i0SzcyMaR0qzBKcYJ7u77Ps3fFR3sQNZWZd
X-Received: by 2002:a05:620a:17a2:b0:93f:2eaf:64cd with SMTP id af79cd13be357-949bab35bc6mr384600985a.50.1795167960305;
        Fri, 20 Nov 2026 01:46:00 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:93f:2eaf:64cd with SMTP id af79cd13be357-949bab35bc6mr384597185a.50.1795167959637;
        Fri, 20 Nov 2026 01:45:59 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm5035064f8f.1.2026.11.20.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:45:58 -0800 (PST)
Date: Fri, 20 Nov 2026 11:45:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: add more reboot
 modes
Message-ID: <lt5f7xkdms6d3vztcwsirtziova6o2y45hdovur7n52t4h4q6p@4nu7vv7aei4k>
References: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
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
In-Reply-To: <20261118-topic-sm8650-deckard-reboot-modes-v1-1-a214636f248e@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXxxaFcLNywJ+Y
 pESKwOviOqQvgechfv6wE+RKeIiXDQBHToxrN99XzI/1hVqgB/6TSlbpSwB+zZmUhRxD+JLDl2a
 1JM3bB8C4SXqgTesXWScBzy7AS3DKwo8MNTus6cbybFhr7c9hm6KIOmOSC0ycw/e8EqSgd2EXUX
 T/ktQ6rRpiIkbk2YFOsCvDkRH6vTx3groyLfi++OLg5hVLhcWrFQLuC3gbYOOh8M7VzuMZq9aKX
 cNO8qAP69bk9LqX9iLjAhfNEQDdKJc5Qpf97a2zqjofmxcYzYXCBXEycRGu/rs5INo1KFLAGfAc
 tQdXgGXciYLt9/YNphVW6eybYHq5JzI1hbv+EhVkrlA32WjR55hBALFULsanABfcP/j8983zLJb
 fK4LLL7EeLHoapNuZYD5rIjEZEQyTRui9xUZ8wjgAG/SCWDKHdobj94bGApmuXIkZsVq2+p4jQY
 VIOE5xO5EgXE0ZhWVpg==
X-Proofpoint-ORIG-GUID: WEQtfW9sxFPhHNl9MN5T3lMaK3MUyBnM
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0016d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WYvkMGzYiQLzyujf63wA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WEQtfW9sxFPhHNl9MN5T3lMaK3MUyBnM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX6iP7ruY2F0ia
 HCmcewmrnR40B1Jel56aG/ulDm8BWZRvVgWsmogLpwH9aSCUDSPQCgJQ+TMQUsd2MbS0XiuBLQd
 yWae81RsWCtBS+81LdvknWxS35ZsQRs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 10:46:05, Neil Armstrong wrote:
> Add the supplementary reboot modes supported by the Deckard bootloader.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
