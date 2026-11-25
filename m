Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595010;
	b=iHPmY9pBCQ8w+JAZ6Lu8PHy4NFUX5gztsXxF8dgrY0Aaj8TxRpBJMjfBalaLLG/n1Yg1
	 RzNwQ+60ypX1iClMhr8DhbA1eaUPdJnJaAva7eODoU/+PT4D1W92BVYVKGDE9H2xSZ1jp
	 pKYq6PINfoZ/O5hceiZzXNWAfuUMLNs7Kq6El9OqSSy9RR7hfFc0Zz4zSpZN4cWFQrF44
	 2W8McP3EfFNrlJMhQejj5bLTQVkKhn0f9sV8GnB3+Zq6KNWGcxWF7RwzpqnSpP2uijdq5
	 TOppJPJzWx/CdvhCJY3w16p3Lp9ITswWoHlKMMX/ERBe2xVZo6TmXqbQDKrd8mK0ZDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=;
	b=T5cyg9TsEsIPlOTzDDBctMGb5Gub73OrTzmENlrunWPm4/fuzqsDqPvTIyx13ShGm7Px
	 SumD4tHKvptRW2fMcCT48xFqyp3+Tq0O5aA0XNkMDRCVmIkSx3IYDy9dxZ2X6vpTASsos
	 SZTsPSRKFRROzOGTnvCpE1MTysuaWDNsFkICnytcmyXxtlNc5JUfyd9aqUV0VaysEX4Ot
	 R9CLGlhxRJ0nmyc2wtvjdmIETH+N8INgeAZhT8SBiQQNPOAySLw18oEbNK3uNAzbkXcRg
	 7GPvXljKOENhHDyZzdvnKNd6qIcTIODq2RpgH89TJWcjspmo8KjU8XoG+CndhkdDOLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsP5wUqJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OcA7OZgj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90355606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90355606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsP5wUqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OcA7OZgj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68f7D3630331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=; b=VsP5wUqJpJ2ylKDL
	EXoU4c06v6dT/C4nZzchcdkJGptgYaIJWjKXhvPA3OK1H2NQAdJUlgUtc4dbsV87
	ffAlsKoN4S00IvoayHU7Sp3ee/pCV3gKuQ8uxDszh0ZwkcdpaGfpbgZjZHATL9ak
	bQq+x/6afJb2eLyP7mjWzXbOFb7bocGxYWeo1KryQe3rmpsQnYEWbhAiqP+Ib8CY
	AaaevXAJKDX24w3eZfXpLYqVdcBZ3rcFJ9Mfjz2/a7R14ln7U7vZaL+0tjr+1rI5
	4wBZo0vmy60pyEBvI2cfwUp1gShKqwxRhWEFr8MUiKBnuCAdbDKAv/c8R0i1XNsy
	+/an2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804bgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:23:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so5437272a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595007; x=1796199807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=;
        b=OcA7OZgjLngCELgH8b4hXtd/9GR1G5oj8ZxH03ZoLpZ5x/3QPmFkDCos8vhTAA0EqP
         21+JjXLIi3KxvyZ1VpvcmyEu3O9ZGw6LZQmg//hG1SOEbavxdvwDbhXlMddfDAKSLcNy
         PqjEskOv1mMuEm19sH5i7TddxRcMaLUq0SL8ZSka8eQLzX+sauMRooXSI8Gl7z22Ind9
         uFLq4X19CH6aTvnmLYiTjDaeRoFis1C0DN9bzgLfvHW+nZRSO0oAyx33JGyn3weZzV5H
         KpfoIUQQI2ussoFDabtiMGGAqPdN879+zqGMLv1DPPEQ6zEUQcbiBRRFffU1tubVR2QN
         F1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595007; x=1796199807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7qZuBBxFMJzvGgQTCt3p1+7Q/oOBSu1DLkp5hs7Q2o=;
        b=Ul9jktFnUqR5gFthyjKoaWDt7C/UzyxlO8hJgDY/TW/EcKKukKBhi2sz6KFKl8lMGU
         BipxrNqZu6fpuV/aIJ/f9Mx74ggJGzTyYzhCHYnAWp7BQJ2GvJZltkKtMQcqmB8doD1O
         P58MUJBDPRDZzPI1xr6EhAq4LW85AfiTkBjIZu7O4V0cYsDV2tcd/49V3kpdOy0GaBwD
         kY4zzsNWSu8DpzctrozBUdyCk7R+4G+4f1pT2MEhKaLrHGMLGXbU9ynRShZsBhVVomUa
         L4DYaV6HDeh5mAVRTehQgnDp8Dx9I+4pJnBsPE4crNiithVN/dQ1Ew887J+/JJXq/oXx
         mFuw==
