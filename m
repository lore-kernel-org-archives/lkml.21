Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795789279;
	b=pVX1xDY9Cb6mducXKdOCDbGruv0BcYQJvn/UuGyqOc8NCoa7XykW57pk6DjlUOSoSJpM
	 15d/wCLx81OdaBhd4t5hohM7DCcM5frexH0uMLyyA+JwqAAB/jS3CI0ne5rqKLftmmSFU
	 yTgxX9oJb1ON5vPI89sUyk8y/pd2Af4+/5GYBJlok01hL60X7yDu61EmHNS9aYHbmbDF5
	 cSlIZ8qF5e+etkjLuAhKtTKr1A9+bF2EtLSvBVuCQDyarzDL+5265hiRXMhTlj39/tZPL
	 atTZGdiZDD2GrsEKV9S3rNpRncaiQ/T4CbIU3l5O6Hu9c0rREXzW5KPLYWijYvZCgiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A5hqXiVN6bv4L4ofOORkjxRTtA0nk2YCOESocO1tEb8=;
	b=V3d9H0LHhObCz86IW9sDRBTi7n/uqU+AYv9uuOCGSYVUkwWT3fBzisYqvDnmOTmYAaUr
	 WwTmRwGII8SXy+IkVbA8zNH4Qveq0ikMsMZALZ6wmV9Stt4h+a+T5OrBEn1s0hQrnBMTt
	 R9k+Uzlkdo4dpAydt/A+dTMUrzu1Gyf9RoTNFBHhu9Thfh/L+cT19Ddc+V0mdlQswq38g
	 oGy7uxUSCxPlA6aoIdszxp1b2n680dItQnIv7jkyv1uiFfAVm9Mb7dAfDE6XuRYFrtcSh
	 es0b9Z/kAAKnWjvrBHsNG/0GoigVRfpI/DFc5A1O3KHjH4k9XRYbr6rWDCoXjhF93Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocnuJtIg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cIERl15w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094E606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5094E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocnuJtIg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cIERl15w
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Z273089823
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5hqXiVN6bv4L4ofOORkjxRTtA0nk2YCOESocO1tEb8=; b=ocnuJtIgb7VcXseS
	55P3q/4tJfp/ceCd8lq6w1hqEGN0U7sHKo7fxIAKsyMlouxnCdHakXmnOaYEWOk4
	EqcB0AYHl8TpvyLZ51S508EZ5s4itQp99npEqGA2jN8tHR50bqy75O5dpRiihDBv
	lZURgVTRInwjJyyGfLpWItlHgt5/hRPOS7Ohphdqj8SsjSBrrn4WRKjDRBUmFSpc
	M1orGqa7LlSr8fLaTsPto01YBBDM8GXRIQ+/7Ca7aBflUzA8xxOlnwIR9PcvvcPp
	fw95IhHDB4pSZ5yAGE0d5jpU1MAKlebC8e9IxaiY8FnqIhEdkVA+Yykwj3wwIbcT
	NxUiLQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9rcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:21:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so5122046a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:21:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795789274; cv=none;
        d=google.com; s=arc-20260327;
        b=sWdnqN2HW6MLuirsZZUy94dnjZYSf6cDPnt7SM1MQmTEz5CR0fstoCeYaeIwsqFF49
         uSq3IMKowME2qrmJ9mhRIztdmftTdztro0qEc+E+kV2Q1qF2Me3W76YT/XR0Sz/eIZk1
         7Fq6XSZznCh7onz2hFl1ct1eTprd+74Q338t/jnfehhPkzRaRGTU2E71rJl5FWdMT8ox
         Vdlki+ZnIOJF+WlvFr8p1BkX33AWMBj9P4eiQ7qisvHcqaHu7i/vHXynxdhbLtGGe/zm
         KNK8hx/LA0dz39SemPQmlLSIFJa8oBDHQcFHk8aj9GdPozUjsbABMnV9xrus8e9RSdaH
         rlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A5hqXiVN6bv4L4ofOORkjxRTtA0nk2YCOESocO1tEb8=;
        fh=0mkIJblRsiwLvvCYZau4zNCfXAAe5ozz9MumR5ojA0g=;
        b=k/dEfofoFEbyKZQGQL4/AQIIlMXrmhzUpNqPMi3vDCT9DlWhSsteSiyWe56VzcqiEA
         n47mC+ke7glThS6Og85UApXxO/xpMuhIMbYH3fPXB8c7ECwW1X+m+J8rUs26WZkCaGve
         s3J2ZD4heHGxhlnwknsmw6dSY+xCfiKZuECdpl9YrkvmsnrdoWlA367C5/WPrCeAFWkf
         vZyq89L67NMKCKzQqNvjaVH2Ip4cNqneZdyKru6iIaH8YEH1JPcULj49y/6ANExQL9nT
         MzRqQWxEasMUIvQ52Z87BoEGFax9+3/Jg5u7RXBttRpi75Dq4iL9odUGfgfYS1wbK2Sa
         MBRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789274; x=1796394074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5hqXiVN6bv4L4ofOORkjxRTtA0nk2YCOESocO1tEb8=;
        b=cIERl15wmlUOGLbajil7pay5F0zOVTEGobNtuDhJHi3x2YWRLbPnAnuM2Y28ETF9VD
         qVw2T6eWwiac3CUxT3u4oGeTutOYgxFFrbeEIrswvHlcoa1ndAW5nZ0YCYKyyEjlUwUe
         5U5vhTbHm0+0Lz5mOo3p1vQBv6nB9t75HFFaph8UBq5ewp1ebUj02Rvk1Kn0bpEqC22G
         va2j9NzUUubOsuQvCy7vbOWBy6tkCzNZ9qqh9YRNlnCGNnN+oktzqSdOs8Fr8kI1ZgSV
         l9+yqI1Ev9bVi4uupeYWS1uucsS/q8IL76epa34Ml6rq3TLhJSSTNHRqusYe8Qz+dO7p
         +nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789274; x=1796394074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5hqXiVN6bv4L4ofOORkjxRTtA0nk2YCOESocO1tEb8=;
        b=2HTGS3jQ9Ayb/HcF6VyN7f+YGsQcnPzqLfu0BIgHnHq7rYvIrQdgkdT9/GOPfK3V18
         h12aWZ3c6xXmEMnfbkS4r5lt2TBtLChMeZRe4FpKbhzf9oxeMgrGXM3RCcyhQ0wSMqLq
         9gP8t97LLmxmBRueOTKxm35jfS2TUZ06PCzMrIp1KmS0vEcGmMh94DtacUgsgJbBpZzW
         U55KtJ5JwO8w7Ml2t05E4nuGgRBej3lHLRtaWBJtZhN+nbbrTjNTwwPS8nTpQnoDCLWf
         D9DxnzjS5q4Skaf7EXes6QzUKukYGSBRlLZVmlCzz02e/3x1LPinj8MlY7I3ialqbqvN
         ptNg==
