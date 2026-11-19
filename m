Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079121;
	b=4zqPTNmw1BR0UFPGbJAIvQg0TGyCXCaoSXTSS6oJPvvB4CzVQAJCyuplMwEcWBod5BWJ
	 pdmsWatSkKGn4IEJi2MYIG17/WJ9RflQGmtsWl40P07VdsL0aTdKPqiVGLj35wpJaXbq7
	 iRN0UgVOZ83tI/mtrSnqiBAFFIk7Lt5pBk22tUaoIJrNs3es9z5tlqiWf2CCxQZqj0dzZ
	 TSdWlvUGSRh9ONtTBekdOfppVD96Z5+znZreIPAOHi27rXx8w2eRoMsW1zNlZbIRP0w+X
	 bn6Yco2/8k8cyDbZY9dT10hpwaXiWChWZYC6HQPr6fRLz1neNwEHIJBpXJBfJk+cVJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
	b=F6kXCghzENsBJGM/J8glfijguR8nPjHrSPUQEm1jTBnk0YFRdD/TCYiKKZ+oancy0KuJ
	 fnsE9TZu1lzFQa5HulS59ih3RbT6NDIh9hrWA8uoprkutcp5fYelcr3QiC0GDVopfvgoH
	 0Koix0j8Z7SR0gjmt9N14TpmHUt0jh4UA0BP8RXtMGXB7dcX84cl8NgpHyKth+BPPt7yo
	 G8TClG4SsBm4wdiIWaOWejqOX+dsbRDaxoJKSY+hX3CxtNPZA70Xwi69O0HG9ngbvR8qn
	 D9Cf3rweTGdceZ95W9Gxa0vDlZCoKnCNPs5UdwuC5BDXJHFJgUXAAJ1jBJtuUZPq1+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E960A2613
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217E960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaL5S0Np;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zhrm4Co5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vEHx2935542
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=; b=GaL5S0Np/e82jLi4
	2RnY2BBKkZLVSl0AtfjZXaJBeSIt4k2eoFEkdNZoPRRQCcwuHR2je+CbCCJhjxT2
	qFEtzE/ytpmE7E11HwPkc28KETBPXZW3XSFjFGtSWoVqIRx8HrAJzh3AuSwqxfCb
	oaiQNQv6UH+BzwPw52PQhrm+255XGNyw+/yuYOWQ6lQQqF2TjxskrgiYEfLLxpt+
	SaVZlJvGbhAnvv9KIoc/jaV8s9xzBCXEwpn2zDPceEltTUS9Fnm4AVbxCokA8GRu
	PaRVP4bR0d9mQ4nMKe1gi+1xCRBDTYg9Xoqwoxws7Ct2B4ymeZnSCnTPhMJQzFqm
	Gg7fQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekj7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so308135185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795079119; cv=none;
        d=google.com; s=arc-20260327;
        b=mh6LoCe73uGsgEg++LEj+wInlfZuWRINV4P4lmOUO+61BbBtO3KJ1swWqjv8HOqPPM
         vmzPb+6j881zoQXak3uI9CIpUGnx0TKhfCk2m4QY6x8ynnLnpj8ojNAK2/YVImqSgbDY
         nqelGfojkeVRcMy9w233TyM92e5l9qfGfmtrLoMa8fj/FU3a5Zxq0uzlmAw2RMxo1bPP
         7WQuEVKsq0kstwg67faRwds3OGxQ0It71QzEZYxnqV/aReVfP89ff9kRiq27yRDUzLnD
         4D2bLQaM1MCLm20CcEXuz2GrqGq3BuYhdsPD5+fv7wuPoeyUMp82a9EeBdm8miogczSr
         s5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        fh=cQFI6Q76Ln899cyMV/412nV7cIvSJR9i1IMVOz1Scyk=;
        b=YFY2jXhY0MctjHBxTB64rdtKqj4wOmD2cBDEP1+1RfvLckPdA5uy7XVABuTIqwZvP2
         +SbOEcTPy5iuzHn2QoZmAgacxeCse+EivS4xo7J9NKClzQo77DUr12vlNuG7fNP58enp
         gKQhGmdCjcpQVOVTw7AbXhKLSoptNCULd7Pk9Z7/xjzsbi1pGi/JadbEVrSF/4w7DluB
         GMxrR1ECOBMpoOhyGHvYW8V6AvtwFIFJtuyIwCL11nNnHvw/7m12m0FFjXnFgbPh4kip
         7bIGNQJJjvBFsP/+ImG+t96m8P5Tg7dwhnb0sc8YNugSfUUhzHtw7Pqxf9XCq5xgKuwD
         4Kng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795079119; x=1795683919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=Zhrm4Co5VzIAgsW0YSam8Q4E83eIf/guf+XkHo4BJi7k1X/P/uUwk4LhpLN+hL82I/
         /LtQXFGg5HrvG+hPp0a0z5GcgLw5gII/vC07zAux2vC8NRfe0BcHacdoZTt+LjwdNFKS
         mbglau8/CZB5xd35WLf0PFAedHcygwHhgMleUL+BeLxKUlDVPg41W2PMD8QPz49RT61Q
         oBJcnLeGMGe+r4A/TTep2OWimNcmk62+5osqXvDHS/b2dnwwnii7GRZ7DoncNoiExdR4
         Kl5Ny6uWxsvYVuBaOEF8L4dfCHJzTdQNwT8gzwHxvZUxlqtigTAPkzF1SWeoIg/mm+qc
         HPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079119; x=1795683919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0MJXOkn8zdc+gwVeKxQQDexGNiCXPcc+gYOOl+OuiQ=;
        b=Ld03aReaWkfuDrQmWH/QZho3N/0h/A90RXGvbfn9LdHDAoSHiGm1A/Apnbbe6Wx+64
         TfeqA1qegKQ0bA75xliMqBr0jElas87q7VXP9n152wzYIAhMccZ0otGXTS9DM85fX/L1
         NGYtahpllQp29LbR1xySvZH5QhJraemzPwpmK6UxZhhoNEM6//uUVVgNjw03oeT25ApP
         UF1SsXOhf9R7X28xBwS2xwpt9cl/1U2zStK9QFy0pV1t57lkgNMPbQMtlJ72ZiPZtjvR
         WoOhGQvnCWAJ5ecAJUbkXVbk/iDmpM66t143YgOsOeAhoUAQ7ifXBUBfddaFRhW5qjbs
         7f3w==
