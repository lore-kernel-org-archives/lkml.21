Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795445098;
	b=ob7n0Az8TDJJ1vjHnYCVwVqJcsPiqugpYHlLzpm/yrixfwpAIi4XO85MjO7q4AR4vFo8
	 IdzdcNMIo5Eu6awj65RaPC1NTyaVlsL4LAlMptYXzM2KGJZRVE3EzKLqPzra9cLxxei4j
	 xw+4tKIJlDvK5n4ppYCrl+uzDw8dl3S7MYgIunkQfn2Mqvwja5gxcndYXPyg3RAs7eI23
	 /jhR+wCzpo0XoMyHMWBq9HdD8g2ojA8WmNjLjZRckYOmm2njSr8bJ3vdR2i6RDTOkR2LF
	 SD4dMytZ+kbHNCnj5eyhK1IsaDMLLfkR9lpNlzRhvzo//Xm1bdQa3ok/K7PExbTkEpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
	b=z5T17AG0xjroCm7RtxfSJKwNxZLTocQKzlBDaz/mNe5A/p1vpdw/90ha2T6ScwvvuRIP
	 pvr0ekyfVYKlFgUnR8NaHL0U7U93jibthW0QgUAkL/q3X7/GIvCubXJKWbwRcdbXNkkA5
	 qQlqJzOK9MpB/Cl76rEQxLSieZZN40pXEW1H6nadkHVPdChUBDCp4RcOU2xFbxMsPljAo
	 a8/zl44vZjC2XYxnq0KVzTfKkyBo6dPgULJwoyna9HBJHgZZbMTmeLTYjpoJlA+NI/38C
	 H0RJjQtyOSJSGQqj6vcvr3N9s5H3RTbN5c6TPCEFICSzzp3s6pn5o30IDsrbQ10bPlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZOWP70;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdaadmqP;
	arc=fail smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C48E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaZOWP70;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdaadmqP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0AG1974270
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=; b=eaZOWP70t09Rj07+
	cPJieXBnlKsehB+GrJAydZDT4+PLIYK5pwuW2r5gNJH0Ojd7pEgMs9r1m7UJdBwM
	7zQKYMmWL5kxVdZlZToJgb7EbSrJo+bICo+4pzanjkiC32c6sBdLCP0QpHDvY6o7
	2N3LRchjol5Kcyj9VoiTImB5GCC9sG44+izkryoUavpx5ETRmQ8hsqXj0PFeoFPE
	VVs3eVVE4trvEH/2pNWN68ptXYzHit7ybHQ9WjKMfQry0Hl+hcfvNyem1wBUiSP8
	j+93DPws1QuTtVdpd1VoOT/++TZwI6m4sUIepZrJmTbemGkiwsq21zFG4MnOuAvU
	ZL8I+w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urtfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:44:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5569532b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445095; cv=none;
        d=google.com; s=arc-20260327;
        b=iWugOFmT4kkyM7RjNDIHvyb4KrUn11BeFFpewswct+J2fcIbfIC9dG8fAju9FfKuSG
         uLp+ECcG4VJu6FX12rHItTfH29mz1vWUU5d0wP3GeffJEQJ9MgGMyJcFzNJilAi78UxH
         YZb0zXTqMB0EWfx8cJ85iXXRGOIrgpGXkLW4vnfFdHwLV0WMY6Mycb3BsycOk4mHG0in
         fzVWlfHvnDH8J3h3TNZ4Nlyub8FRaFpuIeAAqBHLPDM1VgPLuP4bi7DrEzV9LAUCj5yh
         hQ0EcVutpeMGxMO57xHQRehM2PSvcebqjYM3dagGNXqOP8wIllp3pbAbANY/qmX+yTDX
         lB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        fh=HeHq+f2CoOC8wi9y6eDspIWk3Dmpg108BS4WlRKcWr4=;
        b=sfcaZnvXuxLbwEhM5MnKobxlsJ3DE8WzTsB4Zxf3AMzZWdh4u6P3A5BQnM6QY2f95F
         TwOWHi2aTdRZxvYR3avI5GnL5TEZnS7Y2nw27tvj7HqWTGH8VgRmlJbNW8syKZ6WDPeU
         1MbiZWhNRBA3VwDgoVBObyjeQRSu2SdvrAyJH7rmt9TVQ7Fx295QFwpV6AgZd3Kt8Lo4
         J+SlqgvyVjtEXoTR/RzKwQ0Q6QzWQGnSNHGEVzWAMqTleZ3gzNM//3R8LYSROXTi0SPb
         vwOu9h5v7AqBNG3+IJ1p0t9FhchNX+UhjuQ9vJxSVXHNKwKPaP6RUzjp3DAAsHVTndnu
         +jMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445095; x=1796049895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        b=IdaadmqPxlrWInEksHGTbMHQw+6cBlh1Ikp0dHsSCrliSqatwldTV7brzaR61dmqKg
         iTsH0WcKNbfqHa9/RMhyk5JAvXhN26AKkI2aCRXGSHTXTAXnQCAaKv4wwvY5zyZYQH9M
         3Av+Dlg6ItpjDuBdmcatiEj2bxGjQUqzCedAxmsC/PBPjBkB+JCg/Nt9MAlg37HYym2P
         6bz9XGYBnwEiPJ2b2lFsi/m1C3VcxkoLdxrgb3vAgBrfPEKfDDKMDdyUZaN9altdouBu
         IOeCGzmX0UIvlwVKLU2GVkdYOhfiDPj1tNsAiv7CoYOMzBgbM/LIg29fUU0Eh52aA64L
         NUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445095; x=1796049895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d3C83PDhTdKS4Gzi1sKn6/sMS00aaFlTGMatqgMHxw=;
        b=hytThbI02PU7JbFPdx4WrU/LWdpg+XecteZ6VuKxDOpZEfeYRq+CTPR7m9DE7riRrj
         YNUii41b0ii9jTelMkVGZvuS5mF39ZGm22/DluHBwNPXAGeDZroggNr2Z8be0HroBemg
         Uyg7hVFhYeeLF+5g4fByEUoSTT7JsoNswEIJNhH/9Pnv/KLqtn0o/SK2pxd5lisStrcy
         vzsmUa5M7gyE/JyqerBiL9J+Jh7GoiSBt0GooMw9ZEaZ5I3UQENgWCQ1cpYH4rZTTtCh
         l2LvRzwiOfqnRZmeXF6RMHe4v28Y6ZBUx7c/qPrUeSc0GLnAGhn3KS+oprZNpIuP/w2t
         uazw==
