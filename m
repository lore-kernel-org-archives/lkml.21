Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170231;
	b=T60Yxto+x+9+l+F7cOqYO0eit/fFn/1+rN0vLwcgNkPqd00gwlgpzGu3pKC0JvY/affD
	 Fzr0LVDhZgVr+VP6jj/BXtP7ZMCaRhMvynuwcfOMn3MOXIh+Xd/2USWx/Dg97F8nWoyoS
	 8nGMlOd4z9IaYAyf53Njb6OLuIKES1GYOe3bMbrV1bNdHWQsYdvW0qEdwTPuz2V59K2fE
	 +BtGZ4ihJTKWMwMdY6xs9weAuX3MhHzFHUpkXmO/fOFhPWRecNBZZXdV/CNNVTkN0flms
	 augzUJ4ZgI3dhxpaTq/gveFb67PQP+oAvs/bDJ/opLHJUmWLK55PgMwb0NBLlXXsVzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
	b=WaB+zmksT/i4A2OrBNe2n2prFKsDlJIRhmP0ahiHU+jeiHfHlOqNi297xTyUC9CqQ+IH
	 2FkMONSsuIrW443BHzy6cxZ0c3nB+9aW6Ih1ykFzi9XG2EpihC4WL8xEbb9QQrwdHp5Ag
	 GOSkdZ9zPlOG28NFTVHJosbiO3Mwp10gaftBDy9M65oDtciqhXfMBmFTT7rOD7ZZ5h/kH
	 c9+G4Kf7HrfqaMAfkeWF/pCeJKaUSF+Z3v4O/HubWjS/iVKQXsXMeLCePjnNAhGb2/PWF
	 5fGAeLfUUJrdCU/Qqlw+fH5eGFD4907OimxbXDGgeinHQKE1OiZ8bUkSsYdWE+ezkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUjJhogu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvAiTvQQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE1606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADE1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUjJhogu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DvAiTvQQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f4Or1742148
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8TcUmke74uRIjwI8jkOaFTKa
	ZBFJu17S8g+x0u6+YBA=; b=fUjJhogutELs2uVD7hnzyFBThyKIi0WEy+eTSFcR
	cX811Sw3p+NmQjf3221rW1b1mqT/vLupUqlV1+tZNiXSDv+nOEZm7lTfeCz1vvnt
	Moc586UGO2NbfG+Yc+bHNnrmL6HjIrhVH45lqGATN1zNQ9/3ug8j/N/ID+nLlTnc
	oUcI2EKojh+n/X36HL+8MenRFmhRxsI6nhWW9926PIrcJeh90s0N0VYzNrTQuvnO
	5r3yrJLN8CBdWxBmyJQI0IwGho5cqXZkbRKazYaQN/tGdx4i022WxwZll4KFh0rM
	wDNl+Y1doBoMLQpJysXkYpU6mp5E8PiafBGlLYQtImgHVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhdn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:23:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso346841985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170229; x=1795775029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
        b=DvAiTvQQ8Rck6OpoqHVsHQKyFrZsIDOaG0lE6t1v9pYEoRg7g3CsYLWbBOqvgX1Iqn
         HvDDtJAiCbXSQFzk+IzAA7PNArtqs/oVz8ftMo7vebwnpLTOXvKtX/72fianSv+P2uyQ
         hxD26mPz7aWu/fEN4Tdq1Wfpvo5Ze4iXPeBFxDBEPARX0GqmsqIbYFHPJw0J/Jed254z
         cVr3oKBQeC82FmjnL4GITmvPQREM5lcWDuSIYr/IITUDhW++mMEVLi5HDZ+RFgsle9sg
         QCDrH7sYx/PiqaNslADuR07sXI1tFE0KAFNnFqzYJKm5qH6zmSkCg8/mVEs2IU6YMDpM
         xbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170229; x=1795775029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TcUmke74uRIjwI8jkOaFTKaZBFJu17S8g+x0u6+YBA=;
        b=Lw7W3CRTqpzxYKm8hnsFUuvmzK6doM+YsQXOQDA0bYfrujeaj8B75eqD1b3RJu6P85
         Mj1UbXeMRJNFJI3FVlTRbQHooUXuGvRN4sHwF08xwp8TcP4R7Z16fTztt9/WZVz3zDmL
         W5CeLc+Q9DG3B9040HGd8Ry0Zzx124D3WDuAiEXlbYugvWL9v1YhXoTXr3CabOqNSzeU
         qJq1vpuZQMfOwytVJ7/b/C7lqSdGgdMY1kI/YOhY2xmIM7/w92KtxVXCOHzSNFKQu+Zj
         E3ZdZtFCqXxm4IjB1ao5fbqhdlBTm35wBRLz7VC3Fxclhc7+12kkA4VuVF7itsxdfTts
         9T3Q==
