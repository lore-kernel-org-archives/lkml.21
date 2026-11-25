Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612206;
	b=1XiNT+95DjAyizkvoeu8xmoyHpgDtov1zk/n2PSqgtQ6s/2KJVza6XCe2VLS1jAl0DYD
	 rVN/wzIKbYBZZgLXGDR9uGsEiNw+1h9INRvvUQBIXvhLYAaTiZ3wfDXPz78WSL20rJnRI
	 hOFIkOej/+/KSZkFggD7ltf7FRYOJB1Ni9h1bOUvuszhKcE30dxBRrMPIi6LOsLnlL6vQ
	 qCL9ahz+jDDZMQJK/fnkmMFS68+i6PpzY11pJ0Mvq1THOU3E0+xXZfOyJDxMPsj8LfvzZ
	 uwoOpmOjWmfbuN3gwgIEbVKCljnGWjYjdi++p1ASQMNTQULirXFEOCPeXweOMSZqOLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
	b=JdnxIZKfXjRYST/cO1LPC1FlgkM/RZA5XF3x4ZiU/wKG30IfyinhRkAA5Yu6E3kBULFp
	 RgHpC5sl8Qy6g4N+pn+h7PoROql6QkVsQ4B48ah0evIlhZFDLj9lDKzT1BlLXlAVQzoO/
	 LHM6WeJ6Z5M08IEP8hq5rq38O9Lq8EMgIBbEvGkC5y5fsVE3tZSC9rfRW8MEQFmDaIKK2
	 4U7wzkyvh9BuLr4kKlz2rv5IgXtfPZmEGO11cVHiMQvGBWBaF0q4TRu+yrA6JY0rmP5BJ
	 xzvD4hchVjgjAy+Ho6mvj/KEl2JlKw4aAyGh3OtwiF61FNc6fH3fjqbQxtFp1Jbouug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCTsscWa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB83D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP1uVxlM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCTsscWa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mt432359510
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=; b=XP1uVxlMIAT52RJ6
	U9GJgrDIM6cDgB3qq5Udzh/EG3fWMBTEkexAfef9+HRsup89OlthsGib/Y58NBkT
	3vzJ9UPhFt0O3P87OPZda+jjqojkoPp6Htp25iWkVaHhd5CT88vfjLtXsZW0XEJc
	R00lw8tuXWN9W8qwS3h2Um9zBNl9S0qNUWQE+ZMBdzSqDV/9N+tWyccR1ZKGs65L
	Ug0Q7R+VEJlPmGiML16PG5Lme1zfEK02jbLRu/NyV9ymzRfMrG5e2u129tQOcWPu
	raeMT1soGb1sQfhkbbgRszux6zuqrU8b6lxp8ie/HuTtqah7MUWjQIFyfl9eZgD9
	Itib/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6anmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:10:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so6710410a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612204; cv=none;
        d=google.com; s=arc-20260327;
        b=GcVuqNiFpM/gZvXjYL/OJcHgEnYIsQGW1JjAOhfytWs9MhcWVkRbqB7kPfjRTNMYFw
         oO1Alj6dNzrahsuNfTNxM2Avdt7FSpTqlJkrEpeH4Ow1sXvrBugLHkbFhGtj4USjHmkT
         QyKS/tE9h/c9pY9HFCV0OymNoSkM2VpyJLoVMrtoKJNvkNV+NSaMyp5IgoOIKtLAO13G
         LH6Hv3xoTET7GtIeLCuHKPlDQ6+5+x6mDZJVS/FM7P3LGqfLxrt+ilLnECXw6gMldFw9
         VdaYy87cuAeAZ+yyi4tC6uUlMxJ/7QSGTVq2RpetJIbn1DjWkDQHo9w9MK6GbYKdZzPq
         GBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        fh=sI+/kSCfCJkxXtM2Pcq4uS3VVbucKb4maXsVLEpmLzI=;
        b=dpZ2MnG5b5D+vq1+KMTSldBwydONrV8YjWhPH9ysUyEDZ6SWP98wEbV0YUagRdK/vi
         6nZvHm8JhIJsZymcZBpjXuZb/ICWBCGEe/Yo0q7bCFbfoDJ5Auewk3TeLtYBtQyRfTQq
         GhwhbTO+N/E7x3c34EWHI5pqMV0yF6S4NS4XvfcO8lT6/w/OCYmncU73mvAvxVwM3Rxg
         9RycGZ36kQqlKj5YB3VTmNwGZE8zrGAumPkeyDlqrHGwStunBxwnSdPeJibke9GcMSsP
         VyISVb9ikvdGt03sDTYn531CmT8SItle+GZXp+rWG6zbK4X1y0uKOL3PryyEcwya1yWH
         Fbmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612204; x=1796217004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=HCTsscWaQ0D/mLUs3YEjnkg5QclaMq1At5oYtldJ5fjwzF2x16N+otkCNG53wwaNzI
         IhdT4WZlYW4Ufm+0ycBj5wnFbKit+0UQv+rUZchlOVytuxR1kznYro7E24+kzisjehjf
         wijIxlJvOZ9ikUVsVWHw4aDJB9fira0HQy/9Xc3tbubxsLXzt/tX4evuAQWofuogu9ry
         M9Y+GIebPWFyr66FAFQOfLqX0+g33k4ho2pGFpjICNYKayzTsdt7W/w3MyvQLG7u47P5
         64ve9mjHkF5Soiy2Zzl7ZlANa8qU0XEKnPuTx54kEX7wEXPlXxC1pcn9/A1091lkKq7d
         MmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612204; x=1796217004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zYC14kkeeAydLtOuE3dZ/lyIfuyBLa6WSEsS0ZThvY=;
        b=h9+EZzxhNyUWwRKR55bIaUdkJ2UifE0zbci+KCWp2n6N2qXDEbg1D4oIpivLka+WrP
         7Z5ZPXNtQWro6sWK8YkIqle4trlNsBC8sSW/GQa3QRff4TrOSVeMNthnfRjow1WtvmCd
         cM6Yj9oNOYx/ZwLGqGcjccFm4wR23auwMxL6/lepIBxcpvYhRU7EtbdqzeyQAYzExbFO
         ErKxxpP2/Zv2VPaX6YLfOTir8IUihsndLYk4SOqls0aNwW/DvQe/rOoGwfnPgIYO6v0T
         95AxuZWr2ikNotCFMta7mAqP6PF1OfTlFVa28knU4wIp0WZJffaO03MqWaTx0Fxm6pZp
         O7Rg==
