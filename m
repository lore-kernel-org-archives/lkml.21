Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561726;
	b=3L6a0yzpbHXSe2L7XhNuTFQAurCUEIX/K8xjJhG6DFGRBbDqqc6DuK5JUsfpvz574soa
	 ebCpDf72x5QrAgD4o6Kw91IxX3RqLDq9dBzHjj4+3iH7DB/QcGIWhKPssHzuM6lRD88+V
	 clCletie33G75mZUkMF6b4Qz46CDjNQ+YHBMa6wTf2ewSA7PmsmMfS1WVLz78Lmltp4dx
	 sL1HQjQwdly2Iy9fQ0PWINPCeXzKkaW1L96/t4Cr4FXcpmdSH1cYiRohgWiqsOrYc7MfW
	 IsyALvjI29X9+ZR68qZp+BNqqUCoi5dx1OkvRcClmHKXPKnhcYNBp2ObTehJSj8u9eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
	b=JaKjht5VUgUDIfXPNin5pe/93IMUQsXlXe1um8Jt+Rn38eZbx1Spng0/9Zncx1MemD8z
	 pLtZRjH+Xvmyupm/YJ4/Q+ndZna/OI7/VoNuS8q+NSx633MhzhUJJBfUnyY/D2xbBh+Cl
	 ABX1Gk3YTJOvoaBEOnLRfx5jmbAOgBt9bYG3tABktW/KoLtwC6vQI/q1MtKjhpiDieAlK
	 sRPNrhoYKfrOndk2xZTA1kSU46hOMtKwu+JKh5+cVbkjD6cDdu6mhRkX5ciTpPkksHdA7
	 Y1+QPKC9+hJLiVXTPkaCOXvx6m4K5oNOnMa7mjYKWMjzR+vi82szxsX64t5ubOMQbKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l/iJIxEt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cq7fFDA+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2153F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2153F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/iJIxEt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cq7fFDA+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb8HH030759
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=; b=l/iJIxEtbXhbrUuQ
	a5cKBnFyYsoSufAs/EVmTOrxwpo2KYsht9Y9BZN3+1deUoLwxzBSesaEjq05kxOx
	bT7LVGB8NMr1jjmR2+HcM4E8mLnKHerLEPJm5UJO09RHriIu8akQWBLHqIt2bH3h
	DIbL/4Sf+2cRmsieezdoVMijLVeduOGLA0hS+/5o0rVpXSF9Ggee02GKP4mL9YNX
	AfFyD8nKnOdSkpGaoZwKXp+eyeslAVKIoLpeLFjKpODXbpPM0weemVa+rJeGdnWk
	KVgjJGjg0Mi4NM1bjHvL8xZGzLgOIvwgYsgAyCxj3nzvQWsLmqSH0IKjlLdlPn25
	RZscBg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7tpdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:08:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3239103c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795561723; x=1796166523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
        b=Cq7fFDA+6Kd+Mlrz/HavjzL217sXGedSVjL+Yit+0ZUakI7SYWyf1WEkHBeO3xYO7v
         NxJl4H3Cjr5KyzCUt77oIY/gX52aS53qHi1lMZOgp5ZjwmHN8Dhe1Cbh3Okjtz7f+vx2
         J9I7trWKd9aG68BghmwVEjW0iiTPsdBoi/E0tieaJI/vZnM8NSFXFEIqtqLx+zB38JXR
         eRFXWGral2gCRnj4P8zke7Dy5tN0rDh7X0lx+CnoSLIztYpP8ZAWHF8BLV9Fw/LR83bn
         dmbz5Kf3zv3SDCA7EpSqKr3F8ZvNrzFv5BR5HgDO7wRbC6b/DVfmqPeS6a1ny84+xr0W
         cJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561723; x=1796166523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
        b=fDBYUcmOqWqvRxVKIwe4TcjcX/cnBh9bHxg+oL8X8N6+d4DjRNufE8vvDCGb+o+EOZ
         4LgCiEITyKG9CDP32lQa+mreKDHTzTbAMXNvy6ABVRPcDkC+4DWXlXPHwENlUtUwFNEW
         hqmSa0vgaDLTWiASlre8i2NaOKg246dHqZbKjxsDUPjPeIHADyPMQyPBaM1Jdb14R/H9
         jLv9AbQq2Hc/ZbCoS1j9IHSq9vzDp1AFEz6mnlJIc2CTKER8Bh5vT5hJwh6q+cG1nYjn
         M4trHdPzryyLUHKE7wzaq3WsKZtxloX+wgzEh2RpkHYQjd/uhtfMIReCfX0kY7bWWd1u
         0b3A==
X-Gm-Message-State: APuU4Z8HU8AWne5khVybHnFLmP796qh7raahNYM7zaC4aYCzT/p9vEXi
	2X5+flfBhaIRB8vUH29RnHwoUyF4vM4Et9SyU0hOSPYysPjTNloDFFN3uoE+/3TpQ8xNz175nKP
	gPD60NZq0TwxmA0vmTlFdy/gWRdMW8JRc+wUSuVbQy/uqk2qDTADCLC2XkZTfI6XYUtk=