X-Forwarded-Encrypted: i=1; AL+hErEPMEmIzh2FUjhVglf1kfZrBnwBHHvhHaXaBGm0lkZ3akfx4+vXscRuXzJARIWZcXnPmIB1Efr3cY17xnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vlu/uLOlqE9gi92Dz/gqOTXXOcd5hS2ldiN2vdRRvLZzbxhAX
	V05eAB+O/nr9b1g301pVKP9qPR3gUoJRfMKYjjKzPYk0o26EBOTiZrmfR0EHkRZAQlhtaBCQFMY
	0huzbEyhTDfVc2dHw9o1Ijn81yQsDGwxTv4sMQtA4wQZWXAgy3Uwfz7fuZbfhaSNysI4=
X-Gm-Gg: AYBFou3LcFGqzLWXz9KnK2nMrSCxX0xN5s1UakgRpaYTTmW8JXj8/w93Lsd4oML7kpW
	dGRIBC1GT5hNKQ2FL2sva3dfQdPRfw3oippJqbTtpsUSL7WOQkB0+vBu/PNSAwd05PGyu3P/e3e
	d4Y9w0mhMn8rHnYID5aQc1RPU9BuRKK3rixQbdlN1v8FvC9nUJf6oIdBLPKmHHoLIYrKLTC+J+g
	4qgTTs4C48Pj7OU4XOy1RTxeeRTWrY8UeO80bNUBsXzhfSnPvmY7MEHmAGAEjblbQpzV1Nb5iNI
	qgR845zpnrhiyyTJwakMU6PmPRNOud5Pb9H5MqcRv2WplxyA7gICeqBEIZ8OwYCRQz01kYLrSKe
	/xjZXBNJ1+dXB/nnY0sUfNpM2DblMY0e8OJnvBuSLdby+lN+OIZMt3sxV09Ca4liy
X-Received: by 2002:a05:620a:4085:b0:93c:d209:4ea1 with SMTP id af79cd13be357-949b35cf4ccmr548458785a.24.1795170229033;
        Fri, 20 Nov 2026 02:23:49 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:93c:d209:4ea1 with SMTP id af79cd13be357-949b35cf4ccmr548456785a.24.1795170228426;
        Fri, 20 Nov 2026 02:23:48 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4698002f8f.3.2026.11.20.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:23:47 -0800 (PST)
Date: Fri, 20 Nov 2026 12:23:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Message-ID: <dtjei3tsuc37fzaxokznqtxxmkbuk3h6dn3yxnqcru7hggkuuu@igwaugqrjxfd>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
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
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b001fb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qo5-9WyrHJ9SuE11QxkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX79Y3I+zVSx0u
 FHbalxjfS9XnNMnqz9+pXQaItpNNcIm72qQRD7IzDUJC1lWdzVLcU2viODKtNYqgHpNwhTJdnGW
 ba+wytRc2u48ZgAYS/Up/Lc3BbDaFcYgm1COnToLLdqAKX/J8OqF00GxV84zM5B1q2l6wOgtvmR
 rqbvBc4AgrQdQR3wIzPHyUlBV5rUYkDa43i1EHHHL8N9w4Y4TLYhcZPE4QIUOJKXejnt1K1pUbh
 YQR21nJ9XTFOdt/CDGx+BuiqxRz4jxVoLSs/8cXCZ4IULRLjORj543QNK0nHyOSJx4SzKr7IJ/m
 DJpmJj0eEBO18fkwCXwtv5CEqWSNMUJUA8Xz7Gs8p/u2nYp21X17MyiwgPJ96EbuFkvEq2fc2jQ
 gmUIai5CyHj7df9kDQ5VHCSQuCOzFQtxgFg5NQ1R2+0JM8S/rST6kj6L8+7WoJnGOn10jhGpUb/
 m0rHsrvBFjsS+QmkxVw==
X-Proofpoint-GUID: 19N6pAIJgy3Yk18QxiQQJUHIA3Vj_m0e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX6/SJ/eEhI+EN
 5IIEbb6VTmgQXVeNlhp7vSHxkJAYdG9jyFxfhk5KhwF6gchKh4VNRYkMlLlqR6kVpXAtGzzYQjC
 ukY2hL+o6b1je8zqplvT9+Pu99/tgLA=
X-Proofpoint-ORIG-GUID: 19N6pAIJgy3Yk18QxiQQJUHIA3Vj_m0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 10:57:45, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
