Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795004048;
	b=a46OC9Qfkwfg/oaTZToHPwt1cd8CTYhcvUo4LdOOPoUgpi2k5M3VHt8aFf6rvwRaWoR6
	 zVtQtkSP/9TMGHWjHUVkg6sCyN2VJaxQkCbfCI82QlXaGrd8dDUsL9sibSFQKMyJ4HMgd
	 trPtveV5SRvved8gpvp8rJxdu1gxGWlic5MB8JXXus0Trk57WlweMM8XYUW49sKWG8GT4
	 Ir8+9m2sAD0RjEaUg+0teK5aJNx01RjAIf7KQowC7YEKD4rPI3rAS0NDi5SeB0+5uV+GN
	 5+hQFjYWBxrPj+bsem/rrFmatXlb+qg4jyOKIEO33bJX8kZ2+iWJ5p6HMQa0wGGMpeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
	b=Q4Glo1jDwpLgvJV59GYjvcCteNhA9neXBUg46ctmCphD6q+xP4kg9rtMEovS+nDhwAMg
	 URmDB/ohzOKDcFGsMmspeWlszVLoaJ20P07NYaLf7YckALuygUdW2WTxxB3SJ8OfcGMVB
	 JwjYyNjq0bJlOUuJtnBBwJc853zUfiSvL7q3DjxSRNQsi6p/dPG6GA3uSnF/wsOX2btXS
	 tas7R9QEvneS0BXDx9CyUVGbr0Sf7HgLxpVlDTZL50vJY1oWYoI5WjCOlo+7wtAAF1IBk
	 DzcnmNawFWJCBolN1N2jKHHCRCp3+MIjzKqnDS/RFCxabJEEVjsvB/nibyRQ+pjZQ4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SvR/sSus";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSEts7Vq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF3B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvR/sSus;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dSEts7Vq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkiuI3340675
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=; b=SvR/sSusgAAfN746
	9UFnReufWOyWMyRHTAn6lQBClvNKkHfcuIA2GyAVMtuRCSGj1l/c+feTFDvbPPdU
	uNJEaiazG0AExTQsU4QZ3Xr1JWPyN0A+Jv/YSV2jUhuNi1m379pxfFpIWUqgshei
	08RdiyGdWidPf1BMt9lgn+LK74AU6DVwdtWLYGvEkAHYhmhEXGlkjkdIEPMBhdw9
	rMkIBeN/HkFJxrVMYJX9AaqjZikGD0HSJwIDJfEotz0/K4aifQF5EJEyewlB7HXw
	xJ7q4phJ6PWjkSvhzXDzHu4O8mPDe2QgmOg/p4jPgThN9XV1ydsPhI9mEwLyLniy
	cYfqfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8tvpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:14:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f84753b43so828953b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795004045; cv=none;
        d=google.com; s=arc-20260327;
        b=g0Ev9Q6itDLlbtLalr0hwJTY3wBXWZZusVsc7mUJ4QYipFlZM+b/t25j6aXZXxtcww
         hR27MxA/uPZnXT3rrjZg2s20nxo4kLWcek6D9thfETNw928b/Bdl1FegCHeID45j50ju
         q4v5h4hmJtA+74L+vCHsKQLdkNUjRN3QkxSsoQEnqy+jomBGmhxf17wne1Gv2IfamBIp
         zGIBKwxV3z56M8IIY4S3rHLjrUn3jsEHkKcSZAQPzZaWOXR0XknePRsc66f4K4i/flVR
         uGw2WkAAB2hVE+36BIVrmCmnJOEr65ynUrnAt9zzNiYSOWpYdPh9c96CDyizIkY46f3r
         79eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        fh=XdM1o1c3/okyrda+h0/NOVZPl/CEMpynDPAYhxW1ZVk=;
        b=jR+vMS/xsh/zTDTmfbmS7reqJb8EfdsxhVXe8ao6cOK6xfFUOOSILAIeKqtPvryHij
         l6DGPFNC1w0RpXqwarIaUTiML+RpvLIt3jJbNTlqLZ2FcNZ5EYCs6+8gAEFI5qRANxuV
         4I74VNCKuVI0GodAu9nSwGZgT4ZBjDqlOM21qeiCA/NIDKX4d4OdDyb11E1p8e10DfBW
         60qTbUgWu9w0F/d56xVDQnvmlY20N2txTksxThMV2mmOcDoDv6pWZNILIjujCBBJdIyX
         aryj5+Wi+Y7Pdmhc7g+DoAmixZPUigJlnf7TutFf3qgdNg60YJpV2CP9LOGYaiAOXrf1
         6ZNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795004045; x=1795608845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        b=dSEts7VqGraYLgJDKwHn4AHzw5xkPDP4b/jJHPEGgqww4Bx/KmZKTH93cX7Nioi0C8
         RxYU1LslyCbKWFAC93L/NkPcnq4orDOizQNfvarjfChtMndXivJtX88rCG2b64VFDnaz
         30NudmO+yX8Cz096uQk5cUi7Fbdhu1w1NIU2EeldkktLiOqIKRXmJgC0MdCbwYbYf6sF
         nhB4olhDqmfPHApbyTw5uK46rUnrAPGap820TVEUyMlb1TSHvJRle+e8k2XWfFq6xTkt
         vDAO1xUVPoqwc9TGhwOHC/fGFsEII0RPAb0EtJveYumUDOimVbbgwembwMTtr3itQN8f
         4Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004045; x=1795608845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmDCHtd+Q0jDNVcYgBi4nVBZdZ8eCWrrRfV/qG90diM=;
        b=S0ExnhuGI5XqGeN9wn2K6tmo5e1lklJhpn29vIkr6bQNUL40xBKvW5M1HfFPwBQC8A
         ZMBEMe/UxIlKlUf9wWWcwPDRs27MrxZ4+hi8aXblmZZY6/GXA+xADiHWew+3QmoZQVTD
         UZe6L4o81vDilMWBTNr5sE/WzNyEvjTpnNqv5s+zpkYDiBS4Omd85a+z36FdyrsHbYb2
         yTiByULQWU/vkAvslXM0AoVgiNa/DNHNLSO1R8RA+ksAwKoMlLHF2f41v+pgPZ+BzWdo
         RGxq8U4pBJvQZUVj8iYGaT/fcRMnOg9Ui7tk0nvdDNu0MSN7whTJuLIAMH+FvRGGyF5x
         vF6g==