X-Forwarded-Encrypted: i=1; AL+hErHnC1vsEFnvB0rNAwNJq55G5ooSZDkOsJvtEWKyQJ6aoaxm8aI/rCn2NRlpZeU1Mm8HtEvSbIRaRDYrXio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m4j20LE92+mXwvADkWDf2d6WtXzazHiQTPh2RLs3c9ESDjYYM
	PpzaBRc5z4Ta3tCDLucB1ICcrIKk8XsI90xFbMVs+M2MFmr0EYh8yjDw4ZVXhjtordgriwuzxBP
	hpgdUfBMpXCh4Y0nvMnjIJFkYHqqZuXFFcwe56fud6mVCY6ovLECsvil+uFgharkNlZhSjvDU2F
	hnxA21YxCW2AY0j+Ll3vk+xElB+mDbS3PBRkexE8A3hFmAclYVdZ/WDPidZg==
X-Gm-Gg: AYBFou0/oGRkwC/O3GMd/5oVH0R5M72fXNUBrgObB+s1YptSFjkmgPMsFrYE4e+ekJF
	6qWY+viRQjA0WVf7J6rSzM0I4f8j4gdx3mxGGLCbMAhALrTe5TTO+lGFfwwq72nJ+jNDXwjL9ee
	A4koSBOCyOT+ARGvqsYEGWdrZt4Ebzz8yJhXp7UusfBgrBlCZYPDatnnsLHIthW+qz3vap57ruw
	xdDqLGnlaNnWb4AvLzrn5S5xvW6kfmIH+0OCjB7fD9z4FLN8O3hM3302DuDv+18I4Urxk+ejYtn
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id af79cd13be357-949996055a9mr954534985a.68.1795079119184;
        Thu, 19 Nov 2026 01:05:19 -0800 (PST)
