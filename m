Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692021;
	b=pFoQ8aNWMBLPGLk/79eSFozsa3XvRHMAiZVI88/9kLqyJUs+jjigsxnh/n9dE20ImOJ+
	 2/8zPPjXtSEAz7PCBndLQcUiGR8QEMfpN9EdSqVFHavjxQWObonjd3UynOzNbS065prXd
	 E7Ez5vu66MUNJBHAFcrDHjADUBMSZm/S9+Dsw4WdBJTjNUUAt0upnemRYbwUCkACucVJf
	 bJD3iHWGgyhygtLKyEbLTHP1K7epNAAmUrM6j8aGVW+oehAzd/IWvDdG1Emrhb21CR8L/
	 AVWC1V/UxG3B7tr2XY6uqzVtfwT/iZwhbZaO3Lv61kRxQ0I+tXAIg1sNyOlMhd0r1MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
	b=KzPkuFDKZIumqYe4voVNLN32ljcHZtDKEWsowsTzSuUrUq3wzxnTRkoN+0gTkSJE4eeU
	 7fvJUU4u9LuqcK5eoMRAGxAgwZD5+CaPwruTl8R1yv6c2IYtRI6tRHN3/Pi+slb1ZYpl9
	 ipEAmp4TWQsO/zex3xLvIVC5/jj72qQLQPV9COaMHXNFVYTl8fOcWZf/1LeSBt4STry0/
	 /g6qDMAjNGaKou5RIgOODvVI46SAOFXVtlO7tuDIQ6QlC/j8gH+/PRM1y7sW+5q3Qr7pL
	 IdzIUgZgNnsCTkavsoCYRp6z3ZYTvN9hQzGKdy30beKjcKN/ggHd0VEh0Yplnr4f7dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l/HK7ujk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8SCz9eR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9F606A680
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF9F606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/HK7ujk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8SCz9eR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBH76K3860084
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=; b=l/HK7ujkF5oa4Abl
	q7LyN2Khml+Or2fGQIpbMI8M6zMZpCbZ2D/Osaya43rh/m6EmuMap3rDX4zolEle
	HNw8IAb/Dax65sGC3DkDhzJnbole+ZFE5jX0I0fWhrD1jSMRZibLrKsDGR/K88Ac
	CzFw7oc8ZEqG+kjL+PpwS2jFmPjzgBkqrPnEbX6cZufsmVGyCtB40y6p/OtYwxVL
	0Wpd6dvqvoB311vuWNhTCO1JLljTzc47W8cpWrD8L0Hbuhw98Vj9CdL2dDBWXr+S
	Eo96USNzB8uGo5h1L7QMOu0sMQLBkQ6gDAiHM9OfgDO2/jGAyXWvmedzOJTh1Jsj
	H2lIBw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80jg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:20:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so5450636a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795692018; cv=none;
        d=google.com; s=arc-20260327;
        b=j4+F4sau3qNsfgWAWeO9M6Au2jd7ouZKVXC6I+WLMps1TNNfh5a282a2tMj3Z9c/iz
         LRuFfK8jbYpCa13U06R7CNO6TtOJiQ8TAA/ogFLi+EGwlbVhjb9VRTRjZqIYJbuo4RYO
         OltCs9Tg3f7bZSFaO+TKAZiNyuTA5ZumI7abTwCx8x9ZzP3yYTM22pBdVVH3mk9JXb3O
         NticvTOT2AchvMw5ciNKMaxy9s5HOypdcWfgZVjUJkq0YowQsrHqhSb2wuh66rZ/iows
         0baLhF7mezlFBqy/Y5lHjhdypBlT8XnpzY9IMAa7S/gsUhTcB14ueSTzV/t174Z2CUU2
         D6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
        fh=VeeO/n0tl00wZZDNdYHa6XPYYZY+g0e4uZs2D9TVfY0=;
        b=Fz6HSyBXAD6ZgeA1tGerU96LRrEhzcBAD7PNTjazCTb+FRLqx/IVXTxzXvpl/4gz27
         wCNvqyUSqYTlkOmoGBkYJr75eaONYwsuaI7QGnehUGIu6Ye7R6ssnHkem1sO0LrTG67d
         iU1cFp5AtQ0gNGXaa8CYoGZVF88e9K7qLkyLkIrtz7bcB2+421BtX1nbaF4uCuFkl9zD
         tag5UW6taLJ5DLP+kYEfFPDj/wMbe9HdHfK5VHW2TM5ZN/m5thmjoGf+QUpZUPYkBZHk
         EFohOBCllAGxBghMPrmuxypx0xLDemBr0LfA1ylt0QjbXA9TqrqWZoUMmPpMaMasQOO0
         CieQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795692018; x=1796296818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
        b=e8SCz9eRCGNNyJTFbA3k8mf2xaCyQOB+d6MdQZsJ/yagJlM/WIvEBmZbsS/IHDABk0
         3xuhaFactDtIApsHau85lFg8jCMjzQtSgc9S48fvruZRiR5ZxcI8cF/FchBq2p/w+txZ
         P6bQ+JMpBPCxc3inZwfiUEF/i3vn7NofhTSzuVd426sX8MP7/QCHzNX3f7raanVNLQRq
         GESiu9LSvO03Js4pp1DDF8zczbX8DBT4qXyT28yztlaTnFO/bV3Q6KzWycJRkXmqr+d8
         jrAxICDGgvKiHEozOjNgtXNILno+Ajw5hpZiFlohADvGaEQb8yHI82kR5E6OSrtI9aYa
         WaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692018; x=1796296818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJlHiA5Ad3u2seX6moZns/AmqUeg6vMxVgYT3F7uLPQ=;
        b=2yVJdTkK1wCJ930e3ss8+YFkjucSJIsYnCacxmpTd/ipGJzi2u9pBI5WpXE2R6YtvB
         Jp3li6X795ptjElKa3/HqjO3Qoly/a04hOzwVXl5h8ZiDlsO8xxd5boiramz8jeaNlbt
         38NTu4SrAvlsJ7Kh0wFMzKVgySM6gfrgNLaTXAvOfpD5im7yUJy+M/AXju6/AlBoFLG1
         hRG3NmKR6ZDS3OI8+a3eZqCnePBMeeNHFUgljIruqlPZYDF0wRcNxmgTipMdZciTu+mA
         fqUcL0ruRgeEkY8NkYDRQwuWE4WSCdqZq+I+FZ1uKK2B29n1Oa43FeQ98Kp6Ig7AaDuX
         trLA==
