Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455757;
	b=KIcYLwXhnI/IlYtFqXuWqfcXpgpvccEcydxOuAHxaq2otdvG03iZ67QXgxvSm0ilJejk
	 LedZg90fW+mp9JdY+3K/+KxHeP2lDMX7jmMH0ygPKKzUOMHTLJuDZleUtygDwejCjGJAz
	 KlHsdj3h4lxQWISCGHLlE9Za0P4V4F0kCNaQdO8ihLzVSPy/IfIHE8DGW5L2Y7JWnS+7H
	 6wwB9DkH+AydkNuJSlLRvCHfVlcXc8qe+msa+/vStx2BobkGEjVBW/74wi25PBfO7WTrG
	 mwBM2DDkBjSWqnb6AmgRl+R61g7e6BSE4SkqrtobDQRPqSI1gT5sWFLvxpEdP8Jfstg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=;
	b=xRTUcS29xchwdL03Q2PMwQ1vOMF0EFBSBHhW6gJmVZN/+6VyIjy5O40C97eyIbUAxW48
	 2tP653mnsotApZx6dPHiKQ3GF4M6EAOVal5BNsoKBJJUH7yxf5+KMAIGUEd5y0/DSGuqi
	 VYZTXjRFkvLSK0rqH7uaBGIE+5eKGAEkIF4ityOA/YvI3XKTe6z4MPRMYLNuUp1C0UOl+
	 4ULKCOp79G9LUfoajYULmdgcDoLU9IYXKwueosEx8wSS9FVeUrrjuMmuAlAblVva/0sel
	 mjLD9ct+A33GOIHIMkSeufftFCqYH5R8pWR22iVYnsJUlNUfAPvjGWZr5HOHYn0ZNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8UhHcfP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKq3uA4z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B05606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B05606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H8UhHcfP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKq3uA4z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1uL2486670
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=; b=H8UhHcfP5snrnlu6
	IDzJWEkY70MtOBqbSg1CCjdIAd7fiLaAdD9K5ckQk06NVI4RchodtCMAt3Oyng1Z
	uWElkVQW76hWmgnwkYQnYLnEbJKLe2vCdsOO+RiA5Ovt/YiyJB9JKgKip6eytamJ
	7mkE3YGVo0AvV5v1ZxI5cFai66Ebngp/ifAynHWAzF24ET6dv6twLhSLvlwa/5uu
	Ke2lMsJnXn4wMtdTgpHkvtEnanAEVu1uZh93acpUqeYV0KrBCgPiniz8/dRLbzgD
	Fn5oClkrxpBqxEkDF9r1BJFLLl7Zj10aHPf6ExGuzX/oaChXhI8scQdKemvJmDUx
	4UElJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02nm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso55373585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795455755; x=1796060555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=;
        b=dKq3uA4zHwehrbrm+pi6IlngEGQ5JmPiqQQAEkX3z0asFkmNJFWjIVMefpRY4oFjal
         JYvP1xvX2eUf7TDvPRX1+lBssTC8LbfWey9/xJK52lCaF8v2Hp+vJ6+XCTK1D0GY+H/B
         x77nyrhWVz2sW9GdEqhrdaAkqfzC7zRbxkh5HxDH3ZYv/KGRr5qG2zmYaSOyTqG+T7bc
         wO7f4CzQl8I2Ss5SbhTaX+xJlNpNdiLEM2xJnDGwKc5/hh5rai0kHwxexfludDM+KrXJ
         4U15k0/amNIblfUS7V/PqOBi6PJ1BA0cxoLnD4yu3zvT3W2EMXEDn9ctSh0fIoJJnEXR
         W6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455755; x=1796060555;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUF4c82QplpbbwUXkP9CtVUunhZgMQzSeX+rMdmCNJA=;
        b=mBbZBJEEavkPoB8MHtDN4acTfESn5l5+lYw7lOneB7orpBwvXdqN+VVVUXYjAtz+mj
         D3/aLBcskmLZCaH7UQG+wW2sheNwXh9X2aBd8lNnFAVnZzJfN6azmEsQba1vhf/vhLUH
         TSGGQXsgr+lUDw7HjMpYnTkOUiXOoAgPa7P1RcVFipQOnld+Zr3Lu081NoK2Mt9T8+Ua
         aypyvetsSBT0Rl/NINRVRnAqj4bIAKqwQ4D7CqDUJ61jKTzfnPVwGrcmviitMhWd9uYJ
         OMGd6nj/3oN74aQRrwBWlAJyP6pAPtK7VI8VgDHM99l7Weu89JfRsb0g61xG30AuNRLp
         Bmdg==
