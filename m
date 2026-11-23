Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464125;
	b=TRzwyMnef3ZSli37rMaJRagOcebRu0px+nRiCnvI/I071IFT1HbwzbZLCJ23u36kyCby
	 C51p4Cs2gGDrADUgTFfOiH+rhMBse+s/aEYjUMpkFJXX7XrtOjcw2orD3yYEpWFui3SoP
	 bY7uS0gNpxU9W7pDpUW6GkSQ6sEDUARuxE/DYPA7xIal+8P8OalfTz7cA3RpaakWlo1eK
	 n8X3rRGRY1CnLYBT68PytmooGIkbxxXWjwswymY62FN8AkcnuBC4RlgESfBbYsrG5Y3HC
	 GNjKnW0l1BSmvLhqxQvEx1HaGo0f0uFo8F/YmH8Wwm+YiuwQUX4eWQ1JqSQMyV44U0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=;
	b=T0NMJRhIEku3avDJQGWP8uBC3PMxiwyhkXvJw9rQxBPgKYOaIBOVZ3HPkQhUxJTcSv72
	 p2xXr0EiAtf2qCvGKooaAVoArwFLslZQ+uGZldNztWbHtIdTgOYHSpxQ0sqVkZW7nf5wn
	 21P0IvxQpYkiYxzXt8HyB0Q9iPpV8w4KbnFNgsuXPmK9ohwDu9cT58rkhVLCOvcijPrrS
	 uc6nn50rbUWh23oRWuZnu8gbrz+MsSQPLnq+SnmLr9E55QmXcUp6U24i8jUuI59vQ0FbQ
	 DpZDqLpiGPXVjFUnQY9Np/eNrgu8n72uSM/pcJACTOnedsjBgvPrbsSRqYCBf/CEI2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPqwhfwr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZ6hloiN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE71606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE71606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPqwhfwr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZ6hloiN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuSCf1332567
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=; b=QPqwhfwridzPvWFn
	bviNXu/PwlCRHBc/tWm3075w4rEGFNhMmAPl2McYHbhw6yzIB0iFR7MHLyt8zjoJ
	R/55xnAPrMHD79kKdoUJyazct8XjicyYmMaHExINHsc281h2ACuikJ6BAQvLxknh
	FN6HwoC9l3H4M2zvmmctYBs8AVKyNDV77gD3y/3ZVv1U//owdhy/pO0AZ27vheMu
	yU5QX2h/uE+TN76IF/DMR3nGx3VFWkdSxTYK8JGiidXybeWZGk9XSR67rum33vAu
	47XbKY+R55DRDvAZoes1hDRAan06DqSWSh4vHGcUI2F2EDdLjbmHZpvXpzC7k7yc
	hcqNlg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7438tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:02:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so1979985eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795464123; x=1796068923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=;
        b=TZ6hloiNKFdFqP+iT7/N5npKle6mpX0YDAEEuR58sCJ5WdZKP/x/iwBlmCeu8jYKB0
         zgvnDHAUjY4ULSVgxOqTpPtf5ZH5Qe9Y5FDJsEn4StNqVv3UJNSiK6Vls3cFBaYf6WqN
         m2XMs9pzC6ucpglVMhAS3dqtkbPIF8O0foe8nil5B4FCh0V2BDI5QaVf6ZahB4Tfu2ub
         66+sQkU3xobIYt8MjoICzXppaE566SCulHwK/nfRsFM0TEFYCwBgPWFpv7hVpfz6Y6Lr
         JklWd0cObTBUO6OHoCduOxhdB24Jdegk2DtkWuNo/oeZ1UZ7sf9ar4pNrfxBlh/PgtOi
         chkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464123; x=1796068923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=;
        b=eEew9kE2+kyMnCEGIDVJIn7loVwwBrC6ocJLoD/bOIEhN1hXHZ3vOJs2RHdi1V/y6R
         IdKYbkJvP9F25dlLIp7IYdaOzIEmHIuSapB5g1ibdB1903WINkA0e1UTLSSi6Zfdekhs
         C2HP1bRemWBPtcBKDRs8vBpQ4wRRv0u8p0oAi4n/RSkN5lIYq9HBKhYXUjfUEDb0hZ3o
         Ul/ABHwtd7BdpEWVbLeuK1PNrQWV0wQ69I1aEbHIrxax7///DxAO3HT6ih9/Nncq8OFZ
         B3LMlvuqbtSg+PZgWAj4I57V+ZgVGaNwc1fMrJ93JjKdF47ONOLYsy+O+EYQWVduOK3R
         fbFQ==
