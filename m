Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101293;
	b=cOTFh/SJXpEOEpqlsPFJuu+Vdz5Gb08nuMLxDPvTpFh63gXlupOdIJaJ8n13HjDp0Guj
	 0Uepfzvt9Z+NNl1mG1bJ3S56TUV3r2RJLy9mwrEmtWMwR2dDmkXCY9Jaj/5YYEfft0Bdd
	 nrqI9KsMJd3WcMdOFndljL/E79IXDCHGlFC+VIfrxJd8+W3iaFBWzh/biwm4x0jYdhZH9
	 i1mX3rnJ2NQu3Xb5tSL9v2+Usn2orPG7lvKylBhwGRKrJqG6wcfH5FjES7lTDS8LT4GuD
	 Pr3iczkwH/kVvIvvY7dkvlHJRPaGDkEEfkJz4WX5XHwocVlGeMt7dXG7aqzistzpBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mQ68OX60OS8KA87kxHrWa8kzzALUApqKQHVqe4uRyAc=;
	b=AhbW6bTVTqdL867dZTUiKkpi/xZN0+bXj+i0O7dkIEPyFH97Bo7Eb3i+tynHg19gW567
	 5pXFbgUFi1Ds7+DMOCkQyz5F3wdNrJJhABOyKAs6A47B+5Iq6TwT9ug5Ki6BNta4Ay3nf
	 SB/U2aO6470d1DclSMEYJdCAD7QAPOxqKu8+1oeR2EYjnmXR4teQbmCVyWS4rXwYNxyNL
	 nXwxegjq9TpRWoRcWpgZe8N07VVYqHshz2TVM9IU1Ef5gz9V3J/oUakX5cEz9XM6xknJw
	 iWKqy9gsvH/p5BKnEdyU3aa1q/RfO904SC4rPKOEHZ7k96P1ommHPz/uoJ1jYOm6Kvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJFN7lq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb6hz51l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A14606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A14606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUJFN7lq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb6hz51l
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF69ie2619616
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQ68OX60OS8KA87kxHrWa8kzzALUApqKQHVqe4uRyAc=; b=oUJFN7lq0AkGd8Ck
	cINmMt3IGamOO87crw0/ZSEMUMLaKeB06cDH+0HipsUipHVx2Vx3IvmNa+5TdaMh
	nuDxXKr4oiDYVk+pnBDbmq1OT1yYt9neG739vpgGgwyUZqx1GkczQ453xW0Gl7v+
	CK3zT6bK03wgf8y7YXCwR7smJH7yFLOkW56uB9JwbENVgYlL7YqLzeFMnJ9pp/q1
	SRvkmMaFh86bW2aOYrHv2dIfXV/dt1ThmCn7FvlnrAieE7uMPkgwlSk/zasbUibC
	Hk0kOmJN4gdUOhXBkphi9IvIemiL2kN73WXOvlpEGClgBhCvb1msuWvDl0Ry8kc1
	yLqn1g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx68xgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:14:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8c5408e418bso1739385b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795101292; x=1795706092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ68OX60OS8KA87kxHrWa8kzzALUApqKQHVqe4uRyAc=;
        b=hb6hz51lBICW+Tqr0wYv1wwhMhHeSmicBi9PYxGdA4ndHjY3PZwF8p2zl7Frhg0x0g
         nTIpqzyMrns7+HF4Q2b4YMrLe8RjMaCocwYfea/oHodspHaWlnDYE12kcHyUAi1IJqUq
         MUV8DJwLjdmwxWuT2shk7GMh7u/Zkest58u1WkHVdjfuMLmtlod4eT75aiaiWFowWEEb
         1MBaOxtBBSmlObKzWwpZsKs8DET5+NMb8+6w+4cweRbq220vxjKB3R4ZuhEOSfqm23VZ
         i0QTHwkNNi5SkzvMxK1nLkRTeQYmsHti3vA9g2Im2bYoyXUYDQTjezXsKiPcUyxBECRB
         dNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101292; x=1795706092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQ68OX60OS8KA87kxHrWa8kzzALUApqKQHVqe4uRyAc=;
        b=F4O3F7AwwUp/X2WBCLGwt974HDl8Y5GYIV2f3H4cjLj20YgKKUpt5VV1/guiADvwIh
         onQlEa6vSXdGOpYy6Fs011aanJc6+ApJMNj23tdNWJYuH458R1QmskZx8L7Z4pUDPSBw
         kG9gR6Hirk0SvEilDGoXVQ4Md9UJ7QVUfFx7vIiSZlK3A3BMi77HiHDsXUAwgeW87+gw
         +jpp8AsUWLpow0xzVEWEEnvyWH7fOCNQPk0uxOYh9IJGUROw71le5TIKO5LuvUGMfVLh
         FEuruV/Yd9p4igreRGZhDTIr30IYL1Xhf4OcTl64N6rpIE14QqIaS9on47p93X6x2TtN
         st7A==
