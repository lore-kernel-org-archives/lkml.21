Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693478;
	b=22RHTtk6pahy4Oi22fHzFwGltUph6xUlopkiX/345cQEEa+RY1j0Ils+fCr7DXcXPsbZ
	 nK7cS3YWpM1DNsf0a65jgRPbrlOf9f8EzTHUZWDVq++i6jqKFwv4k7lqu0dl1hnXz9gNB
	 1ScClX2YzpM7ArdmsRVI4+h17SQUp6WPVHCYVvJ0QxiKNqbElERuvSND/FT2GIR86sakD
	 HKL70ncmSDlQ3LzNuCxAaqpW4vbcLgrKgMf+HasufiD8G13pqdD0fiX5XHILllbVrOc+t
	 IaKbpkrAUVXmKiSB8qDYDWQrSRIHYSceUIhg1rNu4UethYOadjsGu/kkGVzAZFSF54g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
	b=ubenE04N73n5LlCw5qjcj0hKNLYS0oAWkyHC5kgD9cYrTtmSCpxo2krtIBwmUDc51kRc
	 QEP1HzWUz7+XjKsl7sXEx89JhGmoUThgahieRlzuFnMPHF7MDevlYyFKTmjjkcNG0AZsn
	 oCit169zEVyLnLCYIOkGuXDTtc5I+NZ5Moy5UadmUYTprc6HgQWuPf40MoT2nSA/Wd5MF
	 CONH/2KQHsxDMmfMAjJTABC3+aSV58O1CVQ63SgpzCPyKZpaaUvHPBvUgiUqbymTnK7tl
	 cwW5sUlY7aXlhfwDnF/sHb/rBNtWCMhh6W6PDH5qdXD1mqqy+d1e3nIDjxwXOmpdefQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CqwfbaA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+2oZXb8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CqwfbaA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+2oZXb8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRFf3893667
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=; b=CqwfbaA+k+gbYXLJ
	KjRoylV3rZ1exJ5uFizbBBFmPc3iHg9CbdXGhJ+tmiw2PhP3GlRg9wDGx5NbHRVT
	4LgUXCORp+6oj/xiORGchdy62D+3Kx+41iZIxU1MsJIbs1mr4w5OzaUu93LrF0Br
	TSD32oRkHoQceeMLp9TyuwYNGBmcg5LZjGS2yqWr6s6qT8DCLGDTu1usvMetSJUi
	acwNGUMmC2kYTlOM64VGQQi5PTiHBbhtkUMTfwpNlWlkug+np2V7uk3J647Ezn1n
	0/J7aUKU6vU9H4IEJA2Op5LTX3apNELYGvfFomigOxrU+RdnFlOVGJwVAXPL1t9d
	bN/emg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80nc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:44:36 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67994567a44so947996d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693476; cv=none;
        d=google.com; s=arc-20260327;
        b=aEOsRTeB6ldZ7pYzXSVKz3JnYz9UjX9+xxWwjfYDg1GBH3zgjhuaENUocSRfIYjPaj
         SIzlnXiKAoFSco+D/EwHCXSZdVUWbLJb0JjhrpnHWe5itsamtORovTJpcY9ytJVSkDRc
         C8odr35km1q6YY7Z+FkrLjVuHTYyM5NYUI0jazE0n3IHYED1lgyn7xsf7kY9hmYC2Vp8
         SbMPwldDsSFB4LzrtQH4h59MEIqRRKlLVtLKC2o2uCS8eF6AXHHoPlmObIOXDzQfIR0P
         4ltYag6fhpIbWa20+hwsusfNT8mYP8YkPmDJvI6ZaIJPQLl0Mbo/kT0NFuwCvmjHsPmE
         fvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        fh=SIVOwWxYN5dEY8ZeigQcuv+w4AnP4smIOw0jA0UvjdQ=;
        b=SMYhfah8uR3zy/BRHFL8mFMHaSFtdf/1ylpZz54RnrWgga0SX46myJeqPvGFU0vdmE
         +Wo7Od+R048fLvfY8RChx+QxgT90MG5VGWaYubDWwIVAAc42DsaYdFtlvHiIxn0yIJ8Q
         OzgF5lBc40zXmZdVbjx+8oTXLygHAKN0cvRlsHGazVeY5wvDwHxEVJdEoRmJSFNCRSLe
         5N+SipN5G2qYieiSJ/pP/2M65uwyJp6ebPaDbJ9I0byZXh7Ychr4vtaxlY3xzFc0l3ul
         XxQWR+C053rpQIligZHtLSKsDcHmvSNFWi8y1SxwbitC3F+WAyaSFQMWnhwHZ4eFAJa6
         1rTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693476; x=1796298276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        b=N+2oZXb8j15uMH3VmvohZTgQT+tkIUlKOnrkFcO4qMq0HrgXAi0vTabIoUd+qpZnZw
         qnNfva6/73k0NKHUlmX3JhXEmpl9+sI8QqxQ1EquqCLe+Mo2BRLK2TcgxpJeNiFzpANj
         xrV38pYLHTB5jkF3PVs0KNlqp2ZEosKhAcNHx/9ehSAALac6Ker31b48YZEmDrpN/B3h
         c3LeH30wcMqgYec6WBJ/HwLyvShUIZiCNtTK33Z2blpzjC15vNXkHqHB95YnWl/u0DJ7
         zG8wl7WzGMFbgGWkjTiRZDkx/SCdbRIlIWI1KFlMv/5K7LZ39wTACzAt19vDOVnuPAc2
         3l5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693476; x=1796298276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        b=2BIrIOmP9UaD0P1V+t81+02VtGXEmj6tgNpKztrGNY4tCxBNSjHZ3IOhnb/dLcswgL
         lll/soOuC/Bmxrp7P6ZB+Gu0fV33B5NBs3Gx2Jsukgb1dRttGcQ5ZH6vGohPbQo4SZSf
         vxeQuuwFrQi+IqsjshF2bQ6FTDMDBm6cFY/yR8LnZ2HEo8j+wwsqzGKQMNQIQnM+rYXY
         fDfwGAI3kW6Wuop5sp+KqA8iGTQsHAveUajRjHOEKaD27x685qD6RQ23SlEPNHEIjPm+
         RrQMM/fL37gAQ2Mc2kJgah4nedNgSe00sryQIuO0VA4axXLZ2mlRYt38zha4gfWAsGpq
         9juQ==