X-Forwarded-Encrypted: i=1; AL+hErEsccm4Kat2zBnISjuTl4zHlkKzOQ2eV4SuB+wHpiY2+ltl4vvmLqK+uhnb6Lz4KW8aDIskTBjsdKIsPG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9per2gaftL/dJe9mGyQ0wa6Y9lyLIBmieA48DVJRl7Ld7fGt3W
	ZXqj50BuChOnCDXDp21t+j80GwJp3KTfd4I1ugxC6ritPmvind8f6p/TZnz+xwadP02EYV+l0GU
	8AHWE7OMpCoLgQYszmprW0cnmsHM0nHcFUtQjB9dbSyi51K+YVl2qUS1Vw5C2esQopqCx76M66h
	InJvX1jd5fOKr/GyzC7XbbqivLkXOwlGSb63Izg69hdQ==
X-Gm-Gg: AZFdTZcl7ZUcuHPBfpxmCdSr49rH+tpb43ETMlqtUB8/VHPar1Tc3idrZXrU06u2GNe
	ecu+1mxOySTrjl8H9FbHokIOgPHPBHQKiqz5NHxfT7ZcXAd/z1mnybSl04/dfdzRGNvZP76zNMx
	0CgQk9cIb9VIue4is6XZ4CuyzgZGJ7va32xr4E4F2QG3mmvaqAoW2vWYPAkrVLRM5QAmTiZKiZ6
	5ozNS5COLcwTLZi
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id d2e1a72fcca58-8c87cc450e4mr9837971b3a.48.1795445095415;
        Mon, 23 Nov 2026 06:44:55 -0800 (PST)
X-Received: by 2002:a05:6a00:18a0:b0:899:268e:c848 with SMTP id
 d2e1a72fcca58-8c87cc450e4mr9837944b3a.48.1795445094856; Mon, 23 Nov 2026
 06:44:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
 <20261116-icy-free-lionfish-c3eed8@quoll> <d3060950-04ea-4f9b-b160-0e068946e623@oss.qualcomm.com>
 <20261123-humble-native-ibex-7d2f72@quoll>