X-Forwarded-Encrypted: i=1; AL+hErGqt70Ub11uKar9WsL1MvsNR6Q87ZnWCKGNDtqAGE3nnl2j2MYW4rBqgMScmhtJMDhc+J2+9U6NTZM5bUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oz04BFFv821VXn9ra2kaOp7IFzqvuXCsz5mYAsyU0CiDpIcUj
	y2RRTWs2mGm58hXUX1QvzwXj/wLPr6o1C643bf/76Gtf1wAL03IAPlgNa5mw09n2f0IM2BeGUCo
	xD6b0aPis2BwsThKq82cp54yGLYwud5RpL65r10SSif5CG7UKXJCV6Y2EMcHk1HoYlImqTO2QpD
	aTyPjeApqSvpUDd9rHPnQfdvGGtSEJuN2fB1zy/OTJQA==
X-Gm-Gg: AZFdTZcww2f/AsRRk6TapWgwff8f6gqTix5Y6C054HZFIkbnx3cEBIuLty2vntdpp/P
	6owUV4YxSvS5+7voo1c6xFQUuKo4eqaJ8v3RhzLbwb2YAVZC0ydKfYkTxs8AW8uF1rhRmUEjBZU
	SXkpdeVvjqL0htkYUvvBz84gl3mx3zfjP5+K7fMfVvoNRrCR58VrhjGIehDw==
X-Received: by 2002:a17:90a:e70c:b0:3b3:a9a4:a60e with SMTP id 98e67ed59e1d1-3b41c92643amr23153137a91.25.1795789273460;
        Fri, 27 Nov 2026 06:21:13 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3b3:a9a4:a60e with SMTP id
 98e67ed59e1d1-3b41c92643amr23153087a91.25.1795789272789; Fri, 27 Nov 2026
 06:21:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109081813.3846-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261109081813.3846-1-changhuang.liang@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:21:01 +0100