X-Forwarded-Encrypted: i=1; AL+hErGTyUtoZcK6cboKE8tDOvvEkXU3//U5voFn/j4PE2zeuX4aNlhJ40xA7Swpc4wW7aeNKDw4RMGl7MBco+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9levmqIcucg/RlJghlTOe47wn8S5Q0QbFvwqYFK4a4hQkeNqHn
	KKkA3gkw9Gc/GDcOppjl2D+tSRUB8e7WasQLVPdhWT8LQqqfYUAfl1MVkvTvLI8Kz7WYwOk+x6O
	k691NmFCmH5ZRf2kOvznoiiBbrpKgpFaUl/feZPLQsRWUVm0aLi+ClrfJ8o8x4eAmxyMi+iAetX
	vfokuW7UcTLfCTd6+YiUp8BpkwN2iSGsbgKHJJNkNrKw==
X-Gm-Gg: AZFdTZeIwzo+AUZlTIY/C8fsbaYwtM1ZA2ZLU4H35szFyatlkqhECeGD78O/Pc8CvCS
	giT6A+6Prr0u5+MrW1xLTqJIiphHwhKOuR8NCsvG8ymvQhsHnGmtUTikpmB8vwcl0pDN7yuKvWd
	GGXScOkWRRyuvDaUQdClouNXrvDNY5TMYvGPdhd+mWpDrFl69B/CLMqdg=