X-Forwarded-Encrypted: i=1; AL+hErGly/LxWPg7ObXvN+2Mo6hx0/0H9uKuS4dWYfqQnVIFj4EE4gEHbfaJR1eWIUzwV2gFPUsa/nDINaMD7iw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xqaWr10vbXPWsrP+xVhhV+j06yY5entzhqaIZumrMYItBnIq6
	/4DCd8x1AP0Div01SHNLq4udC4wIh3Gf+9f6lQpVTfjy8WFiGVDNCJRFUA5/9Zcff2rFmHX6y4t
	UuBPhpLgbgdm2IgkPGiaA+yi3E6t5JPDPSuhOn36Pf+dAL6K4sVCF2qOzk1aexIeR+TY=
X-Gm-Gg: AYBFou1NKCHAMBpTKmOP+W3gh981pHyriRDAFJN6sW0OZignAPVVnzp43swUHF1/nsD
	W4IKbHsbzcpxhEbnuYS/cQdzfTh+GskfizG2eM7p0LskAw0cyPOs+N4KtYBxuBX9TSuxy8UZuIB
	b6W9Vhs+/rEgOHUg/QxjD/Vp7H+bhmk28EMVbhB6t6D9LHLTs3lDZMBOaikdQXd3zuAA0zFsMdl
	zd+fByytWbJbpkU3bCUg3GofFTlAT1p2Q+g2JiCZCg+3B4wTy5t2XyDHC2AsMTUtU/DO8GyIdmb
	2rzga5h4FGgBkRIK3arkPazGWZoBlWIHyedRxlGeWu/5ZvsYQ8A73xafKMUaZyUcmFkMW4/iy8Q
	20wtLIofT9Ga2uG0XDPYbdlXGidltw5Lgpp6WNLaKOCEXkB3BwdyW1q1zp6IC+9Ux8/+WVJo=
X-Received: by 2002:a05:6a00:450c:b0:8a8:5b84:4c04 with SMTP id d2e1a72fcca58-8c5d4faec5bmr5605897b3a.38.1795101291462;
        Thu, 19 Nov 2026 07:14:51 -0800 (PST)
X-Received: by 2002:a05:6a00:450c:b0:8a8:5b84:4c04 with SMTP id d2e1a72fcca58-8c5d4faec5bmr5605854b3a.38.1795101290823;
        Thu, 19 Nov 2026 07:14:50 -0800 (PST)