X-Forwarded-Encrypted: i=1; AL+hErEcz2jqCzg0iREhf/XeWwiC24mIIB7+1tUqk4pVBL8554ShRz1edgvuytTIk0H1YP206+ygwuieleBiGpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IqCiuQ49Kqvgut1cZ3GYP/M525r1kynjImDYksOHIEfee6qCi
	pKiea+Ket/MwHcoaiAhKkLrkGEYL90+EY6j810z2MiUJoD9e6L1F2FW4GzgWHuH9Ak0lkr0NBUW
	5J9bhCmYWWIhwSKibrOUWZEXw48H0HhDB4uTecBUaNDRFsgDjKHDX7SHeDXeewm0dnJF9C0AMdC
	UKHGYHQb8HQLj117lwctIYsztSscyC2L/NymbwbyLkBPpmRq6VqA==
X-Gm-Gg: AZFdTZfhQOS/Affbc3yOH8djbIIALU5SRZpsqMsRBASQR4UzFsPPZsynDcnE8S/BZtV
	f9jljrHX6lItG3HFXtVNod48/B/CckMz1XE7xC5gVIfRj3FdIEzrztf5w99b//JfJE6ZX8JCb72
	pOezskhkAeOJyJUpq3LglmadecYZzd/tJVeWpN/UrYYK12Ht2efVg7H0+cpQ==
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr17028241a91.39.1795612203978;
        Wed, 25 Nov 2026 05:10:03 -0800 (PST)
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id
 98e67ed59e1d1-3b41c955bc5mr17028202a91.39.1795612203470; Wed, 25 Nov 2026
 05:10:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
 <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
In-Reply-To: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:09:52 +0100
X-Gm-Features: Aa3M54oxcK6RC0Uj2-RqU1IkNrdUwbjccr03Fd36W2QS4bujwoCnie3WcicoJCs
Message-ID: <CAPx+jO9CHiWfHNqApccUb=srYec+Ep-bupo+iQteu9ZPVZ9MYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: O2oCj_ySdQzUsTo7fWnwyfeml-gv1zxl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX4ehwbVH3Edz7
 jrMuZchttTuQ7Ei7wRXgsY3KjHIdwok4PS/1N9dKjDZTw3K3X0Ao9BhNJxVcq9f5dPIcIahufhP
 jShqOHMFAtKItcl4r3xgjHL5OyvxK9E=