X-Forwarded-Encrypted: i=1; AL+hErGJyNI3ufyMqD6zmX2tAlh/b3qzj2e/zquUU2tsBHVrC4O1Ifs1b9tSxiJWAsCf9V3JjuGiBHHRXJK7MsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ANtpksmi6DZ999obhY0bEbO4JZ4+v9NJvPRFoK5SRtR2jC23V
	px8EggHAc/3yhRl5ka+2CASwvf3MTrM5KPMpnj4HRiZIH5cVZpCRzFllXPzsO32AGxIFs61N8p1
	1FSXC/elHO9Sy1Xt+At+OJJuAs4UfAeMmwSRqc43pLTCCtons1j+HBhdg4bGrKsbZ24SifMAeGa
	Q=
X-Gm-Gg: AZFdTZfRbiTPGcqH5fgic5wZllb/KgCr1uvBCSumCTW4fwAOSRKbypShMtqrXQp09di
	sLm/2pbjNGLu4CDC7pdrAvsIDo+L+woG6jptOjedKCFawn87ZLEU2gCFJ3mFiJqkX88yWJt/M/J
	f8oDQqRD9mhna5JvCl03lThSYJmXvOAD9kTjjeU3BCk5JOiVA94M6OaNGFrLCD0g9o8BBLqKBxl
	IKyORRENlr9uU+X+AYpE0ZoPcfuucHIvlQHu2FPFToFATvKlnTXvRpcTEhujICJEGwwQO2Pxpmk
	yWp/cJonGh7X2M39vafDIhgv0vqFS/nzCkgunycpyfFnnsZo3tfbM1QyYenioumpvDHsfuSMdGJ
	l99aFE3Fkez2FuyWNhd41pt4PDc9IhonLWhSi+jNySRh4XgCMbyi6NF5oPOmT/WRv7zLYL671zT
	0dVJ98syUO1JWJ8M90i4qXH1uy1WwyhOHxhw==
X-Received: by 2002:a17:90a:e7c2:b0:3b4:f983:e52b with SMTP id 98e67ed59e1d1-3b4f983e5f7mr829370a91.5.1795595007427;
        Wed, 25 Nov 2026 00:23:27 -0800 (PST)
X-Received: by 2002:a17:90a:e7c2:b0:3b4:f983:e52b with SMTP id 98e67ed59e1d1-3b4f983e5f7mr829358a91.5.1795595006858;
        Wed, 25 Nov 2026 00:23:26 -0800 (PST)
