Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721640;
	b=hPb7TtxIz/X+dcnu4CknDAbRoV1E6tptDyE/B2AAvtVcDKVLk+WPzz3WURyj5rX0PyUx
	 c8ARsbLU85Chtse5P6cHfJAZiBM15JQSAd9Nc/ixD8t3wqwP7T+/rh8em4kB5Z3GDYx7p
	 IMuXEqAQyF6+EkdwC0064GpU24+3wMH5+dIb4PhM6YN4nndU8rGrFFxauXR5RrfwN5x0U
	 39fCLw0hHMjyRSq7cqqfTrjUjZkEInF5Gphu3He0VhkJ2Hh8LAmIvUxDm9gW2ZCOA61b7
	 sKGQcDOevEAw5VW5akCT0cRXEsd3ToHTjkH7NBe/MaedwomQ97SHhsZGmXzeQBaJ44A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xPxcQjB0LjvGxiHNauOfLhUJyAYPTtfw6Qd8NpV6aF4=;
	b=rDnRAcxi1g6vxsMJnpc/PiimuYEXIRSLm1oyypKHZe23uqz+3gqim5PadS3pgEc1ioIp
	 yb4YzWLkT+PrOVYY8/UWZxZs5m5svDObQP0LyMpCVqUqQk8hHiHc79+Y7FTcBGFr/EAaO
	 QWDoN7e1LL7oIEVDZhc1H5UW67wYZ3QA3EFfSjIKKvHSWmX38OyybqFR8uM+0uqO8mNsL
	 HHa1StRv2/JQE2P18MqbwquqfPPOFWbwrj+pa8QqRElvumuK4ytFImJyrVnIZCzR+EtRB
	 FkDwgiGeWfIqQK2e4fTt1T3pUnsNggCObApNwvHVmtlZZk2Wyi01VknBSUMRCLngyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ha5mzg1B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhuJOdtY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A257606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A257606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ha5mzg1B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhuJOdtY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu3Ac3357102
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPxcQjB0LjvGxiHNauOfLhUJyAYPTtfw6Qd8NpV6aF4=; b=Ha5mzg1BMDFdCR83
	FfE1aMau069UC+HyWZvb3ZSf+j5WT53Nm2UXyI33LuZFY6KEp4xV/QcoX0ORuF8J
	OrkSclq4C3wDJVUtPxHFnCO611yX8EU1X/4yeJUjDJ3Mp32IeI7W3v9obAg9q0hg
	UsaZOvgLgekcY1uJytp/nJ3cKLQZBgj4Fw9IoIxf8dSWe79AHyggQldGeS/4Utr7
	7OvBBep0YJ76bAWPVrVdt6NOEXSiyYb6m0Mow7CgMrRp1TMyFCBwHytf31aC2pcO
	34ZnvQNvNIVD3RCeliSdiaFaRWRyTuTWdkwCMqlbKYSjWncDOwbfdByVcDLKaz3Z
	2300uw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfc8ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:33:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so7797059c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795721638; x=1796326438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPxcQjB0LjvGxiHNauOfLhUJyAYPTtfw6Qd8NpV6aF4=;
        b=LhuJOdtYDPfQvYlyIR64eqcKe6C0zA3UKTWhjN10bj6IFUGfsTmY8BwsRh60YwUHrT
         bLYDDDRvAo1VoJBBPRXlPdaRdbrpXI1CcOzQf+72lSNek+L48NMf2qbaMlFMrErLEPFW
         a2/Ywa4F0w2B91FKycElB6+aJJtmbiS/u7w6CXvYh5EDRCTXDN+U3DPKxYACtjF+rH+C
         yOixJgiKoS0Xxv56f7znZZOQJOGuMiyKey2kqRsRPv91DBn/Xpqf7dxcr3aZ0dRd5D9r
         h1Yn718/eImA+VG5UcfLAE14e93TlNO8sYNdXtN8Ttq1YKF1VDaWsUVCi1LU+QdXtMz8
         vgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721638; x=1796326438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPxcQjB0LjvGxiHNauOfLhUJyAYPTtfw6Qd8NpV6aF4=;
        b=LWzSzQhhSuKNpfAm0yGjjtXxdOQyPE8NDPxPNaZVJ8gWYHh1J325SEcqXhlQ37vl/C
         8yqxSsFFUKYSsg0FfEofLm28MFaIEHJOLc0Ci+YwZjKeIrTrT5dKexAwMszFpVdQg7xE
         KSE+GGIDLfMc+k0kpqPbMYDFnKiYezViP3wUuoXOd9WqBtwLHGzHKzxS0+l0k6blIB9e
         ZJvevREPgrkrOahQUQWG9OrbfnqyX64MLNrcMgcsZ+kGXOcK8SkG32nquIgFPaxLHrHs
         Gzw3bwtEVqtPKeif4KoP9h5Q51nthIn4KzJpx+5gJlZgJtagoQ/4giSCZlVjTPrHPsPW
         L/Aw==