X-Received: by 2002:a05:620a:45aa:b0:949:3ea1:3021 with SMTP id
 af79cd13be357-949996055a9mr954529985a.68.1795079118704; Thu, 19 Nov 2026
 01:05:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
 <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
 <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com> <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
In-Reply-To: <DB7PR06MB53249C2E9D190088A52CF72A85792@DB7PR06MB5324.eurprd06.prod.outlook.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 10:05:07 +0100
X-Gm-Features: AclHuK-GXDRQYMjZzNUPKgixOWRkc2SFP2WEVl061PLLQkCPbkUsldWxw4HirwE
Message-ID: <CAFEp6-1AWQg+rpnZy4w+4khc7PC8CfT7drcL4j+upDWniow=4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: Alexandre Rapaille <arapaille@atlr-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX2Msnx0agdud0
 PMGsqoDE+Kx2nC0zb5foo/a0gC/J8o6zR6qMFLhoaNDRZP0J3Cbp886W+zCxrY+vAAqp0QImuAI
 67fVINF4CmYEeo+kH4mM/06EftBgTKPx+v+sC08Q2kRFMmPolbkta8IRaj+q4p7z9QmTACdXDnU
 GPXSJiPxRFP7689dDNYkUL/Tb9F8ijWnxaqX++rxEU1TtKdY1iGoAyJ/m8Rc7IGw6Pp82mrZI+p
 EYz+vuDEQYQAf0BdfBjXlrwwQsn7i6xFfBY4ikIlG0NNqyce5IRAOeAe+/8DvPs204UD74tu5Jn
 9/9PP+ce1B2xohIbFVg2HKLADMyakJtS+i+m+TyaWRMiQEPDCWwf9KNSH2u3WS5SyJkNZ3F4YwV
 p/g6Fmpp85ZoUpDh260Vxd2lR5PJdTxgiq28qpZAz9Zi8q7H68/dwWCCB87x1h9oijtgi+Gj0zy
 lfze9n5uUdAW97zvVag==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afebbd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Knk3v0qlAAAA:8 a=s-NlbNPW_lAo8gpM8kMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-ORIG-GUID: lRxBL-Aytg150Hiu5YXj2sCrOIab6K3h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX8qewPf4echLg
 qnR5spQql+y+pXzTzuEXPqBSHLXXysVmxiRCrUx8TNF5pddXcqH9KijVCzr6QggNTzsfobopmd3
 jm/LRjXRCDWjZKcsNSc2jZgBY9Nh7fQ=
X-Proofpoint-GUID: lRxBL-Aytg150Hiu5YXj2sCrOIab6K3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

On Thu, Nov 19, 2026 at 7:59=E2=80=AFAM Alexandre Rapaille
<arapaille@atlr-engineering.com> wrote:
>
> > Can you explain why it fails? Is the fix at the right layer here?
>
> On the first probe, request_irq() with IRQF_TRIGGER_HIGH overrides the
> DT's edge type and stores level on the mapping, which outlives the
> driver. On the re-probe after a WCNSS restart,
> irq_create_fwspec_mapping() finds that mapping with a type different
> from the DT's and refuses it ("type mismatch"), so
> platform_get_irq_byname() returns -ENXIO.
>
> The fix for that is patch 1: with the DT saying level, both agree and
> recovery works without this patch (30/30 forced crashes). This one only
> stops the driver overriding the DT, as ath10k does; as Luca noted,
> every other qcom,wcnss-wlan DT already uses level high. Happy to drop
> it if you'd rather keep the flag.

OK, then it would be good to include that information in the commit
message. I'm also wondering whether the actual stable fix should be
limited to patch 1. This patch could potentially break out-of-tree
platforms with an incorrect DTS IRQ trigger configuration that only
works today because of this override.

Regards,
Loic
