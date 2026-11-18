Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033274;
	b=lklhBmSBGrjgOTXpERe+MwAHWWvD+IrFFGMTE4oLAftDB1ahK+ww8/LR5jTzwGC/Lj7n
	 RZSVMPD/XWcj6NZ/09+oscIvLlvCx8TORGzbUys0lCe96kYKSffZ669hmv8q34lzzMvZV
	 ZhspheHdjB/Uj9CQ0higf5LAxgITOEduWq/wniH6eHU4CviVC0NAGWJX44dAMruPzAL9r
	 uB8PufiRSm4iQfvHjSlaM9cgyJmfxkCK0kt9J9TFdpFFh+haBj1UEPIi/eYxCVxAKl5GM
	 Dl5iHuUF/UCTkVTnsJ50enTvN30Q4Wn/wPwsojCG0f9wZi/xwWhG9PbDChqkE7sdwCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
	b=wLjyoU2JvFSMS9MdTMV/pgA8LPlRbFNCz/1zFoAaTQwyeJ8cCjztekYfwkDQlkc9LNJd
	 WRHWLSAvlIMfx/TMOcyzWPZ+1srO3TX10126U7uiyrTSBuHhqC1xxcmM3NzQOkVoF1iQ/
	 Ai4fHlosPqLoNXkOSxgly60pFl4CmC81IC18p+3lbjvjqdVoOeNuy+UhZwRVoDYrWekRM
	 D68oJXB2CrPsvg7cAYS0oSpa4OXeKP2rq1B3EDAB0tHoUTn6gEPrbRCvwK94DJSyCqPwn
	 SpXr1Duh+AwWitx7ZGXb/PNjHr8MSlgaZZ6nOeC1WWFTZ3EcV5Ny9ZhBPYebVFzieMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE50606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE50606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJM3Cq2732925
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=; b=dpAEJXdcPnatspnA
	S07G/YQ2IRII6ORHQHfRa4t6sTEhkDMP8EzaOYLCCYd8MPoJ7T0kqoWsDfrOtmk7
	6HRVGsbhPx4SZZdnzsxpyOtL5cuXMSV+umJcz0xfn8WFdZfa0jLgci+cgiVjv1dX
	uNPiWEqeZgZuZROeXXlT5I5SmOHz03O4hwfL83+9CzAJ4HQyZotN7hm4OpZez4Cm
	41gcZBYfOp3+UKmBo54LFxe951vllosKAzrmMLMrDNPOcm1M5fqAhLCYknC7k9bx
	C7N2U+d/g43036aqxGdaJYnQ9bjtXCRAngwotBRdDQ3P2cTxjx5zR1NZY92q6SZb
	H/MGDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3b8uaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso216550385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033272; cv=none;
        d=google.com; s=arc-20260327;
        b=kdOUz6O9IOcxcql8M1j4MSnp1BoncpsRtxZUj/Oj5E+kUKgfFfaeOfvkrGJ1KX/C/s
         5FgRxFfvEfWmj7u1k3jqDKjAq6/MYMlUpWXttgw3+rvESbpVRuyy0+SJ1B9UWnlBoe4o
         hzrv5+UBiSptjwH8qdXq4XDwG0nWlamEWDXun78tjsfvjwDDl5JkZm6NUex90XNeloyQ
         rSApd03UxJ1IJdGJUBvjOAeflGcmbZo5uRLkdT5b6EX/YmIYwXNRqXTwR9ognJKM9uGK
         qk+eDeocp7M17qpQkCDbIBcM/pk8NvQ+FICTPiuVWqbrpzfrbOt2NobWprAiS30S/mKy
         AWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        fh=PQIqe2JuQJeREc5cK0O1eU85FtLQKFDnfZ+QvRrRv1c=;
        b=YQT5O2NW14Adfb4FRu518qX+Dn7nEBTkOUOaQUO2SMtBz3Vh0B38OTfTsOCCjqIXT2
         RzaRdeJopmc0e0UAOEYgsKzatz68CVgHagLrZLPjBhpEJEC+22NAzXfPNpoONDPRVP8y
         Og0AC/efOjYTifMw2YjJZz12xV/I1ZJp/BAqCefixIKzzVdRZ4s5a1GTFTWpbROXPyyE
         BqdAY6CfzgBX9/Lyo2bcYsyUT8sCfQpKul+vQ0Lg6xEQ8UEeXoPUUxFMPGBzMEU7C7zj
         NA3+VwkXqftL7ZXm4R0na2vx1/tQ1qe+5PeOmZoup2RfIecUdoRGpdWHE5G3aU23YJ1p
         B+hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033272; x=1795638072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=KCJfUviTRuV0Z7GTWfJz8XO/IdaEFc/kZo7ZFTnhZ/1KdZO7yn8/wBSX339eyWgWSF
         glGlX4CU8lIRL3Hl4kB0HtpSekhmcoHmfiNhCcjenifEds5OwxfvsRSkMlsI0g/7V8nE
         zAQoeSGVX7/oHMJ/l54qXNkkywvWnc7J+j+HHPJOSSOL2lkHcM4UJgTyLh9i5CkPQ4SM
         ZoE9frnyTeBUxy7ppoE0InR7S4C6d372/gp+S6lb9rpeQM31tOlutCjHpd6MI1+okeA/
         YibCvUyoAYFB4JgIg8udrHt0VGmja1RQw4L7EUnWfFsX2dp1w0K6jk+3NCh6ycMYnor9
         8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033272; x=1795638072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=XSz/xgHIl4VqtvZ9sFO/n4uM51sEmHmIkn6zgebfcd8SgyfXhb2kLj2WxEtWRZ88L5
         dTEmSLGgNcM2m/5NO6WlfnRnMbsnPwyM86dcNnTqAAn0ADG8+kw9XcOxPc3ABOLsDEsA
         8dfbHyKVb5kIhlHiW1PijP48F4elQ/iaFzfHa59Eav9OO4t5muq6WNNpqiqCp8jV1bo9
         eUpgDt463j3vmxGRcFuyj/TTyK/CFoTgV2JObQbvvO0CnmeV4EtvZPMFosDvFVdrAkDJ
         A3JGo7oDOIcnVGxSQjqfWDRST7S7SkJtujj5waKcU3gF8NJzKC8oPHrGksi+NGSrjnuU
         JADw==
