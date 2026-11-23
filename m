Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434957;
	b=DsyBlvMIIrFZ48+6321kKByEcgx34LOFU8q6BByjCUHD8+Ixg2Gp7pkuiAuPeMQQILIl
	 awzPiR6NKs2BxB2IPFpKymeMP2kWmbPh3ySTdbv6r7qT0/q6GTYH/KWX4hkIIuEqu+oUi
	 32gqsalKQWXWN5BucMB8XiHEJCqd96SGo+kP5xqK9xxGfdg2420I0E27fE7NMW9252cUQ
	 puhjj4lUXBHRGLVDJg53jyiX3q5M4TF+fQPJ8lH1bcHXPq3MMIuIJGlSAKL7MbuuNiZ8S
	 i4vH1KZkkqWDHn+DgmD4MJZXpsDJMEwDJg1BTaOFTGcu2GQg4mRSQuCWXTYpMlBsGxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
	b=f7e35mhyfguIyWL8/jvwUCkD22u5OUjaObW9xZUoSotOTr/3pUzXFd8NF1AZIoivY0vM
	 +W7XlZlmWS2NEb0hp8mnp5POeE4K3lxAfpUB/RTRvT+jhBSpoPOR7iF+80yz5fJXvG7xz
	 1OWuYOL9l7+LO+G+iHU+w3lUopShRJEyjLnlygy+YUKkV/QXa29CUgbu8ldqXL3QIEOpM
	 cXESjIIZhNM8Ipqv8kwA13Y1usAjIN2C2DM9+AvVnBEXK9iAUAa7bRnAMKLetW/Ts60Pe
	 E7CYCE6+YAgrnBSCfyQihWdc0AbAg3dGSjYEdHDSTLtvIkGY051O55L4PxkzhnOdPww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FA0606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FA0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IbQ93491003
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=; b=YgSwKQS3SPovgQxN
	GUmINrmPXDWGKW6q/ioYH0ObUPIVX51a/+TwH7Njh45HmrwWoo4cUva59RqEoz3i
	tHzHZ+PdKTh8sVbrg2BnL5olufnr+T4FKpWHWp4MQwDwENAeCulBVJHBMXv/PYVT
	opFWwysZ+KmyuiIC8nQHq5c9ocdzxnbTFwYGwGNzm0HzLttVBiX52PzeRH3g7yhX
	K/G9PiwiJxch99qx6zW4uPiX5bcvaxYzGWyaWtzazNp3cU5gieqIQ7jJ9oLDcRTI
	L3JuFXAtvn/KdW+dwvns2cIvmsT+WZhWRqgsDp5AP4OaTUZ3C3/XpsShQybdiZnZ
	yg8Fxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshetv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so644760485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434954; cv=none;
        d=google.com; s=arc-20260327;
        b=cpEZQkGkAF9uaSvFl9Y8fG19lK6139EHo7rA8ZnStqfn8Yv7SIreUs/kgxfqonoSye
         /DG9hyKsX9pOHctRSZHTrbqYK92lhNiZNzFmXv4Yb0a5+DAkdQ5T4Y3ZFY3FZPDc2bVj
         WtS7R67xhGuSKtDALXEVePPYWpqEaLsjZuYvlIuBXh2WJ9detpQKeQfPmQBPfvtwdK/w
         nQGOfOCkQ/xLhKlpVSkcDVvae1JaBLOFoRp8tkx0mF3z465U5TM6NJLhtnvLP0wCplaM
         z2v/LAyVZzsm1+1R2v7ZCbGY5fdk3hUwlebmBtTOQj+i8/xluWo3gLFzACYGL9Oky4PU
         v7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        fh=BAZMCuTwHt5Y2V6VINgVwnfYYDJS83bBq3GzsRunMA8=;
        b=im+HZo2J0pNC+eM7bl9kb7J6ExzYCzdtqRciPHp/nzPCTbbC3IWKWyGBN2s5KMfBem
         fETaglD6+1VBtzXnzijoHgLb0h7W899wwPtnLCqdM5ULLL6tKrtqZssRrMuEKCGr0hVj
         KPz+QXrnprjMOBcN62lFsbnSYlpmtn85piRKYKcIh1jQDV4K3nG89dF+USlfvb2LXVx0
         rhQjcEGhgIC5KzPEERpTSBRxbCApbVYAGrukLe6iMm7AIO5TfuDF+sr1daBTAbI6W7iF
         ingHpkN/Rh3XjW7scINZVMgfVDOTGve8PcKKMqvghCzhFc9QqFbJoKQHgY5XSKed9/xm
         dyHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795434954; x=1796039754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=JCR73BE0OGo9DDilbWsp/GyyMFZupxVJaH5T7/HsEMTauoI8z1FqyUUyYvhpGOdMs/
         YQmUquYDr52Ivxj2z09Tp+0KPTZl5pUjVlrgv3Q2TsD252NNet8UBg7wAZwypEEKvFiv
         zOx/aV8qLOXkF+5vYNAHCO7xHXXv+g1HFjLGDGabnmWsT9k9pdsn5VxG4YvZ5ScGx8dz
         hRRvNgPAlw9HzL/7/xcDYRcLZ52AWmNJa5ikTNDUy5RJmQZS98PTSLXQwbmeXPz7vpUN
         MQtlMfAt66MC85OeGESHWLiXF4pbgRKN/bvkHlEgGdh4q54ekWL51EW17IWxQxmcUQOS
         4MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434954; x=1796039754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=XOLvfCwl+u9L8a63r6f88NftJpGJKwDPuzUIrlCy9CTG6nU+ZT4lJH8aB/Dr8X7AqN
         rN2gfvPLk0dpG6YsUpuzTQBw7XEJN1EyyNp6Ejf/CHw9SCPNVkfksHeG7nd+4WOG3UPE
         vYIID1OXFTTJr2sZvztDQtgjrNWVf27Wmic3Nel68CYG8W9cNRHiLahrBqMMpmdYQUtJ
         gnkRp+npWq3KWGhTKofL6tF4Q8lzp3ZvB/3xhABB/KA7G2RhJAHvWw5NT16H1ADYoVJw
         eChSYagk1DSVKdm5hGisbG6mLuSiBvEYZqFnPXF4s+gyA7O4yGPNzvCHx2homEN0Om3U
         i6Fg==
