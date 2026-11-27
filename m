Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758370;
	b=kpZjKUfybtoUeg9iIHC5Nc+nVfuIfGIaUPBivL8Apad26GzjmbWcpTRMLBGh9j2vNES3
	 SJlWQufqapeJt4osG3vqTuuznpt78GindoDooa2T6QTY4q6Ypd5Cs1tIfPAV9xYJ6cJjl
	 Sh2lW52ahRwX/5Wh0FHrxD6b71x6rT8ayMXhUarShzJl1LHH0IcsOKONL15/4SAaAYdZs
	 FjuGF9KCdgGq08YHlqcutsrf65p4BDg9q5jDO8zWVzDregG5IJr6n+IiqwcwSyPpHrfKS
	 ftM3Z6e8Mvv6xIpT7/jj4thwhKdvTjKfjziB0Ho/zgRWZhHFw7qzDH4wdsE77o++++g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
	b=FxhZwnF+gzvYBibbEQcvP0I9Kfh6evhlS6EThGFS9kTmd8bPlqrQhOi4F20ZQBAObgy4
	 ootzWpsMTJChOe4xp4d3uaYeVEsu9SLgJNXcp3EYG4gevNnLSiN3OZXOdcKrJFHYSUuJW
	 9zOtu68B+krwe1vbWajCLtJx7Akb72ViVmrpcPPdFgnWFQO04PxLV0NBn/EF4f70hF6T9
	 AYDttGIDvfRM8FCLxNrYj6+8wpnJzDb0JCkZfc1Wmea/2sktVDwHvNsVlvgZdxAgjQUxn
	 wb7E+EOBRoNz+W6cvOUEkks7wK417zhGaYKFoFLxZ00VLkzRzLnt6THwLJ9CtC6ZRFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QX8AIqDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y/AX0Q/r";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B5E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QX8AIqDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y/AX0Q/r
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR5hFVh1012358
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=; b=QX8AIqDw9EUpdayh
	pMtKkspjplitviDn8nRK8PEpDaxbZmLwQuGe3WeBYgQmmeWJrHvzb4oogJ9jRxuc
	74ySR1joHvzYxkrrzgq7dVBL6VLB5q00rAK5TZmOeb9ez6PRKJY3Z+PRWzTtBBp+
	Tp2OcWmgpN7+XpMMbwD3eN6F2c4t8QsD23zyXd8gZKDsJsrgpprtLHnxZ1LAx0t0
	K4KunrpuzT97TaWDaRR0XZ51x41UjrL9hYWDdOSHUTHuLOmQfHic9Bq4IsrOgyMb
	PoVbLnS+Vx+1aDeSc65PchQB6P+m6rb7WkI2G/G22yEKv/Ryc2W9r24+lKSXu7Ps
	5w8Pkw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf91xwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:46:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9417234eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758368; x=1796363168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
        b=Y/AX0Q/rWYrbHmpvSDVVefNL3ygHbo7bsEcAE4E/hpdl8qA7sDNeiSjHCYjuu+2Xou
         yL3QpzrqaxFqdf6QGNjKj/UZSjOlBbsbMEtNiNpvRX6E/18Z7Kt1SYsZxRg3jVf8f688
         q2KqWpjwsBk93Zpq8Tsvx3wpbQJ86FBTV8RQDT9mH3cU1ra+94wD7NCA9PM2/J1qNT8O
         NEWFxlMuYG/TuYbTot73mEhEdCFn71149iE+nPuiULFq8mDA8PC7IilWK7YId1hagJAI
         u/BI3kIkNh4PdgPGt0C4eDjrlXD2BA54r0d8ummtXcuHm68GYpq4Qz09T36VJD0Z5c+N
         /Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758368; x=1796363168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
        b=bJLHDn90tjtNG/fIxhiuQmc3nvVRrU7YkUJbQ4DfurrLm/rWUNweh1hinaO5JHul+t
         GzD6edfDiIqIGqysUUG3runBedW6DU7E7HjT9sKDJaGYfHtkXmaraIyC9c+JUizva5wC
         iU6h+q7kxagetb97DJ9jGRqwnP9DGqFrF8Nw1ICXch8V7gZgnf8BwsbtV74Pb+5RHbEG
         SYdgtYZqjypaHXjYWjTpXcar7JVqyJ7mRT4VUNalxGymkOuTHewYSBU8Nu4H0yW6gdtj
         Bv/hnEGL8sWK59n7JiXMVP/3jNCL5ApR9Bf8kA4TMBcqu8HO9SVP7aJDSJWj706skUlv
         BkWw==
X-Forwarded-Encrypted: i=1; AL+hErEpkPHOMdj1/2e0IfpRvTqeZTsYjmTSygjXwqrPBnMvyvCimw1/n+x+nYPHgOmBHTxLb5r5ziIG6D+IBcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z90jk3dMkpxd7JthFIv9ULLunDTkMm9elc3c5Y6u8yzlDyad10B
	GJ11M6c3Viniw+/ffLEtO88F8godGIzSSLv7pAKEFFd0Fi8+3iYD3foOacR9U69+4zhOTBqMfuC
	ryT6MDHOkq/AIZfTRZJwkWOsWN3ZEyHx92ltjAkCTfOjOM55lwn1PcnJ3/nz+jo+oe2o=