Received: from [10.239.96.119] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm11420458a91.1.2026.11.25.00.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:23:26 -0800 (PST)
Message-ID: <26d4f9ca-ec16-400f-8f0c-cd5a374aadfa@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:23:22 +0800
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
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXwHy3km6sgDLB
 OISdeugjqzVwytTsXihZzh8NsjJU4aLqZzNcPfKXwRW6cue33UQpuoXoJ1H0qlLaqabdjOaaZql
 QUXoCPxzNuaZBZkSoMkrK87pnyfTLLHT0AkvxjRZ+LWlANmfY4bmAVXodnDT/xC49AqmeYfHlPW
 GOj7re+5tQkLX/ls604WFBmtwAwmW2YHfWZf3vvEAFtOsRIYt0kQDTusxSL/LRvxgKtiisgt+BI
 4Lw9IA2ODm2vrT5YYX7JgPR7CVoGkIVYMRnVgfhM6hUgaGoDAksm+ZxMbgE1b2k5LeJjRW5/Dm+
 ZXOCv3moMG9wLiw96OUxwfYN8SVRi80t1RKg0XBawhvguEwZT+U/6DUGeQ1H27zt4Mn/Q6lsnIA
 0N4UItWhDnRkTbB7fSNJh5XOEN8+9ih6op4uzp/T8h31yHL4OSfoZ8x3j6pSUl03zh/66QYWADX
 gw1x0G20Vv7nDfompEw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b069b00 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0y8wJTrDH0ucKQC6Y7wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eyLI6oMDtGlh2GzmdPAFU4GYkqKvxqWs
X-Proofpoint-GUID: eyLI6oMDtGlh2GzmdPAFU4GYkqKvxqWs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXxfWwMcwu8LaL
 5BzEumMi6TKKjzTU7KjCbU+AfhDJB7+vF4jSUAQGsUgsCeTUNij/YxuRD7Om2JWjWtinL/aXXWS
 EGlLR0bxu68XgNVj/VxaBSCiu0rPJCA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

On 11/25/2026 12:47 AM, Loic Poulain wrote:
> The buffer address written by vfe_wm_update() has to be made visible to
> the hardware, and the way to do that depends on the generation, the older
> ones only expose a register update, some relies on a FIFO, while the newer
> ones expose a dedicated address update that triggers the latch on its own.
> 
> Both sequences are open-coded at every call site today, with the address
> update being additive and always followed by a register update. This
> leaves no way for a generation to tell that an address update alone is
> enough, or that no latching is needed at all.
> 
> Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
> it provides one and falls back to reg_update() otherwise.
> 
> The write master configuration programmed by vfe_wm_start() still needs
> committing, so vfe_enable_output_v2() now latches each initial buffer
> address inside the loop and issues a single register update afterwards.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>   	return hw_version;
>   }
>   
> +/*
> + * vfe_buf_addr_latch - Latch a newly programmed buffer address
> + * @vfe: VFE Device
> + * @line: VFE line
> + *
> + * Make the address just written by vfe_wm_update() visible to the hardware,
> + * through a dedicated address update when the generation provides one, or
> + * through a register update otherwise.
> + */
> +static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
> +{
> +	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> +
> +	if (ops->addr_update)
> +		ops->addr_update(vfe, line->id);
> +	else
> +		ops->reg_update(vfe, line->id);
> +}
> +
>   /*
>    * vfe_buf_done - Process write master done interrupt
>    * @vfe: VFE Device
> @@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[index]->addr[0],
>   				   line);
> -		if (ops->addr_update)
> -			ops->addr_update(vfe, line->id);
> -		ops->reg_update(vfe, line->id);
> +		vfe_buf_addr_latch(vfe, line);
>   	} else {
>   		output->gen2.active_num--;
>   	}
> @@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		if (!ops->addr_update)
> -			ops->reg_update(vfe, line->id);
> +		vfe_buf_addr_latch(vfe, line);
>   	}
>   
> +	/* Commit the write master configuration programmed above */
> +	ops->reg_update(vfe, line->id);
> +
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   
>   	return 0;
> @@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>   		output->buf[output->gen2.active_num++] = buf;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   buf->addr[0], line);
> -		if (ops->addr_update)
> -			ops->addr_update(vfe, line->id);
> -		ops->reg_update(vfe, line->id);
> +		vfe_buf_addr_latch(vfe, line);
>   	} else {
>   		vfe_buf_add_pending(output, buf);
>   	}
> 
Tested-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com> # SM8750

---
Best Regards
Hangxiang
