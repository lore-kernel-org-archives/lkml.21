Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783115;
	b=2st5pq0oSwNpLaZEhxUxWjwO9aosTGMa4AkkOp+4q0kAma5VC5Gm7jGP2jwnE6Gkgbsv
	 GtojaW5JHQfwdor9cDOB2t8y5M9wyMXFrrSmqH431FMp1FgpmzunNTwJzdvo/nmpvUBLa
	 FOv679kG7fH3d8oZFBbPmoNnB1Cff8SzXni1Ii+7FSYchDExqRp+eTI3YWeVwahUlKuaL
	 coQk101KMw7rFflv/xGBr2JviEsUeGYNmHU1MXbZrBF3reSpD8RH3gaIMHsWo17kwvKiQ
	 Mg2UiJqq0TqcxULjisxvtaK0jnQeOw6TDoM/2bILOpBsr94Fr55uncGTwIet+AWBIIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
	b=L7QAxg4SvJ+8w+xVo+sZHwAOOACTzO0O/kPsb++c+Ny7tjjxIn2K9thtKl8e7bekytlR
	 G+HwNoptxqFQ2I4Wtiyto/VZOo3rLdvOCPwGx4W6RxrsVm/s2zi4xCf8JgNqHsMmNzNYQ
	 EaTXNOpO0kXrIpYxKF7DniZLxie2mBQUM751KSTGW2L67Htk/dXFjWTl3pTwKJDWucaI+
	 6nxF+ud49CW/XN/p1xI1UIxdR7S4zmRqS9ZwWyJC/M4meAZubiVhjgOnnKOOGPNrYyiTX
	 KiG5/+agmT8GEO+Ei2Vkppgpk1IKVtIMK/J1YKiI9DiTEtrIS45kLyigz3AKDr+6ekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsVD7nYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K7oTcFTg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC36606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC36606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsVD7nYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K7oTcFTg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApVC11685549
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=; b=OsVD7nYemQhekW+f
	MgqDMfW6xtVAqohPNaln/mjk0f598jSdZ3jjOLaW912eROmGX8PQz5nJXPGZey9w
	l5B3qubGjlPmYQrNzOwF1gbwa0casEQjd+DYCODHkpz7FLDqX+DDcrDdtOnUzFxF
	inYM9cv391V7CHSyJxl1nJrmwADZiR6SPcgVXAybDl0MAy5xmObe5I2eOeplFNsd
	m9WM8zkFpJoG8GzwTPd4w5gs84DQPJraEqYP0QiGWnCtIbyhP25NykOV1KlinxsI
	gVGCqMquxW4xtaH8eB7Ky8HP+4w2zOSXjuPlLavcdkkqhM+xv7X8SgzV9GLGnzIn
	+ym14w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k98yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:38:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso10107324eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783113; x=1796387913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
        b=K7oTcFTgsrOKKNvyzFPX6UYCSKWWB7QEPTfnuYn7drrq9d5q6TNIwZ905xZrumFLD3
         yhANAtknJcKw5/SPwfIoAXJVtUoyasynNDMNXa2bOiO9vFHFcLZYZj6Oh6lZxOVjprpl
         R/DyvJDAn2D2KntHlj/dSjwZ1LYGZjTxcxI6XQQ0KH34Xu0L/LJzBYhqFDmtalqWOd7o
         wFIMYlQqXFiJ/8tZxVUZPeB/Bi6ZBtW1hwK3bTAsIvj8K1CI5GbEVZ4n0FzUsWjURBZK
         lc8VNtOA89TDj9YVWM4Ga0EnB58z9C2xn/ZLb6g1gJU4kfNjnf8jje67siyPoU1MsgfK
         zfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783113; x=1796387913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMa2kCzEW/leD9xf1rjAeGaC0mopa8BovnBv42DRtl0=;
        b=q/pbNglsICCh+Q2HgiDHgqBeqUh4S9FT8Pjjb/zicNGuLgN+V/BjMpAqTVwlGJiKyn
         royhl28v/UhB+3KL1+4vuVLvHirHSKputjeG0R8nHZ7ToRtwaL23tbGLIr3VEoNj8vh/
         PHOCx66V1xM7qJek7zPQxgfqicKNuJgXMsZgrdnhhlfXEwgjTWVO084sNISNt/Z6ED9U
         uIDgFfH42XhPLoj7Cfc2+QIp+mO6QNF8efNpz7K9IzE9aD2I/QSDkjzZZ1ZiNEnd6WeY
         +Wgud99QNITyLc6Be+Bae5vWQU9a+/4WyoNtxjZ8puthUDqhTIRwzCuAPKt+enVzf414
         aofQ==
