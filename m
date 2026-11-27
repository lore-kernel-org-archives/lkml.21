Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772784;
	b=Bxz/5fQGEL7U2MsUlXB1BQlUYyqdEU4IJjxOSKugEutQY2PEyMUyyOhflKraywa8f9NZ
	 lgP1OvNmDMjjjRRiKrl0AgE9C2oSS+3gsM8ake23XaBFf1TdmuvxSJOTx+hRJdRieb5Gh
	 1cjwLENPfWfuifJK1gUVD+dda9gkpGNTD4MVAkuQjA9fjuS3eV71AtBfN5UroMHQPmBPX
	 0h5xc70WNvsXscpQ3QdPfE1MzBfcjtiqjL8A1UQ8fz9alXlUL9thftJ2wiS1BXUkqIT+F
	 uDABjEhA31OmAiSoUcc/AfIainA9TEqUSEjrkiczgF9VvafvkQz+tZyvjxd+Nf3B33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
	b=pXFx/pHM8A7Uvm29WwAU/jrdsCAl9w8Bvp0u0LMjMSWJYxT2cyx6EJBDXGE01y0Bdnli
	 SECI6rey+Xe+6bMDSQCnKVIdeQQGZie/N/qrzrxAYUb3Y/lQkMQlylGLOaTKkMfhpJ//6
	 Ea8dPSsgtkcgPtcK0CBbVRFI15IvgSdL6Z0SESHgVP8f7L8l+KWdadfOkdja7gY2E92sX
	 gVpYUFnSBQ9tzx8rcmGkIDUa8/GaxmrhlHKM7d2nCerlEPFBKGIQLSaEYWLs6fEPvQZzS
	 JwJMJuTCaJGUyGYNbyW2C6HEMlDWs39zWnCvm8a+Y8a/b03ah0jLfwVkN6UnUayqjeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqgV4653;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSUWuVEY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC37C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqgV4653;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSUWuVEY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7HviP3118096
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=; b=TqgV4653DkLm6qkz
	RlPLfQBpnyFjhT3TU+1XMh9kPuI+jN3rszvdilnmyVAVaah5E85sngPVHehl6kiN
	EB0YWygwrJON462cztZYudwLWboBJCWeTTfZUlLOhRSahJjp//V4jbnZrWKKqU/n
	Ta1mIJhLmKi/uf3FyrOD9+vZx7tjtpg+CUUWnu7AGpbCf4A5GSyVF1DV08goR0gP
	rmuq1VmWqUOoWu8xEtRrywr3teSbzl/QTHLq/RuSJtMLu2xf1QUv1wKPj43+fk1j
	Qb1nt1EllfZjGevExiaZxtEYu3mXgwzmW7MuMbVvj2xCgPL7VzaYlrh0kUy8WEab
	w3VyYA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh90q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:46:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386ad819860so7087960eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772781; x=1796377581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
        b=FSUWuVEYy2Z3A4FjS3mYNm51kUraX0wPp8a/BGuYCrlvu5tVXuDj1fl9soR3mvEKZT
         EJs91zKwnRd3uVtbL+z3b/yequfp5+YF31Hz3i1gW5VA5jbbnR/3yZ6ibBIkIXN8C2Z2
         ik1zeLyoknkaXy8I9P94vIDcvT6L41D8KK4g5ZXDybqoJhNlz2GIq3RoEgELu6n+Bn35
         9lMZ/c9ZjD9mKSDpMSaWok+aSv0cIbN5cWTkg/w5JvW/ha24xYXNo0bOcKABAngbGJPs
         36apGIaqjdIEUUS6fKPadbrmaDBMkXSyAQMN5Y2k3J5vjFXcRi7bDBzYHW6oR5bQMj1M
         mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772781; x=1796377581;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxKSlO+moGy/0VDy261jO9fGPMmC050avn3F2JluBAA=;
        b=y9RUDEeUvXTQrXQonp8+f38RP6hzVrX49Ru9p8fkEvvoGMQ0/ixIcalPhjbGmfAWko
         PxtcEDUJAFAZVi8PZAJky84r+jMufkk2pY6CinDVYqqOHY+Euc4X/wLFTxV5f/4moxg7
         LJY8sRCgh2e+L+X7nzwFFwAiZFx82yULcmG5IUiSLxODWEuG/5N+xw6HzwndryilOlyX
         V77cfKxU8gKMGXIdBh94mxRzPitCJ4H3S0kIwQyieQwco2Yat4F+y3ygASVy4Aq91sJN
         9fytAVx5bq7H40zU3ohVEc4QMrpmPzaqtS1qk/JF2Zqn60zVALEAjPdIeEF7sr1uxcBw
         QD2A==
