Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769889;
	b=InikRVtN9/zaZn9I7WgwVWhc2dexgj3lD+DlKe1LVJYY526e2ZPGgAkCL3buFUoE53+c
	 B6+0tsnLcbOua/lENDk3gh9fQcU0BN9CpbriqrmC8F0rh7gLUBeY/v8GV6LZx6fixoyuT
	 HkNJD+Hr4QJ67S/rVej55kQIHNJYFrIJe+se8/RTohMKwum6W2tFut3u4bv5UBTEAISH0
	 Z0+Gue8ZlU2qaTJlhozlgDWhEwb+gTpc0h8Q54JfW3HqnE5FTQ7UB3miFLRhACJOxmyxL
	 MEE3bwjpRTXdOSv85FN2PKmi+z6FdoDdz1//8tz9FnLzbtta79Zt+tuUhgOP1pcX4vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=;
	b=MqqjXEfUOJi/YzLVAVGnZaRk141z6F6y9x72S6uUsslq0juEXek23yCDNeRtPw2yNLsH
	 MHXYbbpPU/dKjqNOEnD8a1aa1W+puQZRAXP6t7YidAq0Wliaks/qB/Jd2svV7UiAroEkP
	 HEieGuvV6zjYck1E3Xc/PtVjTzpZIPnIIYPTt3gs+yRHx53t2/N4r6epE0KbRsps2pZGf
	 Rs99F5sc+FZPEochv/G8aO8qDFcaINQ2npgnMUb4PJspoyafNHqWl8IIl+ocrB7HCojpm
	 DFmE/IxlOMiPVXb1JoiTxz/KlM5F69Lj0mTh81E1trU5dONP5d0dA5u8Ve2D1Ofjk6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lk9Oywob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oh9xeZhJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE7606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BE7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lk9Oywob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oh9xeZhJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GlLF2421719
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=; b=Lk9OywobtmU/Ngh9
	29CuMYg7t/As9oJzt9mhYKv8TbgK4y1gkpzUS2DplRkGsTnHJ69jVuo+gA3oJWgF
	1tlPQKzlOEbRaICMeNpeBrbCBBjmyVYznQQeLp1gx9TgxCrANZxbWc3BDaHPITax
	b93SLvu+kd3inrmbizExN2lr6KA2fHBh2acquuo4cUi4MsNNFQMlx6BBcfA5LB3a
	00de6Y7aZyYc0i69YEs0YG6HV9CFQw95N96OCqeLqfFCz2oN7BQEIOUflwMVryoP
	NloIeE1NqBwiZDOaHT2Fh4PeosCy/lXlcWvBHUs/yT6ufSKh6R+d7R49hVIMh+g7
	MWuc6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92pas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:58:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso12360412eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769887; x=1796374687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=;
        b=Oh9xeZhJtQ2T5rYnNDwDWH+lSGlDiPXyOD9Pg6/lxM/XbtJ1FuiPDRVVH6OR0kBbtd
         aoNAw5RXYpGk//GIJzosoKwoY+gV2i/V2fmMd9/4tUXdRdtZzFcGdLnG94HWN7TP6ZZR
         SeGL5f2swvRQfdWNEZp5zjT6rSh7KkANzvtjTgYJNjsVT3P3zBC4XuD4vin7ztt+RiiU
         PTGjRn7EdDrNFIMwjd1Q79mmFO8Jly74hvA6BcVgKLmiEfv9glrQqWVYvvS1ms2jYRKm
         aTGEZOYrINlrBjpKRPYKqG3JBljLN4vMmazAgILZ/SyegHTh9jlYdypj4oKMsewSWWZi
         Vdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769887; x=1796374687;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=;
        b=ng1EH9wZBNlKAh7d3DwKC6fawKWmpSWgN9W5aE5BXPgj0jqLtxeeHXlosin6wHIO1M
         tqkx/E95VmgdSzukdDX7NLFO+KMd9CsWuzYd77xd6/Ew2TrRX8uUtwgLpJjVlf+tIl8x
         /oWvweXsftbIE2l6NDtpRWS0Dpv9lwGuXcwF6VSYBLPjeE3ZBJ2FuMpLyHVTZPSbgrMR
         10jmoPx1/5RsM5Ng31hMQSUd2Lsi5DtFz+3u5WkmR9OuZuw/t9xMF+68j5gh4TkJEu3X
         ilVc4/K5PjwWdz4u35quIVGwpHfUeNEKhsAmLFxSByt+pcob43w+movADQE+qunSqlmJ
         wtRA==