X-Gm-Gg: AZFdTZcYt6WDr29WmVTN2nKKf/Guk3ttHio2kf5z5SLL0n8fWppHYmDtDE1FmTXaVxP
	05WkQGZ9uYVg8fL1J3AbSIpqqLmokF4RmZ/EHtnsS2JA7Hj+Q6yGnSLkBKDAGYP7lnxcH5zfLJU
	e2OA97WNejsN8TN/Qti7/kl9MGLNDMyS2PJ4EljDx+cNyipKl4GGRASylwuCj8gIZ3jtuu0z7Kw
	1YDz76tJccno8Bx8htxbNIXjypTarKvNfB3IfPSPJVMQUl/NzU2Q7E+PyHNT1HqPRwe2MQdeOzE
	qxwnppGq2I3v3Uu3dLFyGYwAT8bdK7IusYdoPT1phfh5Cas28cqgRCrd/R0QBGnQvJysdRWOxdi
	OaJccqr/hJerghsJCnXeUW55IV1XmYR3h9Zp9trNUverguFliw3GYsxxJGz5gntLuq8w28E1B7K
	hdzJfj
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr22911675eec.20.1795758368327;
        Thu, 26 Nov 2026 21:46:08 -0800 (PST)
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr22911611eec.20.1795758367484;
        Thu, 26 Nov 2026 21:46:07 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm77109128eec.24.2026.11.26.21.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:46:07 -0800 (PST)
Message-ID: <f7c526c5-78ae-5369-ab22-2d6f93f9bec4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:15:55 +0530
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
Subject: Re: [PATCH v3 4/9] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oph_euDD3xT38RsUKO4q5e-p0g-b3VrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX7B5vtAbBYdNu
 rdN1nZpwzUWuFyqZPSsrEZjj0XPiLI+/3TTRjFUryHj6C5Y3sV7Dv3f2S1KzSNr3Xafh0Ds0M+I
 BQnTCDi/b8Qhowwgi3/Cx8quPutWkis/wNLLWcI3FHt2injlD5O8iZ/3NudfOHgmpme/yO4fdou
 DcDY3i+/FeGE1zJwziB3LVTLytXsLZPUcufpxntRrkSGhCbjabeHNLeGP0lTTI7T1IKxIihUgVz
 XDJPHAAgNsts8xKnpR4ZcDn1RHkuTZATefgrcqEx572230mkFixQYD4fzDtIX8YRlX+KYpCSItf
 nUUTIO0q0s7Lomz4iBF660W3pPjq/Oex5rjaSh8zLgO60FmvRVNRHfDlCXX96dnHATjQ6+wftzw
 K2lEKkJXJWYXmRYeB0TgRDw8ITVjzNWy3UhRgKhSA4A2EfSc9T4L38etaI/BqUJFFW6m6ib5r7D
 mV+w5+F+kgiIK4Ngtxg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b091921 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Px1Cg1egfbfzpgs1NNIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX+VBedFEm0cHX
 QV/4bV3FuWFbY5930Y9ltZiaXZ1A01cZIT3Faiohxv+yEPoEgHYtr56T5iJhEwUsvu8eJYBqLbl
 L9OK7YK/EhRRLMFZWZ2ZNjpcjpUP/EY=
X-Proofpoint-GUID: oph_euDD3xT38RsUKO4q5e-p0g-b3VrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022


On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
> metadata initialization, memory setup, and segment loading into a
> single API that does not expose a PAS context.  iris_fw_load()
> calls qcom_pas_auth_and_reset() for TrustZone authentication,
> which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with
> a PAS context and can handle everything qcom_mdt_load() provides,
> along with additional functionality such as shmbridge creation
> and retrieving memory from the shmbridge buffer when the same
> remote processor needs to run while Linux runs at EL2.
>
> Embed a struct qcom_pas_context directly in struct iris_core and
> initialize it with qcom_pas_context_init() inside
> iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
> with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
> with qcom_pas_prepare_and_auth_reset().  The
> iris_detect_firmware() scan retains a separate memremap window
> after qcom_mdt_pas_load() completes, since it needs to read back
> the loaded image data.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
>  2 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39..ac73bda072f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -129,6 +130,7 @@ struct iris_core {
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
>  	struct dma_iova_state			*iova_state;
> +	struct qcom_pas_context			pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..b701a7f43514 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	memset(mem_virt, 0, res_size);
> -
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> +	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
> +			      res_size);
> +
> +	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
> +	if (!ret) {
> +		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +		if (!mem_virt) {
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  
> -	if (!ret)
>  		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> -
> -	memunmap(mem_virt);
> +		memunmap(mem_virt);
> +	}
>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;

Please address sashiko comments in the next revision, as they are only minor.
With that,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

JFYI, depending on which series lands first, either I'll rebase accordingly,
or this series can be rebased on top of:
https://lore.kernel.org/all/20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com

