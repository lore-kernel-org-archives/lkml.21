Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795671358;
	b=46MSijQgf2mfvqvsWOuCAxR7RrtQI7BHLDDBiFWq1Fi3U2crIBstDKPPsLyuDeceU0Yd
	 z6cpHY3WXoi5x6/fy+UzBhmDyXkOEuDHUeT5F9po/Sd4uIjHl/cS4OJDa4DvoMbpB/q6Z
	 5N5tLwQgiE+5J2kFeKevHBwkww14usDmsXJShzwZj1KA8XoLu9j1I5Cf0pa0YPxpI7F7G
	 eEyih2fWYdsHp9TchXPPr6AdaKzqKGkI1vLvUDm93yVloR5mN4WrVyuRSO1vXD5jJcIqG
	 1965qoQ7+lwzapFf2IYBz5qO8vE0RIgcPfbGuUrUyxDwqCvyDhOqxcD9VlAMfv558Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671358;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
	b=4Id/QlNl6CYPEcgAEn9CWEBeP30hdeNpeeZK667mD8J3Sym8+BxDHrqjaWSbfWAKC6gh
	 ckUkQ9gf73NjYWwmukRV0oRZWgbVe8VR/zAqUc+upNOD2ZbiQ2jama3Az6lISOEZXYhZE
	 SE5CmdGfaMQGGta6PFTe8au+ouq62hDcKDnIzRytyItIz9ojp32frZFcpyHqut4oCR6mD
	 ohUeGoCyjbQR8LXmTGa5If2S5PrO96kasgqp6u9lozqBDmRVfoPen1EHSaVWmLcclnyna
	 ekr/N394eodTo8OQRrqt5dqkpgkPHlY7US1cVn3ZK/aAr+fjsFPJOVeO/JOtJ2qt6ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWXpjIRZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBazHJ1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8D6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWXpjIRZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBazHJ1P
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36XmZ2175930
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=; b=TWXpjIRZUlAKYCrf
	bCoI6WcynwRJOZcCPruaTA7JoeVcKqIIpMR6MC32zewKuFm8RwaSvHcu01odul3E
	IT7E8doBt6rNO6Bnw3UhbNv7+RgmCLlzHMObpo0R038o6JRPLHK92WHvle9D48cE
	kj9aB9oJsT7kVKq004Q6D23aSu7rMyIkMg6w1lY91GB7vRYzW4uyoGonPK/UtesO
	xNL1vl04NsJEg4i6s3Kh94znEP0nDV043RsvY892raTNUoEi2PtEDW7zYHGtNNIl
	ew9rS/qaB3f/idlvQY9/DqZhV9LpqGHTfiFElwcCEYE5GTGQg5kfOyXwz3EwoHZ9
	9ExzRg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhv4qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:35:56 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67dae919cb1so9597867d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795671356; cv=none;
        d=google.com; s=arc-20260327;
        b=RzBSlDF7hA8GxjzoBqt3LCAAzKjanQVjwgBQ+lsgxYz36XqH8Cujii35X807ZjZ0Wh
         2QD7T5rHfDENx0v7TB/PTFquPGL9qXzrZeptsXMKPYxDfvkVD6ZukVBLpdrW7B6G3TuN
         D0kOODLRxx2XHTKCfIwdhLgCo1qWsprz79s0rHyJ3GFCG1bzycYu6P8RKfNHoEhQrIUF
         D4j2pjF94XSKGDrE5Xkwkd08CBLEZxbPzb0lfnLjUDR0YlISn3P8TtBiXMtxK0/J42Ke
         u20tGxshY0ajgSLMumkbgQMERZoMnMhVqDipulgUhHp5X0eCyf0rIOJQAyI3wjYkn+C0
         yC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
        fh=fhx5gxX0pKVWq9GGvNCzT6UyXYn8ZYsfXLtRt7ILyd4=;
        b=o6NmJeSCJgX/s38Okunhk6qVIHC62oCRNUjdKdbOTfQh94oY/o7bNh34EdpM5054si
         tMu7mupBuYrdLR6iiBQvQ39+5qe3eG/QRFiIF1IMk0E2EonbL6Vrr7I4tci9+hWtumxG
         Ltpkp4cM+XKXt2kQa60KKE5sjGZ3oRC2OUG6egX3cZADLghJpE8mRmMDXv6f6Xc7myMl
         Dnz7aFXH0rGc6rzw2RSg26lQlKFqxNuBpc4oOC6jJGSYsajjbDblDKLMOGh2Fa5ySY7P
         EJ6q+BLDmm73HZ+WffNH+W7WAoWGQPWAzUiRdbpYbEQ+tIk/xgZ5YR9D5Q+9lJHSkxyW
         2dzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671356; x=1796276156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
        b=GBazHJ1PFsgPlv5sITz/jhplVi3hbq3xrYYH7i0/Deq9QQWd2b5xiZJeKasD9Sppfv
         K0OjgW3RqznELU+W6UzkeiO7NE+M2DLKzG5WUj0aXqXAjZlZsqmWdnOd54TWnGip6XrV
         EA315DsPP1Y3/l6UgoOndnx2NmK/Z3YdSryPwaTLT3MipAC/nQRAR4Xaj4OaSx9LzKwd
         HPvDPGkxkt1gV9Pw/PqBuV0IdaCa5GRlIWeC9uAvxFSGZOHx+J4BI0LxZD4qbrI5eSHT
         aHwCz8QpgzYDU9lTYLYQd1YoF/i/BarBHch0CiDxyOWjK75Aof8MVrS+yrnJnKmG3X58
         dO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671356; x=1796276156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wLY6WDXlt7DLeZFtzRLs+mGQyRljWZ2gx0ONlV7LhU=;
        b=GzSvK/lxKyDbgO8n/D5ThMC20P/jeyX01hk+29TSV+YwPzeaaPRpjOrtGhOgOZUQlC
         swLg6qisQki+jufLfZGGQAW86mAh3zQDYVdMA99ennoJNQ3yEEqKKuJx3zyqKZ3Czb2U
         IYM6Ej8lXbfQyTiz6yyDEKpj2yL8yByvKAXoV+UUwr/KWWE7r8xQYFeYNoDmC6G1RZ56
         Q3C/MlUUq+Uhb2q52x/EH0qJaa6TEzHIV2ilD+CMBHK8ljWwoSbKlxcdIPTWKKv1p6zz
         2vMgK6pQRsWzJWpkJsy2pfNGjuoMNWDZTMksxtwbYO5m6eRXWJT2GmAGXH10DIf8Hj5l
         oouw==