X-Forwarded-Encrypted: i=1; AL+hErEesAcM1Z2DV53If8ColWlyngNNhXvVEqf3WMvR0nSzzQgNsR5Em5YRSQqD7vXjntuhE8ACokeG9PnrzAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tANn0kJ3MAEp65FGYXvjQdLKA5K2+unFgU9itfqf0/bJ9HRVS
	CF5i4xHLvbIX7lleKc5adItJ5+i3UEsuI3yxX1y5eF1Blkj8T8P3sP8plkNXnGIWVaX1JlnYMzE
	0GlT/fX0u6jLFvWw6+I0+YnsyzZoXU7DocHjscACJPPnWtbLk0hlg/UKF6fs/BrIad0g=
X-Gm-Gg: AZFdTZc+421SPs+ACGX+611smo0O2kO8VximYQYGmxRSsLFKpxmGrs9XFpEA7XLvgvu
	O9jWfy5AZfTBNuXN7MErJhdO4DnRtz4mLfdysuzwNi+yLntWP3Sb1LC96e+TIHJ/GpRH7axIfEw
	2W96zVUwrphf5n8U4399L6kVM51j6OE8poqt6NraVWTXIJ0x8oH3z/8DWg2tcbz/M735Fwn/QzE
	qgjT9Dw6yjCTtsEbr8crUkd/fASzYZYKyhv4iRb5WsD4HWgANJlb/H7/locB377kbytiN4jt4YK
	kCvY/oehanxxkUEhM+vT4IcvM5GaAHtd428G1ewgWOzmWQy0WzOc2e952f/G4JVDHll/e9TnDlE
	WdVkcsBewJdAfhEXVF8/3QhJQd5Oy/Bgjz++le6KVBk1YH/w9CnQSrIVqMSlBFqwr3ue/0wATkF
	m/PStw
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cemr8394366eec.16.1795769887234;
        Fri, 27 Nov 2026 00:58:07 -0800 (PST)
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cemr8394327eec.16.1795769886631;
        Fri, 27 Nov 2026 00:58:06 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm63561148eec.20.2026.11.27.00.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:58:06 -0800 (PST)
Message-ID: <189f2827-808c-1cb1-e1b3-3f35278503a3@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:27:58 +0530
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
Subject: Re: [PATCH 3/5] media: iris: Add deblocking filter controls for HFI
 gen2
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
 <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KQXqrYoJjbTdyOdlraeLoO8WWBJsBKoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfXya3Em4zbCpPh
 i7bZNQv6jiyJPUD8nbL4Xhm1mqpR4gHAaNK2FQ3CDwegBGA8nndfARiPP6TiX9Q5JMA7nzeEU0v
 +PSA/F0iC/VC1jE7qN/7nVH/pBE8bteA0DcLjBZOazYTHwu1a3bIpg38FTiuFluNMFa32m0dHYO
 0cjcTYTEggwTjGyHyD3w5r8zCuhpZsbfoISRwkHCxwLIWH9oI1O0t1Va0Pv+n2gLZhtbVFy+pEz
 nJXaC/fnGnk4mICCuk1QsVM2OwhQB/6Mb54li34AYRWQWD9PuKRcbQwJPY/jdHUOKIPGyaSFYIT
 SBtofdOfjUUhLvYcjO8II9g/iK75KwH4d53WwrMPYaYyXCnrhc9q4RUuJ2NqzXikAAsNjHb7qSO
 VxlfvF9l4EgBj1TBZOoD8iV99w5XKwMPH32ycUKj+cEjWGCpl5lnEn+bw3ctOVA8u1T0lkXWuZo
 WSSx6YE7B/i7AcfXswA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b094620 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=ctBV4z7rrj7PSml0dIUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfXy3Lb4i4i38mU
 cbNncg+N54SvU+uYzZuCMWM+sKqCuMXFmU2WrY/vvJ9vkw8eUJOlIsOcnL1isMuCsAmnbklesIH
 n443L9EHOVYAl3xrknN9u1Z7JenXVKo=
X-Proofpoint-GUID: KQXqrYoJjbTdyOdlraeLoO8WWBJsBKoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035


