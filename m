Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778751;
	b=wODJLS4VfEYsAMH3pA2YcE1jMjt5hTHFJxZeIcNViYqm7opsdOYlBHc89uz4sXrmRaGG
	 EBDcza8kO5x7dFEdE1GWtAUmsODrxhVnveyko2MhfuYghskau1f/WbWXVudHLw/vHGfgl
	 ih+6I04ejqHP9WCTxPfBtCSJSdMfZi0SCOd0x2d4AvN/9C9rVzG2TdY0+yvyr01xh4kq/
	 JKaS11DqSv4M9hnieTNw15GIW+kN6+t2q4Pk08a00tSCt3EQ+crbUpnUS8/KQRnbWKcP2
	 pT96VK5QJd2BWo6TrXXdG1hOuWAAfhzVdf5EDWIHnsbLFRxEs5tMrnDB012oKwbnexw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=;
	b=gWijNCDlESCYkBsDZbDrMjYVSh6FB+wL1Uj+ybxrPEV0pi55aCan94aiV1cW8UiVu67c
	 cwn5FEjfD+AMqFp281gc8uV5cShdb7U9lq6tOimhJLG0K2QDhKuOxZ5dlYkQKsRisTUEm
	 fbC2c6+ggg1TZI4jKt4kPXhM5UWUJpiukPcaGDhsDS/dCzvZ6O7YeUvNg2ILbiyQZI4uP
	 juoDSID7IJ9FqAZmb/nReZnuXViy6H07CEOvrCtH7EmVahOlsHXnbuh6MDECRYlwOuFll
	 uQ9y9aql3UBdL4RI97jLglTFL6nOW0P3GnXWkpiGG3oDyLL9PgTXPDIjZWDXyFR6ssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YXuGIaRp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMY7+JQG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63D606A6A1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F63D606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YXuGIaRp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMY7+JQG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApDuA2677321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=; b=YXuGIaRpgSfdu0xz
	9+JVNIL45ylbv1CknDEgFcLP4zf2eLutncMF6U4/ntGdQqpzd1jq3MnmtOWxtfRK
	jsKY+Yv+yrZuYBQYDvXcLRz2s84Ag2QgDM8BAzuqQvudXjKd1ElBrTG9iyr6JV5y
	47KmhHe+GEutkid/7J2s706Dm+eN8PHC3euyBhfNqbExTujvPdQO7wcj2ljD57tq
	ps91UeR88hayTKlDGJt+6ezEjbF/Zd7RlfcLrW4zX2NSxVuUkRQzAnsNGCARI7YT
	ohKXEBWHR9F7i66HpOgIQPiN1OeLpetZd1D7qoz0fXT8KRyBQLL+GdzhAeMG6o/M
	HjaMIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh95nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:25:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so70297985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778749; x=1796383549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=;
        b=TMY7+JQGLIEhywUUxguQNyu2GNCX2Zf8oUsLPvKoI5/HcCKsTBq4843e9OJPaSxKfo
         mLUqrB0xTiqq+iUKu5PU9UpSXm/aRR1g1Sqd8Q7Se+Tc3Sk+bUweqd8heZm3xi9J7cy1
         alUb2AxjuksUoVWnCfCX1OQJwz4TovhVeOcHSdQ+zoW6NsQ0g9ypfgsogjC2xfKkdxj9
         3oE9WHMlMuIAegQvz6o92ptUs39hqExEa0HPor+VGmTsYNea7VtDBIxGFoXap4+fXgP0
         tkxUyiy6rDFQSw9jv9NtERTH5nrfJRq51s6esasS50f56Pro047qTknBKi70g0FQbvlR
         M6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778749; x=1796383549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=;
        b=H7NlQaQ/FMFz0t/2u5ARuLIx2BzKtgbwRRjLzMqWP0sILf8Ae15oDj3X+qfBCMgZdZ
         fY6ykd2OQ60lJLFFqInsu9j6F6cEc9uwfsdLQbhpOL/CGnVWX11QGoN7r9wR6AVINhn3
         lRtb+4fViTrT55lkaFN7gM935yt7tugINF0grkzPjtcnQwJGgkHvuV4CyIPc3p8CcCdS
         sIGNTeeSL0Fwsih05gpBRk4O+2Qkl/JxYbkHEnfxSwwpkcRme3LNBGeOr/NmgAodCh26
         +IZViGkfcj5tjhxaXLu2rRA5MxllZQ8s4149tL6o5FpF3Y1mbmF2CyN/iGkD+oJsKS/5
         xcQw==