X-Forwarded-Encrypted: i=1; AL+hErFBJj9TROUqVWz1CPN8ku8kwMbjm2CLzl96Pr0g7DcPMmpCh9J96EfEnCh4kxLSeJHGCDOcKsV7hf5SznM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SbxB9xeO6DFznnD97fCOSLbI/rvLBcvMSRZI7Jko5fS/WPnVd
	iUTetRrDcu+TeMcVDWa/aP9qaPlAbKYqEq1ZSG/EN+g0fJ/23swK27y0Phcr2wJIx4G2uv3Sn6j
	vommuidkG5a2eBHJQQvYygAhMgnXy6L+dKoB7DAB+zn8ipRvAAMXkBYHwFfLLJ/yKOVx/wp80UY
	hQ7fUUcCuRZNzdR2SRe+IXHuQUR/TtQ2ZKcdKYNNDv4A==
X-Gm-Gg: AZFdTZdYES6YvjhA86PvZhm6fyKui/gwgXiC47Uv1D/mzYXqlhTtTaHu6KRZb9obkCk
	/UZ21UFnZ3garuuQSS/kvm6XpzKgDAS0hCcSsk42QuHeMWwkzbj6EGGnhCYlijpf42W8R2BP86n
	n2LZ9u7XyRtEx9ZYfrrAKWrAS3DvSbNfNtLxw0YHN+B4IZEowJITNvyvHgkA==
X-Received: by 2002:a17:90b:578f:b0:3b5:175:5aa8 with SMTP id 98e67ed59e1d1-3b501755ac9mr4329102a91.11.1795692017806;
        Thu, 26 Nov 2026 03:20:17 -0800 (PST)
X-Received: by 2002:a17:90b:578f:b0:3b5:175:5aa8 with SMTP id
 98e67ed59e1d1-3b501755ac9mr4329070a91.11.1795692017157; Thu, 26 Nov 2026
 03:20:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
 <20261104145502.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
 <CAPx+jO8_gCHgkeTB4aQDRjs1xwvXCB=zFjFBHB_UwqeOWSUEZQ@mail.gmail.com>
 <cc9c816f-eebe-4f29-a8b1-32c967c27722@foss.st.com> <CAPx+jO8d58tCoEL52baYMzjJ9VzyfpVNhruKAhrHrnEwuOoJig@mail.gmail.com>
 <47a78147-8504-4186-8e68-2d20d3832541@foss.st.com>
In-Reply-To: <47a78147-8504-4186-8e68-2d20d3832541@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:20:05 +0100
X-Gm-Features: Aa3M54qCBzOg0cyr4KewrZTA2vxkD-uFT-mziu9nF41gXnLv2lnfBKZ7ymw_lSU
Message-ID: <CAPx+jO-XcHTyAxdZTDQ6skJxdYRa8z9T5Nz2+naL8ZqC6pakag@mail.gmail.com>
Subject: Re: [PATCH 2/7] pmdomain: st: add STM32MP power domain
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nieucidg5rszmdzdUeqzAlKDi-YIpflw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX1IpfZpxFLOPN
 IeqL0GuutaphLGYpHwwKQN1zCxco914L9ENq9BCHkg7IA48ziceDOn9WkuHDpz3cPReiKbUP8tM
 1HaKWQNAG4zLbedj6owVzE2BtptG/T0=