X-Forwarded-Encrypted: i=1; AL+hErE2r+bjNbAuulDPlQO+Od3awhylhnjOTQP/Pws3lv8tRECP5JYlKZ73HYtfB9fBvIh3jY37reDdbw+iQyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BbpIqkrr1RGqhLE38vtfCfhGwjNYNPO8sIV2VUcXvpM9AnIFh
	9kXLsCgG7QYfIBN0ijHObGibMOnae2paJC74rT5/e9NxNuIglQ3+XEMPulp9641X0gAoqpHFJ6s
	ZLS51on1xZNxzU/0abf4y2DpHwg+yG7KTSU669dvXGtkzziwMxo2zSACf+fAZQGh5BhoRWp/c/s
	cZ/GyQb83DpYq0SjPnTa3JDuooq25s3t4CekL1jAY/Nw==
X-Gm-Gg: AYBFou3+T+av2iet+xGRmfW3HgAXX923nKTafYR5WP44vvj35U/0ZOkPVxH/plr/tPG
	PBDipuOWiaXZN7sfPdT6GSKRsnTaqpujVv9OVx7Cvs8KoOS54LGvB/bGf1MQabz74yUQ9l7pvcu
	I2eho1/bZEROsb8FNoEqI9Mbvm1KUB6p5o7cP85u1dXEkoX9eGm46mCt5cSyQ=
X-Received: by 2002:a05:6a00:aa05:b0:89e:71df:d6d5 with SMTP id d2e1a72fcca58-8c5d363803dmr2099235b3a.10.1795004045365;
        Wed, 18 Nov 2026 04:14:05 -0800 (PST)