On 10/29/2026 9:28 AM, Xilin Wu wrote:
> HFI gen2 encoders do not expose deblocking filter controls, preventing
> applications from configuring the filter mode and offsets.
>
> Add the standard V4L2 H.264 and HEVC loop filter controls.
>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  85 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 116 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   8 ++
>  .../platform/qcom/iris/iris_platform_common.h      |   6 ++
>  5 files changed, 216 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 1dbea37c93c3..a9b8124aca56 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -55,6 +55,18 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return GOP_SIZE;
>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
>  		return ENTROPY_MODE;
> +	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
> +		return DEBLOCK_MODE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
> +		return DEBLOCK_ALPHA_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
> +		return DEBLOCK_BETA_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
> +		return DEBLOCK_MODE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
> +		return DEBLOCK_TC_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
> +		return DEBLOCK_BETA_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
>  		return MIN_FRAME_QP_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
> @@ -210,6 +222,18 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_GOP_SIZE;
>  	case ENTROPY_MODE:
>  		return V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE;
> +	case DEBLOCK_MODE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE;
> +	case DEBLOCK_ALPHA_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA;
> +	case DEBLOCK_BETA_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA;
> +	case DEBLOCK_MODE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE;
> +	case DEBLOCK_TC_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2;
> +	case DEBLOCK_BETA_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2;
>  	case MIN_FRAME_QP_H264:
>  		return V4L2_CID_MPEG_VIDEO_H264_MIN_QP;
>  	case MIN_FRAME_QP_HEVC:
> @@ -884,6 +908,67 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  				     &entropy_mode, sizeof(u32));
>  }
>  
> +int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 mode = inst->fw_caps[cap_id].value;
> +	u32 alpha_tc, beta, hfi_value;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		if (cap_id != DEBLOCK_MODE_H264)
> +			return 0;
> +
> +		switch (mode) {
> +		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
> +			mode = HFI_DEBLOCK_ALL_BOUNDARY;
> +			break;
> +		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
> +			mode = HFI_DEBLOCK_DISABLE;
> +			break;
> +		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
> +			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		alpha_tc = inst->fw_caps[DEBLOCK_ALPHA_H264].value + 6;
> +		beta = inst->fw_caps[DEBLOCK_BETA_H264].value + 6;
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		if (cap_id != DEBLOCK_MODE_HEVC)
> +			return 0;
> +
> +		switch (mode) {
> +		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
> +			mode = HFI_DEBLOCK_ALL_BOUNDARY;
> +			break;
> +		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
> +			mode = HFI_DEBLOCK_DISABLE;
> +			break;
> +		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
> +			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		alpha_tc = inst->fw_caps[DEBLOCK_TC_HEVC].value + 6;
> +		beta = inst->fw_caps[DEBLOCK_BETA_HEVC].value + 6;
> +	} else {
> +		return 0;
> +	}
> +
> +	/* Firmware expects offsets biased by 6, with alpha or HEVC tc in bits 23:16. */
> +	hfi_value = alpha_tc << 16 | beta << 8 | mode;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_32_PACKED,
> +					     &hfi_value, sizeof(hfi_value));
> +}
> +
>  int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 08db80744420..82437f4e19c1 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -29,6 +29,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 65af61b63a29..a271858fd06a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -357,6 +357,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_entropy_mode_gen2,
>  	},
> +	{
> +		.cap_id = DEBLOCK_MODE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_ALPHA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_MODE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_TC_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
>  	{
>  		.cap_id = MIN_FRAME_QP_H264,
>  		.min = MIN_QP_8BIT,
> @@ -1309,6 +1367,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_entropy_mode_gen2,
>  	},
> +	{
> +		.cap_id = DEBLOCK_MODE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_ALPHA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_MODE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_TC_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
>  	{
>  		.cap_id = MIN_FRAME_QP_H264,
>  		.min = MIN_QP_8BIT,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index e89ed4075526..04e5429328eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -57,6 +57,14 @@
>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
>  
> +enum hfi_deblock_mode {
> +	HFI_DEBLOCK_ALL_BOUNDARY			= 0x0,
> +	HFI_DEBLOCK_DISABLE			= 0x1,
> +	HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY	= 0x2,
> +};
> +
> +#define HFI_PROP_DEBLOCKING_MODE			0x03000129
> +
>  enum hfi_rate_control {
>  	HFI_RC_VBR_CFR		= 0x00000000,
>  	HFI_RC_CBR_CFR		= 0x00000001,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index aa8cd2e1b3f1..75e56d10f5d0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -158,6 +158,12 @@ enum platform_inst_fw_cap_type {
>  	FRAME_RC_ENABLE,
>  	GOP_SIZE,
>  	ENTROPY_MODE,
> +	DEBLOCK_MODE_H264,
> +	DEBLOCK_ALPHA_H264,
> +	DEBLOCK_BETA_H264,
> +	DEBLOCK_MODE_HEVC,
> +	DEBLOCK_TC_HEVC,
> +	DEBLOCK_BETA_HEVC,
>  	MIN_FRAME_QP_H264,
>  	MIN_FRAME_QP_HEVC,
>  	MAX_FRAME_QP_H264,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