X-Forwarded-Encrypted: i=1; AL+hErGMe386XMp8+tA/EeVjKGMYW2NTsKqYtKT4W0EXDWtTELJBRyEfnm2dSkjCmxoH5jXiCdBn64mOm3dfek4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kAgr5/KCoZ972bohJx72I+io2nfDBIXPgJ9p0DFVkWP5PbOue
	2+RLAj9ZYZV3sUqzYh+YoXUs3YftuAGmjIujs+LRZC0Bec5JK6BO9bSFgadmbMmQvwqcvqCCsiL
	jXjZabALmmE8dn18P1oMei5BD1pvFSlTu+9LAoJ+554u5yD9mirFr0ulkjEsk79CoUlk=
X-Gm-Gg: AZFdTZfXRIYghp4UGXsCDp1QTEPW4oX9up1QFBvL8DXBYyIzxmjlp6UyCo/c3IjU6p1
	EJnoBAz2YiNSD0KQSrrlQNXrA8NofJ+pY+GDp7qH2C+uB8v2FTXmuVCtiLqEy+TEW5fSjzQpdyW
	Hg6ijs/Uc0UBe1bRPpqz6Bsw8MBNVyGbJbFM8zrvihj870UnZugsBZ1cve6LVlQXtTsBXOoVHbk
	cpMnelXMPDLymWiNLyDvW6DOnoK+7xbk8jNJWIXNckPE3bNan/K0s3VSz8rJLDCiJghXoj/csBB
	G7MY1LhbtgRmWgMarML+0suecwgvWA+FNut9/Mt5JkM2/hqOXNEm8elXoBT2w45uvNAj9tRJltl
	LxrYP3JOJtK7rP9Pj9nBcngU64QTJ+IvY7SgNXnLHhE9I6lTrC8KDTIPisMrmOLf+1z8bTPvwjA
	==
X-Received: by 2002:a05:7023:e41:10b0:1b5:43f6:74ee with SMTP id a92af1059eb24-1b5567c1250mr19538092c88.1.1795721637497;
        Thu, 26 Nov 2026 11:33:57 -0800 (PST)
X-Received: by 2002:a05:7023:e41:10b0:1b5:43f6:74ee with SMTP id a92af1059eb24-1b5567c1250mr19538064c88.1.1795721636955;
        Thu, 26 Nov 2026 11:33:56 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm42214241c88.4.2026.11.26.11.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:33:56 -0800 (PST)
Message-ID: <4fe3eef4-d5d6-44a0-a7fa-4e9192f536a8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:03:51 +0530
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
Subject: Re: [PATCH RFT 7/8] drm/msm/a6xx: Add IFPC tables for Adreno 650
 family
To: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
 <20261030-topic-a6xx_ifpc-v1-7-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-7-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I7arZZs-mc9b6IImLXuAAyxWBtd1o8n5
