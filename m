Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163473;
	b=FywcbCpQA4sBiDpsQtrJeyJwipaZuxU1PVoWPeTiNiOWp/xVGGfHvlMUXs2gr6vjkrvv
	 YlUnlLhAqMU03AMEq4ddh5wFB0lYwXe1/+G9wnmVO4aKb2WEC3Wvh0oA5GFJCyynYw75A
	 p9zutlEPs7W5vMfnX5W44E0AbaQCeUAz5TEnbR6ybhLYDCJr6BscLZSgq9je4jDGjD2xC
	 2dO4EXbq+h2tPiOJazxbBc4f3msT0TkDj9IR01mo8cp7/B0KsIzlUgNqjVuIWj1eN91YM
	 ckpX/hT0ieKaDONR2Oz+daJn2XmieKVGc+ESNDA5Vx5YMg+TIsfOuA+tDkzc3iEoTTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
	b=12L8XTd3C3dFcU0+f8MMZPD6y8QulgSDg+KnPXsvtsIoBuhpL20jqkA+2mGDLa4F/B6R
	 rvBEc8c7sZXS78T4xShlmJPI/Vv9NYj+xff/6Ck7rJezD0ur8zZlQYE1lCY3YvjrujNwK
	 dKEVBYlJW0arAlzM4XdQ8IvyaSCdvhey9xmq7GUpHnJBv0yNym8D5JTT1udJSaZpSqcU6
	 ZJ9Ah7+1xHgv7BpdgGDDng2a0JV4XzaW/k2SdVp9m7WK/WK+TVXtgrVo7opK+d2NXAoUl
	 JBNuAQ0zxUa3aHqPAZ4CQRG/ODxTb40+TKvT3iNbi78yTA94975lO25u6S2uvPsbZ8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C9E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LU3Y3XD1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py8Ekl9I
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0fa2019591
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=; b=LU3Y3XD1hN5TD/oQ
	pz6hWJygeLPcb9SMWjd+b1jhQYq1E+SCUds4bO5A5I5/r+64PMwci6GVVLVHnJDc
	YHttmuQ4yepW1NYCQ9XNTNheIdJULK5hfkYwwRxXYZzz9yFtVEChw8ApvIyTwOPw
	XqgcEcRDQC+vhnD7uMBX8ToyWGOZp9xPdICJj2zs9iFq80ZmcBhK04RdWAU4qShY
	gwGIiXb2BKdLnte9LCJ/RED9pBr6ZiqlVjh5GqPdQn8Xdo3yf9b1zJQQrOcyyxeZ
	9GqamWgzZlYJ+N8MEhuGoUZKzn0QnbXI1K+z+39bT+WLOZEC1RuO2JII48lv5fRO
	vK02dg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj8u5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:31:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso105737985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163470; cv=none;
        d=google.com; s=arc-20260327;
        b=UnD9SQmHPB+XrLFMBQnZIfkuEzvM57hpIEczuObAwFqgsKXcnEf3zKBQJgLbr6jg/u
         +NylOddzO7ALLoVoKWfdAn2KrMyMTAIw225JsPnftyLjz0OIAszelUCz4LGd62UwB79U
         Btb/8kelxjtTtRRBPRKq36KZQN7rdGxb42DTCPVqX4g2mnGdfks8tcZBwsDtJkRqtK3P
         byFUyMKvBPmjX0N607Lm2sW/0BZ+fM1d/imR8nfod+KCC4otieAN36ASotZ0/kihe3t4
         ArxE1KzNlHv1iXtqzK/rfZ727LIbFxPCImfPGpj1+7gxPed5gSa8XZUSRimEayNO8VmU
         lZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        fh=UsX/XHf6T31sbPLab4y7TCOKniPXmOHIS1x3mM90hjw=;
        b=jaXs0wMPu7haOZvT8Hvslhg+6UMW4hJ3KNN/fojLGak6fwwi9LP7s/z1nOx9Y9rXkq
         400JoamYvPxAEGFcYUIErTIi0i1vN7ynoUBMMGjP4oplvbUPehBudSnF61cPYFw0/wdo
         bC4dKNL8Cv1CA9Uid8fu9dZ1c/CEbIY9EgoUufew2kreFmDJH1S8gXB+2D02KD+e4azn
         xiyRVFPv8ZNNslVG7PnEExr+pA7DMhm9EMKYLb61ATx0FWC513wvAvdtsVwLxcluSTVd
         DOj5O56jCEFKWkfpkrLdj2moVCCHxqH9mIcD1X+e2+FdjjlfCKDvhOUMfp2WL2g/kvrj
         G3Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163470; x=1795768270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=Py8Ekl9IfA7utoB0tDdW4cpxXAHzKw0Gyh6IDpWmT8EmgVSp2OiBfPp7H/yrqjbP80
         wiY5EFNEpvWT5MH1SgRtPVfbqPXz7ngDWkdLCIQApz3rZaCp4QHVwEONbsxvBhRo7yIW
         3asJ9sr0bFo40+eLjJFQ/MTCjo9Z7VSVCr5VqMhyEbmDnjkBfM+JpgTumLAHYFAmp1L3
         7zs2dy/AhSdxx0NpyqGK2kyP3xiG4cnUZBn/vWii/ld7Rexq2zHx85nbJ0koJ2qlwd0e
         22cCvjw23HJxgK0SqSTaMJHwU/4+yGtC1cRZcT2EBawVd7H1O8PtLkyrY+OyAieiqZxN
         xzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163470; x=1795768270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpmh/M+A/qQdXAHeacj4Na1iCs57fndm3RIBxR2oEDI=;
        b=sa7knrTFgp9eDdCM3NZ7zEd3C4LPQsSDylb0/ir+8qSGoTJAXJiYkF0AhL0JHLXwXF
         b0voGElJ7dDhTUsP2ZRD7HztEq5q7gTP/WTeb5SFYOudnr4/62m6SgEU3lS1uY0OJkVg
         NWnAe0zLaNhaO3OCtfJ2MfZjg8+5fFoYio0/u7FSWXONln/wqPxbTWT3gejmYuGKlJCw
         eyyCF98VavdT/fWxIwJCPnYYh6/fT1PxDuGWuXMqoTyNK5q7qalQMbwzis1Un24Ghihh
         qeYLlFcTf4Mi/XR0IBJTktq9exxekLWnW4p0go5pAy8PFV8dKwFJHWCXkwJIAxPR8EIx
         kgew==
