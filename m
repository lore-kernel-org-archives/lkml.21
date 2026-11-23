Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450882;
	b=EQdGiuiSBbDve5ZBztBg58zSeTHtcmfj1Cos8qB14jHzV2u/O1dEjUGeHwfzZXjpQAGM
	 mWx8epsYtoC/g4GJCCEursde1wjzbtZmBrTmWM4e2wZMeLFWNkWWwwj0qOgcKbog3mw2R
	 ISrD2nEKixWcO6wM6dnUQw0dRh+QuKKtxpVceySSCKRFnebzKw8UIZUBoRdtbKYcE2dw3
	 T9TugrnBL34xL+u/0o5jzTKf/Py1YYeXVed1UoTPaZ4rzS7zoOvMLh/GLxronj4LYVfCE
	 liRaiuo+jX1xmucTf5hLfCxBkSNpgxa4+vzDb+XHXm7zcvenqeXh3uMWY5QChBrnGww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
	b=J8cKB4tJnYAW0Hdu/yuLGbH0oMkeKgPV9Hmzk81mpKg6FKo3MClJWSwgmizvzR4H4OeC
	 OsFrS4vKbpoMHyKuL9VOs3BK6N3MtIZZLVA8JM0anjBJO6hwpKgVBc543LjKrQl5qCB3h
	 CanvmpEyG5lfeKFkNtoUaGTpjHwOD25i/HskZHSMjx0EAnPD0sTum2fG0pANixDUeirRc
	 uZzUFalFQuorscKVsYBbazHPmpQOc2r5HkwNd/dEepl4oV0GXMyCMNoDC1F64gCG1/8Jq
	 ZWxu8c50qbozLJVP6l5v8SmDas6MMqUHaYz/xf2IBU0PPYBgCqplVSpiLADndY+EIsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SlfLHWi/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXGO7Egx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D43606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D43606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlfLHWi/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXGO7Egx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpj82769001
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=; b=SlfLHWi/azcieUxH
	w+GfLXrOy8ebUt4zn5RipaVgHuzhkfZgHlYMpaAVq8dlK7vN0s8G11AQ5ZDq809N
	kLMckgPmXP5O2rqByp/YuwxS+Wd5vax/xuvdItZcyAOfnppmbAE9cTkCK6sp9n+e
	4VNFjZs8WTqtXRWhBrJyfIeyqNUgOC05T3bOUSwYRKWZNxUOYbWWK9l1U2e9CXmP
	0a3ZMeV/wBL9jA55Y3dLcHHhBsOJS623doTXOxdFqmQNsjJFUjY7ttGeKiEKN4pO
	5O32TXHnH9dsoc23YIdIj2rNVRbmpYLsBH7lNHMJqIXGZxzmBvuJfjXIicm1/q9a
	MoVprw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa9sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso2294795a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795450880; cv=none;
        d=google.com; s=arc-20260327;
        b=A+T5fZjOIRQOaCoXoRjtsIQW+vkRala9C1CimolDXnaCN8xz/P8kwmfAvYZ+JcqYE0
         Bg9Q+mlThio8e0WsiiR528nS0qTDs0sDJIosjIs/dsFxT92in2Tpa8ITn+zzqodfl1Li
         OtNLFIkkfgWLb7IH698V7OvudYiqGZW9CMh7tEqo5X33HrlqRfFzrsBu6xpZyCMl+9d0
         FPDbPzqb9Rd1b2oLv2Vihm2s26AfuK8HVvNC16eGdh1Wv7A4/u+2flI99xqMpS9aDPvn
         a453+t1mWiMsrGCHgkdBj2zBGWpNRoDjoeVfLz5ys2ufB5uvZXylhhCuPbl8M9MOm8St
         tiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        fh=SPD4fAJEwOVRe7oDlHQngB5koAupaUbzwr4etIm+x0Q=;
        b=ctdAT/DBnazYkb5w2oDdTQNznp+CsYt1vNp34j5DmBvklrpo6Ror8mLtatmXGwHWiI
         IULX2GQ+PsjsT3nrGkGCIneu9CPsQPJmLrATAoU3ywKq3cSMsgbgfoSrvqLkIplQqcR/
         096NVJjqDPqdymRS9zjKd2p45KRv0GUIDEQGsis9WI77tqZ75Nh0nP5J/gtxkHNtqTkH
         jme30HrxOS6J/HysTOQJnflsY65GU6rS+sisPe2baZgJr4F+pE/cIOTeYsxd0x3QNfXw
         UCm4UNxEC4NUFyffMpFFFaO/32Gx8FDk/NAT3DKci8tCHHgoRM+gzYC6ykU+dmeaxNRC
         S4JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795450880; x=1796055680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        b=SXGO7EgxFPj//D4ayVrzg8zFdbb9leyGJHbVojP18k4f0UrWLxLX6emZcKg9SQ/Ekd
         iebZ6wrck8eMfvC9gt+rYEB0bpV7qP/A5qg7kt1GnDe0RAR6praOA42ocA0Cm7M/voG1
         w4y6lCPERa8S6hle1/PUN7R0oa1Xo1hA9x0cRqxXTxyxxZH6Byu+H/3CkPRGgDqpgRMq
         o7z5T8zkrPvF7MCXffdWapyQ2sRlaIoTUn/00ku5Y1PRcVx7KzHGeTQtLzg7WsPwI8Yt
         ULXIYZaRBQnIpv7Mg/464OxtvGlg0I8tFY1b5XdzzsI/t4ZpL+GzPdnuCHN3ONFgNj6V
         DkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450880; x=1796055680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JLUp5Tt6iphlcbohVm+BinvOWopWEMpmD11h/DXgvA=;
        b=dWWjk5E8kcrAd77iTk4CBG2Awvl3EwXuhhiHnhPg82eWh/7OM9txWoMDJmDZl3LiR8
         UyDyXwcYWEV/s0XZg7F/v4n84bVXppr5tWs/7dFiYjbUzn5TA4cT19axD90o2aq4W/OA
         Q4OHBE1HJc4idQrN1hm037QlTDGLFqAS2SaEbFR76obYUFpt+cGgv3N5vCzMgrxeOZwm
         o2vwfCfIwuZgpIjX88Dn7Ljnc3CJzh2VYQ/LWUuNqwc6uGx23RiR+QyIZ9UzWQWiL6+m
         0ShDwkIaJDhVrSv8gDy47ANYO4s4Ocx0BIaVE4IJPcGZQf0jlnUAc1JWqX0FTkEq0fC2
         fjDQ==