In-Reply-To: <20261123-humble-native-ibex-7d2f72@quoll>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:44:43 +0100
X-Gm-Features: Aa3M54pEpZ40tQjszZMv2Cjc9ZKJszGaoEabHp-a4xi-MEaol4PsN--f8rv57Hc
Message-ID: <CAPx+jO-e337v234_wF5QKDf5YJaEZE1-+_Mo5=Y9BfwuG+29_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add system-state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NAUUDXVqleLcpvrmvOugnHpXsvAmbFSI
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b045168 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I1gXTs31tpYBTtf-1f4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NAUUDXVqleLcpvrmvOugnHpXsvAmbFSI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXxrelyyJXpI7M
 EgyrsctLZevEJT8+gDBePtTREV/5Rq9IAeAbYOacqPxnva8sYp4BfGP7E51ez6wrSPflsUTjQ0s
 f2COBpKnUhsHr+iSf3KzU8xIKl8d8K0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXzAxp70lS/MiY
 mXEjywgUyMFhnHyygFbJgI4tOKuj9DdVl7Hrxe4NaAej7BJDevHnf1B63VERk0XtW2g1hl3t/Fj
 MCJsVJvqqZ8VY2xbpsZbK7cQKmQudUmn6nSHUBKduw1h5yWo6kK8L6/+pbuCwHvFp84swI33scW
 s9PLTEQ9XL5n0ZuBjSYcGA/q7MGAmNmo9vmEn4ebXNJlfW+O7F+VVdxDxJ5wUjoo9i1CJxii/Wz
 B0aUWb5FDYHD+RfDTle9LU5gzbykWBd1QkfNrH8vkdTvGuxVgT29stUwXcZPehth698YI6TYuWg
 px+9Zt9vbYW2fSChq3Lgh8XLYVnwvQjjL/BuFuDPfnm12RSQ5OTpRZuuAkGy0qEyHOyKWCLA941
 JgEs5K26D5KN3X+poic6lcs3AOuPhaButV9BoOW3uq+K7WFS6L1JzmWd2ZYHMDZC46eBszI4XfJ
 gEZwWAexxbmoWarEnpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On Mon, Nov 23, 2026 at 9:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 17, 2026 at 10:34:52AM +0530, Maulik Shah wrote:
> >
> >
> > On 16-11-2026 17:28, Krzysztof Kozlowski wrote:
> > > On Fri, Nov 13, 2026 at 10:25:25AM +0530, Maulik Shah wrote:
> > >> Some domain idle states require system-wide coordination and are not
> > >> applicable while the platform is up and running.
> > > You repeated the property description. Say something more. Why they a=
re
> > > not applicable when platform is running? So if not running, when are
> > > they applicable? Why?
> >
> > On certain platforms CPU subsystem deepest idle state requires co-ordin=
ation with SAIL subsystem
> > such that both must be powered down in coordinated sequence. During wak=
eup SAIL subsystem must
> > be powered up before CPU can resume. The wakeup can take a second or mo=
re.
> >
> > Selecting this state during opportunistic CPU idle can therefore cause =
substantial wakeup delays and
> > repeatedly interrupt SAIL operation whenever the CPUs become idle.
>
> The idle state latency times define that. No need for a new property.

Unfortunately they don't. The extended coordination that is needed in
the FW to reach these states has nothing to do with latency.

We simply can't reach these states unless the entire system becomes
suspended. From the PSCI point of view this can be compared with the
PSCI SYSTEM SUSPEND call, that we use for suspend-to-ram.

If a "system state" would be voted for from cpuidle in runtime and
when using PSCI OSI mode, the FW would always return an error code. In
PSCI PC mode, the FW would typically downgrade the vote and pick a
shallower state.

In regards to ACPI, this can be compared with the S-states.

Please have a look at the discussion [1] I had with Sudeep around this
to get more details.

That said, I will work with Maulik to clarify this. Seems like we
could improve the commit message and the description of the property a
bit more.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261005-s2idle_state-v1-2-3c402c66f388@oss.qua=
lcomm.com/
