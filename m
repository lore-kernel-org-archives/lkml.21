Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699919;
	b=nUK4iHIeYXWvN5LDJlB8xja4bR+qeW8tEgvfANBB1j+xNvv+wnUHDZk2bO7CWoIN56MB
	 26+07YaSpyUj12iyKVmzZu9Q5EfY+pKCqggBbMkeMGHqvX3K45/NzIITFkQlwl5QXJ7b1
	 hwBbJYfsNxt5xTdnwD/S729xnO/20SxpjXhqQNDnNSzDF4HPyEYkYXA6HASWnxFUGSdwS
	 I0Sa1qOE2jyZ1NqpH7v/4/xNduEEBOkLplaxzYeueI35uD9tIXS1ZY2y4BHj4zUF2AoSP
	 JZ1HsnNWxbu9oI0D27f8HxYi/oow0cTG7nZxaJvnsf5QNA+dOaFCRSFWgUy8StRxkAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
	b=dzxHLZ9G1Imp7h+5zrs/oGrVBapJF4iHl5KkhIMfOI1m+tT85FnOmGFEFNDdF/W70vbx
	 XpZOUmeJD6j/lXsm3aOsb6lB7Y0lwtYQeMr7CP2Vxr8ugV/xXcylYzTA8K3VrRlKwkhZK
	 BGxzqNWffFS8vyBYGvEKdOjqZs8JgfPkahgUVrlNplDovM3/967GfI8aPxx768phKqU1n
	 d/Kmh/pxaLZZh5Zy1OSQWkoktRF9QJncAC3gTbUOzZeW9dJkLQphnCcEaFsrq1W9cBuKd
	 RonOqFtDk2m3l2l/coyU4o59rf+xVZ0X5phgSY4GnJsj2cHkJT/lXuaJTjgg+wfLWNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lVnLx/XV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJtOP7JW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2AD606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2AD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVnLx/XV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jJtOP7JW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVb2E3476321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=; b=lVnLx/XVkcJaiSpp
	oLrrfQ0e7ix1RT9OrfS39lYUO3LgCgDlR0pPQctKZyXiAKUmKYttNwqctB1Su//4
	bZyJYRE+/0ED3DvH+FJVuajrn7ZDd0FGi5N/+2ZljKaXaPrmEtLOoEjsWIS3xssN
	0/eULf2JflCZhznLeu1S7ucb7S0C9BpL5fjA8X/qc8uKZ60b4Y3JHpJOqN3eNTZq
	gqkxowsyWy6f6WnxdLPsUbtwcCtf+rneiRq68AiSgHp4hg/AAzVGOrd9qa2lk9kk
	W0SgyL6W6JjziNki682KZA7YwyL/Mgc17iCmLWwZ69dB+CVkgmsvSJaWBQodPWgj
	rxiKiw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhkbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd48746a49so4035238a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699917; cv=none;
        d=google.com; s=arc-20260327;
        b=rsR97brv+EXUZ9Pf87JPRi5gRhb3ZqApGRjo6zcBlwYJbpNAO8ta6mmOq9iUoZq63t
         JjS72acQXgHc1IQttxmjJ6rtnnLtd1KbcOgWSs28zaBOLZJRi8txwcGGL5zewmJio5l4
         WBGEC7c9UxlXFOy9lVTwq5Bcqxp4C2AW6W0gc/sn98EyjK1EZrXEiLfpTdEqMeSOvbP/
         2Dzx9m98obPa7vp0LgzhhKkYNkJygTbSnhR9l/TikSUfW9tfBFPsvpCw0MYDDXk4c5Lc
         bRYAp0oa4cj5O1xpm55ThM7P00G2dd0ZOZBCRshpX/ppiKnz4YgNjOaZvXgWzFsNdqYv
         eyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        fh=fJjQGRUTvDvouZEZcCayoDMlTCUlVkHZCNLUyPcvOqA=;
        b=o54HyX9a4R+zuP4ZtyVK8KlGQ9HlZ6Elbs7BDkAQgB8Afvw14d9EwblaZUhYwOfyNz
         Qzz93q+reYY7dnM4AsWfciiu8oma2oiFBH+kSdO0CGVZE77TM90ITqhy/31i48UgcR9G
         cW6Lh/SQiZh5x14TBhyhSJ0nwYPZcpYtIsroCjB33IiU9OtlfVABCs69lXQd3E/ir3bE
         qcl+XE5kD7u7L9BoTl7Y/9ZLfwIC5L3x3R80+huAYnPqR66zabeKFixLvQslNL3AD55D
         syOPG0VCIbJVVYO/j/g3gV//owWhig7ReNxEiwDNPbUzvk87wyaU0/P9+i/5n0KU8rA5
         591w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699917; x=1796304717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        b=jJtOP7JW+89nqM23yCpbNbCwrlCI0B4q5yD+RzlKyvpWQOXvw2WeqFQCon2iuCxtmN
         9X/2Ow6JbFlvvFaaR15fah9xSoxj/Qy8ByXC7egAtrGSuBzKZe3xb+Eef6AfC/kZZO2D
         JZdm+MXNqxvQiJUw4x98cdW/Wl0wamr4naGOv0eJFURvxRwZDl0tdvTR1g2kAwIuCzsX
         12CQXHn4jMci1iA0px+mp2knagUHTAx1zpzzh4wGNKFs+i7FrqcWFmNCxY/uYwYQuBjh
         aQL+dPOCBTX8+XKmMF72Snq1CJL1gnf0ZGWS6MeBI+bCpdpEzUBn2wHEMxcwMtG5bRLu
         t2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699917; x=1796304717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        b=0Uxyt8iu75bdQns3g4IuWpWa6OO7rRrwnhJ5ZTPqNJQ9br/WnAEW384e44G7v+N+EL
         7a/v1yyHpCxOZY50kRIpOtabAVqj/C1Gc23GQ0yNrZc5CDcZ2DLaSfpmcLwf5xdq1ZmW
         Y2iYPoDbt2FNMChyuugEVbO89OCbeTpFZKr1giZG9Ux6+hthXNisveqsjzR/ehmnAilx
         gHuH8hl9P6Iu1YTWKku1l0Y0rWTgb+5K6CV5a9FyeVkhdGdMNxDdjqgvcfWusA6rrOVl
         DuG9fczufzxIPyj6qWUMSzE8qOgwJuZqX5rrTF/AcJssyjJgjnrzCrE73coZROwMLP/W
         8eSw==