X-Forwarded-Encrypted: i=1; AL+hErHIuz7Cbv8TicELGMo2dWujQThg77TrpyZZlWcSIjeHWoB9kDNPNF1QVR05ZUvaBC2xIfCGpyGbIW6jz7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EwK4/iHjstww8e6D54ezlzLJjaCttbO5Qu51PyLkVtC1B0ARZ
	xMxpLoyMvlGI6rvIYzpYH2fU1QegQvzcWd1THyfdtfbQNl+C2TL1Rbx7OQeHzmEBmv3s9MzbTE/
	yIWe10deh+4kMpObyNOZeMELCAWubO4Jw+5qqMovrtv9P5KUS5YqK7n0yhsHeE4bX0aX4PiGeD7
	kMWqzJUyKH9+38LDcrzYICkitd1LTkq+a2Y7YC6RvJB594s7Cb8g==
X-Gm-Gg: AZFdTZc1RoPcm6dJODQ7lqiWL+8J5UJXgQA0YWprujfNzWg6zDieSQkbLTL68L0h5O0
	dzWmV8nCh2XAfaMJr8B/GK60P2s+rsilPu3o8tHuT3TzKlU9YhXJ+rcVU6DmXtaa663l2bS4gu9
	RFsIdf9Kzpq88ABxlWR1hiyJH+gOocs6BCwJsSBvd8E7lfsvUqelv2iCKT9EZ8Xp82OQ/osiIuB
	GuZnnHI9Ao16Hps
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr9851294a91.12.1795450879807;
        Mon, 23 Nov 2026 08:21:19 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id
 98e67ed59e1d1-3b41c98a389mr9851267a91.12.1795450879025; Mon, 23 Nov 2026
 08:21:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
