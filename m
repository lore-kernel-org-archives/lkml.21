Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699950;
	b=Z5bGpNE7IJy4kov/xTYgJJ+7PT3pCIsJ5eIFNFzcrS3sMrjneoFLKd9829KGCqETmwzd
	 7/QQS6Yz/xFXraW945xlK0WlU0GBxA8hLIg+v9LMdmpIWzfy5gEucoMBPdDSOeu4wce5s
	 c7NkX6QZs9i7v5GFZexj1ggLT71D/3HuRvwGD+U0qTTkM5PhJ8tpUYRk9cD+CqZzeqDqL
	 7noVvtCDRmtMH+H9HQa6mn3ptD1fak7JdAaHt4W+RPb2fU3GdQW/lfYEyYpM0dSoEXs04
	 7pbOCAb3Ffb+nzNsLDXx/EPgBh5wBlxFfndD550B+NaPgP/e+wXWq2xWkEdg8BQeHmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
	b=Qqz3nRk/o/BlnUB22SeTcG4xb+xI/YuVvBkago0NCjO7o5aYs8amxV1v7pkT+cQAENXn
	 SmtNiqykJOLEmznlKXpnHjykdp5Et7cheSIu5dQCp/ztRzn7mh3LLFJLs67S6kFZgc2fm
	 OL3/LqWR+T3SDXDaGdUKTplawcxGmn8pMS5yWcptS8PdbwHGSLZgv0ZDZiuu13VP2tKFG
	 mfB4xRv/cz9qFyVyXJHyYNl4gO9w2y/8GZsUzO+n9Ci3gXKjX+RuOzcquqTGe84DvcB01
	 XSLm2P7LD2/Ncd/1Snm/0rjAZ6cRFfBH/L2BkBe1Eo2t4y4oOxA3J36yXX1ZS0SKngg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O474cMuf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cA1zTgKv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O474cMuf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cA1zTgKv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVSc41497082
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=; b=O474cMufGk2k5Rvg
	0oFgqz7ZcI4auS15ppYaNM7jq1lVpF5Ok5M3nBClKNX3UPt2yJ6YX5/VLaVqwBRr
	Pp3rwzqBe953cG8DD6w0lKCKi3DjXZE48rkwHKnVASb7i9p3Sr+HM6UGnj9kuxM9
	j57LbTPXlcLV+pBeKWlEoFRxikEYWkdgmfnMdcec6SGSCxG0AsKXNgR9URVz7Cny
	x0Nt6m51lVgR+IkxmBb6AUdPfdCwzimOYok1t5bhnFJf3fkhNsVQVXdkypG1aRgA
	8NQZvFSa0794u3KxPuLmO2WoeJbrzEWY22RF04hNSrbo5UA4i9zt1eQB92nR1Jyc
	yYfU7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y38fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:32:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso5969496a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699949; cv=none;
        d=google.com; s=arc-20260327;
        b=s44kHhdkxMSIGBUx2BIqd2S5UTayvXmzpr6yBi5FMuwNwJUprf2BiiOLwEmSxQd3Q8
         N9neh0SaRRuNsIGb3eXT862L7qraC3YLrY63OpJovR7SsIdtRVhxXRF943mak3h+a7uG
         D/UbnijRk9IVbLW8fxaaPBojEU1n4LzuoyWpVtjEjqQCo9qlEZbASl8vrricD48BpU42
         POv/NpDyrlzAuV2EaupIMOMaKR1sB9MYiHpuBDHCI43rkeThkjJNftUHGZCl3z6i9gNi
         SrnfiwbrXYIZVE+NaUxNsjsRRnHXT0KvaZNVaP5PZ+4FwxVmp9730rMsvQ078191Lw6V
         SmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
        fh=AcgS+p4hEtvPN7OS2XImMYQ2PQMh4Qvc8wIGCqrRAJo=;
        b=EHTs5Jstnjd9TiExEH0Cl50oxl+zfR2VogETVRWExVEj7xY/kgUHPnSaASa24RA2iL
         HF1YheBdA7wZQdbn82A4lLBjy37VmdVP+NtTflYWQPwCTG1rLJTEFfnQPLRzYY5jN/XH
         TmCMld4DtPZyZ7I0Uci5GBopUhVehNWCkSqMF9/d+1Ihpa60Te7a/ezDyuZc5pATwvuf
         8xQFoygfhBH0iiy6ETOM/ChMG+S0vBS7HUPH3uOZ1NrWacEj1yoKoIvmQ59zLalUng5P
         oGHjasn9aL3NsfSnqHl49GZnbriP+bzm54cctH+gApDqeDIFzWRe9z5pa8UTXPEt4sdV
         3NcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699949; x=1796304749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
        b=cA1zTgKvCEoGBovNCwpez+mvNVbXXiitOsgbg4FK/DNdaEKyPuDYWbK2h7Hotpd2VD
         d3LbTIhc+dxCD/7lJOMiRqUlwO+7iNL1c8kRy/eMEQd9hR8pzwboOMxhH3X50Ft2bWRa
         90cRtKodwYNklqqZ6PgrA2cXVkoQ9crQFEkGIfmhEzbzUdm19U1krZuVUuOoqUq+t7gw
         8jRdVpVBAHh3Q+/aJvoxSqVlCBJfzdcad26qfQ+Co+J+KtisuR4bSaA4yiKbHsIytnj3
         YHKV8tYvD7ljqt3GdTTtigoUAalTC+o1mgqf1Gri4f++nQDRgFjeQEKrwFn/Cj3NbK9h
         YWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699949; x=1796304749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9miH9ajMglEU1T9v/p5qaesHmImKy2AVWQklFfrU8M=;
        b=SwWDxIrOBSb3fH0ViwI+m56Xo5lo1YhyrlLSevOJ1isEd+LtaP+SjUxLNADGzcdqt+
         b4daPUBopUZfFBccXZxbDf5kdqzWBgO2BCCNC1m3QDg3Y2LxuNcQdEGPmUN045SYCrxK
         RvzNkPOiGPo6KQ8MVEUoT0CyPtZRarsbVhueZgCQVyF7p+r2aENAmYcjoP0RokmeQEWu
         6BHOa7qwVfigt7ieMT8o4W749PkdPDATlbiSihebMJXGsbqCmJwiPdT4W2cylzpZDq63
         m92UpdYXRYrts+4Mbih+F2t38HBPZKqtJ2Y/psq7DpDNLj6LK4tNziuh/p6HeCaYt+LT
         GEFA==