X-Received: by 2002:a05:6a00:aa05:b0:89e:71df:d6d5 with SMTP id
 d2e1a72fcca58-8c5d363803dmr2099197b3a.10.1795004044909; Wed, 18 Nov 2026
 04:14:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
 <41B3F89514935AAF+5c08fd7d-1cfb-428c-9ef8-035fa3910bd6@linux.spacemit.com> <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
In-Reply-To: <17FBF8B3DEC33669+55643c4c-b5ae-4ac3-bb2c-a1653c3a6972@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:43:52 +0530
X-Gm-Features: AclHuK_lmH3PRq6DteQT9bsd-ifWG5c7o_benTjtIXtrCBUSK48qIpxC1_u9aYc
Message-ID: <CAHuiULCf7RF07G8Nzgt6ZS0deWxMrBenWf9BaD615fLtwOzobw@mail.gmail.com>
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: SC-nZAkmQ7myxAHnfPzh7SDeQnQ2OkMj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX8p36YdKK46J1
 Uu4RCe4AV32Onw7iIXEHFp0stor22S4j/b8HtWk0EzwtvPx47c3ZbK4tj9H7EPzH5cRpohwi35I
 w1w+NHju30jvRzkKRR84dsDy2csFJpo=
X-Proofpoint-GUID: SC-nZAkmQ7myxAHnfPzh7SDeQnQ2OkMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXycec92+fz3i/
 vpg1JaIXPEIY4HSP/VbVsvxI95TrRdD7GEowth4TwnHGHiW0helPcvMGj7dCxy5oSVkQ3oSIY1O
 ZGQZge2HG99RmR8TIUcv64veU+E5yyRYLVe/3/uR8UwJj57OPicZM+1DSPll3xtcDg/X/zJBgbr
 mgCm+vnzsND7igLB90AVNVKKb0bHzMSbQ1/OaWNnTQfQ8pARRY/Z4xZ/PFQ2GCb6WaCImNfFFbp
 a1W2kMv+pA50FW5OUFrLILERFNfW9y6pztx6Xoe8ArNoCiCipY4iPnhbFPxO1w2A8b1wr06fpef
 M1Iuhm8m/fm8Lxya3frxaf5Coevy+ukVugWmeZ7MZy4clEuqRd9kUkjKirz4ade9IwGddfU21pV
 jE3kCTQApEC0wSGdxLxXFgLvJxVkie97OJs86Xz2KXOF9RYwnm+zzV9dAKyTMvgvP6bXRASLw7B
 E+FfAWnaT4OJPxDzFOw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd968e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=lv0vYI88AAAA:8 a=WaSwiR3hT_GFvAymbGwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

Hi Zane,

On Thu, Nov 5, 2026 at 12:39=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
>
> On 11/5/2026 3:00 PM, Zane Leung wrote:
> > On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> >> +/* Helper to access start, limit, wp pair registers */
> >> +static u64 rvtrace_ramsink_read_pair(struct gtrace_platform_data *pda=
ta, u32 low_off)
> >> +{
> >> +    u32 low, high;
> >> +
> >> +    low =3D gtrace_read32(pdata, low_off);
> >> +    high =3D gtrace_read32(pdata, low_off + 4);
> >> +
> >> +    return (u64)high << 32 | low;
> >> +}
> >> +
> >> +static void rvtrace_ramsink_write_pair(struct gtrace_platform_data *p=
data, u64 val, u32 low_off)
> >> +{
> >> +    gtrace_write32(pdata, lower_32_bits(val), low_off);
> >> +    gtrace_write32(pdata, upper_32_bits(val), low_off + 4);
> >> +}
> >> +
> >
> > Could you move these helpers into "include/linux/gtrace.h" and implemen=
t them as generic APIs
> > (e.g., gtrace_read_pair, gtrace_relaxed_read_pair, gtrace_write_pair, a=
nd gtrace_relaxed_write_pair)?
> > This would allow them to be easily reused by future components like Cor=
esight.
> By the way, please pass both |low_off| and |hi_off| as parameters to hand=
le non-contiguous register offsets.
Yes, I will do it in next version.
>