X-Forwarded-Encrypted: i=1; AL+hErENXB2D+eUpiQDDElpvR1yv60jY7aA/9z/+syOs6dEC7tg/ER565SbVVRuorpofyzy1fSICzAp58sANfN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q49DwbCdFM9jIS4JbWkP0M9t5/8t7P9UL5CFV+EaGJ7paRo6y
	WyswKsDJvjzLQVDYZIrzeii/06nT0cR5eSOzKyQVCoUgpkofRw5q38CA0d5T2oZ2kX2H1JLWfbJ
	oyUX6JwyBx1plgjf11GFhsGT6/oLkHxQz7MmnET4EPVeSOSrBec4qJARo9h0wCUo4FlEKwcTdmI
	f3PilAtlkpZvGjqCJyV5RayNs0+osyjmRwfdLK9hDTjg==
X-Gm-Gg: AZFdTZc1KReuGck79hhF3Gsvt6elOkad6RkkY7N/jix0IFSdrSa0Hj0utlsbhNJ83iX
	LlQv9FQqU6lJ1v3bzv0TCPQxAnu5qlzQalE3UUc8B/JzAK4yTqMohWj7NSxQSImF7k2dONTqDGt
	ob1iPeLz3mtepUcVNpKGVEEEhFlov/TfUlRrjO4vYD8u58fYXSpi5Uk7xtig==
X-Received: by 2002:a05:690e:400f:b0:67d:e460:78c1 with SMTP id 956f58d0204a3-67dec454459mr9075903d50.24.1795671355789;
        Wed, 25 Nov 2026 21:35:55 -0800 (PST)
X-Received: by 2002:a05:690e:400f:b0:67d:e460:78c1 with SMTP id
 956f58d0204a3-67dec454459mr9075896d50.24.1795671355349; Wed, 25 Nov 2026
 21:35:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
 <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
 <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org> <CAPTcHHTALv+Atqf4PKESvqRGDKf1+dPmdJCjOsy_Zpk8ZVJ2JA@mail.gmail.com>
