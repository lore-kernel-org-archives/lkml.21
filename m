Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377074;
	b=t5YzEYHarGvTk2XnU9wRFhTLmlIpZo0hWExxFahgxWgUF8l/B0qOrSU5HWrAiJSmZyzt
	 hS9ycWtWbXx1VaEdtXhaXLuIWmamyy23kxzbupZIpkyegSdpJk7tMY5mbqnP27VSGBgSc
	 zVQtDd68zmkXNcmgkEpke+USKMFxBS9DjqZJeAPszmo/kFmODsVs7vL/AuI986gHMxj71
	 j80QobFGYs9zRH0nVb355uf7BqSiZ6za3tXe6CpB2WHvOYfRq+MQxrUxsRA7ZZ6HNO1lA
	 1etppreOqK9Ht4XkbsL8k1WmhqZ/13tQ1Ca23qNz39jte9/ok2U0JSPUzZetPLc6h2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
	b=WLDxf1vcY+nvgiy8L0U0kIqQP4NMM6UtOElFQLwPgUSomyY43kuesTGkjF74QZzLaWLC
	 sEBC4HOl99PHALd2phKogTghavTuL6WIdN/1Pn/S1vh7fsAodEoQYCQFSFRIIYhGSxeqa
	 ENW/xm6r34v/9waFhcEzwFomdrZZUFTXKnUzM1K1Im8VMuohbM3NdYdj4IV+dNnRr361V
	 vbKE1PiazLlRFo8PdmGVzN/iQ9aRD2fxjJ41GuniiqyTvoW64WDenY+abZdxPviCIKgSU
	 /1+8/+TclqQeVHP64vn89pfMMGI/qeBWjKa9HaMnM39xGMS8DijJkog4H+BdvFKmweQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Srm0FQ+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9aPCLiK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A61606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A61606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Srm0FQ+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9aPCLiK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVulg3629880
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=; b=Srm0FQ+0E+Nhaa0M
	JAoh3zURFwR3lGKK+ATSxpFXd7JTLC5faR//DYv1SpaUKl9r6qVGJLBC1me9N83j
	6gOEsgrV65uqaJ5khG4bkmc0fSngDi6J4wHreLdz5siSwKelDV/OcANBLQTA/m4/
	xZ3pJvF8isNJ/cLum2MkgRe+ktK2YhgMMrGHhqjQdp/3N1PIl1LXhOwH3PwbmpSj
	iys6aZnW2Pum57lMjEj8o+d4reUPZzAhSCh0ZurXTgBZMGdKRAt5n7lhuswWUPyR
	ebczyzbA/rqPugipC85qYx/THcSgDs5EKEvWnRnV26jrQKuJ73C8bh+0ystltrM4
	nukBfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc6ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:51:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213e04641dso50701786d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377073; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLDN7TH7kJNddqr4DpkVIYLybvuC+Jsc61e92gMyUsM7fjmUA0vLKO7+6u0WVTEuWA
         gxXGSC2/iGIJhgml/K7e9yUwnif4xu2zmaCpzXs44/5nN+7nT4k+ULTqMYDrDwhs0Toz
         vBNTUTujiZmimdEi99xBLIRsomDdqM5aadmlFzLXZXHXBWEq4Mm2cBDgyst22f8P4izw
         TSI0zlid9oBlmD8lyFXs7BP4a2YA1ur9POUqsKI9f6l+EQ1KdX3KRMd1XuwuYaICZPyU
         Ckfr7v1IY2w9533D879ii1dB2Ma4SHg1GbFrapI7slRv82cXqzZcCIw/lH7MsosFwWC8
         nZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        fh=MMUMSLEkU1c8EojbpkjGwfjRV9IMC+Eo9NIvsOCAPUQ=;
        b=YafXM/VkR2tKifxES3yz748pQXg//IGC3irVs0oHZFusssr+L21k76v6mbzIBDw3Qz
         hMn/QE+v1KRyvw6HwfvprhBycq1bJ+z/sJdklPvvwkWT8LXIP9r2tBcFDuoxCAhvK6Hp
         A9JVovwbxSd7b0aMrJ8r6IWHvdpE54FmSKlzRpdBogyVH3qS588IW5bq9ipnLPDB1Z5W
         e804ds+7AF3oJGOhVv/j/pI20gZ8JEmkM4a8zxDSAymczJrMoD8XezCdTqja+c/ZiECJ
         h3VpDLXAvD2AUN5CnpCU2U76Q0pSSpiLF0Qc2STP1Bywwou5NmyNY8kM/l2a0tFmulsQ
         8RkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377073; x=1795981873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        b=G9aPCLiK4n62QzbLjsEnsHi0Rv21CYYW1EGHbkKzAORwY33aWS3jEq4YCMKTgWrmJg
         w2mWgKF1LZ1Fi/zMLuHEevtYdo5gX60ZOKa+j0PjYQMcrAN6r57cKF54NNphcNEAPrv8
         1MeQHMbNws1hyvJh6Ay/IwCFIlR4Wno1/UW2nKELy5TiTtIGKTn+QJsu3HGOvfc+oosl
         b/fYu0OU8Uty2/wIJhFvKdd+bmPA9Fu4TeP97t+1UJqqelBkc2KoKwJeBoYE9mi9Id7O
         wSvRLSaPtpCbUD+7VdM7LA1PrNz2xg7HM80oWKIku/6B/DdFw9M8BP2J+l7M8SiRGOfc
         q4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377073; x=1795981873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        b=P56qZSOEJpjhBjhtAD9Id4zsEV1tAjB4YD+8bK7eTLjgTioShpRP1k4M+g5wZGBI9l
         kaUZiAlYDE1IC5ZFNrkEdG5a67BUY3weQ9GY9oSMWon3MLSSfaA5Dff1FkkzmCJgLVNt
         aKgsPh3K7+PhtHqS/j6UihjcdcC9MLF5CHvmMTfNzWez98owlxHQHotnr/gPqp6DXHKt
         SqH9vd9ffZoXBYu0b/S24YkOx2MbnVFvBYflsiMkZQ0e1lkULBcPJbqa/uncPZTDmZV7
         HTAlyXp6ZMbjlZfrSPMP2qxHNcAVDW2Jj/tJ/W/7kQfeqiuhM1P3rPKKCnbVLyti7DTK
         f2Jg==
