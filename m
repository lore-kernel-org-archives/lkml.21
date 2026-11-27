Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768719;
	b=C3OQP9LuVH/8xXP2XcT9pihdcUa3qwczZDPIQJSbwNFHnTRRzT5e9BV2JbpZ2DjIv32M
	 DNrgB4kdsc/7Eg07UktdvBanDMMJvEAxIBInzjJtbXtpfBMOL4DeEtikdfuc2R8LyxnBG
	 CrRIdlBuetqE2DwF2+CkMJu3lKi/55liDlQgIQdzeyx+NPKTGeYe1XdW+9Cr7O5i9SbTX
	 WSF1834bKl4WnuGNR8eg0VuS77eKm54Qu5qccyJxiJbYROIinPNC7E51yddaGUsfGrMDw
	 XP8kXtZ/8HG+9WPHBInsZgt9QaTwrEJnovcWmkSrCF3jzyAQDqnNS7q8DaJQ7DCVRew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
	b=On5Nm/qzn+/IJqdajIRXWtJkeZQenoMU7iJKd+EMb4uwu+EBOM9zkQtzx+tLut6LJT81
	 g2XNVCGjFbLsIc004zL8NXAABp1s4Y3mMyUu6HGVO4S0IRxJg9zx4GbMgQP+DQVh7xZjh
	 r9LOKkXvvPYBiXHoogOgxBfBTN25KUpiHGFH8Fac+7+npYx8hOH3pYIgBymMmRmKHuMx9
	 lPbhUZIuSvV5Tyk+0LwkdzKgpgAK0ujw8P9ua6hWLF7Y+QifnHm3baBNVZHf3mWu+Y1GK
	 zw2Q0w6NKrD6eWDfcQrAK8nGx9MXVV1SRF2/8ZN9xesBxfYcvw4Svij6lWYgoMDGGhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBCA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBCA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7HuWG3118087
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=; b=ZTyPVBKFf6tDcZS3
	j69kfanIfq0zT99v7awhutNb8AEGt7nf8GIY0VAOpuTNzh1bhCUSBQoctr8WRag/
	2G1HrQA4KC9hlaxz/OL7bABnSt4YVGXL8c9Jw6SpVjf0WXvs/AEnmyj7Ttxe3+LZ
	DQVl+svr3kkwl8pELwitzqTuVEEnUR004qH43ii4KBOhG3oFEPB7r6M1I+M3FW87
	eFDUrjnf/5wR2DXvWqmKUVt/bF2Ki1kraRRw08AEZG6FmOV5vMlMT1JQQfiePK9u
	6n+jmQEGexaqqDJLB64/b3JXWMqcy2u6Lib6wYiHdMbgRRAeqzH7x5EuBEC61M50
	4Rzdpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8qr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530cd3dff25so18858111cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768717; x=1796373517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=Yc0Ua7M9lQ8To9fWdrbilqI9vTQgtYb6n4IdOcdMuWFxeNtsgnFGcHu6nWCAF8u91k
         7jhTeCisP/dghy1ILzJKVhurn8NUQFBOiLpeWXe5HmOgnoc4l7r7YwXwHmH4E+6O2nD6
         QYLyEBJB4Ojo/0BeVN9SFQtHoNJghR50Hb3vertIvzXsY2TXf1rLxar5J8Gyhn6nFbv2
         McXvyuQdYQWrz5VPnE+Ql1SFG3ZZPBWArFkigitQgUai5nNHBeB+LhnxfxhcpqI3o5A6
         K/hwp38u9a52Q3pyCCKuMXXgnPm3UsIau+MAWWYvrSWkvnNRzkw+l1jgVS+sso5HPIzv
         6fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768717; x=1796373517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=nUSF+5WkHldpBYp2kFBBM3SoTyHC3Qs6X1ArykDZInFrYv1bZ5p3Ec0xUwiBnGP7Xj
         ifaWAYEv/bZ6QHDcqjQ4Fxey8KOOVfqI6o4LRUmeI7oz4s+9OCPGs9HVPnErki52RNM3
         5HQbSx0/m5z+jGGMWDQMPi3TFTCJcyCCx6oA4IWCVtSB2fB7OVafR/0W64GIsZz+pMo+
         P0OyXrMFP7E5xgImSn0NJxlIv0NYZEr1I5uwuTazZr9I+PDPolrtQDi5OochL3G4DEnM
         YbDUo5/hBsjupK1kIEY+BBLNtrETCeWHYgRI3luQPBPIcff0CJGU8KpRysavvpQooM4X
         vgVg==