X-Forwarded-Encrypted: i=1; AL+hErGSV//ROk3i5WBTr2PI8Cy6xRaT1YnG4Ov/FQjNCLYfpjtiDUONVdfgR8/ROo49Kn2Qp8oWo/udyVyZXt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bNtVFQn8b9Iej5HLu3tnLyjkcTEBJae5Yhuzq7LXaHpNg1+HI
	FNxQir9Iu4fZshRPa+tG7hUVEmtrACYXnuGuL+uUZT0hBcBTRNLLL64QoDb3/nsxmLcONRXXPV8
	KBenMX7lmEoZZzolYk107xIYEv21g2ev7bao5pqT0AotTaO1zCKOJNSKB2/mUfpTMppBl3Gd9nt
	6IAXuTaNj4GSxxAxG/qmsjjaSKf9ygxSPm3/bNypNcrSIFMOzbpCLH
X-Gm-Gg: AZFdTZcwYq4ve0ZoNhR7uvedbUvUE/yM7OZEw4jglsGuikeVWnowNR/iHvZhf8mtfWZ
	9o7xQovK4F40QPQZqB8YHjPUpLBaVbcxUx4BoQOdPaR2Kew5kak7SWUBUfnBl0vIg5ZTyXYt98o
	BADgTIScEwsC3VQmTiu/uOcCJZidHrEECEm14nPFGjKExvwQooyveBBLViu1LbAyhCC8tOMQKit
	+11TlaGXWurnFNQUXiVZpa3JroTy1CmV3rqajt1/3Ce/2fLYvDTW4YrOlAr6aWVNSpeF44P1x4g
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id af79cd13be357-949ba9d4cfemr1741028485a.50.1795434954517;
        Mon, 23 Nov 2026 03:55:54 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id
 af79cd13be357-949ba9d4cfemr1741026985a.50.1795434954035; Mon, 23 Nov 2026
 03:55:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com> <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:55:42 +0100
X-Gm-Features: Aa3M54pzaN1MMD5e1zJKHe9DPNQOJ_Dbh-NSm_ScNAiRKuU9oPpZJY6F7RsVn6s
Message-ID: <CAFEp6-2EFh=gEFN7-ot+dYKjigm-2tdKPmKjS3_irCq9BPSATg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0429cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=FShq8-UYHVsJhsOZGvwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zq11tpyOYoAdhl5vPEShQa-LkuhT53DB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX4VvxT34Byu4V
 XCvuO8/FoK0aVJ/yqGpuDrzEEHjMw7ZMJ2LSejGCc3GK+7ooORLIedSiSIZIpnXsB0+a7Riuytr
 i9qQZQOyxJoH+FL9Asw17EnpIO8BPwfMaBr0/ZoGxyqFPJY+39wSy/Ub/aTXIQqJ9l3V3ZyPokn
 /20mIZ/gpJq/Op+BE5WrphAVJyprWp1kdik3Bp3ZmLd8GqovCuPFFcreWPbkEnMG6qDWfAmrQ1Q
 MpEInNSByi9Vta8PSVghgPHvpO7jSRWPe1w6Uaeem7c3hk/bWwlLE2pIrRhGk6XaCvShFczGLoT
 6JrNEpc17BC9t91tQa6dDE15+LLR5ENdCcG+BugWW39L14Vl/+b//Bl8508Vwl/AqAj1QaYHEge
 Fx+8lzyHsM0r6oEENMhJoqhbX+nXCC5K7Hvv0UyHztBFW9mtfMkdfz0VaR7uj+Ept4xy2YM1ghC
 11a3BEO+4NoHrGuXUBg==
X-Proofpoint-GUID: zq11tpyOYoAdhl5vPEShQa-LkuhT53DB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX6r4B8/oVOwLf
 X6Bk0o7fmrOySuBmxTRNENFG+RElwapIoD1UPRqH6JJXCgt7xTW8bO8nYkcdOvVrvD2ltDvwXkk
 vWF5zF3QiHwexZCqR1PbooGo1O0WTqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

On Mon, Nov 23, 2026 at 12:36=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
>
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
>
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
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