X-Proofpoint-GUID: nieucidg5rszmdzdUeqzAlKDi-YIpflw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX1sbOZ+uJlq8M
 c3NcD3h+KNiHQVZM7MIzlL3tIazgHInDNmH0EWcOFAUvM/kjYinP0l6v8lbcTq1l2NrkXaH3rXV
 /Gxx5XVrFFVYRantLvCdrn2/3vd4/jMxrss73PTaX/MrhWFLu07rNXRL3C1s5BM9UvVkomGM8WJ
 lhgvefzwMwkf83EOAJ7ZvMTH62OhpfPffZcu9IVNtM/0AQoaPZcPkJfzD3DX/UbeJFxyjZyKfDU
 k/87O0A+rvwYOBtPN623bhSeaCUvbmRciA8tltVIW/R0F4dh7UzlQSRWoIhgrgMfLIBLj3kIKhA
 EYB2xhWDQJFxOzQw2tWR/Mjs6k0zIgB5J85xWcuStVRkJLucGkhzUrJ3ZCwe7gZWrPStDGxxGbN
 Dx9tQZpxL1iI8kq9Z+eiNzQALJoyOrELFikV/1MUWYlrXvbkYYAbR+7VLYEC2hrnmfjFZ8OCGMj
 tZPAHK8DzkNOdxyNyrg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b0815f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=8b9GpE9nAAAA:8 a=rfZIK_W7AAAA:20 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=gloIJy42cwCfa957JhsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

On Thu, Nov 26, 2026 at 11:41=E2=80=AFAM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
> On 11/25/26 13:35, Ulf Hansson wrote:
> > On Mon, Nov 16, 2026 at 4:11=E2=80=AFPM Patrick DELAUNAY
> > <patrick.delaunay@foss.st.com> wrote:
> >> Hi,
> >>
> >> On 11/14/26 11:40, Ulf Hansson wrote:
> >>> On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Patrick Delaunay
> >>> <patrick.delaunay@foss.st.com> wrote:
> >>>> Add a generic PM domain for the STM32MP D1 domain, using the PM
> >>>> framework to manage attached devices.
> >>>>
> >>>> Make D1 a subdomain of the PSCI cluster domain, so active devices ke=
ep
> >>>> the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP =
on
> >>>> D1: system wakeups are handled by EXTI1 through the RET_PD PSCI doma=
in.
> >>> Would you mind elaborating on the system wakeups a bit more?
> >>>
> >>> The devices that get attached to the D1 PM domain do they have anothe=
r
> >>> PM domain as well, to support the system wakeups?
> >>
> >> Each device in D1 domain use
> >>
> >> - D1 domain to allow any low power mode  (Stop1) when they are suspend=
ed
> >>
> >> - EXTI1 interruption to manage wake-up patch
> >>
> >> For example for UART:
> >>
> >>               usart2: serial@400e0000 {
> >>                   compatible =3D "st,stm32h7-uart";
> >>                   reg =3D <0x400e0000 0x400>;
> >> -                interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> >> +                interrupts-extended =3D <&exti1 27 IRQ_TYPE_LEVEL_HIG=
H>;
> >> ...
> >>                   power-domains =3D <&d1_pd>;
> >> +                wakeup-source;
> >>
> >>                   status =3D "disabled";
> >>               };
> >>
> >>
> >> Then the system wake up for S2Idle  is managed by EXTI1 device wake-up=
 state