X-Forwarded-Encrypted: i=1; AL+hErGA2/CCemFl2pPnCe/idqt+4uo9pS8gS/SOlgqMpMplRXZrxIs+ycvDqDXB9a7wS8xKPrd3RaVNvoSCMf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+er3ETByDXtJtGlKjtHWI0AZuhQVoLBQ863jPKLZGpNRoOk7d
	8n1u872ep5kzNaG43CS2ABpiZAS0ctvAkCex6Vpy1TVZ8OaWCQ0aBS8UYjpdTkf0etIZAIwr2vK
	1pT0n3tKr/F8Ws+nhbCMq1YAt9SxOsJXHxkc48l9qiQsQHaXZ1VkAEVIy/1OXzmb9vRI=
X-Gm-Gg: AZFdTZfjhZmQIwMfVTvy3D03PuaiIxD1MPryGD0adiaXqHYFxmYxevU9GiIEzcLlLYO
	KF4oHwfT6T0XajRF6u4yGcrPl5GY5k+e0kIgFtVM4gDG/N4mB0y947sWRAcfVcbxv/38YwS7+2S
	0/1kg2qSn7Ui9zlclWFm18OKXy2McNqkxTcvkm5OkzMsKPuDaCUYgcni7uPgFYHhw3MkANtBAtZ
	JYmAChyngK6g9uvm1MQjK5Qt0/tKmcphr/8gJ+APDHV436/ARXMA6jB3ayQLfyfn6l9BxWa3yWl
	eOVA/1wE2jF+vlky1zYBBBLQidO3Bv/6IUf+FOA2aKVlgYJWNj4Sz0rwVrltBVBOC6rP0eOt1H0
	u80BAeg1kkdqXb642BkzhFPjzLMf8Hlgma1nNsxd6OHBES9cAZEWguMHaORgt2TqY4M9WJQU=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4351118385a.4.1795778749266;
        Fri, 27 Nov 2026 03:25:49 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4351111885a.4.1795778748592;
        Fri, 27 Nov 2026 03:25:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2d97sm847396866b.59.2026.11.27.03.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:25:47 -0800 (PST)
Message-ID: <d06c0143-2630-442f-9e6b-89580266e5fe@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:25:45 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
 <20261126-shutdown-v10-1-fed60d9687f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-1-fed60d9687f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX4pkgWNZ0Smzn
 Z/J1gQHTXT6GwNaYXtrcAJ90/fziNsqy15yR/+lrWwqrHyJjOmKazHxFs7+xlrVUFHZM5CxZXJT
 uLDoblk9vdqLF3WKWkQre+qxfGiraNY=
X-Proofpoint-GUID: wO2U9c_n5wcX84jtUL5lzSklPsDOMzMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfXx2uQRa/c/ogr
 qALTDdPQiRT8wubziNugVEVXcT3vyoJDIGH+4D4zuaqM9LGFwLROiCVXek/ra53cbdQgVb1f6ss
 dbthBh5/EjufKHD9FN6Hxc0KDr2fBkkZlVUTNb7Dow58Pv5TTR/5npGv+mUXEG2a55p6mYe1uUb
 6kqX5T5NXT6uIljNIUVlBvbRCD8E22VrY87uQFRootBmOrRkf02yAMgFpRsSxjHbEdN2k5aBxo/
 PGeO5WWy3YBOafuL5pPdyRPLk1lYJFFQyv9p+AQKBuaAiiqJcoFf3Ca2Itd2eqJEImbP04MvhHc
 az+yNi4BxiIXdkihdtQD/niJdZgPpea1Ev6memzkeXUqegkFaP09M0PtG+HoovbGboJoyMI1DHa
 VyUlbslEA7BgrmXfEcj4VpXOXSX8IZ30sBv8bGOvnfxnVfsibbNH3iZYHDymSXNW7lv7jMM8N81
 4IPmjvtKb7AIRy4NXuw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0968bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1dD4SeorvVlWizVoyX0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wO2U9c_n5wcX84jtUL5lzSklPsDOMzMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270045

On 11/26/26 6:16 AM, Krishna Chaitanya Chundru wrote:
> __pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
> downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
> the walk as soon as its callback returns nonzero. Any device enumerated
> after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
> capable endpoint -- is then never visited, so pme_capable can come back
> false even though such a device exists on the bus.
> 
> Since pci_host_common_d3cold_possible() already returns false whenever
> any device disqualifies D3cold, aborting the walk buys nothing for the
> plain suspend path: the overall bool result is unaffected. But it
> silently drops pme_capable detection for any device ordered after the
> disqualifying one.
> 
> This matters for the upcoming shutdown path in particular: unlike plain
> suspend, shutdown forces the link into L2/D3cold regardless of whether
> pci_host_common_d3cold_possible() itself allows it (see the following
> "force_d3cold" changes), so at shutdown time it's common for an
> endpoint to still be in D0 and disqualify D3cold while a later,
> PME-capable device is never visited. dw_pcie_suspend_noirq() still
> uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
> result here can cause Vaux/wakeup support to be dropped for a device
> that actually supports PME from D3cold.
> 
> Fixes: 1d2a29ccd3a1 ("PCI: host-common: Add pci_host_common_d3cold_possible() helper")
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
