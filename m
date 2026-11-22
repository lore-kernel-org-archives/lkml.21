Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377879;
	b=WzpvZXfaczDZF4bbB7ZO+PGLN75OcWSF5jLPIeRwfoSllIrIiXt0TymBUxfP9+fM+2bc
	 H1bI49qLwkvdjkyKPRGLQncSPI/20I3rp5CcfELycRMdQIcBtAVanx0bAMuadUtPTwBeb
	 Oi9MLU9z8ERi34IwV5qzwBVjbQy8J91ff+opoc99usm/yICUcjpOWN+RA/t4xS5Kcscjv
	 bbgUB16L4E/gn2HhbdXAkKSKiaxEUTMUA/PgIcoGYwGKvBi8auIemNpAlhGejiDyLInkk
	 /+iRHWcdqhN0rhbeEyyfDrcEp2mIpydKXiCMotwIPQIIgvEvbAskyQweSALmQEE2XLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
	b=hru8cAJP8oHurby323IOpj3IqrytrZ3OiLhdpd/GFWC0NI5OwcR1THBqCiBYGUSCS9hM
	 XfX4bjhC6KIVnaeJKaJP7rvnmm8yGpZJoed4SRPWt54tQUNffBYyVhImewo4EKH3VLyPv
	 FqGvvZSV9fZDnEbpqRlGp5RzqICjpZe3RP5rdRpaOqXZxDIEIopF/FFIWQFhDdsxH9MsK
	 Iy/TVHOh7SjSesGplQDRQ2Nbmij0U2cMbBQBBJs5y/7hgUYifltIqjgXKDE1RugzdzaAT
	 QbIQeQ43VhqqzJ8rdBuHftGf8jZmdc6KBWb8ojJrDMGA8kHSgGWgpglKC0/yuMWjTtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdiIEb00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB4lqMI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37081606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37081606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdiIEb00;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB4lqMI4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVAdQ1380872
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=; b=cdiIEb00v5kWagL6
	eUwVvRPDz7im7ZtvWbpO6np93uS+Tj6CgtuPzHT0uXaS9aAppi2+6C7VpSjbRThb
	viw0mCz5onFIhhm/NoCGQOqDOzbNh3ZyANUYz60/gvsdIRoJoDNvZW8qiMJMFjbk
	IK7y12qFmmrO5l/dMoVL62bM5Sw5CXS7gKWXwx5Kp+NRwgnCrdoB96sQIBR3ir5A
	jBVzUuTaPqAhdZ3rXAyJHc0ggNfLvEVIkDlU2dAewu59uPBxpBeNMlOuNvAsqMZf
	ylCpli4icCzd6I4npM/MFkoEIt8WRsqjtY9oxanAoMuW+24YPR291Q2H1oVUTCWA
	BCoUQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w0464q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:04:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so467111185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377876; cv=none;
        d=google.com; s=arc-20260327;
        b=qzUyyvPWQ2oXEeVvM3luVA6tCYkpO7/NHDiI3DPsjVIPMT1qrZct3/ppm32BwEQyFa
         jht65abl2y6dCaPFGh3uNutebNU8FwP5/QBy86R03vA+ZfmeEkyEilgDObyTDLB7+D+O
         kb//Q757bHtjRy3iTPVUGO/V86Y4d9zlStEnOo6He/vtL1UbqN7h4JhdgBmrxT58HQ+b
         jShM1nPNRVd1tldWPuSwGwyqdERwmoWAG6+5MwDTRYo/pI1C+BIEHXfJSZu72GIFTXJ+
         S50VC5wUEhUJMC9EnXFSsuKbtjVy3sPOAwA/0fj36okooI51gzPpkeSeJj66/u+Ivk4Q
         ypkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        fh=6IZdhqfxvcBexZHJK12Giki12fBChQN7muhdurpJl2A=;
        b=aFT7BTdcSvYAN8SpckS3nJrXCITGo/xDdYU8hrvIORcOByfYhdMXfDPAUtfh4CI/hV
         bS8ySk9Szacytp3bYjaTwbEizWwjnAnzYpQhsO2HjvoEQW6giGELRU0kKR+TVPvaFV4P
         NknbqmMurkLy4R/SzWakrvf1/GQv4X5ziPpKr4UHfwQ7RUs51IWwstpXjJTic6siPU8h
         +9O8lTNlP16XyJXCxV08X7RmdR2VjWQ7Rvww8UQ0QO+wfY45QK1VVZIY5mMoECExYPuI
         IgGSdumybyHLWiLe5MMz4BLGsaeRUJCjesjHkz7w8A5XGrstjcQzf7Xe6xoqT+57K4MN
         4e7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377876; x=1795982676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        b=LB4lqMI4yntPsxt+YZJAe7MvQboR47G3/2H8Q5gTMXmlMKohkJIH/QzKS4DqKNoU3w
         h6InpvLoMTJxh7lrfvQus6zK0i+AFiY1cMSpmtK6WlpUa2Kt9twYVgmGPE+OEui6F7hO
         9D5O7E4Ov23pyiS0Jomv29FFxPP6RiqZVuszaDe8MpL5eR4fsEM8nF8kVrfplK155x1W
         MNqXorBxFIkrCGYjRAXWps2Xodh3WqfRZO0+/TDMYUwlxfO7rSjePOhIL93D/lnnn+wa
         ktIKpb2mr7Xj6lLsbXPPN/H7hfxHHGadW1+OCvcixdHZqHadnBsqhQQnO6jn01SBP1CL
         HAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377876; x=1795982676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        b=a/bRg0g5pg8ySU3OH0PmdqWLwqphvu7nQ9jTVAi1C+dPInye6Pd+U0w1loifyalO8Q
         /p+wZT9nrOJdbBrT8kDdWNGA3VO6V0oIx0udHQ7Dv0D19TqVFcTCnp6nO03L0DgGKSwO
         8x4wXrf1KRL8fM+qBE+SPvCOfSNri+oNaKkjeuptf4YmKG0mfl/x6aMQVk0vC3RRn7Ag
         ufMYCsiNLJV3oPMg1rkpTGNYn+AQa/Ju1Q0ECPt4J266xpR+Zny8v+OwVTyqabIYHirF
         awDHBfJ9IuwtwvQ525AFVDec3lSnkYn8Y+IgzBHKgBbvC6r+vb4Kmlr+J9PRWCvuHxAM
         RseA==