X-Forwarded-Encrypted: i=1; AL+hErE8JpJNCknteKgb9NKDk/6ymCAgQvsma2v3eCs7Dw9CrEWDL6LWgyKMMo5NpWqfLuZhKzNSeR/XkT8XHWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z91aUtY+sS9oPHslOwLPJgtmgqO70AbFoYXmkzRqg1SfC99DDai
	63lE9ruXvlk3CcGmYVLnbcmRokqya9O2ujaYkoEBvLbsroet6zrQarAs57OH7r4ijexU4BDIq7i
	N6k6ab/L+NjkGS4sKB6UTrujw3OH2BNx65vBUu7qPiBxSce449AR4M9orm9HllFsZC02dn3Nm7v
	ytTyybsANcSTVV3UVNjradF/D/Cta91PvYNM9imU8pR0d1uHYKiQ==
X-Gm-Gg: AZFdTZdWHxndln9ZSlIEuWzEJIyPrje1lofj+/hYnM1SxPRzUmvLKD/Fu2MaclS2Kde
	//trWUzkTasGyaYeRqOt7awq8m2ZcjhWdhypUJG5XhTW1qf+bdqiES6vJjLu4XFsVIO7L4nkOCZ
	7oR2J4ZjBshRNqzbma8qI8n0eTbeR46YO00I74by65p0YJFNcDMd+rhgLbHg==
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr21453818a91.54.1795699949025;
        Thu, 26 Nov 2026 05:32:29 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id
 98e67ed59e1d1-3b41c95f64dmr21453795a91.54.1795699948555; Thu, 26 Nov 2026
 05:32:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124153811.338437-2-oss.patchbox@gmail.com>