X-Forwarded-Encrypted: i=1; AL+hErERTOErXrz8X5Wt8GClhFDbi00zrXmUyNfJVqvMKgQhkRWvYlfKs/+U0wn0ZA/ZYRXx02fesYjz5RalUoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LuJW+cgqF4PUoNhWX0tMC9VaqOOJ8yMrNs3QkdYqXtni7tQf1
	Eatru5vgxdvjZrJQKluJlJGerFZ9gjIvLhf2jHTlnIBC4GXPcUbIj+AqfKDUK5WsZI0KS6JYhbr
	y2q6jJe84NmaDYO8lJ64AUQhUWppUvM+NvV3DuyD1fyJILYEVwc8mGus5szAplzsf4H3ZaPnT2Y
	ayr2WraNlEqZursO+mBhJmAMg/yLqSs+YNeoKu1rIZNQ==
X-Gm-Gg: AZFdTZff/7QQdl1M8Ilg/qAuzN61kM/47tX0FHifMbCyaoC1TtH07Q4HCZSXK9dWH9u
	b5I1H66kDSD/Kv4ZMmtDTZBPjIxiJ8F0fScaZ0tjYzFKUVMBV1cZxPQOPuilahs+CXH0HoG+Ajh
	h4PyWL69KA5T+lTx2fa6MLmosp3urB/40MHGR7ZnMmnCsBq33pqGcpEOW3Qg==
X-Received: by 2002:a05:6a20:748e:b0:3fb:4a1e:2f82 with SMTP id adf61e73a8af0-4014ce58b6emr21264791637.61.1795699917067;
        Thu, 26 Nov 2026 05:31:57 -0800 (PST)
