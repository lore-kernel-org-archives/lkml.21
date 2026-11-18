Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795014603;
	b=J3gw5agHEB9VcYbdPgUW/pxvuBCi2jlEszQ+cPlVfU+uWtQTQ1UV4qQ5Zr0OZnpn3viZ
	 LptdSpUjFhFaeDuFbMHw5U1Pkgx6hvsiGA3VkTmffy2XpxYeU2CW3fT3dW+lcqP3zdlJw
	 hLMhHJtjmtXnO4ud/4KSqgaxDdkILp8/fbAB7SY3oYadlWNwVnyvmcJ9FDB2Jdml525Nf
	 +x9u5CnQZfj7EmYqt3ZeOQBjgXpDjMeRsBJB0qYVNovZ41HobOzbvkRM3EbkgMylytfXF
	 BXYO5BeW9vpuoY10IpyJxQP3mk2LvnKyU+nZSeAXTNX/W2N9+Q0rfWSw/2ccyVJ+qrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
	b=EO/yF9K78iA0KhnGVxuSODyw0UN6Y2pF8Zev6DPULDbwtHzKBDdV+cepupq3J7oDqmjb
	 8oHkLcWOkBFSVrDeJ0+mNyM+y7LNS32t2lsaZwRf2XcnS3OBF2IGuEetiNNem+ymobced
	 zjzntqjyBQHQqkaq5yjMTXS8DAmF29PKb0kkpqHDefqkDPMJ3E14GYFQk9EVXj2dC/ove
	 KhPPhNG2AC3WKOD9mNjv8wxTAj0SWrMAWPPFNwt8LFUzdBUf85kZNTTBT0gq50BQe8mkb
	 JRjHiBEp7eAieIdZffYgR+bJ8AR0zW7drd/YGlznZ/bz+5zvNXjOgkCjQ9qT/Bmt+jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF+QsBGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apikv5VN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64294606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64294606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF+QsBGW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apikv5VN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEqRig072477
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=; b=bF+QsBGW2eNNOq4M
	1o18j2IRQvedJAbrFgv18WbJ0L9nfEkbNvK5p3rFjFZv3vuxdIpgImIKggAHvJhI
	gvJ0qQOFkcVPhN8o6jSom5+Sm/Rvi0Rz5vkrK+56bipuIV2WO0T1rThXxjxeOBh+
	p7YTBrZkd5bLWHYSWRQkv7LEKXTUxzwMSq7l0Mxo7gNiau4tvH/z1ObJ06M77uFm
	PNOyGElIps2VaSU5gvHBXYVzV6GXsHLLMtfDBSWJCWWPTQ16sF59kQaxF2ZkVQPX
	iJ1gUuKDwAPngixY2+6OxvBSO4747sRWXISlxP6xPhPajjFHTO/o1Fh9kjodq2Qw
	nu0Hrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qr2fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:10:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde2fadb00cso940634a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795014602; cv=none;
        d=google.com; s=arc-20260327;
        b=juYqb78vXyJVJetQo8r9j/+dpI/S7A6fjPE6TMZx0wQSDbDBHHqRbNRrJvVSV80UFc
         EApJSqXu2ADIOxLSc0jvwq/op3HbYi45/LlFL8a38yGlqRs6WUbAFGJp/z6suCnjhOzG
         RUhgqCPEMG6FG8JcQD25eQ6+EpmEdLRe6uyoLDw5eExAQ1mcI6FXYwlqAhBZ48HnMkFp
         X4kAD9Xg58TGwlPx2T6g2t8859GfOOwHb8Jsd7ZsLmlFx6296RCgJ5WfT+UDLP4tp/zx
         kXLT0PZ7dGwY8xicKycan7VUSOAsQqn7/XmA7MEANPuUA1ntbfYzpZACbbtAsAgfCa7U
         P1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        fh=l1wPGl7/6vJUlz3qFc0f3p1Z9LCLvHOZ+XO086bx8HU=;
        b=LjWvsE5ve7+us7CCwPOl7Cxc9p95mWTxs33ZjLxZoN/cmJgnUOXoR8Q1tRyCcBQw7v
         GqHnWOOd1VALWABiQlrKS0zZH5mu0h2izhtLvhTeOTFSa5sfUOULSMJTweM6W1V9GKUr
         o/kl3F+W+Z5k3ZSVj+tXYC08+rJ4hIuvZRS0FkibZD7Rg1iAXrIeevErEZScIxmfBUDj
         yP5l+Hb+mnN14I79b5tou+hcVaBKSeXYeo1DRyCzz8Cpm//qcmXLrZrQV4yq39EVCSc+
         aDKfS7ymDiSBHEythkxGQJgwDJYz724fXyucGUIhjUQUgdM2xKSgwxq8gswgqLlhQxcv
         Y7oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795014602; x=1795619402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        b=apikv5VNqioVqZY0y16A8FlF3b8jNYI/nngyif+HWQoTTUOmYq/WvtuOFSpC4V82Xc
         5UmCbNRdXkCZFstKPiM0uWOkdwuSgIgEMDcqbbIK6QpVoeYP8gn+ML0CTcZ1hPJ+YjtB
         jHY3Vfr6p++uEh2xcWstn1C2zJgGpkXpEreNG/JfdISPVyISQCKnNMCA21xJ+bJnFSj6
         K4asXnebzEqIcUy+77aAfeKL1ieHsEI64Lj9cD2WbFksIUKOxpHLpPEhmrB6UnfSMzby
         UStBSk4KN1pfKWaOy0ZESTbRTXu3fQ1azQIEKKMxf8dbl+vQsCExe19Fr7+VH5MzqRPM
         gPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014602; x=1795619402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        b=MRhSF7zAeMZuTdHiLpOFvctgfeLXu4fp/lQ2aTcv4jh5qkV98KtRB2D8LEv+7ItQ4m
         Ybc708xPx1RvDSBjpMDwfE60bYCYXsLfkIS73VXXWdEt7YgjlAF3077HmKOrUv+v5RsG
         dDLHYJXENwRGo1RZYUCvGOWZWWNGd+UzkvmsoFvw5lKK1umA9t5YntL7eZ+Jz3hOzAUG
         ihJFPV1wZLE9Oh87bQPrC0cDrkwM5C4y1oW+rvfbSRWrtsMfCyegAu1QbSPxSHZ6TSGv
         GCfFTMZl2tqXldBpnr5FmfaXHOagpPSSuqtjmaAbG3k+uPzYf1Bvu3rBsZV3ZGlSwm3A
         68uA==
