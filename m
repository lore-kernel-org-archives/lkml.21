Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470346;
	b=xLE3zMIARmOPxYR4oLb5Acd3K2YG0eDXEK4EO7PH6iY7vFsXGaOUAf1Fb/jvYlM75+uD
	 6PJNqnDAC1Euk2tjq6mtIoL/+KnOBS9H3EIZl++ZXQqoaEujn1a0Dl3IzJSvTgKJqzpKZ
	 j77ftkrKhv2yPtvR2nGAKnnua4dHcdeat9ic8VBkRuvxrhBvtg177SYGr0Ao3KpQqMyK1
	 j9j42GzLgVcL5PLssgb/B6Wz+L6DFXgeAqNbELsGvuU38HzMlr/IjugkSmFEL2m5Fsy3F
	 8Wlr80kIz8X4zbqMn0txALGf2ZbBJKeqFjsm7Tbl0l2N54yozKaVaaX/xnGiLxvbQDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
	b=EoHTdmQr6E4BOn0apRkBKFypX7i3RNW7rZErb+M2YAm2WOasOmmiCChOJ5lr9lIw1J89
	 48Xy4PsmWtDpbIwWxYsTOluw+WO7lfXJ/tyALldEG9W8AtU7LSLBfIx0YPPitjXSsIG6r
	 dh8dp1aYailZSRSOl7roETBCe3uoHCmu0V/uao37qc4Nqv3YpJr6Bg37b9a6UDvbMztKx
	 ujFRe4UWKc1SQad7vhxqKkrK+dD7DKMODvHeytqDB3/cy6Ca2LdXmersoG06hYkp4XdDW
	 iIKEDtwdcSNBcQkFIsGz4aXze2/RXP+zzoyLk+WjyaoVfSzLxy9a71cH/t8couxcbqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grRu29bG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKu7qd4W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C568F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grRu29bG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKu7qd4W
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJudhx2827537
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=; b=gr
	Ru29bGUeD20KN15hfdTn/v0tDcsuI0iM4aVP34KjIOqVlJ589XfwK0rRJ9PRxYhg
	j/oQV/f4gL+HRYAx75aI7FJrTvxi3/PrY0LLPXMwFPR8zWzNnySCrt84iVe2Latp
	slWABwSdOefa0MzvVtR+BIyPkFUlROB2RKAE+5icheqxjRYxJPep/me+ukfClyj7
	aNh+4VpO1/Ecoco+CGRKaaVIBej+gEZdAQo8ZyIBUpueTJrT3F6nQncdjdDqiPL0
	VuBFXnVIhvDU3y3iMcjlWw7vgyYYYUErrM7iJQGubIrkwyUsRqj9ewqz5EzCEUCC
	fCePHonyWP62mxUs4lew==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3shw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:45:45 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45e6091d8a1so2822131fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795470344; cv=none;
        d=google.com; s=arc-20260327;
        b=QE7iMLIXWcCoWWGfYTxl+MSYdAF1whNYB512x+XLM3A+4p6FjPIVZcbMQZRi6bM/mX
         QA/9NaIM4IZWDbartSZ6hOWuDkMRUrr6eSIdLX7EHzQMIQMrf3Qh6wbnEEba7tkLxVf+
         AnQHhbiOq1WcUa1RWsoshTFjBQKp6sJqNnUtDTDXIlbGqsn234H43b9EM9cRTAc9hgzl
         MAUEga0tUEiSieNVG0j0zMQNQ8wrITwY+XUAU+0pmfuAwADkqMeXdR+6nKZfVyKxp6uV
         G3s/yBrfypmxCIC6Vm8fc0uXG1sanpMOD7XObg/0v7mnL/GTC3pb2+9j/tobAnPcq5DY
         Vb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
        fh=2G1jwR1IZaqdM7GDeT/qJQ+k4ssZRrk24qcjSpKMtKQ=;
        b=SWBEnC+zBa6gnwsAZ5UuSnYrDqRNUGpW0xjYuznQsr7u/xQeT0zvTPcenZb/lhuf/2
         FeHyyJK2Uc79RSFRRAvo4HR2QWU649/PJ+9lB3+bYaIm+UBaPxY9T/0q0VwIXP6aDI41
         luKQdw0Kcioalo00nl5+C/p/iazfMC9broRxrrPVNLpLSQilwC0b1v587BSlD6EmXNCs
         6ha0KfPW4JBSEp/4A2FGC3oxIJFhzO0lfQ6GPTX3MWNty/7BirfNiul/h+k1zPjq44XZ
         uPeEZxd8evtZog1brX8QCqV6ukxtx2p4qnBUra6mYOCgsIeZ69QDzJwH0FTwizQPMoUk
         KosA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795470344; x=1796075144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
        b=UKu7qd4WEbSKPsNFfj+pHRYixCa/7b6VDiWTtOWAll2AZw5y//VVdKPNcPX8MmDI5o
         lGa1PY67uXz3olImtl6TKpojqvebh/rIl5cVj9a8zcCWLH4xzc54oIhjO7T5K1hLGW2n
         TsINYtVfh04NPCFLUuEgqZbWs3+7ixdXGqLxMHyc+f6LfydTn3jQIJxiaWk6UGgTe3wg
         wzZAtwBMsoCxzAfU3iuBMh5ydZXWJDPewH0vTmDcnCFGU2XdeP2rMiq8UDt9LD9MWwgk
         zavh8wgcBSypsZXfxe76IaNKtO1JepoFCZ3gsFdI1udaU9wguas19FykSCaXYh1ls+e9
         twWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470344; x=1796075144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8CTs4H0e4+xV/JFm+XfAOVDKNKiSc6f11sR45iH4HU=;
        b=GYx4uLjumhDevC4HyvuEMX0HQQ4ZekUMcqFWAciYdSn4RI5GIBElOAc7/5x/dK9Vax
         09qRPikkSxOboMV6zONyiezANq2heacM7sXFExb5aLi2bz1UyAv9mvIUZeBqewHOXs22
         DGiTEgtTCrLqDhebCfYUlth7yxzdaU3NaPW0Kr11FmVcpxddGcC1JlR9ctC1/k12HPBY
         hv0/muWPn6zCSKb1qrAXp+tmjdyMNa78mjqqBYve9OxU7+NFugtFq4pLJgqErJpiZ3D9
         Z3+nRYrNiVhQKVEz4+HkrtNdQSzFKcamj6/sRXZTha9j0BL8QXzvYdjttRodicHwjGK7
         ok1g==