X-Gm-Features: Aa3M54qA9bVNsH5PZixhN_9R9wb5sPnkOFjCW3Z5Z4-v6EvM4OqDvC5S8dayrX4
Message-ID: <CAPx+jO_s2hPhY3vvStjucDqMUajknKFMYavqa9Dxki0HM4wpAg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Improve eMMC performance for the StarFive JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Shawn Lin <shawn.lin@rock-chips.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXy5uUQayREx5/
 6jAI/VlpyM8Rd0A5xVQCUSkKyE8O7CLQPSuD4aPzuZKveYP1V1znAgEqsTA/ixi1RalgDNlTGz2
 Q47M/Uqx45wNYOoQmyqYXaQv1hY48NU=
X-Proofpoint-GUID: ALM410PaBm8ERrvX4RrsBTSf6mlBqbYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX/fdC71XvmCOC
 /13FWjrpMtdK+FU7YtXSlHpxGYXFjkeKq+PyXrJEel3owN5LH4668wbNzeGefUEjR7x8wa8Zoj4
 gaZrMKq9ub+Fu8Oe7Nz87pV1uq7Al+KPnkutTBb1Q3LuVlkpQO/FZqw73fFO3UpjpVn33Bl26r4
 UsKQRdqSa8j0qjx9EF8wisxD9mU1wxbj4hg4v2QekzKKxb85e7ealRE1kUZeCnxnIKRKxYk5PF1
 q06YDtuJcloPpfrEqbuAyuQI/TNmne16Jr4mRaRdo+yVoZSWTExUqzI7X3CipcTaPKUO9ljKCYi
 n4waigs/n/I41ZK/njzp7jmoji0cNW2ds6fslITgEqnCfgkabzUrFXd87PErqMBcZ4PvrkkkuqM
 /ZY57iexlJkiwRCTk4BL2xFfxVD4lV8U8AsVDfaqH1hhDNk0GR7Pow0b7yY285islO9/kax541B
 le38pxg4wrmjzMzp2/A==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0991db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=Bq6zwJu1AAAA:8
 a=g4n6s_l22fGBxNAyCcgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-ORIG-GUID: ALM410PaBm8ERrvX4RrsBTSf6mlBqbYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270057

On Mon, Nov 9, 2026 at 9:18=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> This series implements programmable support for CIT, allowing host driver=
s to
> set the Send Status Command Idle Timer (CIT) in CQHCI_SSC1, either in
> nanoseconds or directly in internal timer clock cycles.
> Different platforms can improve MMC performance by configuring their resp=
ective
> CIT. This series has been tested on the JHB100 SoC.
>
> before:
> dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D1M count=3D800
> 838860800 bytes (839 MB, 800 MiB) copied, 9.38511 s, 89.4 MB/s
> dd if=3D/dev/zero of=3D/dev/mmcblk0 bs=3D1M count=3D800
> 838860800 bytes (839 MB, 800 MiB) copied, 12.2127 s, 68.7 MB/s
>
> after:
> dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D1M count=3D800
> 838860800 bytes (839 MB, 800 MiB) copied, 3.19472 s, 263 MB/s
> dd if=3D/dev/zero of=3D/dev/mmcblk0 bs=3D1M count=3D800
> 838860800 bytes (839 MB, 800 MiB) copied, 10.7587 s, 78.0 MB/s
>
> Changes since v2:
>
> Patch 1:
> - cqhci_set_cmd_idle_time() is removed, along with its EXPORT_SYMBOL.
> - A new internal helper, cqhci_init_cit(), computes the CIT during
>   cqhci_init(), replacing cqhci_itcf_init().
> - Replace itcf_hz with a driver-provided cit_ns field.
>
> Patch 2:
> - simply assigns cq_host->cit_ns =3D pltfm_data->cqhci_cit_ns before cqhc=
i_init().
> - dropping the post-init cqhci_set_cmd_idle_time() call and its warning p=
ath.
>
> v2: https://lore.kernel.org/all/20261104112657.110536-1-changhuang.liang@=
starfivetech.com/
> v1: https://lore.kernel.org/all/20261014121222.31385-1-changhuang.liang@s=
tarfivetech.com/
>
> Changhuang Liang (2):
>   mmc: cqhci: Add support for setting the Send Status Command Idle Timer
>   mmc: sdhci-of-dwcmshc: Set CQHCI command idle time for StarFive JHB100
>
>  drivers/mmc/host/cqhci-core.c       | 45 +++++++++++++++++++++++++++++
>  drivers/mmc/host/cqhci.h            | 13 +++++++++
>  drivers/mmc/host/sdhci-of-dwcmshc.c |  7 +++++
>  3 files changed, 65 insertions(+)
>
> --
> 2.25.1

Adrian, no rush, just wanted to point out that I am awaiting for your
review of these before proceeding.

Kind regards
Uffe