X-Forwarded-Encrypted: i=1; AL+hErFtsz44CVWnWvn8KtVCFHMWrVadPvLc3tYkhiY6wv6MYoUQPCC+FgqrnMOGgoOvYqBQV6VMwnEpuWsAzd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q8PTk19SfX3Wh+gHCvNUizDMKksuwSYs1UTOt0ndhYK7i+oSh
	ojuPTAuJAhzMsaH7ja7de7d6ZAyxHBtNvs6tw89eeV6oRPTYDcghQNbe2EkEg50W6C3RUJTlzLl
	Yt3GhwUUF4QWAIDZGyb9ws1p0uTZw6x63Cullk6nxlvyXW9TKBuJ9VMLo61lrZUBuEKA=
X-Gm-Gg: AZFdTZdzX98ztCZyP+5nbg3lxsNwZno4qCk2Q7IbRh77ZXgoyGiTJx+tTc9pojOIqt/
	w3zTLy3WboRjFBF7hboip2iYOmJJCPqgyfyb/y5GfMAID8/Jwf4Yp6eL73uC7wJAp5RdD2Eu0g2
	5kh7uXmUko3Z9FZChKsTY0Sf9a2tdxNN1basQCYFDxVX7qpvD7JPyYhkYHuOwFvoLqtcARbiqIg
	IuJXNgH4B82ioGW0/OCSt5/Ai9VOL95haVlZ/+tRN3e5Z1y4rQ1NxI0HwAZIiKuMnYIgsx8R54W
	H4lns8uL2eARk7s/y5unXuY89Qpq+70xxLSYbGrjlr/irXuanzjRTyulyn63GpGgxYpyxbIoA6s
	CBgLmDxodRo1a3kTyBc/H7Z7Us2JgFpcZLvhZN1ETaeM90yBlRl473A6wiA+ETvVoGXGUazl/t2
	Y30Q==
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr1937653685a.74.1795455755352;
        Mon, 23 Nov 2026 09:42:35 -0800 (PST)
X-Received: by 2002:a05:620a:4485:b0:93e:c12c:9b6f with SMTP id af79cd13be357-949bab5bbddmr1937649685a.74.1795455754714;
        Mon, 23 Nov 2026 09:42:34 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm571943555e9.14.2026.11.23.09.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:42:33 -0800 (PST)
Message-ID: <90f6a16a-2d50-4453-bb3e-b4c60f4d2d82@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:33 +0000
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
Subject: Re: [PATCH] ASoC: SDCA: Combine width_find_mask() and get_word_mask()
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261123115205.3498244-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MCBTYWx0ZWRfX4ezTgfNrR60c
 niBuMza3rfqTzq+Hi8W/t16ZCxV4PqjYIPzdFnXuo3/QqYnXA8w8aht7UcStGv5xcelee1X7HZl
 DJ4GZj/vSbgDcXmlm+lPMRD6AoGuiN4COd51DWT233nj2lhuYCh50AR8gF3w43t8sBpV/7amAdL
 zUTDT0wS+ci+KggMGgk++KCnWFRms+D7bkjYf5FjQAos6+1vM1ikSbvNm3QFdgUY3eS3ZRCs49d
 r/Mm4WNMr5Rap2pmUNgx6wQXXMfqOK5XeRkkA0SDBEDCu7T+v/Hu3Zpmng/V89RcyJxca/TcuYp
 n8to6CTYZ5VOmqlE4AkN8uAlfPKSVxAUAAGGg6mCkSny9Tk+ufGadrkt8OmVzK3UMzwFKowAP/z
 DwYuW9VcHsK2NmWzwxqB6NqHIMKRMCbI64pkpAcVBKfRyTwI2UvNYPq8neEQi11PjfSvp/jBvdU
 NEx6wVuldcME5jtU7xA==
