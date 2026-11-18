Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794969714;
	b=3dFpPejoV6MbzD+0TnSm4T7GOvvKNjNIAzAciVtIxtgvlnTqLl2zB1Sm/SXFuPwu+P62
	 9BolDyd00NwqFZZJdyvUkcHTe4rmpwzz/jz/sJlCmx8wXxVlf6+ZNjIu7exAAd7J2BcZl
	 gLMifPkLsQwt3FPrQYbJPLZf3Mw4A514Um5g7Jii8ggg00lr3Lpm3KAe7GAMXtp0Q/fK2
	 uclQhqfcVD3MlnUjTZjXyoQsU777lVCthuGbUWXK0YKxoTXQ3CurHlLYYWtgrD1SCHUnH
	 7nqVBExmaJAM8ePAcx8mCd8iqyyfJvzc4UowXnwSrfn7evUNPqhBTltbdA+g0gthOrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
	b=yB+8iyVKpVWAbMCU+rNmdEOseWULAipxCZTEZPR511EyH6u5lzBL1DclfNgg8JY/pN8v
	 5+Bg2w8jpxEZcPXfCaeoAZ9K3K1jYnNJmAx50T1RV74iF4rSsPvb9TeC8w+3V9Es3tDrj
	 GqH9o0UI2gAyQUSRDcjiXUF+TcjIvpS0VvBdGqkfroL6FslAXOhywCr6NUxle6afj92k4
	 /FVj0bd6F+kdvQPL/HA/vtqT9PrkhrWnGOXcDHb6Hj6CEBpioApM+ELBVTivJK9kbseHb
	 1HAsLtpZf96Iw1Lxr0F35RIWK4dRcl4boERgfg9KXnrrSeIkqL6lbRbJmyYjd1SJjiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdfiQh9T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtUTZzMs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332FA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdfiQh9T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AtUTZzMs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrsC2383072
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=; b=VdfiQh9TO143Yzve
	d8LMPHXsMHq66Uhcwgp/xbKf2czRZqOr0IqD7m1ZW4cHfEE/MjlxawqGlxDUvfYE
	3DlWZGT6+wT/qxNkK7NsRmQ/QVhWG7RuFKwt3Q2PM1DHd8ttW++HUS+NFKW4/Bk+
	OclCa0TN6v4RGMtQqUlFGUEedXIVOhk0Uiu+UgT2WwKURV/0Wcs9W5sr6Vg3DGBQ
	pJkkrd6ggcOX9GKX0zZNmmus7oMJh//EphyrsVAA+LY7kgVnBfa4uAcbq+V54z7X
	Vq0BO+nAz17xoaSaQ+PV/kRkc0f/njQ9sQrIUXftxVWWcmHFDTR1o0EBmv3wBzA+
	I+y3hA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvarsm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so6926295ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794969712; cv=none;
        d=google.com; s=arc-20260327;
        b=dtiuPVsMyqoHGyLt0ILy5BxoxjpFx7xrPsmIdXQZFc/oApW0lLIJq36Dwk/+6cU18H
         q9JvFZLmR/2s5vDxTOFSS5DtoDp25ASFUlVF49POyNIUClpZkFUGgAHOE3L6glb+Mwsc
         2Nt0tW3N3EpyZ7qLf815f9EOFQuWIxyRftLmwLL7WdDooMrUea3dBfOK4no8FqJ8dLA3
         UUbwx6bF9oCVPs5sTTh53dtTJWU3a70YpeADk8/0JJKzJ+QOnda59frOM7uT3/cAWw+j
         7vvdDQ0fD9n4eQxmhR6QI0Ywm8x0Vz0zDKnMStDwfsXMY0+uxuEbjuL5wIC6h50cCVOS
         s0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        fh=77AlpkXPQbjx7dF1YyF+SWazLbvO0akClQCQFaRb5HE=;
        b=IhPVPefZD7PDsjUt950YJ7U6HW7XEW5BYT/inkemzsOJqHzhPtp7DRRPdIvSXnLqHI
         Uem1m6/pWozB97ca8E54mNWryMPpESrH1gfx/eVO5KpZKNB+ANeX58VYNw/Zx/fZikUg
         aZ7pa2V/yMtjmoBxnu9dGMNZYZnaWaf5NfZc3qbtqjTgLX/ZcHHHjCoN0SpYZklBFHka
         1cj7xSXL+bn0NvS3sJsbIxfa0jDFg8+RHcWUn06DuDOB11FKyFEYYRFo3Gu30K6JnRZg
         iCegA161DmzFir6UBWHW2HOOAi0d2ZUyRZD1s/sejl2/cWH6IUOvFwastYrTuWlC/wcV
         pdfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794969711; x=1795574511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        b=AtUTZzMsk9VBgS8NNJYrofzUUF6xGdEwggUEC9JGkq8UwP9Y2NhWSgeK+bgR1n+/Et
         fWuc20GmPpoMLbCY50ZN+OWk0Jpx/vhraVE4fxo4ciLjSJXy9PVZjqwJPK80p+bosRn0
         +IkjOaj8hTV5h1+s7voLcIpwRJr0Ckjo0b+1pHFexynYC74YLswa0sLbvBoTmDmmoLvY
         H1yEsPreKT4sG35a+te47vKOBpY4URZl/NT6XDLlzo9U8zI8iMkc+rY8eETRQTvbjNnC
         drVb/qQobjIwv9kbNFvX54PVjANKfd6pMDpXCQXoM9WFGboPd+lOCNwiRPXTCRE805Ny
         lETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969712; x=1795574512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        b=ceo1Um9yF9U1Sf08I1wJTuBumJQO91AFmA+hQrqcFMe/NXXPqB55snO9YnYR77ARTB
         f1t8+UOS6NRrCQ7r4rd0smFMkCjud8VmUqpp+FoL5HSHq/Wm4Gdg+Sy5TpZJC6TuEAGl
         XiHTTFhUUJYHFk+VVJaGndV2btypVC7tuBq/CCs1wlU0fU8znFrpbzE6L1OkI9ZNu8nS
         e8x3dhXVZrZ6b8sj2JSCywze2nPvki3+CTcGJJaTXwDpsxJCl6KKptgNqVCOrUOvu1Ix
         KDfsXoN3jnCJRYiNK6NzX+hWn2STlTzyG3jq4jXzJytlSXdKJ0UG3IjnKoBMAvCFoVdn
         m57g==