X-Proofpoint-GUID: O2oCj_ySdQzUsTo7fWnwyfeml-gv1zxl
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06de2c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UY4Qpe7uAAAA:8
 a=gEszbayXw1Bg4_vTXsgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX7LdtvgAbZ20o
 CMWhUjaCNzhg5Hl0/z7ts04Tjig0FDyt27yHZGUpK2CKtfyVdtizbLOMKA0h84F6Br9XAnu3oqJ
 EqzJSTkMwNK31ubfOTHE0/cAPjFrhfZWY09gfRX1ubtH1mbyN/lLTxkbeLTVVtKSko4sXzrY7n3
 rZe0ge3LY/zMJvRoG6XKJk/A/p+mOUpBvzkbGaRakhrE6Pgsr7ij9SUdBpA6dn1n+UzAiqZnReu
 ck1zYClK0GTTNBWZx7iFUNmKnRlxJ08gw+7AmEZIyZaVUakHC54GzX7paeeL31yUeGb9nzzWwrd
 T0BQiV0/sXkuMbbzsyhJKTT4RE1rGtj1tBChJgc/BMvw2QmcZIoMC29w0hX84paA89Ur8A7eL/B
 bAucv/MCk7uhvT8+Nb4QlLNjG1OMSTuuo05yNsSrI9aj2vl9UEwRR95dLC0twQLchzhe+tLeBhY
 oDznCzjw935FItxwzxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

On Tue, Nov 17, 2026 at 7:15=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com>=
 wrote:
>
> On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > + Sudeep
> >
> > On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail=
.com> wrote:
> > >
> > > From: Alejandro Tafalla <atafalla@dnyon.com>
> > >
> > > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES repor=
ts
> > > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > > call is rejected with NOT_SUPPORTED.
> > >
> > > PSCI provides no call to read back the current suspend mode, so the O=
S
> > > cannot tell which mode the firmware is operating in or why the switch
> > > is rejected.
> > >
> > > Add an optional flag that tells the OS not to issue
> > > PSCI_SET_SUSPEND_MODE on such firmware.
> >
> > I think it would be nice to further clarify what's going on in the
> > PSCI FW. If I understand correctly, the only supported mode is the
> > PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> That is correct.
>
> >
> > This is clearly a violation of the PSCI spec - and I guess updating
> > the FW isn't possible at this late state, or is it?
>
> Just as Val stated, it's not possible sadly.
>
> >
> > >
> > > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > > [Reza Kurniawan: split out the patch, rewrote the property descriptio=
n,
> > >  renamed the property]
> > > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Docume=
ntation/devicetree/bindings/arm/psci.yaml
> > > index 0d04389c81..2eee38d155 100644
> > > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > > @@ -98,6 +98,19 @@ properties:
> > >        [1] Kernel documentation - ARM idle states bindings
> > >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> > >
> > > +  skip-suspend-mode-switch:
> >
> > Maybe a more descriptive name can be found?
> >
> > osi-mode-only or broken-suspend-mode-osi-only?
>
> I initially settled with a similar name before (with 'osi-only'
> phrasing). I ultimately went with 'skip-suspend-mode-switch' because
> the root cause was only due to the mode switch not functioning
> properly. This property doesn't do anything regarding the mode the
> firmware is stuck at as it's only fixing the failed call. Normally,
> the driver sets the PSCI to the preferred mode at driver probe (OSI if
> supported, PC otherwise). This property simply skips that part and
> assumes the FW is already in the preferred mode. It could
> theoretically work for firmware stuck at either OSI or PC mode, as long
> as the platform shows the same symptom, It is mode-agnostic essentially.
> That being said, I'm not completely against the 'osi-only' phrasing.
>
> What do you think of the above rationale? I'm open to suggestions.
>
> I admit that the word "skip" here isn't really helpful since it counts
> as an implementation detail. "broken" should better describe that it's
> a quirk.

I guess "broken" deserves to be part of the property somehow, to
clearly indicate that the FW do not follow the spec.

People have different tastes and I have no strong opinion in the end.
Anyway, I suggest you to respin this to clarify the commit message and
to suggest a better name of the property. Let's see what Sudeep and
the arm folkz think of this as well.

Kind regards
Uffe