X-Received: by 2002:a05:690e:191a:b0:67d:b753:f6ff with SMTP id 956f58d0204a3-67df43ce21emr10002165d50.32.1795693476039;
        Thu, 26 Nov 2026 03:44:36 -0800 (PST)
X-Received: by 2002:a05:690e:191a:b0:67d:b753:f6ff with SMTP id
 956f58d0204a3-67df43ce21emr10002155d50.32.1795693475552; Thu, 26 Nov 2026
 03:44:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com> <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
In-Reply-To: <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:44:22 +0100
X-Gm-Features: Aa3M54pVVV5qmWM6b8CLMteH3KaRnJ0qbHg9-XNKHhrV2XXx2MVKh7bg0-fOIrg
Message-ID: <CAPzfCAajqBWB7OHYoxr=+2xRUzyWnGiiDAc--st0UGkutYrdOw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: m05Ubc1Y95kPocAeHLVuV0GbVYT9ljkr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX1IpkWBZb4Nmt
 LN6sZ/GnYW2xt/mzHMIDjyj+jTPXKkqpgqOTlHUDLAEc/BZz6sSA21BWBj3DPWeAj893a01u8lv
 +lLVMbFWPn1EwIm4eaxPYcjnLW/0gFM=
X-Proofpoint-GUID: m05Ubc1Y95kPocAeHLVuV0GbVYT9ljkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX2vFrZiEpR8VK
 L7jEOR7zsri80iH/UpaRJ4gA5aI8vKhLj+EN1tFZiiybLH007MJtzGK+g+0WXvGcGSHMu3ogDZr
 /rd7GclUfYnY/P5/yMYd6gz/6lOkLLY5g9zzIvIznucWpwV0PcvZPrz2ZbB0gWKY+Xk1W9MIBJ5
 YPfVypcCSaTUceRQOknA3Mz97/tbLBrRGa2Lpapa373oa+04w9dGtkt8hi99ifGfooqMhwgmhqN
 lRMTO5KFvGod8Q2H8pri3+2CSs/wVBbH6WYlr+kkDUwiwPk66PWNaDyZivmQYBOHCOYpri6awal
 im2Aps8/JLWgsucHkK8NuzPmJSZAqA8cIjlVQyUYTuB7mTl2y00OklgbPKVYZEuthVd83Uo+mfg
 uVaUePKiMYATu0KeVu9ljXMi2x4NkLemM0UMG2WwlAXopzNLdq97I+dM/BGETmjNMX8YMTRz9bT
 /75D57zcMr24+3Uq/TQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b081ba4 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ycHgb9qKDJxlMUMqlp8A:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On Thu, Nov 26, 2026 at 12:42=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> > The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
> > OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
> > three patches are the DT side that this chain needs and that does not
> > belong in the base board file.
> >
> > - Patch 1 names the GENI QUP firmware, so geni-se loads it when the
> >   boot firmware has not. Where the engines are already programmed, as
> >   with QTEE, the drivers do not read the property.
> > - Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
> >   zap shader off, SMMU stream for the ADSP remoteproc.
> > - Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
> >   kodiak-el2.dtso has it.
> >
> > Loading the QUP firmware on this SoC also needs the geni-se fix in [1].
> >
> > Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
> > and the Bluetooth UART probe, the GPU renders without a zap shader, the
> > ADSP starts over PAS with no SMMU faults, and WiFi associates.
> >
> > Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
> > without the property: the same serial engines probe and the same I2C
> > devices answer in both cases.
> >
> > dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
> > qrb2210-rb1) is clean.
> >
> > [1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@=
oss.qualcomm.com
> >
> > ---
> > Igor Opaniuk (3):
> >       arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
> >       arm64: dts: qcom: agatti: add an EL2 overlay
> >       arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream
>
> Don't fix the previous patch, squash 2 and 3 together
Will do in v2, thanks!

>
> Konrad