> >>
> >>    when interruptions are activated.
> >>
> >>
> >> Moreover LPLV-Stop1 is not allowed when EXTI is "active" for OSI, i.e
> >> when at least
> >>
> >>    one interruption of Group2 activated.
> >>
> >>
> >> To explain deeper, when  OSI is fully activated  [1], i.e with full
> >> upstream for STM32MP25
> >>
> >>
> >> - the PSCI power domain Cluster Domain allows "Stop1" and "LP-Stop1" l=
ow
> >> power mode as CpuIdle mode
> >>
> >>      - D1 is part of Cluster =3D> the device is D1 domain allow low po=
wer
> >> mode when they are suspended
> >>
> >>                                             =3D> active Wake-Up for de=
vice
> >> in D1 domain device is compatible with Stop1/LP-Stop1
> >>                                                   the wake-up path is =
NOT
> >> propagated to parent domain
> >>
> >>
> >> - the PSCI Retention Domain allows "LPLV-Stop1"
> >>
> >>       EXTI is part of this domain (not yet upstreamed) [2] :
> >>
> >>
> >>           exti1: interrupt-controller@44220000 {
> >>               compatible =3D "st,stm32mp1-exti";
> >>               interrupt-controller;
> >>               #interrupt-cells =3D <2>;
> >> +            power-domains =3D <&ret_pd>;
> >>               ....
> >>
> >>           }
> >>
> >> the Group2 wake up sources are handled by EXTI1 and but they are not
> >> functional when the LPLV mode is performed.
> >>
> >> We handled this restriction by EXTI patches no yet upstreamed [3]
> >>
> >>       - activating the wake-up path in EXTI1 device when at least one
> >> interruption of group2 is activated  for S2DIle mode
> >>
> >>       - with EXTI1 pm_runtime state for OSI mode
> >>
> >>
> >> So the "ret_pd" domain can't be deactivated when EXTI1 interrupts are
> >> activated for runtime (OSI) or
> >>
> >> part of the wake-up patch for S2IDLE
> >>
> >>
> >> [1]
> >> https://wiki.st.com/stm32mpu/wiki/Power_overview#STM32MP2_series_power=
_domains
> >>
> >>
> >> [2]
> >> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/arch/ar=
m64/boot/dts/st/stm32mp251.dtsi
> >>
> >>    https://github.com/STMicroelectronics/linux/commit/d216f8439d14e0a1=
1475495cf5445e05cc4a9da9
> >>
> >>
> >> [3]
> >> https://github.com/STMicroelectronics/linux/blob/v6.18-stm32mp/drivers=
/irqchip/irq-stm32mp-exti.c
> >>
> >> irqchip: stm32mp-exti: Add support of pm runtime
> >>
> >> https://github.com/STMicroelectronics/linux/commit/4a4a20f5c5aae461a7a=
14c98efeddbc9cd08c672
> >>
> >>        irqchip: stm32mp-exti: Add support of wake-up path for S2Idle
> >>
> >>    https://github.com/STMicroelectronics/linux/commit/1d3b854e7b95318b=
67afd2dc16b8ff5fc060443a
> >>
> >>
> >>> Just trying to make sure this gets modeled correctly.
> >>
> >> I hope that follow the genPD model...
> >>
> >> and if it is the case , do you need update in the commit message to
> >> clarify it ?
> > Okay, thanks for sharing and elaborating. Even if it's not entirely
> > straightforward to me, it looks fine to me, to model the HW like this.
> > Although, in the end you need to convince DT maintainers to accept the
> > updated bindings.
>
>
> they are not yet convince....
>
> But after Krzysztof review,
>
> I propose a other solution to handle the needed domain without wakeup
> support directly in PSCI topology
>
> see detail in:
>
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2026111611402=
4.RESEND.1.If3d55e03486413ca40ac73f9bf07046e76a00f0a@changeid/
>
> https://lore.kernel.org/all/7493faea-092a-412b-8332-8fd68d20057e@foss.st.=
com/
>
>
> I hope that this modification in PSCI domain (code and binding) is
> acceptable for you.
>
> to summarize
>
> in code:
> -  pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> +  if (!of_property_read_bool(np, "arm,no-wakeup-path"))
> +     pd->flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
>
> in STM32MP device tree:
> cluster_pd: power-domain-cluster {
>      #power-domain-cells =3D <0>;
>      domain-idle-states =3D <&STOP1>, <&LP_STOP1>;
>      power-domains =3D <&ret_pd>;
> +  arm,no-wakeup-path;
> };
>

Let's first see if the functional dependency PM domain can be modelled
as you already suggested in the $subject series.

>
> >
> > However, there is a fallback option as well. I think it should be
> > possible to drop the D1 PM domain altogether and instead hook up
> > "usart2" (and similar devices) directly to the cluster PM domain. To
> > allow deeper states for the cluster PM domain even if there is a
> > system wakeup configured for the usart2 device, the corresponding
> > driver can call device_set_out_band_wakeup(). This informs genpd that
> > it's perfectly fine to do a power off during system suspend, see also
> > genpd_finish_suspend().
>
>
> If the device are move in cluster power domain, it is OK for S2Idle but
> it is not valid for CpuIdle
>
> For example when UART/SDCARD is not suspended, the domain cluster will
> be powerered-off

No it will not. If UART is active from a runtime PM point of view,
that will prevent the cluster from being turned off.

>
> with CpuIdle and with pm runtime even witthout S2Idle system suspend
>
> when sleep time > latency of idle state
>
>
> So Stop1/LP-Stop1 can be dynamically request when device are still
> active, even if device are
>
> not functional in this low-power mode.

Sorry, I can't follow what you are typing. Please work a bit on your
terminology and how you format the text.

[...]

Kind regards
Uffe