X-Forwarded-Encrypted: i=1; AL+hErGaliQPWdakwzVJ2jSRzLIVtgEiUbL1hZVI8lQ61KfiCWL+K6wwd/3KMIioSvaw59G9u95evHhvVqOC9wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cUEG62rWL1KYIw1f+LC2gF4GpPNH9XfPI3BbDHxQ2sDQuznq/
	10QzcFTuSKwG2PYNldXy23EVkwHbU3APsem+O96Ky4gpX5F4JnekH9pZx3GeDeYvFrWyWAzuZWH
	Dc/2xXAlGpQBsJqwh81ZvmlJH5h9Z6w9yeu+OewjR5SvcsqgHl67jmk4klOMy165ZeNs=
X-Gm-Gg: AZFdTZdkDKI3MH4xmBCucUvvB9x3JDPVlX/UvjHKk26IEaNdfAZzFCsmuisGCLiBRoj
	jS3I2dHX0CBO2hQ11DZYbfFhmP9KlkArVh5z3lhu0tfT92JbD9blCtquRDWLza/oR04/W48rxo5
	rP/T4+YbEe3b6pXsMJUDACrjjVsqoNoza2XIk18b1MNwXeK0i5mUlNXNV3CEILBk+MZxmg6GNER
	mzjx3oqM8kQ7+ayoAjGZdL3A56cDTvKzpH8OyNJEnC5TBuVXxkQIYvg4CqTGMtI3AJR2Y4frmXe
	X0ILcbB6QSKCwZL5qr9UcvqJKS6FbHI62RNe7ZfuFMGjyTsn38XSZXnkSd1HNP/k1FjFgtNUI41
	fSjeSeUX/vj1TEnaisURN4kjMhhUOeF2ZaVPEINtyd+xjMCSnkMduzhVVLAYhI7DHLor3EGpFRj
	1tYJ1E
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr9901036eec.10.1795783112969;
        Fri, 27 Nov 2026 04:38:32 -0800 (PST)
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr9901006eec.10.1795783112393;
        Fri, 27 Nov 2026 04:38:32 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm88060568eec.10.2026.11.27.04.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:38:31 -0800 (PST)
Message-ID: <ffdfe000-fff5-4498-a4d9-1de2e0f23707@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:08:25 +0530
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
Subject: Re: [PATCH] Revert "media: iris: reject open() when the session limit
 is reached"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX0X+Dnfm9Dx5M
 HrZ+2zgE75W/47IdFrqItUqCu6dy+8rIbewHC5VSD4EAXRQQfNcA2Ns8rc6MGsTxtskwn726WJW
 a0U8LNg+yL9cQL9o/aoo+xFYCQFX+ECAnXwqvg5XW2yMC+2wPAbW46967NE31+UMZp96YnLMQkw
 hjlq2BEvzLJ5zi/SjwHaVjpkcmQdEbNjp02i88jy3gxj5L+VXO1AQGfiU2E7umja0s00ZoIX8ND
 N17Cvkp4qysIKqMAMVnG8fqP2sqnpwYLvooMFCH/4hqtNiOEoN5uqMJtSVuGZqDVhS5PRuFGu7z
 d1C4IIiXWlnaCR+JILB1PahzclGi/3DGLv/dR2SgoNrnw2nGmBW61+RZny3IsdxHXpoVcauz5Vy
 yfj6MmXfx4IQa7tgkmJxAsYTfGeFYeGAy1DxcMFUu4ycnVQAvxQf1VLJ5P8TFN+WhKG51wZp73E
 C2ApR/aJdtUkSFtvR5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX7CYqXXMzEX4j
 yYK0DzR8G6iNinXK1umh8gwFTyHcHmxrIQaroZzfz9Q3siFuJ+M17wiQcYROv78vgqh21baSpjZ
 NHWbVN/sKNKfOATj1a2gcm2S3fPm/28=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b0979ca cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7GKYziPKAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GeMy74hU6CVubCBKRZ8A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: LVG23_nbq3f58EWda8Ix3ZuYSVUeRB7n
X-Proofpoint-ORIG-GUID: LVG23_nbq3f58EWda8Ix3ZuYSVUeRB7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050



On 10/31/2026 1:45 AM, Vishnu Reddy wrote:
> This reverts commit 397ebadcbc21 ("media: iris: reject open() when the
> session limit is reached").
> 
> V4L2 does not allow drivers to impose artificial limits on open().
> Resource limits must be enforced where the resource is actually
> consumed. v4l2-compliance verifies this through testUnlimitedOpens()
> and now fails with:
> 
>    fail: v4l2-compliance.cpp(773): !ok
>          test for unlimited opens: FAIL
> 
> Link:https://github.com/gjasny/v4l-utils/blob/master/utils/v4l2-compliance/ 
> v4l2-compliance.cpp#L747
> 
> The session limit is already enforced at the right place. An instance
> that did not fit within max_session_count is not added to
> core->instances, and iris_check_session_supported() rejects it with an
> error from iris_vb2_queue_setup() and from iris_vb2_start_streaming(),
> which is when a firmware session is really needed. Failing open() adds
> nothing over that and breaks the compliance requirement.
> 
> Fixes: 397ebadcbc21 ("media: iris: reject open() when the session limit is reached")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