X-Forwarded-Encrypted: i=1; AL+hErFFYD4h6dcqvMf4jTh0tP0tzC0GYMltzqgCpwIR2a4ZNSIODZeTNd1d8h1PHu/OvdiJCrGYhEFAcGVkk/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lcJgRbbljXcFCoeTUYNw+m0+lq3q23q2HPeVKXOYsM33+F8AW
	W2EJGWmIPGkYDjzP1ogQMx5QyNDiqVLrz5onu6zgEu2Y0DCXmbzWA4FzVCtCaYS7UvRtEgW6Vw1
	QdzX01BOPGSj0NtDVajlMxjiTqfHaD4IPpb1xsqG3v8yIIGgVeRlZs+ZclRyxBku7hqN2jiKa15
	G8Yjbnabfj9R00j/6ZTMkqg9QCZp81oHm77RMwc9XAcg==
X-Gm-Gg: AYBFou17RRUKUb9Ti4f7e/W43wa1NKDIUZsfSofa2J+9roH67IiaTdySQXdJzRv1qBA
	jPEjg3hvtq1097RNKvF1b6H1z87nmJG//4a/5gWf62uHXKHk0Rg0T9NMKPM7qLXp4fWEaHBAZf2
	cmiEdu+Yn6buZlMs6cxhIWuSsh7GKpFejm4w5qOj6lkCtekO8Iwp22a/fysv+7wSJw+Nb7/gvW1
	NWrzAooDO0SwLdvrUICDqHn0DL3rZCh/D7rwiZ4NOnX3zdNr9J21pkZF6P3fY+M9D2JI9c/TsaK
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id af79cd13be357-949ba8236d5mr338133585a.2.1795163469986;
        Fri, 20 Nov 2026 00:31:09 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:949:6775:4713 with SMTP id
 af79cd13be357-949ba8236d5mr338129185a.2.1795163469416; Fri, 20 Nov 2026
 00:31:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com> <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:30:52 +0100
X-Gm-Features: AclHuK-2t8-3AjSOfc5mzRVYC-Pl0iOAGyB7DrYCV7YVpEsHwSudVmzm65JQBp4
Message-ID: <CAFEp6-1HNo5fJ3k24sM_Ed_WsrrUY73ZHz3+ZJwa1S4pSqQshQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b000550 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=J237TlFOsQyoHL5R2bcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX0fsReXhY8MMV
 WhmKlMHYz9iZil5dm6yMUgW65TV431wyMUb7ZRTcru2y9U6FXVGJMaIS5sh6ufNg86FXsv5gLY7
 zi+8q1RoLwnuks8oei+6FFqEQuSD5Z4=
X-Proofpoint-ORIG-GUID: uLDhL3IwduC36zuPWtHwRWRWGYb0qLQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX+nn/X6xSAk/K
 KxATdEIwU0erxUA0rYeGZilhGHleWWkCP24AxbL1Lj8fk7O1LPgSuFETj+zbRWEpLZ5ylcjuW0X
 Z8YjhQPnHk2jCGsTd748/d2OQn7ZqRLxixiKbmrf9k+c+l25Mo0g2YmvcYWTbmMNs6WzX+B065k
 eRogO/u9Jy+rt4Iyba72hKF4rMS7i9BKJ0+ElVkQMHP8guFXPg9paXqR6/yz8CWphzF5flcX1DG
 CMr6liEmQ7xNXp1EJ4zeKGGjW5biBmS2lZyLkfvnmpkn6K1so/Hsw9MUkzVV12ZMm8nGSe5FoY7
 VSCguT17FxFfLBklqX3CN1Cfu8TvlFMPiqHoxXJiXhiNkuZo8tyxVZGyGGQGxDdwy27OLA/to6z
 zFIAZSwuvpMMrnJp/us8CyeZ++mdpRDXWvIOcVn4oEihazeDpEr1y3Yi07V9WBEFj6FXAOXFEYR
 2OQ4Gj9UO0dcFAxfGiA==
X-Proofpoint-GUID: uLDhL3IwduC36zuPWtHwRWRWGYb0qLQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Thu, Nov 19, 2026 at 4:04=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
>
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 42 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0c=
d4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 0,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 1,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 4,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources glymur_resources =3D {
> +       .version =3D CAMSS_X1E80100,
> +       .pd_name =3D "top",
> +       .csiphy_res =3D csiphy_res_glymur,
> +       .tpg_res =3D tpg_res_x1e80100,
> +       .csid_res =3D csid_res_x1e80100,
> +       .vfe_res =3D vfe_res_x1e80100,
> +       .csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +       .icc_res =3D icc_res_x1e80100,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_glymur),
> +       .tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +       .csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,glymur-camss", .data =3D &glymur_resource=
s },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resource=
s },
>         { .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resource=
s },
>         { .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_reso=
urces },
> -       { .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resour=
ces },
>         { }
>  };
>
>
> --
> 2.34.1
>