Received: from [192.168.1.8] ([171.76.86.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm55144b3a.17.2026.11.19.07.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:14:50 -0800 (PST)
Message-ID: <2c6e86e7-734b-47ab-8699-aa07b5a35e63@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:44:45 +0530
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
Subject: Re: [PATCH v1 06/12] thermal: core: Calculate aggregated thermal zone
 temperatures
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
 <20261119094706.3439040-7-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261119094706.3439040-7-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bWCIjC7tjGDJfXadz_YxDok-kUOnhoBC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2MCBTYWx0ZWRfXwt+6ZewrJu/U
 z5yN8MJxw/MhK+TufrMQJ6Jysd5w1zX/rhret7nqB/QvbUJW0Xll0qj+me6P9FjutxIuDuXW0TT
 Gl1A+FRvMIpHGjcQLTqwW0MAcEvDhl4=
X-Proofpoint-ORIG-GUID: bWCIjC7tjGDJfXadz_YxDok-kUOnhoBC
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6aff126c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=87ZocSFwOvG5wiH9gxK4QQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iNLAzDncfHITCqKQpZ0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2MCBTYWx0ZWRfX3JGGMG7knNwh
 26kNbQx5TCgY0ICysG7n54gI02ZE5d69ENFxXvweHc5I5KSxFIyM1QadFeDL0yoCvslVzDKgHQd
 t3TKTR3tW/Ft3kR4TWyRGIfaGBuzCCwFr4NIP/d5qpf7NOu5585BIwXU2LfnSRmVPqUz44qYx8o
 3oZYl7ybXqIT5oXDa8FnrHaPcutoG9QFpWQn/x8oO9OMyoIPAZtqTY1xish5tLKhwcXz4vHMjYR
 Xwgm0pTEqY7LgfUNL2E4FRqtCEoKmMfPUnkmwK7TW2kLd3c2zr/FcKawIZtuZl639ifWWWFJj1N
 T1V/9d24zHAxjd7/VSdSUMqmwOzEIMAtnEprvj2k9ktI/mS20XYmTgDRw64LYIwR0HXRmZMaugQ
 4R/foKGuFFfWFudW3r5pGiN/RAhTy/sDRrR6VU9O3p7lqOEowkWeMB8QclVNv96L6/5H4Jh0PD+
 FvST9HI4fgPmYrC1MhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190060



On 11/19/2026 3:16 PM, Daniel Lezcano wrote:
> Replace the aggregate temperature placeholder with a signed fixed-point
> affine calculation. Accumulate source temperatures multiplied by their
> coefficients using checked 64-bit arithmetic, divide once by the scale
> of 1000, and add the existing offset from thermal_zone_params. Reject
> arithmetic overflow and results outside the int range without modifying
> the output on failure.
> 
> Read each source under its zone lock and preserve temperature emulation
> and error handling. Use nonblocking lock acquisition to return -EAGAIN
> rather than wait for another zone lock while holding the aggregate lock.
> Reject exiting sources and invalid temperature readings.
> 
> Keep initialization-time checks in the aggregation validator. Require
> validated, initialized entries and stable source references
> throughout each read. Aggregations of aggregated zones are not supported
> yet; source lifetime and detachment synchronization will be integrated
> in subsequent changes.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/thermal/thermal_aggregation.c | 67 ++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
> index fa6cfb8669b3..05668e53fed8 100644
> --- a/drivers/thermal/thermal_aggregation.c
> +++ b/drivers/thermal/thermal_aggregation.c
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/errno.h>
> +#include <linux/math64.h>
> +#include <linux/overflow.h>
>  #include <linux/units.h>
>  
>  #include "thermal_core.h"
> @@ -155,7 +157,70 @@ thermal_zone_aggregate_validate(struct thermal_zone_aggregate *aggregate,
>  	return 0;
>  }
>  
> +/**
> + * thermal_zone_get_temp_aggregate() - read an aggregated zone temperature
> + * @tz: aggregate zone with a previously validated aggregation description
> + * @temp: output temperature in millicelsius, unchanged on failure
> + *
> + * The caller must hold @tz->lock and keep the aggregation description and each
> + * source zone alive and stable throughout the call. Source references must be
> + * acquired under appropriate lifetime protection before publishing the entries;
> + * the aggregate lock alone does not protect source lifetime or detachment.
> + * The description must have passed thermal_zone_aggregate_validate() before
> + * publication. Aggregations of aggregated zones are not supported yet, and
> + * sources must remain non-aggregated. The destination cannot be a source.
> + *
> + * Source readings are acquired sequentially, not as a simultaneous snapshot.
> + * Each source callback runs under its zone lock, including the usual emulation
> + * handling. Source callbacks must not re-enter a held thermal zone lock.
> + *
> + * Return: 0 on success, a source read error, -EAGAIN for a busy source, -ENODEV
> + * for an exiting source, -ENODATA for an invalid source temperature, or -ERANGE
> + * for arithmetic overflow or a result outside the int range.
> + */
>  int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz, int *temp)
>  {
> -	return -EOPNOTSUPP;
> +	struct thermal_zone_aggregate *aggregate = tz->tzp->aggregate;
> +	s64 sum = 0, product;
> +	unsigned int i;
> +	int source_temp, ret;
> +
> +	lockdep_assert_held(&tz->lock);
> +
> +	for (i = 0; i < aggregate->num_entries; i++) {
> +		const struct thermal_zone_aggregate_entry *entry = &aggregate->entries[i];
> +		struct thermal_zone_device *source = entry->tz;
> +
> +		/*
> +		 * The aggregate lock is already held. Do not wait for another
> +		 * zone lock: return -EAGAIN so the normal update path can retry.
> +		 */
> +		if (!mutex_trylock(&source->lock))
> +			return -EAGAIN;
> +
> +		if (source->state & TZ_STATE_FLAG_EXIT)
> +			ret = -ENODEV;
> +		else
> +			ret = __thermal_zone_get_temp(source, &source_temp);
> +
> +		mutex_unlock(&source->lock);
> +		if (ret)
> +			return ret;
> +		if (source_temp <= THERMAL_TEMP_INVALID)
> +			return -ENODATA;
> +
> +		/* Cast before multiplying and retain fractional terms until summation. */
> +		if (check_mul_overflow((s64)entry->coefficient, (s64)source_temp, &product) ||
> +		    check_add_overflow(sum, product, &sum))
> +			return -ERANGE;
> +	}
> +
> +	/* Divide once, truncating toward zero, then apply the unscaled offset. */
> +	sum = div_s64(sum, PERMILLE);
> +	if (check_add_overflow(sum, (s64)tz->tzp->offset, &sum) ||
> +	    sum < INT_MIN || sum > INT_MAX)
> +		return -ERANGE;
> +
> +	*temp = sum;
> +	return 0;
>  }

Tested the aggregation series on Glymur CRD with a few local DT
additions for the aggregate zone.

Tested-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

-- 
Best Regards,
Anvesh