X-Forwarded-Encrypted: i=1; AL+hErGIjh2yc4gcolFURkA/RSxAQS+N6lklohdj8pvwhnvZ8Ej+lz4dAF06MNGtI0Enk9ynft5xhNuSAyeXxuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TeaactA03Iq8yhnJ4jk2U9yzhfaQ0hGZ+goukwJ0YVREGS5Ck
	9CTHyNAh/MjixKvL9F0Tj2E4+zbmKnvhKi2kPdokUYS26s14vUF/8rOJ/8aejvCbPi9eMT6Drca
	HO25ybsOMXfYgYRKjdIyEsKaA+eDTzTSj+LkWq8BSPBM6KRh/hWH536mWsBHCWTgu9mBxHLGkF9
	VdVsmuesRcfgxQPe7upGq1FhLSOUdiUR1jEbyIynvh0g==
X-Gm-Gg: AZFdTZeMtMgKRdipQ+mkpbJZT6B7JO7K/akyzK5Lt8vs8q0U8Q1Y3tB286cIQ4ui9PD
	7KHhak3b3QowcD1PLw9FHh1tUSbZQHzGPQ59OcIVMNohEADpyFEHaD+/Slft7SmTRZ58G7eJo2c
	KjkrEPxwZpj9n0cnTOndupnfmHPT3xUwKb+krmxnAqlfIsaI20Np9IIWxCqpbFVb1o91LQXvh32
	8U0CK4YOmjAr/WZ8nYlqw==
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id 586e51a60fabf-4bc821920bcmr11250547fac.20.1795470344138;
        Mon, 23 Nov 2026 13:45:44 -0800 (PST)
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id
 586e51a60fabf-4bc821920bcmr11250511fac.20.1795470343685; Mon, 23 Nov 2026
 13:45:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123181306.420017-1-robin.clark@oss.qualcomm.com> <e4ecc291-026d-4ae1-a391-5f3856df8ce1@oss.qualcomm.com>