In-Reply-To: <20261124153811.338437-2-oss.patchbox@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:16 +0100
X-Gm-Features: Aa3M54pyOdadrKqsWTiJ9nCAOq633Eo8wIVAGtc33LTwbXCOnSylrRHJagsfEfc
Message-ID: <CAPx+jO_zWB+QyYC0GBOA3YFbeypf9Pb6KteagPBkksr33_ChYQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-sysc: Fix CPG/MSTP node reference leak
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX0CTaNwNQZ+Jp
 Rt3PH5kxXiFeKkD2bpEDysu2oIvlLo2IpwOpttlJuL7zyiHSBX3T70p4HaNFfdTDC6OHH9iW51u
 r4xgzj/1TgYuXqSWvsDR4mkB1iLheX7Hz/RTimw+9CPhKFZcapGgAeZQ5KPDSc5xg1dXskIQRC2
 qJYLf/taIEywjiiOS6JeO3OVZz0gHyenjZvsAi6nxuCRe4Yr0zp920UUzFogfnxTGs9g78E/vpT
 hhWBPW8IJG1p93sajpLzMjVJO8madHpO3p9IYGVCFrGVzq2k4eEELjUxRuL66oiSpYvfVQ+Fz+Z
 8kAiEWsZprr8iIoPjPuwipNYgboyy1On5yktTyyjS2qoBoJkhMPRuqa0oP3IfrtGhmvZzmP3ma5
 2B6WenTx5UzsKj4MLQeVhC/rXloHXoY9kRQBQDkwFe9KLV2hKm6y05IYnylEwx921HF+tq7cZCG
 hZl9Es+C+pdIzYRJ0/A==
X-Proofpoint-GUID: Y9MoB1Y4C_BgOB-2FGbTXzlmbv6m8Km7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX634vQQUxz3OM
 zfpC+sVMGVyqS1xfhpighN2sz1ZbjC9VtS0BgwcegzDf21rJnN1TS1kXyGaA3YtwdXk+UjlgDij
 PV3aKj84WkpOoMXcjclen7NKeJOeE1U=
X-Proofpoint-ORIG-GUID: Y9MoB1Y4C_BgOB-2FGbTXzlmbv6m8Km7
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0834ed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=iPbxsK-MUA0o8_X2VUUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Tue, Nov 24, 2026 at 4:38=E2=80=AFPM Yuho Choi <oss.patchbox@gmail.com> =
wrote:
>
> rcar_sysc_pd_init() checks whether the device tree has a
> "renesas,cpg-mstp-clocks" node by storing the result of
> of_find_compatible_node() in the bool has_cpg_mstp. The returned node
> has its reference count raised, and the reference is lost when the
> pointer is converted to a bool. rcar_sysc_pd_init() runs once as an
> early initcall, so this leaks a single reference at boot.
>
> Keep the node in a local variable and put it after the check.
>
> Fixes: 1c8c77f52d10 ("soc: renesas: rcar-sysc: Enable Clock Domain for I/=
O devices")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Compile-tested only (ARM multi_v7_defconfig, W=3D1). I have no R-Car
> board to test it on.
>
>  drivers/pmdomain/renesas/rcar-sysc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/rene=
sas/rcar-sysc.c
> index 3c8a44c6d772..20acc9dece6b 100644
> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -353,7 +353,7 @@ static int __init rcar_sysc_pd_init(void)
>         const struct rcar_sysc_info *info;
>         const struct of_device_id *match;
>         struct rcar_pm_domains *domains;
> -       struct device_node *np;
> +       struct device_node *np, *cpg_np;
>         void __iomem *base;
>         unsigned int i;
>         int error;
> @@ -370,8 +370,9 @@ static int __init rcar_sysc_pd_init(void)
>                         goto out_put;
>         }
>
> -       has_cpg_mstp =3D of_find_compatible_node(NULL, NULL,
> -                                              "renesas,cpg-mstp-clocks")=
;
> +       cpg_np =3D of_find_compatible_node(NULL, NULL, "renesas,cpg-mstp-=
clocks");
> +       has_cpg_mstp =3D cpg_np;
> +       of_node_put(cpg_np);
>
>         base =3D of_iomap(np, 0);
>         if (!base) {
>
> base-commit: 8dac6df92a2e66e2098bbc69061964cfe7e8375b
> --
> 2.56.1
>