X-Received: by 2002:a05:6a20:748e:b0:3fb:4a1e:2f82 with SMTP id
 adf61e73a8af0-4014ce58b6emr21264768637.61.1795699916655; Thu, 26 Nov 2026
 05:31:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <confirmed-20261105-18-6a8421e1b241@gmail.com>
In-Reply-To: <confirmed-20261105-18-6a8421e1b241@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:31:45 +0100
X-Gm-Features: Aa3M54ozD6ck_D13iF_4G2ldlHlAUxaHQPOAD28BUKrT-8-JuoTdL0auTG-EAf4
Message-ID: <CAPx+jO_btJdPP7Z-S-VCkM4hes33QKEJzjw-p7OhTcGRXirtTA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX/3341VufMw99
 HO/SLc7ZbHfMwNzfL4XVxs4LzmcuGfe3IaDX2yk5bocFFAbL53joyKtzpbouqznGqd0mOeUB+Kc
 CZzZ3OW906Gzm3kOgdZR8f2FOGfWWGEPmdezPHyJtj8v2HV2PZ6fIJ0gaxw3DZwIyV2rHjzEZLn
 txLl2JwAjOylXuPUYsgdIOFHjfk/o6xxzcW5LuAStlqIvExUxrzTvbUJhZx/GbFRLyvxsECUr29
 zCGvNdXDmhJMB7TGlG4E4Rkus8LOBtAv41+hsP0CjvznVp3rk0TcgguVaUJ773n0qlkeScJqZpA
 Ds696tt4o8YPrU9L6VepplSsg8JCMqLOpGx65QPzSsDqHs2W4O2IkPiRF0CERPWCAqa4vhxIdFg
 HNmZWdiUabWYtwwnVe3oreh2Snf2QX9GtsyT7Ifs3PPxpYQNYLvEto7vbzZF622MuSFAK5nkxix
 uBxlSF3/hk2sYjoEkcA==
X-Proofpoint-GUID: Hl6oUXmvGqEkLDPmt83XoJG7a0rZ8UiB
X-Proofpoint-ORIG-GUID: Hl6oUXmvGqEkLDPmt83XoJG7a0rZ8UiB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX5uchvOUsmLKy
 5sGZRV7omBhQS5BVIdVVYBe8m2TKvY5LlEbdm2GC9RcnpTaVyfdzK2vaoTdOplgEDgukovStePd
 IlDbZiiO3ToIHgts822Hwn+qSyOiLPU=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0834cd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=zyzk0L4BWZHpzulOrW0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Mon, Nov 23, 2026 at 6:19=E2=80=AFPM Yige Jiang <yigejiang86@gmail.com> =
wrote:
>
> The child-node iterator owns the reference to each PGC node, but
> imx_gpcv2_probe() assigns the node to a newly allocated platform device
> without taking another reference. If platform_device_add() fails,
> platform_device_put() releases the node through platform_device_release()=
,
> and the iterator then drops the same reference again.
>
> Use platform_device_set_of_node() to give the child device its own node
> reference, paired with the put in platform_device_release().
>
> Fixes: 03aa12629fc4 ("soc: imx: Add GPCv2 power gating driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260530004541.E04701F00898@smtp.kernel=
.org/
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> AI assistance was used for analysis and patch preparation.
>
> Based on next-20261104 (8b7179210b22).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, drivers/pmdomain/imx/gpcv2.o;
> baseline and patched objects built with no warnings.
> Static source review; no hardware, boot, or KASAN test was performed.
>
>  drivers/pmdomain/imx/gpcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 6a54ee734514645db7e0628bdddcf579d1f0d904..7b377bf0196491298e9e772b9=
7d15a2bda9ff83a 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *=
pdev)
>                 domain->genpd.power_off =3D imx_pgc_power_down;
>
>                 pd_pdev->dev.parent =3D dev;
> -               device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
> +               platform_device_set_of_node(pd_pdev, np);
>
>                 ret =3D platform_device_add(pd_pdev);
>                 if (ret) {
>
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