X-Proofpoint-GUID: I7arZZs-mc9b6IImLXuAAyxWBtd1o8n5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfXzIWpTAWBedvv
 9ZB/joth9EP+ae4BJwi6ZvB9dAO0k+if+KmSHjlnGDiJGNQR0xCudZqgQ5Qd5ltxtLOwtMIikYL
 cjO2KqV4axjPeB6TAtPuVF8aC9d/9UE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfX3ERYjKA2vTf4
 YD6cVEqTWCIsbCIzUv2tYmfpoVbQbOYUj6hUQxK0r5zaND+ii/4jF9p4lBTsw/yK1s1EYmwrEAR
 HHdqj6yGjfD2Ny50w97B4Bb2NuLXOK++zPtlmqiDtiUHle14hNRH5dwgzxQFjINX3uryRWdCfTX
 E6ljdXS0Z0KoMiDksaPSEKKdjtnILRZaCIgdKQooyX8vUGOwFyHtr9T1rsVaxEauDXXINwE/5mB
 ong7JiPGHFpPPtUXBnlsrCxV91Gy+mGhk7sLvzFvkA8y6B26UbmPm3WI51fV3mxEMMiJ3UauHQm
 W2PsJiccaLgqfBAVVH7PRRltJd7ImWMlLzwf6nlQjvk2Bf9NVicd+Y9ikO3pmoTkfP1NSsyZzG2
 Op9WWHvGn8n+S7abkvAO+sM6slQj8cj64Vqk8wgAUDq5JSN4tVdrqIWvIuRIXcWcZ9RQUdeqe6q
 PoXs4fkyRM27rGdMPDw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b0889a6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pSBQ5sDCE5yABuHJYC4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260076



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill out the register tables to enable IFPC on these SKUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 122 +++++++++++++++++++++++++++++-
>  1 file changed, 118 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 89829fa8f4f4..2d59f7735c90 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -851,6 +851,108 @@ static const u32 a640_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a640_pwrup_reglist);
>  
> +/* A650-family IFPC state also includes CP_PROTECT registers 32-47. */
> +static const u32 a650_ifpc_reglist_regs[] = {
> +	REG_A6XX_CP_CHICKEN_DBG,
> +	REG_A6XX_CP_DBG_ECO_CNTL,
> +	REG_A6XX_CP_PROTECT_CNTL,
> +	REG_A6XX_CP_PROTECT(0),
> +	REG_A6XX_CP_PROTECT(1),
> +	REG_A6XX_CP_PROTECT(2),
> +	REG_A6XX_CP_PROTECT(3),
> +	REG_A6XX_CP_PROTECT(4),
> +	REG_A6XX_CP_PROTECT(5),
> +	REG_A6XX_CP_PROTECT(6),
> +	REG_A6XX_CP_PROTECT(7),
> +	REG_A6XX_CP_PROTECT(8),
> +	REG_A6XX_CP_PROTECT(9),
> +	REG_A6XX_CP_PROTECT(10),
> +	REG_A6XX_CP_PROTECT(11),
> +	REG_A6XX_CP_PROTECT(12),
> +	REG_A6XX_CP_PROTECT(13),
> +	REG_A6XX_CP_PROTECT(14),
> +	REG_A6XX_CP_PROTECT(15),
> +	REG_A6XX_CP_PROTECT(16),
> +	REG_A6XX_CP_PROTECT(17),
> +	REG_A6XX_CP_PROTECT(18),
> +	REG_A6XX_CP_PROTECT(19),
> +	REG_A6XX_CP_PROTECT(20),
> +	REG_A6XX_CP_PROTECT(21),
> +	REG_A6XX_CP_PROTECT(22),
> +	REG_A6XX_CP_PROTECT(23),
> +	REG_A6XX_CP_PROTECT(24),
> +	REG_A6XX_CP_PROTECT(25),
> +	REG_A6XX_CP_PROTECT(26),
> +	REG_A6XX_CP_PROTECT(27),
> +	REG_A6XX_CP_PROTECT(28),
> +	REG_A6XX_CP_PROTECT(29),
> +	REG_A6XX_CP_PROTECT(30),
> +	REG_A6XX_CP_PROTECT(31),
> +	REG_A6XX_CP_AHB_CNTL,
> +	REG_A6XX_CP_PROTECT(32),
> +	REG_A6XX_CP_PROTECT(33),
> +	REG_A6XX_CP_PROTECT(34),
> +	REG_A6XX_CP_PROTECT(35),
> +	REG_A6XX_CP_PROTECT(36),
> +	REG_A6XX_CP_PROTECT(37),
> +	REG_A6XX_CP_PROTECT(38),
> +	REG_A6XX_CP_PROTECT(39),
> +	REG_A6XX_CP_PROTECT(40),
> +	REG_A6XX_CP_PROTECT(41),
> +	REG_A6XX_CP_PROTECT(42),
> +	REG_A6XX_CP_PROTECT(43),
> +	REG_A6XX_CP_PROTECT(44),
> +	REG_A6XX_CP_PROTECT(45),
> +	REG_A6XX_CP_PROTECT(46),
> +	REG_A6XX_CP_PROTECT(47),
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a650_ifpc_reglist);
> +
> +/* A650-family restore state adds bicubic weights and UCHE_CMDQ_CONFIG. */
> +static const u32 a650_pwrup_reglist_regs[] = {
> +	REG_A6XX_VSC_ADDR_MODE_CNTL,
> +	REG_A6XX_GRAS_ADDR_MODE_CNTL,
> +	REG_A6XX_RB_ADDR_MODE_CNTL,
> +	REG_A6XX_PC_ADDR_MODE_CNTL,
> +	REG_A6XX_HLSQ_ADDR_MODE_CNTL,
> +	REG_A6XX_VFD_ADDR_MODE_CNTL,
> +	REG_A6XX_VPC_ADDR_MODE_CNTL,
> +	REG_A6XX_UCHE_ADDR_MODE_CNTL,
> +	REG_A6XX_SP_ADDR_MODE_CNTL,
> +	REG_A6XX_TPL1_ADDR_MODE_CNTL,
> +	REG_A6XX_UCHE_WRITE_RANGE_MAX,
> +	REG_A6XX_UCHE_WRITE_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_TRAP_BASE,
> +	REG_A6XX_UCHE_TRAP_BASE + 1,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_FILTER_CNTL,
> +	REG_A6XX_UCHE_CACHE_WAYS,
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A6XX_RB_NC_MODE_CNTL,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_PC_DBG_ECO_CNTL,
> +	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
> +	REG_A6XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A6XX_UCHE_CLIENT_PF,
> +	REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> +	REG_A6XX_UCHE_CMDQ_CONFIG,
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a650_pwrup_reglist);
> +
>  static const struct adreno_info a6xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
> @@ -1068,7 +1170,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_HAS_HW_APRIV,
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a620_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1077,6 +1180,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.gbif_cx = a640_gbif,
>  			.gmu_cgc_mode = 0x00020200,
>  			.prim_fifo_threshold = 0x00010000,
> +			.ifpc_reglist = &a650_ifpc_reglist,
> +			.pwrup_reglist = &a650_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0, 0 },
> @@ -1180,7 +1285,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			ADRENO_QUIRK_HAS_HW_APRIV,
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a650_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1189,6 +1295,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.gbif_cx = a640_gbif,
>  			.gmu_cgc_mode = 0x00020202,
>  			.prim_fifo_threshold = 0x00300200,
> +			.ifpc_reglist = &a650_ifpc_reglist,
> +			.pwrup_reglist = &a650_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0, 0 },
> @@ -1207,7 +1315,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			ADRENO_QUIRK_HAS_HW_APRIV,
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a660_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1216,6 +1325,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.gbif_cx = a640_gbif,
>  			.gmu_cgc_mode = 0x00020000,
>  			.prim_fifo_threshold = 0x00300200,
> +			.ifpc_reglist = &a650_ifpc_reglist,
> +			.pwrup_reglist = &a650_pwrup_reglist,
>  		},
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06060300),
> @@ -1227,7 +1338,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			ADRENO_QUIRK_HAS_HW_APRIV,
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.a6xx = &(const struct a6xx_info) {
>  			.hwcg = a690_hwcg,
> @@ -1235,6 +1347,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.gbif_cx = a640_gbif,
>  			.gmu_cgc_mode = 0x00020200,
>  			.prim_fifo_threshold = 0x00300200,
> +			.ifpc_reglist = &a650_ifpc_reglist,
> +			.pwrup_reglist = &a650_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> 