In-Reply-To: <20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:21:07 +0100
X-Gm-Features: Aa3M54p0-foOOggcU7jnv7PtUHqqVznLL75NrrbIJ3AZrrpdKquyNVfoZD-nGbM
Message-ID: <CAPx+jO-Zo7qx4wwbY6WhW1_DQTh-WR7P34sht-2-O=v9iG2WNg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Don't power cycle domains on probe deferral
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Enric Balletbo i Serra <eballetbo@kernel.org>,
        =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>,
        Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX/vOO+ghTa4YX
 ICXrnnD3m2NNneJSsHsPl2umQO+G5IHxgig5kJnZ0/sIVzikacaihQJb05l7L8yJdRx9Yc1IB0j
 bU1YPr/sV1pPHOIlWl+VfRiq2orXaJwsdiCN+fIBYsmARVqpoIc5SfABXwM+IoweLQ2GVqL1g5v
 Gkbz+kQibJlW/qTkWquK8RGSFFUHnf26mr2f8/Ipy7/l2V568e1GYrpab3s7MWmM0TQTHfh4s9W
 VQ4+Qyti7HgtvYQjLREWPeipbEOiHg7EiCC3oZg3GO4RqgL/00UrLd0e+sbrKyQr9biCd4UDd16
 HgHBj5m4NP5IkraKpi2YqEDsqJAR5zMpLYDhPsanLYtwPxd3IUyFtTmBm8pI7HbKy8qCpHyMh5+
 fTbvP6d5r1qsZa8griGB/XbCbq+BmHSLTU/rvRr27NpovA/Df7DNHZ5g3zklgLnAZ3M+ZEU7BSH
 xtQOxaQAqa50VFnEopQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046800 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=s7NOb6aoII2F6go70RgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: mhtJ7LAAIvlvHod6rM7_z3RIRR11Pvvh
X-Proofpoint-ORIG-GUID: mhtJ7LAAIvlvHod6rM7_z3RIRR11Pvvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX+11ZHFPhwQMv
 RQ+T2C3ga5amPnm42HqsLtbcXhRY2Tcu6AggHkVHxt7bvVObmrs1xIIsvCRm7h6ETJfHJJbjcxS
 p98HKWBBz5GtMYchRXuYnQV7WpX7UZw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230065