X-Forwarded-Encrypted: i=1; AL+hErHJTXPprp8YFf0Uc1jKLJdyaPybK320yjR8Qv1hWG++TnE0ZcuqMm2cJ+QxbG8kD/Jkk7ain0o2igAl718=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KU+0RICmCwedcwDeUY5zc+xTkXbNmKa9jRJjMLqWrgYUN8yCK
	w08CmvxXKXnA0jCX/MSZSg7M97funlhSu823kvfKUlOiDh8HY2q18FskCIQGIvF1PRPgoW55wWf
	bAOQCNhGMw4nyuiqHWzHKxRndiUUZ0xiddMxj6g5jLAvhFk1HDcEfCuA4z7sFiG8IzobplsLKeW
	zSnvZdbWVKi7FKm2xuXHUyCaNQfkEd35zBflhGY4nvog==
X-Gm-Gg: AZFdTZejhcElwaAMr+Md5l+Sn/FQcaHzCatKUxPKEXQhqd/t8GauSjGYYneLdrBl77L
	lAABwgO222Oxb0bWWrJSP/kSuwpTSZokcOCld67XR4TPx9kTpArX3Xl0YcGiGELXOWVTmm87D5T
	8t1ZXpJ94SHC/SNps9YrH3Acr97+HVarFO3QfGumh3mVASXJzv5QpwDvWh/CH3JP/bU/lGb3N8f
	RlNuYJhCDb4EZXhOqDYPbYeuiK9YFpF4iPvVKHPc5/h9VjabK3zYSdXHF3qKA7J+Gd2bL4Zuq8Y
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id af79cd13be357-949ba9555cdmr1583914385a.25.1795377876419;
        Sun, 22 Nov 2026 12:04:36 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id
 af79cd13be357-949ba9555cdmr1583910685a.25.1795377875985; Sun, 22 Nov 2026
 12:04:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:04:25 +0100
