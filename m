Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783026;
	b=T9G7jozPUtf5LTvFnuMi+GxJgLd8ctIaCihdK7Xn9g9ADX8Di5xf6rNB1tQO/L+T7JUn
	 zseUqMrirTGmTznKjvFww36HMxTI6lq1ZhvyDCWbt33gbxASa1KoLh080oEI4sKTgc1o6
	 F5w4p1QVMoCKLBEvTOJdJxwqj+YH2tGcjxLom4ccHPeFkwgwIaMz0/fvaj8+23V3uNTtQ
	 7DHASuql3fSKiKvqSF/sGNT+S2BITiOI1OWscoumkQc+E9r3jhCC3+OovaetDc5OEYmjD
	 K3N6r/YgyXCQDMqyJfMZDfkKmQ3BaMYYvJ935hw14SdrkmdcvJPUpA06xRbRJkXKmrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
	b=Zmnb2xu+KNZY98Vsq3a/dSTxlefqhnhltWq5P4Um840E1MsxZQMpMzf4gKVJNJowxfVa
	 cCf1280bn5AoFZHcH05hUA/SIlJ5/X/xMALslvccOXQg5NuOFyPb3ZFBHQL+SF8yNIwnx
	 l4kFTYmVtCLBcl5JhzpZd8UcCMsLT/Fb55KjDrIfZRaCTbyGABtikYrhAo+KnS3pO8iXU
	 8b/EcFIdFzQpIXdxgOqPV9ZZoCZi0wyy8+yKTEHsfXtQlUuHvAj7/77WleSkWgkYjTrru
	 CeYbblcD5qXjAV9MWq6LG01HXZ1UyUbOELJjvIFnYdTZnvqVlHn8+snNh3Um6SOj1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j1M/IWo+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVWT93Cq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34663606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34663606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j1M/IWo+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVWT93Cq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYWa1685698
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=; b=j1M/IWo+FcBGsw4+
	K9HC2uueshvm5urAsoG24grMwN3cYSVizBuz1Ya5f/51SqolpAmiPif3k+QyAGKi
	Tlkzjua7JsClhrlKnl9jM8PH/StObrmcOiA4h6nOGXdhN+BsCD03urAiWSqX1cBa
	d8PNKBF+89kgtIOeS6Ge/XkfEQba7gsLk4Yg0aHHf8Ytwdvr3XYe4AChV0OBUpzL
	wpxMB6Xmz9AP0BHsJAo8u0BbqyRASeiOol1II/HKVznBG1N+hZ1UHOzkPXSb1ZjD
	WtJhI4qpyTCUU8Kvxt6Vnva9IMWGHGh8Y8ESpOWJEcYGJPkoA+dCttM3pAszqYRw
	Lc/m0A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k98tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:37:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4818229c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783023; x=1796387823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
        b=AVWT93CqGnjbYU+lgghuuQQ8G38o4CfXjYy2BwUSG183gqUEoBVqAIcQfuo6WCrMLG
         TZgHY8/wL1viI7l3QFfmg45MRaaxSk0dsLEdVIiHp6no1/ItEADeaQlJZFTkjvBL3H2S
         Xsjw7bgXQvUep4URxW1kJuG2jVU0iXI3O9dUEeGOpq2anlZEBPh5bXHVvay+tREc8Vol
         If2dp6KSwKNJUPvC0Y1u+WiCsOmjJ2IKZvJFWw0ZCr/twGlM1LMiip1lpRd16eUIGRMX
         vs/auD9CqFvM/8Jfd4CJwxmGUgaATauPSxy+nJKMKK/m7jWIvcN2R06FrMCnjti79qrs
         88QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783023; x=1796387823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh8c48r9GrudpQXzXEgvdFAldCpWfhxNFka640a82Bc=;
        b=DoHDgDqAPTaQJ47Tbmx2Tf+mBAmWr6KwjYon12u1k/s581cUrKNDnqPhNetz3fN/po
         00KQ4bsp3QcFAkF3wmFKyPWZCJLgN5kEQVDq0cpICF99awxL8M6NkFy71AGqprtbJj9K
         UQnMrIFZVs74Smhkt3TZouDE60V3lQiuf1YATG/xCqw0gswxggCK03DOHbnVA9E8l6R+
         eOtFVggfYk73SmIr3CsMwV3MicfPl1/xT0MeFCH+BlM5PPlmyWT9n0gZRmfXjTscqQgT
         /nMlKmfBr/49ELe6K50qZsRSyi8QEP1gG/haILeeyyiaV5Kg3pT2Lrg3JbFHD2BtSW9+
         OSRg==