X-Gm-Gg: AZFdTZe84N9IWw38VF59kqVrgAl6cxK0BfuPALSEvvP2fvtx0JoRwiE9hhbjzhNRJBr
	RJpNp4OutgETTxM8bTNHRPJNhUB3KxOdxhnIb+VXsRQQMjnUC5toIN27qmHTExTPmUXsI3Gd8dj
	mrMOSqPbyjRZRdT1EH9xuv1HVpSEFDPUCTQq4120KKpiWikXqSRNRb9uJwzejwjlpCIN/YB/Gtd
	sitGKOXYp39XFRRReLU9HYqnPmgJN8cdseG0jNFhBS6fi9t1AdeHVxX8f5rbA54Adl1jlYIoKDB
	PJsMw4+z+SgtLiHsqPe+cgc5uEq7ssEsxJALGBLVCqunZG0uzWRxr+CJr4oA+EYarQ1eI04BqHV
	tPG4OrRkPpomn5PXmwkNRcuADLkcyKkoT2yBgo9wMzITClFNnbTJoWSFB4wc8nMIYDCZ/c1JZuq
	qAoQr4cGWeHWuwV1EQnF3YUfXjuVpW
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr15352944c88.12.1795561722511;
        Tue, 24 Nov 2026 15:08:42 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr15352913c88.12.1795561721846;
        Tue, 24 Nov 2026 15:08:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm55030717c88.14.2026.11.24.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:08:41 -0800 (PST)
Date: Tue, 24 Nov 2026 15:08:35 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 02/34] [RFC] firmware: arm_scmi: Additional
 iterators consistency checks
Message-ID: <20261124150835.000060be@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-3-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-3-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX0Q0HAfSN0IWa
 wTVKqhtXBJlEvk6z8kkwRrOKxIvnny4YruK6mBwtqRbkw7ggGFqX2QtqwDpJe2nF8RrINdpGD8D
 hb79WObHl9CjeasNAAu4dku/Kua1wgY=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b0618fb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=8EtlKy0l8xtiV7R28LgA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX+9WQILtTPnx+
 DZ04ExGpajM/s5KmIyZGzP/K0SSIV7e2WDH3NrkN885TRMZbFTnFbOoOt94BaJPN6GLIsnCe6rR
 CFnw+GZsTH6wQaiNvjbmdgR++k7AZgMCE8fPtbdP6sLmVOQ+de/aXo8B91W3gERf8J177JkgkRq
 LxeO1ugRhSkTr5qF2PcC1GFGWpHRoAq3X9LONK1Ir9Tja/UGxEp7KZmbagcgBvhhvCR18yozBa8
 CavRtJDrEW9cMW57l6aqjIB2rjwn2evKZRC1xqhoEpOm6uJY3M/r41RKEp6HCRbivnu3ampKRyn
 S2HIfYMn++89H9HNXzoq/qhnHTQ1YrhdZX1uAgVdExF+2o2M5KfPRoLihaWneqHIbOjCQRwEDlt
 lj31dBHCq/D160vkR+gWkRBr02HrsclplJNKzW8TS807n910uHZNL1pDNcPpelZvE0lm5loAyOE
 IZcgn4oH7mSkCuxvB1g==
X-Proofpoint-ORIG-GUID: pGpiLsrikILVpt8chxOOhI9fwtbvTzzO
X-Proofpoint-GUID: pGpiLsrikILVpt8chxOOhI9fwtbvTzzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240091

On Tue, 24 Nov 2026 19:48:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a few more consistency checks around the number of returned and
> remaining items during the life of an iteration: this is useful to spot
> prematurely terminated iterations that would produce shorter than expected
> results.
> 
> Handling these anomalies in the platform multi-part replies within the
> core SCMI iterators machinery avoids the need to address such issues
> multiple times at the protocol layer.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> RFC because this is another fix that is potentially disrupting for any
> non compliant SCMI platform deployed in the wild.

Looks sensible to me and cutting out weirdness as early as possible should
make everything more resilient.  If there is a broken implementation out there
(and to hit these is not definitely not great) then quirk that when it surfaces.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 36 ++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 55d9cc487916..6dd249c08f5f 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1852,7 +1852,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  	const struct scmi_protocol_handle *ph;
>  	struct scmi_iterator_state *st;
>  	struct scmi_iterator *i;
> -	unsigned int n;
> +	unsigned int n, i_start, i_max, i_returned;
>  
>  	if (!iter)
>  		return -EINVAL;
> @@ -1862,10 +1862,15 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  	ph = i->ph;
>  	st = &i->state;
>  
> +	/* Initialize iteration counters used to check consistency */
> +	i_max = 0;
> +	i_returned = 0;
> +	i_start = start ? *start : 0;
> +
>  	/* Reinitialize state for next run */
>  	st->num_returned = 0;
>  	st->num_remaining = 0;
> -	st->desc_index = start ? *start : 0;
> +	st->desc_index = i_start;
>  
>  	do {
>  		iops->prepare_message(i->msg, st->desc_index, i->priv);
> @@ -1883,11 +1888,34 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> -		if (!st->num_returned && st->num_remaining) {
> -			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +		/*
> +		 * Initialize max items expectation for this run based on
> +		 * values returned on first message exchange: during the
> +		 * following iterations consistency will be validated against
> +		 * these parameters, so as to spot FW anomalies like sudden
> +		 * termination or unplausible conditions.
> +		 */
> +		if (!i_max)
> +			i_max = i_start + st->num_returned + st->num_remaining;
> +
> +		if ((!st->num_returned && st->num_remaining) ||
> +		    (i_max != i_start + i_returned + st->num_returned + st->num_remaining)) {
> +			dev_err(ph->dev,
> +				"Inconsistent multi-part reply. max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
> +				st->max_resources, i_max, i_start, i_returned,
> +				st->num_returned, st->num_remaining,
> +				st->desc_index);
>  			return -EINVAL;
>  		}
>  
> +		dev_dbg(ph->dev,
> +			"Multi-part - max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
> +			st->max_resources, i_max, i_start, i_returned,
> +			st->num_returned, st->num_remaining, st->desc_index);
> +
> +		/* Account for last batch received */
> +		i_returned += st->num_returned;
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",