X-Forwarded-Encrypted: i=1; AL+hErGpT7QQVf+PDlt3ZN51xoykGzgbjLYPRAVKwv9Mm7ylWxOuGa+Ymlfcwd+/8wja0cL/Z65dPZnlUyBoIy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rMchniVs2+v+I0qnyl6iJkcgwwi//TafjdMszp0WOpcoTx3JW
	TSjaYwxVRA7OXkESFDKv/UR4iCqwGnJuwyq9upr6PIDdlt9RmcJEsGHOk9qp9DRfSdTI7/LxLao
	C9sNtMJDo2yQeL9gdn5SuB5wfbtuRKDd4fUFVuHMN5fj5HeMR1QqkTDD0xsI15Db/Wn74bkgVdL
	d9jOHm+wyMV6QndRVSqVzOTfGhf6nfqlWn/qgJQJjsZg==
X-Gm-Gg: AYBFou2+7nxHQYhjq0Keh6WpQBJRtD0rrphcw+bqeVCJiIX/VGPbAC2SoMHJyCVfotK
	hufSlq2rgC4EbD677lIO6UvysY5GyRHJkC26B9rh5tOSO7fiCkjlCq73SVZ/zl4oeb5F+qFVFvG
	Q3nh+kGyK8ETLVtXSV52LylAhF1wYL8s3+KHW4DmcP/xndByNDnE8h3Xv5hC3HLfqPFVmolK7D4
	GvUaYfh2w/imidmB+Z0ay53l9x3DbmsJICSXIa1SoyD4vmhiTzZswoE5qWZjkLpD3LBcAl2yU4=
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id af79cd13be357-949995b362fmr665350985a.38.1795033271742;
        Wed, 18 Nov 2026 12:21:11 -0800 (PST)
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id
 af79cd13be357-949995b362fmr665343785a.38.1795033270937; Wed, 18 Nov 2026
 12:21:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:20:59 +0100
X-Gm-Features: AclHuK-LczRUNo-ZjKC-18fa_PbQ7l34X57L0f_tADLZJQVkzCFWJzXtV3xPheA
Message-ID: <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: QZ8U2LFOrbxfLtMAtu7pjh5w_W31uhBn
X-Proofpoint-GUID: QZ8U2LFOrbxfLtMAtu7pjh5w_W31uhBn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX3zxlRDVMf8TN
 mPyPKEZsJaVhmqSrw3fK6rb47UQ8ovOghGwEAYE2kxVqcwPXu73tDRe7OPQ+cHRw6wGAHj9KuOA
 aVWEQEV8k/iNE/2Ml/zNl1HJPbexGx4=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe08b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=cZ8Ya61OWEQOVQFXRIkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX3p++7mu5uHux
 1u8Cpy5N6gGlYaNhl96N8ZXprw7SRYyaWnt8DP39f4DsNyDf0KTnv/mFA3/xS/zpUDCwN3QvO79
 j/SnquVU8HVIcIBttmfBwpIKlDvqBpHWL8sEvkLxMs8z3zTrE1cn9fI1oghehDB0GT0vj5NFfuV
 TJqekbH+fXyQC+Xsk9E8kWeLBFNmqIvB2zV4DR38yhTnb8IoSdeYRR0TKZ5FHQj94x3wKrT4Y4D
 RbK9CumUg+I0x53YJ9b6e/NbhbAeAaATgh63PE300YRBnUTPtIctAb3Z6cIQmmEInQtL1SS5nRu
 1nqYgrILCNvQDQAmJkz6FYNafy4Ne6pnq6UIioJWNP5bJXXyAXy07DO7QOre2jkLY0Q6EtTf4rO
 DCBQFuv8grOP1mh3E6WqedKp0oZyPWEdcZg2zuQuAdrIwhDurnH/MuEy9bsyhfdEnx/yBHpP0wV
 0ILzg9QwYY2yG9AzTjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Can you explain why it fails? Is the fix at the right layer here?

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