X-Proofpoint-ORIG-GUID: NNz5ROT6BNnjFLaCkYJLnfbUqQrsIrmx
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b047b0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=eLmm6ZdPJpfIBFh7QgUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NNz5ROT6BNnjFLaCkYJLnfbUqQrsIrmx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MCBTYWx0ZWRfXz9H+vUYbOUWE
 GinlUHTgCxJkGpRGTm24Ytql4JLjykRzKywLDyH4+9TnSZ2ddtwTH40J1SvGgX+25EY2cNQ+WZq
 gi9DadOn/TjyGYpUdxr69+JFblA3llU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230070

On 11/23/26 11:52 AM, Charles Keepax wrote:
> Both of these functions take a bit width and return the ALSA mask
> bits for that width. Remove get_word_mask() and use width_find_mask()
> in all cases.
> 
> As part of this the function is expanded with a few additional
> formats. The big endian versions are added to the mask, for
> the original dai driver users of width_find_mask() these would
> be added by the ASoC core, however that isn't true when used for
> ALSA constraint users of get_word_mask(). The 3LE versions are also
> added as the memory size shouldn't be a factor once on the SoundWire
> bus. Finally, support for the unsigned formats is removed relative
> to get_word_mask(), these are not commonly used and the SoundWire
> specification has no obvious mechanism to indicate if they are
> supported. So better these are only added once a user comes forward.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
Tested on Snapdragon T14s Gen7.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/sdca/sdca_asoc.c | 56 ++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 38 deletions(-)
> 
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index aaa84156f20a8..d58be660ced7f 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -1214,19 +1214,28 @@ static u64 width_find_mask(unsigned int bits)
>  {
>  	switch (bits) {
>  	case 0:
> -		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
> -		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
> -		       SNDRV_PCM_FMTBIT_S32_LE;
> +		return SNDRV_PCM_FMTBIT_S8 |
> +		       SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +		       SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE |
> +		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S20_BE |
> +		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE |
> +		       SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |
> +		       SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE;
>  	case 8:
>  		return SNDRV_PCM_FMTBIT_S8;
>  	case 16:
> -		return SNDRV_PCM_FMTBIT_S16_LE;
> +		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE;
> +	case 18:
> +		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE;
>  	case 20:
> -		return SNDRV_PCM_FMTBIT_S20_LE;
> +		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S20_BE |
> +		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE;
>  	case 24:
> -		return SNDRV_PCM_FMTBIT_S24_LE;
> +		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE;
>  	case 32:
> -		return SNDRV_PCM_FMTBIT_S32_LE;
> +		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE;
>  	default:
>  		return 0;
>  	}
> @@ -1510,35 +1519,6 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
>  	return 0;
>  }
>  
> -static u64 get_word_mask(unsigned int width)
> -{
> -	switch (width) {
> -	case 8:
> -		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8;
> -	case 16:
> -		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> -		       SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE;
> -	case 18:
> -		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_U18_3LE |
> -		       SNDRV_PCM_FMTBIT_S18_3BE | SNDRV_PCM_FMTBIT_U18_3BE;
> -	case 20:
> -		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_U20_LE |
> -		       SNDRV_PCM_FMTBIT_S20_BE | SNDRV_PCM_FMTBIT_U20_BE |
> -		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |
> -		       SNDRV_PCM_FMTBIT_S20_3BE | SNDRV_PCM_FMTBIT_U20_3BE;
> -	case 24:
> -		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> -		       SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |
> -		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |
> -		       SNDRV_PCM_FMTBIT_S24_3BE | SNDRV_PCM_FMTBIT_U24_3BE;
> -	case 32:
> -		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
> -		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE;
> -	default:
> -		return 0;
> -	}
> -}
> -
>  static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
>  			  struct snd_pcm_substream *substream,
>  			  u64 *word_mask, unsigned int *ch_mask)
> @@ -1564,7 +1544,7 @@ static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
>  
>  		if (prop[i].num_words) {
>  			for (j = 0; j < prop[i].num_words; j++)
> -				*word_mask |= get_word_mask(prop[i].words[j]);
> +				*word_mask |= width_find_mask(prop[i].words[j]);
>  		} else {
>  			unsigned int max = prop[i].max_word;
>  
> @@ -1572,7 +1552,7 @@ static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
>  				max = 32;
>  
>  			for (j = MAX(1, prop[i].min_word); j <= max; j++)
> -				*word_mask |= get_word_mask(j);
> +				*word_mask |= width_find_mask(j);
>  		}
>  
>  		/* Only handle the number of channels for constraints. */