X-Forwarded-Encrypted: i=1; AL+hErGu9pAFTg/8B0l3nntvtvN0g9TIba+vvGhz5MnKhqsqPhY6QB1DjQm6Eim/PKJPHSZvjHJ5qoPmf4iRE+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q2D30FFUS2Eh7PrkpiwfjGiJgZGyBDlvKc61nCSsbEKT6xbT5
	IS6LEgug/baYUZGa9lgAovgJ4ZRe7gWgVVEz0MVZNdRjrj8wpAO/T1GUevHo1ZCitoGiZ0Sa3+P
	/dPS2g1/502KOkjjpBhRPAzYWBnEb8efmpm9jI9uowwHZLRvPsU6HKVGFoh6p29LGTcJDUZc7/7
	fTuH/hyy6WJuBKGOnCu8RLE2s/h039niGJHZBZ6WRptnzAg07G0Q==
X-Gm-Gg: AZFdTZf+ZNI1DPosehk0IXTa6NiZCNE+qcgr/zLkap9Ma2rVFWn6ISKwNGRzF2hLHtt
	P7aByJ+oKoPMmdanDHGh63irsBAVN8fqBpiqisMsQRKUq2f0H7qNOi9d39WAUye2bLbUijuZf8J
	8e5dGCqFPBK+zZ/xCXRGzl/wm7kME0ArXA0P8ewyPL6DBbB5w4X4RcY/Rz+/Y6QaEiuF3ijHVRk
	4el5Cdvvn52+BT5mU7dnDDU/ZIg5vmwdNPXSOMlDT/HdO029yKjnFrxztAPNX7rNtYBlEuWreHQ
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr1618396485a.36.1795377072745;
        Sun, 22 Nov 2026 11:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id
 af79cd13be357-949ba9cd23bmr1618394985a.36.1795377072330; Sun, 22 Nov 2026
 11:51:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 20:51:01 +0100
X-Gm-Features: Aa3M54q8DVvj5BuTbWloIlkkU2isU41K7yHCwAzHNhHp_C9LxH-6l0mb3H_XQ2Y
Message-ID: <CAFEp6-03ywJ2tow23woY4FkW2Np8r_Lja37zDH1dh3z4skYFZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX5UDJoSpKV981
 ev6GGRa6yQs5fmsEA53my6KVicYUFCOotHWRGDVYMjtENWaLeAK9i+0FHe8Y7ls8dR7mN8BSuew
 b0bCOUO0eeGOaYaT1t4HDG2GhX6XCHrTDxENAI41k30aTr9+3YNQXkQwWZtWj9+MbUiSQNGoCYI
 rZIVhDkmnWna19duBGv8qG4R0DKUpM3J7evtNjXYu1hiWL3iD8E36JAiZ2PwAaXd+Q9oNZgQxMg
 ZqlrDlAfKJUYZ/BAI7uerPQx0EiQmwvA0EyebFj1S4twKtPsbv9YqDWX6Cz4HTOHtkp5v1mzoMz
 lqCBMPwFuJplAr5U9xqIRJAQYdpKivGxFCsP6dMNeinkhrDBpncztO9VrCEMZqghhPQV/xzrGTm
 5pkRUmz0BvsNGtt6xMM/1zrbQES1beorukQ6hbjTf+MyMJd1ZQkJrl1A7tnIHpBZHAoYf7jJ1LK
 QNOjU/ghqPqzSGDVQRg==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b0347b1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uV7-nGl-jdedDGloHnwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX1rhaHYSbIlCu
 Gw01TEqGDcPeRu26OXqCOYu/fJ/pfDNNRyii8hv1uqx6HcC6hRJi25tHL20szXsDAJRwK6lW19c
 sH5O+WO5e+xXMg1bb8t/XvRkFgIBuK8=
X-Proofpoint-GUID: 4dGxflR9-ADkQLxMtxYcHZJELRGOGyS4
X-Proofpoint-ORIG-GUID: 4dGxflR9-ADkQLxMtxYcHZJELRGOGyS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:10=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY inp=
ut
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If =
we
> find a real use for this we can turn this back on. In the meantime drop t=
he
> definition, it only confuses things.
>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_re=
s_x1e80100[] =3D {
>                         .formats =3D &csid_formats_gen2
>                 },
>         },
> -       /* CSID2 */
> -       {
> -               .regulators =3D {},
> -               .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> -               .clock_rate =3D { { 0 },
> -                               { 0 },
> -                               { 64000000, 80000000 },
> -                               { 80000000,  100000000, 200000000,
> -                                 300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> -                               { 300000000, 400000000, 480000000 }, },
> -               .reg =3D { "csid2" },
> -               .interrupt =3D { "csid2" },
> -               .csid =3D {
> -                       .frame_sync_en =3D true,
> -                       .hw_ops =3D &csid_ops_680,
> -                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> -                       .formats =3D &csid_formats_gen2
> -               },
> -       },
>         /* CSID_LITE0 */
>         {
>                 .regulators =3D {},
>
> --
> 2.56.0
>