X-Forwarded-Encrypted: i=1; AL+hErEPxYyViCXXKnz7/ubYALni3Ms9nCFhYO6gD4KXISswi1GKB2vrsHwmRIU8+QpMDG9QRZHklejfVxQtApI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z0TbbxYnzT2GtvSKAmHdaRcBwJMX26TuT0qFdjkk83h3M/NtY
	NSdHgMFpbEWLSEvrpqyB8/58VFSuQMLp7XGcorhYCsrv5Z9I3uYvJ8WUxwcsTZNs4Ikvw3vTWy+
	a9sfJmCk4suIGeYWml+5iieKB4QXTVQCfMc6U+4y7xjvX4GmyyuG3MB1SFvVVxeIsh+A=
X-Gm-Gg: AZFdTZcHgURZbW2JHtK6P2pgRc6sHp+N1N4wt+zgS9pD86B8tMKDQbL4r2d1w+XvbKl
	qmS4wZIPdcbb6P3XxPdnthngeQ/Pzcju555fY3ezjlZv+mdBcWl1tRwUZm8ymLgeqY9q0wCFCI/
	lKFutEBDHsrEO+v8EH3AS8noFQPj7JswehMd7M8X8nJv9TtchpE1YkNDc3r2WpxJRkWsKsCP/ij
	u+SXQC8ZCU2Tk/MAOyT8ebYivYtIDdnbLjs0B4x5Ksd/qy7c9M/NPBSEifdZMKN7CsqcKGnldi1
	rdIkm6BBRPdHk8QestvlGH8DKnBkCZx9R/PRsIpJgL7hXk8SaxUMM2uQPQDBgQYUU44pVG2FVP8
	IPYqHFX+qz+dvNFhn7Fv1+QmZHddpv9t5tguKhK8jTA06Frz+vHf7O5/qF64gumdcNzSHxWU=
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr15532179eec.6.1795464123070;
        Mon, 23 Nov 2026 12:02:03 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr15532139eec.6.1795464122304;
        Mon, 23 Nov 2026 12:02:02 -0800 (PST)
Received: from [192.168.1.9] ([106.222.230.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm66658717eec.3.2026.11.23.12.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 12:02:01 -0800 (PST)
Message-ID: <e4ecc291-026d-4ae1-a391-5f3856df8ce1@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:31:55 +0530
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
Subject: Re: [PATCH v2] drm/msm/a8xx: Add missing preempt_record_size
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261123181306.420017-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261123181306.420017-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RzmWyyqHXTkwJcHBi-6NDmaCHeul-rBR
X-Proofpoint-ORIG-GUID: RzmWyyqHXTkwJcHBi-6NDmaCHeul-rBR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0Y3S09JoDw75
 4S7KrymYIc1cUHYag9NT0atuERxpY4WI47trRGNd5noCeLauscVEJ96LZT0qeH4yVb2goG6IUoZ
 a9qEtlTffKG4xtBmOC2x1WuJxTxFlvk=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049bbc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=6/OokicQZQM7IRI9QMJePA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=C2-uWAezvlBjfc1kpfMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX6iN4wMEcHjvM
 RVf/6+STW9j900jNKzSvSK7+jJRvklyGd6UOdkOP4pQIS4cRELvLSrrbHNQBBuCQ02+rzxIgPCo
 JgLj2kizUyHdCodi7sSdBCr8Xbt93T4LvEQHPhwjXZvLH3VtvuiwZsxxyIUJLi2P8iun3Ogf2yk
 tGesDCBOU9I9nyn4OKZR0MIrAMRZiupSPS0NUMgu1b5j44ZJNI3eCFXFisJIdcN7fig3aic46CB
 biwSt9+/YrCqsjCe5dy5dTuOMrP+nWWgKo216pil7lfmS8fHNsincEBpDefnHM7FHFFcsVcbxvU
 vN8w8d0/4Y7hftSVgqvx5ue5Ym+1el242Ds0BSiAsI5T4C/uO8INU33ITl8MUxtCsU0lUnHYw/h
 yBCeL88O1NoP1qMAt4ocx4aY1SudrJbNr0glAVBf5Rbg7hNAHtvJ4w+UkccV7v+fGZ8V1lrIvsQ
 OCpexUdWXUkYnXdbJwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079



On 11/23/2026 11:43 PM, Rob Clark wrote:
> Somehow this got overlooked, and Glymur/Mahua were falling back to the
> default 4MB.  Which is way too small for the amount of GMEM on these
> devices, causing faults in cases where preemption needs to save GMEM
> contents.
> 
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

I think it is a good idea to add a WARN_ONCE when the default size is used.

-Akhil.

> ---
> v2: Fix typo in commit msg
> 
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index 0c6dde3cbea9..20fe93b83c0b 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] = {
>  				{ /* sentinel */ },
>  			},
>  		},
> +		.preempt_record_size = 23088 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
>  			{ 388, 1 },
> @@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] = {
>  				{ /* sentinel */ },
>  			},
>  		},
> +		.preempt_record_size = 17712 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
>  			{ 388, 1 },