On Wed, Nov 11, 2026 at 2:25=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> =
wrote:
>
> scpsys_add_one_domain() powers each domain on as soon as it is added,
> before the probe has looked up the supplies and clocks of the domains
> after it. When one of those is not available yet the probe defers, and
> the cleanup powers off every domain added so far, whatever state it was
> found in. The retry then powers them all on again.
>
> A bootloader that leaves the display scanning out does not survive
> that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
> from the MT6397 PMIC, which registers after the power controller first
> probes, and power cycling the MM domain under the running display hangs
> the SoC on almost every boot.
>
> Power the domains on only once all of them have been added, so that a
> deferral leaves the hardware as it was found, and on cleanup power off
> only the domains this probe has turned on.
>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
> is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
> when it starts the kernel, and the MT6397 regulators register about 50 ms
> after the power controller first probes, so the probe often defers.
>
> The deferral was forced for the A/B with a local test knob that returns
> -EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
> was counted from the host's USB log, since a hung board is reset by the
> watchdog into the same kernel. The hang does not happen when the
> display is stopped before the power controller probes, which is what
> our downstream kernel does today.
>
> elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
> DA9211 on I2C, so they probably take the same deferral path. Whether
> their firmware leaves anything running across it, I don't know.
>
> Only MT8173 (direct control) was tested. The HW-voter cleanup changes
> the same way, powering off only what this probe powered on, but there is
> no such hardware here.
>
> This patch was developed with the help of an LLM.
> ---
> Changes in v2:
> - Rebased onto pmdomain next, on top of Nils B=C3=BCchner's "pmdomain:
>   mediatek: Don't power off default-off domains in probe cleanup". Its
>   KEEP_DEFAULT_OFF check in scpsys_remove_one_domain() is kept as is, so
>   the cleanup no longer passes that condition itself. No other change.
>   The patch does not cover this case, since it skips only KEEP_DEFAULT_OF=
F
>   domains, and MT8173 has none, so there a deferral still powers off
>   every domain the probe has added, and the retry powers them on again.
> - Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-m=
tk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com
> ---
> With the deferral forced at mfg_async on every boot and the bootloader's
> display left running, 61 of 63 boot attempts hung before userspace
> without this patch, and none of 5 with it. With the patch, the cleanup
> left MM on as the bootloader had left it on every boot; without it, it
> powered off all seven domains the probe had turned on, MM included.
> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 59 ++++++++++++++++++------=
------
>  1 file changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index 1b5cc9eb920a..6ec77ed0dd66 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -984,12 +984,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>                 pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
>         }
>
> -       /*
> -        * Initially turn on all domains to make the domains usable
> -        * with !CONFIG_PM and to get the hardware in sync with the
> -        * software.  The unused domains will be switched off during
> -        * late_init time.
> -        */
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
>                 bool domain_is_on;
>
> @@ -1001,15 +995,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scp=
sys *scpsys, struct device_no
>                 if (domain_is_on)
>                         dev_warn(scpsys->dev,
>                                  "%pOF: A default off power domain has be=
en ON\n", node);
> -       } else {
> -               ret =3D pd->genpd.power_on(&pd->genpd);
> -               if (ret < 0) {
> -                       dev_err(scpsys->dev, "%pOF: failed to power on do=
main: %d\n", node, ret);
> -                       goto err_put_subsys_clocks;
> -               }
> -
> -               if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
> -                       pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
> +       } else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
> +               pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
>         }
>
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
> @@ -1087,7 +1074,7 @@ static int scpsys_add_subdomain(struct scpsys *scps=
ys, struct device_node *paren
>         return ret;
>  }
>
> -static void scpsys_remove_one_domain(struct scpsys_domain *pd)
> +static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powe=
red_on)
>  {
>         struct scpsys *scpsys =3D pd->scpsys;
>         int ret;
> @@ -1112,11 +1099,10 @@ static void scpsys_remove_one_domain(struct scpsy=
s_domain *pd)
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
>                 goto put_clocks;
>
> -       if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> -               if (scpsys_hwv_domain_is_enable_done(pd))
> +       if (powered_on) {
> +               if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_V=
OTER)
>                         scpsys_hwv_power_off_internal(pd);
> -       } else {
> -               if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD=
_SIMPLE_PWRSEQ))
> +               else
>                         scpsys_power_off_internal(pd);
>         }
>
> @@ -1125,7 +1111,8 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>
> -static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
, u8 num_probed)
> +static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
,
> +                                 u8 num_probed, u8 num_powered)
>  {
>         struct generic_pm_domain *genpd;
>         struct scpsys_domain *pd;
> @@ -1137,7 +1124,7 @@ static void scpsys_domain_cleanup(struct scpsys *sc=
psys, u8 *domains_idx, u8 num
>                 genpd =3D scpsys->pd_data.domains[pd_idx];
>                 if (genpd) {
>                         pd =3D to_scpsys_domain(genpd);
> -                       scpsys_remove_one_domain(pd);
> +                       scpsys_remove_one_domain(pd, i < num_powered);
>                 }
>         }
>  }
> @@ -1374,6 +1361,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         struct scpsys *scpsys;
>         int num_domains, ret;
>         u8 num_added_pds =3D 0;
> +       u8 num_powered_pds =3D 0;
>         u8 *added_pds_idx;
>
>         soc =3D of_device_get_match_data(&pdev->dev);
> @@ -1449,6 +1437,31 @@ static int scpsys_probe(struct platform_device *pd=
ev)
>                 return ret;
>         }
>
> +       /*
> +        * Initially turn on all domains to make the domains usable
> +        * with !CONFIG_PM and to get the hardware in sync with the
> +        * software.  The unused domains will be switched off during
> +        * late_init time.
> +        *
> +        * Do this only once every domain has got its supply and clocks,
> +        * so that a probe deferral leaves the hardware as it was found:
> +        * the bootloader may still be using a domain that is already on.
> +        */
> +       for (; num_powered_pds < num_added_pds; num_powered_pds++) {
> +               struct scpsys_domain *pd;
> +
> +               pd =3D to_scpsys_domain(scpsys->domains[added_pds_idx[num=
_powered_pds]]);
> +               if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
> +                       continue;
> +
> +               ret =3D pd->genpd.power_on(&pd->genpd);
> +               if (ret < 0) {
> +                       dev_err(dev, "%s: failed to power on domain: %d\n=
",
> +                               pd->genpd.name, ret);
> +                       goto err_cleanup_domains;
> +               }
> +       }
> +
>         ret =3D of_genpd_add_provider_onecell(np, &scpsys->pd_data);
>         if (ret) {
>                 dev_err(dev, "failed to add provider: %d\n", ret);
> @@ -1459,7 +1472,7 @@ static int scpsys_probe(struct platform_device *pde=
v)
>         return 0;
>
>  err_cleanup_domains:
> -       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
> +       scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_p=
owered_pds);
>         return ret;
>  }
>
>
> ---
> base-commit: 09078f3f8a6fca5c3a2d674b7059f4d7b46e21c6
> change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb8240=
0
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>