X-Forwarded-Encrypted: i=1; AL+hErEqb+lC/hs9ZYAfKTUjGpg/t+YIn58GTXgTo04K8wVV4ubLN+rj+cMd1IeJJRo9OVPXfUoIKutGBvykHnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F/bOh1EI9fsT2AxStIGeU6X15IB7R+hz1CVoBN5zR1CJKB9D+
	/Wt+2NZkJIkm3bBOrLBefSMgJdeT637xdVi2hKSPgiG485lldMDSRkq8N65Nt90ur1GfslBQC+b
	UVRzgKdxR3kjvIzM1yj+el8dA32tmyfhxLJJL8MlPbrHeNNo3GjXAs8JrfTvOb0G70UlAKbPMrU
	xzsqQ6+D0X5P8mk7eLRlJIz1yqQROhnph3r5xZZaj4Aw==
X-Gm-Gg: AZFdTZc5VSRLY+Fb6KQLY8C+wvA0P58K147X/nv4NZaXFj8qISFvMPC9wtjO3HJ7qZ+
	ObLtPtnwsbk2uqB9XEc3NhjTOih+EgygOabOtxw62fiUQMwSjAzS7GsDMUegr85yqehkp8MBhuV
	2x3ILRWTNybYh93QF13NPsynKGx2BaFzlcz9caGH1fpbhiANWyshScYF5B4w==
X-Received: by 2002:a17:903:1666:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2eff75188a6mr12050705ad.35.1794969711521;
        Tue, 17 Nov 2026 18:41:51 -0800 (PST)
X-Received: by 2002:a17:903:1666:b0:2df:90d4:7847 with SMTP id
 d9443c01a7336-2eff75188a6mr12050495ad.35.1794969711011; Tue, 17 Nov 2026
 18:41:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050328.213157-1-zhangfei.gao@oss.qualcomm.com> <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
In-Reply-To: <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:41:38 +0800
X-Gm-Features: AclHuK-VLWBxgIZ0XisTSXibfSltulzootARIxFetC1ERo1sszBwmUSj4N4pF_8
Message-ID: <CAFkd8hs+H6TLg7rCbX=5vtbouDQmW-xRNb3riGZEDmtxSf00jw@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: qcom: audioreach: support multichannel PCM formats
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd1070 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QqkvHvLY7Ef6vnktetUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NQarI5g9k59Fd6PGNrVDNyJv0LMUWjVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMCBTYWx0ZWRfX2Eij47u+q3FJ
 4R5I1IldIPiPXm74rMkAkS9CkxIDcqwGFR4ahdbhXP7SU78a0C06dPuwZGMY4CRhsR3MO+4pG1s
 QZdeHonb+80TMf+lQCdVpDSzt4LkdVmY1wz5RhS2aBMm5iOhdyy6R8YYuv/xBcXqDW+HXvsnms/
 sE/YKNLDMsnWicmz/bhlxCeO/FaL9wppEYwsZod0as8OPX+7LXtcNUFI3RrM6lgS6AIz47NbWql
 I0RhqGCJ1Z43668tJN5p6IABRAiVeD0b2muyDDECUMUZ/zY4+CisMOnOM36ZFWVdBY8/5aNzIL3
 mfJyn7YqxemiWBvIGg5s9qPgwAGSrhinIg+5I2iHeQ7L5FTqjNQTMGyeL1EAaknQ7uF5j7ZC2kl
 XPbt47c6+Ht6MWh5T0N2vjHtN/KYvss+qoOYXv/HTBuyKUdL7sbyjm7AMiaPV/q2ayaieYpjS3g
 x95B5+k2U8gu3aC+BOA==
X-Proofpoint-ORIG-GUID: NQarI5g9k59Fd6PGNrVDNyJv0LMUWjVj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMCBTYWx0ZWRfX9agVGlauRUTj
 0evUOR9efRmmg9lWLkcz9EjotHyzaJtigqODZQMR5g/wtr3oV4a0uHiAdqycGBr/V13usFOlqFo
 Bi/sVRa+IdU5hDbexpt9HMWh8k2asus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180010

On Wed, Nov 18, 2026 at 5:48=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Nov 17, 2026 at 01:03:28PM +0800, Zhangfei Gao wrote:
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
> > v4: Rebased onto sound.git/for-next at 7cd6b1fd8f9c
>
> This doesn't apply against current code, please check and resend (there
> were more updates since then).

Sorry, has resend rebased onto sound.git/for-next at fcfcd6db32adbd.

The conflict was caused by commit 347e02073b08
("ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA channel map in hw_param=
s").
The fix remains preserved because q6dsp_map_channels() clears the
channel map before populating it.

I also noticed that q6dsp_map_channels() does not support 7-channel
configurations.
Is this intentional because there is no single default mapping for a
7-channel layout?

Thanks