X-Forwarded-Encrypted: i=1; AL+hErHlpCGrQ4a053cJ9CpINDhWZEDuOdXBWsftpGWMYNOS7b+RfI4x4yWMSQxpK9j4Tie6hBG4p5nHDX8wczw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qArEpYuz9xI8xTKpUAr81mdkB3npMvtMycPRr7f5+lZnmEfb9
	lyRojrDuJfPZ6CZp7H/DuArb5ha68p/KZknCPbq2xwEWHhGvSMDw6Q/rasOWkRB7d4ZS5LaPeua
	jqWHnEDCCwKoBKK4iz1PqoAASOjFjxJdt3gaR3PUEoKmLwL4DQ79XCiTKu1JLIcAjKXasbA0kKm
	k=
X-Gm-Gg: AZFdTZft7HEseULfv1lNEvoplfC5pL55eDtckfG34FDkDQbYr80V2YemceRwChJw6XQ
	yc0qPHcxUXKD8HZh7+Q8/JZccsPDwgY+qi6IkJyFX/ZfXJ9B+ogkBC8wjf78mYgx2haHplBB9VG
	Dhzi4NH+eHwauQGXI3MS6lPaik/jRt84T37ULr/7BMAhHf0GvxaBTANL+DVmR3cJPI4wIJL8BMq
	NjzbRk3Xf3E1xl3+7iytB9+M2UAuJtB8Ns+H9fuPpj0cMGpmpE0xKmUXbQLkJrFs3yXhizxqRAl
	qtN4Aeiy6a7KcSOWGp0g4ckM8DKmTWDYsfC4K57XNbc4XKW2Wf3zwOm75qFJHH76k+79ET5NzKY
	1uA6cNkpBZks5b51L1Hhf0qWeks6JquHlt3maLYbLxkvtnSQnfvuiqB1kZCl4R19k9d3RfaxT3u
	1L7nUa
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr22594257c88.22.1795783023100;
        Fri, 27 Nov 2026 04:37:03 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr22594243c88.22.1795783022646;
        Fri, 27 Nov 2026 04:37:02 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b59d8c0cafsm3430688c88.7.2026.11.27.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:37:02 -0800 (PST)
Message-ID: <fd5edb54-0ee9-4aaa-ad0d-9e92c15e6779@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:06:56 +0530
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
Subject: Re: [PATCH] media: iris: Fix encoder reference buffer size
 calculation
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261031-fix_enc_ref_buf_calc-v1-1-54dcba5977a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfXxs6OR0rXfM7T
 VDF0hkhCbhQDP+uAbPQdXHolquHzOoED6N/PKtIzqLvL7cRc6h5aJ8KPk7si4q11/SH5VkrLCYW
 R0rOGuUm/Lma7T3TxbPdwKBw96zfYbYUbVLGViDfOPcbWzjwa5/3yQ04QabnOIo6xSRi9zhd/Q8
 NdnAoSdXQ/0lhlW9NZ1hZCKmxNGHgSJjrowkTYsZkPL7AZscaAbTvCO39JzRe9fHnA/kH0IwJTj
 BQBZcRfPVw3UUTM5VmOdCeo1b6M7EFEOWM9uJjD1VkVguexYV8p/0wed2uUQ53ZwmvnVSbBeO+F
 zGi3by+ewDkdNQICyZdeNe+49hfQF9GrrrGX9lONScsWaRqapq1aBL50zHWJtTSFjA74RVQcJRi
 Vu+SnEXE4ye3JR0AgPQji7vdzn/gidcWSyFnNWdfIBzdDRSM2l4yXU5TTuUuUc3KV42FAVchjSM
 KyZq1rE42WfcOwOUhig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX2eMgugX++niw
 +sniEBPKUwjLf5HnQyex4FuN4Zf1g3SMpfPIibGKy2h599b/jBsOdgZ5M+1K/+ZNQc254B3XyQ/
 KYy6tipp1LSiwxxhNh2w/dFGGXu1HhA=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b097970 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1hkGSTuj8OjxEnJCJEIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: -QjwtMVVYfo_syo72vN0RGG-r-ygyM47
X-Proofpoint-ORIG-GUID: -QjwtMVVYfo_syo72vN0RGG-r-ygyM47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050


On 10/31/2026 1:43 AM, Vishnu Reddy wrote:
> For frame widths that are not multiples of 128, such as 864, the
> encoder reference buffer size is underestimated. As a result, the
> firmware reports a session error when starting the encode session.
> 
> The encoder requires the reference buffer width to be aligned to 128,
> but the current calculation aligns it to only 32. Align the width to
> 128 when calculating the reference buffer size.
> 
> Fixes: 61528e86687e ("media: iris: Allocate and queue internal buffers for encoder video device")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