X-Forwarded-Encrypted: i=1; AL+hErFi46Y5l+szJqYgAjSQQY4+9hDyQtveb4NUouH5tcSbwnAEncT6yg/6PNSS4mtRPVwiCER4Zuz68TjWppY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+217FcsL70WftAIG2dF39CqJVLrlhL2KG5xrJLHw/kqydgLCeC
	QYE3Qvyn5S2aoC7lTvnjqLM2gbLjJ2pqpwRl9SiJnGvPqQ7Q/ZQYrWS7YjcjZG/b+ngfzZGJ9iY
	VVB6+i5D3MvL7wRVpRy04aBxJrAgKljEd7Ypv4Qez9eIceScE5aXUo6LUKlxZOsUfzsg=
X-Gm-Gg: AZFdTZfCQ81Zo4FAWahpeyID3HK4rXwy49pnrT4HVGkFq8bk386mTerhBB1GmkRe90M
	I/XciycMvGOynBV3OHRt2CKd8HtUFf/vm1V4xLrx9Bh3JZggPkl3K6QTnforeFnTiUQcp9MjUyi
	IVfElKbItYRKaRVzzd3MKxvDRr/hqy6cEO4p4zUr9wO6+CvgFDcZpsIKJxIbxbOAGk4O08OdkdJ
	5di1dqFmAr1SNjoyKuf57QpeacRcZal7M12X9kyRoFS8/PPcQJmwdVRzR0v+5oQcpvU5RDaywJp
	C0HP1myk4D6IrPFMuk0mrmQxdpCCjpV8MHE9xdMRwQwDK2Z2k+lFTitV0ebg5inxJnDm2g6IQTs
	EWomYvhfmTgyn+dp+TDGoIzG3SOw7soLS5TdrEwLN+uQXx8z9bzQSlxix0aswD3LFrUIxW0o=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421017485a.5.1795768716768;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421013085a.5.1795768716319;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm838130366b.53.2026.11.27.00.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:38:35 -0800 (PST)
Message-ID: <dafa31ae-33c3-470c-bfd9-ea16cf34f583@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:38:33 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux
 functions
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
 <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX8p7UK3pttLrw
 5fHui3mpbd/dOgbCYzdepMCMIRw/3Xa8llYA6mzwmvy5fqJxyZ9hDkzNBj66byfyCYpE8AKxxjg
 makDbIJTBwt7zsxdh5Bm+ZdBGlD8Sk6IIRUugRmmind5q+i950NSpZ2AUZyn7/NDsBXEf6CuMx0
 +M+AfE0ahixTIcXGDGdnNjNLxhcvJ0j1WfgtjdNBCY1I4HpIeJgjudUqGsod/BJPW29H0gWVDt7
 pS/jHsqa/oe6OX4pIb1enx9OoNs+S2xopt+CGOHbf8yq0zSdypK3da2eHeWejfiQU3tkvI0iKEV
 4Gp7K6yoZv1YaiwbxVkE7I7jp5fIukizHh/cau/dCfr5LTeiJ2+4GJDdkcTdvRZ0Ej25u/Bq1tv
 GsyX95uBTX2JVVWkSbLwCu02lNNNnMKoBHK445VGHUTEO5bZVxuupGm8W9doeq4gVLNi236vqBf
 Q+GkSw7oloazLGZsyaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXyIZxWrKOF//D
 LQdhcMsXLEi0QsZC7aG2IR0yi8jhhTdKS/lSuFgWUSki6k4ofihHZdIexRwMkBUmKuRTolZw8qz
 tfYz3DdDDxgdUVyonGdfw15SvngR6aE=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09418d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uTCT-FCyihPU-J8YwhkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Hbk76-2nacVQkO_Gs1rfN_VShDKEMEO8
X-Proofpoint-ORIG-GUID: Hbk76-2nacVQkO_Gs1rfN_VShDKEMEO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270034

On 11/26/26 4:22 PM, Stanislav Aleksandrov wrote:
> Add the gp_mn function on gpio63 and the gp_pdm_mira and gp_pdm_mirb
> functions on gpio35-37 and gpio88-90.
> 
> Qualcomm's downstream pinctrl-anorak driver does not have them. The pins
> and the mux values were provided by Konrad Dybcio.
> 
> Link: https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