In-Reply-To: <e4ecc291-026d-4ae1-a391-5f3856df8ce1@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:45:32 -0800
X-Gm-Features: Aa3M54rCKbnTmosWYAIUHrhm3070EypXS245eQnX6lbW45gG_2uvaZLev6Ye9i8
Message-ID: <CACSVV021qzsi-s+9GfOqx4syzb0=eAtv5nTV7u3thOqLrRa63g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a8xx: Add missing preempt_record_size
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04b409 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OkJ-WEULEOmYfeJtPDwA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: 5GIrruSz4mzDpHmFwk4urBQfEujtIZWJ
X-Proofpoint-GUID: 5GIrruSz4mzDpHmFwk4urBQfEujtIZWJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfXy3FJagS3qnHS
 1U2jowTWqpjY1G7tHQ+PS0XdsL2MxpH9jBAfo1W5P09z5r+HIDgcM7j2PGU8kjQbgxtziwbyFaJ
 WNF9iI9LDgeBaJ4iGh69kMr4slvNgao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX5wNX3xulnaGM
 5pFYG7h/AOV5izbPLk+0ghL/dvZ7SDE88Q/kHPlQDKiGQ8ebr24jr/MiyID2MFQssmei2NXcIep
 JdKmwDBouZQQuQ7s01pl6bfTWrrh5C/ymDK8Y7CzI9gwmkrcKGyQ8sPz4GfVKV7RYcvLaUrI3NQ
 4xfuN75d2LNHHsz648QCRROcz0LBmmWur/iZKo/1rYtNA8rE2lFMD+nOvToZ29m2WZEt4YbVsIL
 ilFMDBimSZdXgbJ+GpCMqOspiL0uANxZ08B12FyQDf9H9VdgYgatV6a5otFyq/FwetMwfQPiN1K
 eCtC+MAjs6LkE7N4CokT27mHNZSoQ6lz5QDfr5YCG2mNpDDT7fa+YM8QxUYQefSQ+87jg2ruuHE
 U3rL/OGQwcj+U2+4zVA21MtEJxzklYIptuXUKiAMvrGVtSiQc1ZCLgv+Jr5Dc2sZDUE3Ei9/6kX
 ur7ysQDQhJd5rKw/ZgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086

On Mon, Nov 23, 2026 at 12:02=E2=80=AFPM Akhil P Oommen
<akhilpo@oss.qualcomm.com> wrote:
>
>
>
> On 11/23/2026 11:43 PM, Rob Clark wrote:
> > Somehow this got overlooked, and Glymur/Mahua were falling back to the
> > default 4MB.  Which is way too small for the amount of GMEM on these
> > devices, causing faults in cases where preemption needs to save GMEM
> > contents.
> >
> > Reported-by: Connor Abbott <cwabbott0@gmail.com>
> > Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
> I think it is a good idea to add a WARN_ONCE when the default size is use=
d.

More generally, we should probably just warn if the preemption record
size is less than gmem size.. (we could probably also make the
preemption record size smaller on ring0, I think?)

BR,
-R

> -Akhil.
>
> > ---
> > v2: Fix typo in commit msg
> >
> >  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a8xx_catalog.c
> > index 0c6dde3cbea9..20fe93b83c0b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > @@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] =3D {
> >                               { /* sentinel */ },
> >                       },
> >               },
> > +             .preempt_record_size =3D 23088 * SZ_1K,
> >               .speedbins =3D ADRENO_SPEEDBINS(
> >                       { 0,   0 },
> >                       { 388, 1 },
> > @@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] =3D {
> >                               { /* sentinel */ },
> >                       },
> >               },
> > +             .preempt_record_size =3D 17712 * SZ_1K,
> >               .speedbins =3D ADRENO_SPEEDBINS(
> >                       { 0,   0 },
> >                       { 388, 1 },
>