In-Reply-To: <CAPTcHHTALv+Atqf4PKESvqRGDKf1+dPmdJCjOsy_Zpk8ZVJ2JA@mail.gmail.com>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:35:44 +0800
X-Gm-Features: Aa3M54ozoI0brzTdLEin4-PQPMiSaVHu9T3c5Nya5fB93qflgM_PLtP-EgFFRHg
Message-ID: <CAPTcHHQOLzoA0WUEVdcfC5iAy8C6YnprWjaPY-9d463swxiP3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07c53c cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=vTvV1dd80Ivsq4zynVIA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: qTme7krd_hvpBCO_CI97b9HZD7eae1Lp
X-Proofpoint-ORIG-GUID: qTme7krd_hvpBCO_CI97b9HZD7eae1Lp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfXw/UT8c9vzJaB
 hSjBPgvjs9mBaXqNkurUDx7bqh1804vXBeGwMsf+AZ4J0N2sCzBUq2G0Heji1Q7T07/GWHxQ9L+
 yICsU77h8383fJTvks2c9eBhu5slynI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX3f7YO3U1cGBD
 B5W/QOWY/4vXCSR6j8u0kcIhjb/1lFFdDBKR9Cltn/AVUhV8mGITuw4JG/OeTQHVVxx+PiHdmWN
 Ddg2L5GcXpvnJihZDsF+CDL3fS855JnWMPtcEI87V3qryPkuzn8KNFoPMOlSuv1uFW6EldojOfF
 ynMkF9BPvDdPyFGeFugdcI6PlRz+U0DwIZloR7UwULPCBycXbjkCnviF9wiIhXVx1uXELTu6Ddh
 3BX+y6rDqgPxdQV8nnxEHj55I12eudDOrOLQ7FEK/WeS3Ke3DNwF2PPQ5cdCBQHckSxGAPINOEZ
 nXhgUOC5auSi6khD5bLr7bkiRQ+Y6oDV/9+zHHW6jsBYQnbX5IrfJEKcn20Kt6w2nFZADnOR9I2
 gCyAFENbTtbtkQsWFLFpPJC3HYqh/JwBpehRAR5SwU7u6RW9558wW1nSkuK5tFt+UiBbtWgv6dK
 76Eiw6+4hsJaYC9+bsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

HI, Srinivas

May I know if you got a chance to check the comments I posted 8 days
ago? Expecting your further feedback, thanks.

Best Regards,
Hongmei Xu

On Wed, Nov 18, 2026 at 11:20=E2=80=AFAM Hongmei Xu <hongmei.xu@oss.qualcom=
m.com> wrote:
>
> On Tue, Nov 17, 2026 at 11:29=E2=80=AFPM Srinivas Kandagatla <srini@kerne=
l.org> wrote:
> >
> >
> >
> > On 11/17/26 6:04 AM, Hongmei Xu wrote:
> > > Add the byte-mask property to the fixed-cell binding. This allows
> > > selecting non-contiguous physical bytes from an NVMEM region to form
> > > a logical cell value.
> > >
> > > Some SoCs (e.g. Qualcomm efuse controllers) store a logical value suc=
h
> > > as a MAC address across non-contiguous physical bytes, with one or mo=
re
> > > bytes in between reserved or unused. byte-mask lets the DT describe t=
his
> > > directly in the fixed-cell binding without requiring a device-specifi=
c
> > > provider for a common pattern.
> >
> > Pl take a look at layouts, which does exactly what you are trying to do=
.
> >
> > --srini
> >
> Thanks for the review. Do you mean there is already a driver in
> nvmem/layout that implements the same functionality as byte-mask?
> I looked at all the existing layout drivers. onie-tlv and sl28vpd
> parse proprietary binary formats at runtime =E2=80=94 the cell structure =
is
> unknown until the device is read. fixed-layout just wraps
> nvmem_add_cells_from_dt() for standard cells. None of them handle
> statically-described non-contiguous byte selection.
>
> Or do you mean I should implement byte-mask as a new layout driver? If
> so, the concern with this approach is that byte-mask is
> hardware-agnostic =E2=80=94 any NVMEM provider with scrambled byte order =
could
> benefit from it, just as any provider can use bits for contiguous bit
> selection. A per-platform layout driver would duplicate the same
> byte-compaction logic across every platform that needs it, while
> implementing it in core (similar to bits) makes it universally
> available.
>
> Could you clarify if I'm missing something, or share any concern with
> the core approach?
>
> Best Regards,
> Hongmei Xu