X-Gm-Features: Aa3M54qUzr4tb0KxbdidEOr8hL9CXGm0SM5knxBXQMkR5xBalOtIALTCOaJIY4E
Message-ID: <CAFEp6-0p+m7gV=qk=UtD_E5haV2H=KJbmkXvH4P3_C9YhwJYFQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX+lrZK0Kb5mVR
 wDshyCCT2pUmTAU50QqDpn9Tj8s6JTBB84KJuqsr/NnJfI7nEILVL/fzWMo49SsDbnGrL540N0/
 l18uIUVAFh6aXXKQnacsfY4CDu6auGQJZE05m0mWBnYkMbIj71vnCffyDP9pEBWxOqb09eMlOuR
 +o6S6zEmy64B9aWyq0NlUHtvZ0tIYefgXCTjH6r1j7w/Mkzy7SwlpvF9p6n7Xu99b9AoU86oWZw
 psDuxsva40ftsQbg7G+GTsXL9aQaqfNRQtVR1yohTC39/GdY7dn4BSc/Z5VWz/zCOqe8+jY8I0n
 JykReQlkLcrxXonAwvUukWZ9OejrT2rH4Q6caGrherWG2eSfSgaU3dBF3dvatSAOvTq0VczED43
 KJGU0h3AWHrKiKYcB7hA5Jux/zJRXM2aVYYuoZ6/V21NQ6ChvZNUF9XrTybmXkE7UA4LrZy+s5l
 h8nFHHCeYhZu+n+6b5A==
X-Proofpoint-ORIG-GUID: 2eVkaYr_OL5hBaMrskeAVlWXAXpQBw9n
X-Proofpoint-GUID: 2eVkaYr_OL5hBaMrskeAVlWXAXpQBw9n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfXxwY76pAGrGnm
 mpRwctZfuR6jJh6wZ0KuFV7x0nqWOjER188FHnrh6wPsi+RBchDbSJFGNICjl/B5Bf54pu9G62x
 ekYggOGhEddX8XrP85qTizB/lLTkPXI=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b034ad5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=z14PLRylv3i5yIR1d5AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:11=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Every time we add a SoC the src_pad_code switch statement is expanded. Th=
is
> expansion has continued to the point where there are more SoCs listed for
> what used to be the exceptional state, than the reverse.
>
> Invert the logic. The exception to the rule is the old SoC set there's no
> purpose in expanding this switch continuously.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index f9bd2367671f6..10ad862ff5010 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,21 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u=
32 sink_code,
>                         return sink_code;
>                 }
>                 break;
> -       case CAMSS_660:
> -       case CAMSS_2290:
> -       case CAMSS_6150:
> -       case CAMSS_6350:
> -       case CAMSS_7280:
> -       case CAMSS_8x96:
> -       case CAMSS_8250:
> -       case CAMSS_8280XP:
> -       case CAMSS_8300:
> -       case CAMSS_845:
> -       case CAMSS_8550:
> -       case CAMSS_8650:
> -       case CAMSS_8775P:
> -       case CAMSS_KAANAPALI:
> -       case CAMSS_X1E80100:
> +       default:
>                 switch (sink_code) {
>                 case MEDIA_BUS_FMT_YUYV8_1X16:
>                 {
> @@ -415,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u=
32 sink_code,
>                         return sink_code;
>                 }
>                 break;
> -       default:
> -               WARN(1, "Unsupported HW version: %x\n",
> -                    vfe->camss->res->version);
> -               break;
>         }
>         return 0;
>  }
>
> --
> 2.56.0
>