X-Forwarded-Encrypted: i=1; AL+hErEljgHNIAerxQJp+9Otpp1ohxWbAz7mt+7ShwCxdkYq6oRXSdfN5MM1FBteeQLdOJ5rHhOPMx6MjNtu0Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jHeLlHPwR/DWtc0ILvKrUdXXbdj8lpIEBC0YHIf3jRZtoF7S/
	ErdtM1FzX+2HdC3YaJNwpLVQZ0j3aGlFet4jVJoQ/jpGuJELgLDZeLsYrdco3FFy3zo8zgGI0Ys
	enc9TLmnDHgyu8ta5m3MhYrAYhBraa6kBzMfsrH/GfU7MsfLFardl6gGSehmJhRc5zXw=
X-Gm-Gg: AZFdTZeqluh8B7iuQwNZYRgwHXR2FsMcG0lx4aox5pcOWdXZatoHYjiKOMkWR7OUkTO
	oGFqrlxmOg/nbCk4zO0sCOT5W7z7UF+6/ljBbxs2MXS08pL6QSlfnp8fEaTDvCNDR6lBBAVa3OR
	VL+9iKzLbJjMgfNt5JzOXVgv62U3HfGQOK9b8oujlgCDEx5IWJ5nSAvaxjIyUuh0UwNlntVfJPz
	i/DjaksZ1nyHE62E4xtULfv/yD8J2v2IMCj+AgmDfUKPdjcEjQy7ZfkKsyUysqnmEomrrLasx7d
	IXhXaFl1dDNrAl7Ezog64QV9+ZJdFmPB2PzN1TG1XBlL6SawXLhnuKYmS2/QddsRtlvh17/EiKF
	jG/jcjk1qZSoOrzRE/9nagqRaWn7Z/nSPDgD0HCcSaYLzPcGZIlkbnb0kDjBMMPtDpVBdZDgXfT
	XrAnb4
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr7306861eec.13.1795772780922;
        Fri, 27 Nov 2026 01:46:20 -0800 (PST)
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr7306841eec.13.1795772780452;
        Fri, 27 Nov 2026 01:46:20 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm66869920eec.16.2026.11.27.01.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:46:19 -0800 (PST)
Message-ID: <6ca6b0f2-575a-6c1c-5b97-73f22d369438@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:16:12 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
Content-Language: en-US
To: Xilin Wu <sophon@radxa.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX381/t5ZCON4c
 pvcwAfJwyme89GPN/rsbKEucgtyQRBUlxDOVNKIAg58zfpbvO56L5+Bf2PmtSkeAzCHtVbxxwft
 GO2UaFbiMdvTx0ejh5JSFH5V47bmS+CTWVD8otMCwAq/v324q3frZbUh8hhRYCXJgOrV6JMcvpQ
 vim1tNMAtlknJkj6EySjpMJboFwFGZJvdjvkIMoGJiTfvNRAVj+oHRobYQtvNVpEOTld8GMdBr9
 Mrv0243Nt6miw32jr1GuM7alJihDsUbpvaskPZxSqN+7XrZgF2zcdG6iKlg3NgiZrNXxVvJ6Tez
 U78FR2EUiXGCCT5mzzFZ4pU5IgiNniBE34Sa4fP3VWUo6Q8MvTGbyXHlIpL42Dv/pWrl+/Yt/pR
 Wx4ROli0oRXFJ6VslsOmrqPDUO27ne8DNmsTNw8L7Qj3ABd/9U/eHyMMa9DWequaDR3QhE8u+zw
 z8IhxvtlUFcbb4PcAuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXxe7/l6EJ/cIV
 3ZVnPur8+Hp8CUZUXUbjKAOoOtPOWeopxOOTZh6M5k0QBzmb6ylvoJ81YC6ftPGiPGSCN/rpBUB
 XWIy/iMd/iOkER7fJuxOoYCJT1pU4Mc=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09516e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=pyson8MKFhwrqUQxeQwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: VwLxGh0ablxOvfh7lq7ayDDJcxDqovTp
X-Proofpoint-ORIG-GUID: VwLxGh0ablxOvfh7lq7ayDDJcxDqovTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270038


On 10/29/2026 9:28 AM, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
>
> Preserve the firmware-provided timestamp when returning an error buffer.
>
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..f790483d13d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>  		state = VB2_BUF_STATE_ERROR;
>  		vb2_set_plane_payload(vb2, 0, 0);
> -		vb2->timestamp = 0;
> +		/* Allow userspace to associate the error with the input frame. */
> +		vb2->timestamp = buf->timestamp;
>  		v4l2_m2m_buf_done(vbuf, state);
>  		return 0;
>  	}

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