X-Forwarded-Encrypted: i=1; AL+hErGvePwz1/AEokldfAV/+d0Zv6+kp/RXsAnHPSx32w+e08UiGNyR/EDFTISn0ZCpGj5BKIIrNJVzMLSW6as=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zyNBjvoQg9g4iB162gLcADBhbx3J1S0czBye0cWaGhktl7m5b
	WFnw572GeFC1dzKYu+F2Uay9cnyvwM3jQsYEbzi1V2+3bFeKwWr6cbcTH5rXo0KlfckRUINH2Gx
	zBE0jLSqChFVRml3LuKlw+T4WlN3RqzZPaKxYGliTFnwduc/Ja13AGFVFXOCmM2r4gd+dRlXPth
	IVNxSpP4olACF1hRuAJ3lD4YoDn+SAXsCV1TVlHHTJRA==
X-Gm-Gg: AYBFou0dK8GqP9TdFWRRF62+hp98o65skwB+VNfArBCfBYZbUKs6SRxy5L2lqX/VB6u
	daOjSd48rSQn9BBBo7BBcTpPNxOHaXMIl7G8M6u3KV/FGIEBPUDrO8Lr6x5v9B31Kogk52jNMRU
	EPUmtiCKPGPBSlTQ6z2nNvg7oJFMqbgSpTcjclqgqbb6o12vO/kYJulGptfg==
X-Received: by 2002:a05:6a21:3a41:b0:3f8:78ed:b4fe with SMTP id adf61e73a8af0-3fe980f6d1amr3184469637.46.1795014601775;
        Wed, 18 Nov 2026 07:10:01 -0800 (PST)
X-Received: by 2002:a05:6a21:3a41:b0:3f8:78ed:b4fe with SMTP id
 adf61e73a8af0-3fe980f6d1amr3184430637.46.1795014601308; Wed, 18 Nov 2026
 07:10:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118023201.2031211-1-zhangfei.gao@oss.qualcomm.com> <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
In-Reply-To: <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:09:50 +0800
X-Gm-Features: AclHuK9NVLbGP6CpcTR1T8ysZ9VKjGHAEIip-iOoYZVrM4ubgXtHt96rt46OEkM
Message-ID: <CAFkd8hu1K_4kfGJyuD2NeD0S=K5fPBk=9=V8Ziv3Qu89YPCxrQ@mail.gmail.com>
Subject: Re: [PATCH v4 resend] ASoC: qcom: audioreach: support multichannel
 PCM formats
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: C9c1Gs3F-BAn72Os4IxLZeuv3rpauR2v
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdbfca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_LpRk2n8-sDezK4FkoYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MCBTYWx0ZWRfXzpq91JubOtXc
 EnNADFXgIzfkUslo9p/3LucdbFgtsBVvdvURWVu7jFaHRZTAD8X6PSp9LkZNkwCgvCxcDKZU+1y
 WdMoAENMEfShh0d96AaJhOt/ZNmldNw=
X-Proofpoint-GUID: C9c1Gs3F-BAn72Os4IxLZeuv3rpauR2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MCBTYWx0ZWRfXwUlmDYxMaisA
 6nWF0qIWBBdwdzAPQ34o51g8IALZRUd2RFNTRbrMg60dTk7FGOt0KLjN3Y4QGvR3TaymJUpeeWk
 uQ3FkB16lQXViyN1J/VpKk/0vEEDeGh1KW8Vlh2Cilp+Im4KEQsLlMu+jhiR+/F2JPi9rS1VdOf
 tcSyy8PNWdNfD4HuI4wQbUYk9HIWb+bFevGRsoSu/vvoE602Q2y2PNOJ5MA9MNxp6a4Zu7fNZw9
 NPrGNRn+NdK8KTSTPoEW5iDH52TbEhc1EwvbV8/Q0LOxn3ExbIZJZhv3TbxDR8BZ4HP7jybzfxV
 5YFzV9XGNhWzH0urzQnWzbQ8kqHtneTe02f+KttjO7Ci23yvHq9tlUQCwaoN/pZylkmB5R2eawp
 LeKvj5YIMBJiahQDW7cA5gATin1a9ux/YrTFIYTf/uPKnhKMsHQystZsUTO3Jzrtd3E8Bpb86hC
 UQAwAzJvEjZ1n/l5j4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180060

On Wed, Nov 18, 2026 at 9:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 18, 2026 at 10:32:01AM +0800, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> >
> > This prevents TDM links that expose more channels, such as the 6-channe=
l
> > playback path used on SA8797P Ride, from being configured.
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> > the common PCM channel limit definition.
> >
> > Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v4: Rebased onto sound.git/for-next at fcfcd6db32adbd
>
> v4 was this rebased onto some other commit.  If you have changed what
> you are sending, including a rebase, you need to change the version
> number otherwise both people and tools are going to have a hard time.

OK, will change to v5,

Thanks
