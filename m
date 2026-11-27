Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778609;
	b=D55hK8edvqffolc05Pq0TzjATSd4MWlwAXTG5BwsP3jLswrrTAxn/hlieChJlSXHrJOk
	 FtYGU6za4BHEWeEeaDAH3J67ATeT0kljJ+0ionLB/1lgYsFpm/avOisQK/eAF5gM1IjSD
	 8LOE54F3CMvE6VGfZqy48JXtDwZPw3up0oOMeP8Ff0aOlMFqEONYkyLVcBUTjZsgif4hG
	 QV42lQjAyGupDYp7ImV/Fvpp8au3qyF6qW24EEBdJ2FTVKX/BMpzgvv1l3no5mz0qeYkJ
	 1Nri80eHunbfoQbLV6s461fW3Foyn+pM0BtORu+gLxLSkfL8WzBDhtcvkmZIZCAmBJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=;
	b=ZTwuPdAdnrqn8Qd432l1cnLSlAr6hDPoWNAqnAU4P1t9novbF34M8KZZVE/g5JHm/2U9
	 kdMV0EPCYyqsfgSw4ZtlF8i8fOdTuleeQCVojbQdDovaNuIA0eQ/dmRPxMDZPFAEww7vF
	 +KLsFlVFf005A4iPUWq1HUYIRLZ1RAP+b7ky8+jFVbv3s5E5gu0O1H/Wdj4y2TF8yJfvE
	 ixe3FbFBeDWAguaqOqGdmObcjbqaqdalUc5hUa+GZhNmcgumo1Naa0A3UDw0m9gNbkQPr
	 rwbpHrNcAhFt0a/rc/3Hq64qXoLTvPL21VcB2FCpIJJLw/awl8BjAicWflSjp7oYENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym46Pl68;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FG4RDLUr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym46Pl68;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FG4RDLUr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApuuv053101
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=; b=Ym46Pl68RgkZGSS7
	h9p16gslZ7WCvAuEQIXPvvuZC2G6ggWUqZqbPX+O76nv4g2VGWPvhmq6TDB3lXQz
	l4qmQpwJVzWSoyex6gOm4kOnxvzWRb/n1OFWWY/lf5xIgXU4YKDKyl3IxScKYwEE
	m3Bnr+ogof+2kEgNBC4wq22J1EVgh4vg9u0wqh3YAWs5uqIOZQnWzwnqq32QumWR
	AFwV5Z46sH7iFi9bJiEId0+DaQI/Gt/cs5eL7w7n5xolzUVIoAlt1tcyNzwxZT2f
	/rbf3k1ShokZlBd1+G6pNIU8fLonVow28NkvwOJzv0/vP2G/mUcARDgb/qvMI9sF
	cFd//Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s5r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:23:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53657d237ddso11262641cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778607; x=1796383407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=;
        b=FG4RDLUr419LzjrJUMgRXDitHecF8ZSOs7jARhzV3mWhLbZwfJU0ffzrvtOvpZJYbf
         qiQlBCU3nCdjuD42TmwqIFuRUmLgpAn7o44OmYlG52+BeR4D0Lsb12i/iA1LMO2bjZDV
         BM3/WCbxwDnfLOu4rJG8teGeO6a1iZXEfF/cXa0b53L7HjEWfNhBevnUjHTIElZ8/a5U
         HrZNXJ1BNNGmRCnTS69q7MHl2qJmZwiVMtjGlfxnkH9uGr+6GXOHh+/FagL59Y48pmhO
         7Peantjz7vpPC4Ip8v8EClrzFFZBFSfDm4HqtO/lMDwQcCicff9j3SztZz8vneHOsNv1
         r65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778607; x=1796383407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwbGdFEkDz0Diwrqb+uD4pMw+aTYw7fIvGX1BVepkok=;
        b=HeJd+7KQsLFmDAc5WbZhw5i8HeffkpKA8D+ZUAtmEIXMiewcnhYVygOSWTPtfgc1nq
         eoNgTbqMwBYg5GQrZjdOlWVO5uANSl8ITRrdGNuHPWU1d8UMG9RJIK2RXbaCFNage3+g
         Qon+LPWpeCgL58C8I232+iWooRKpdbH/EfUBkEyEftrNbfBfHQU/HB3lLn2o045uRfkN
         9xsLsXqtCRp1QTy0NApImkBpoVLCovo4HpluvhbDGdD0qLM5lZ29BkrKvFdI8rW+RP98
         hRSBE6/PFIBQyiIGk+MXriotWc2qTGJYouJniThhPxEQD+u2knkc5BqV4T6KwToSddqx
         JPsg==
X-Forwarded-Encrypted: i=1; AL+hErGCd+2VwQHHHjLXVNmLwBJZ5B93A/IMTIWMcRsGRNA6GzSnPgJPArCWrroKNF23RCyEDd78E+2pc+TUXxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ETVe/yQQ0c8p6CGt3vnuMf8FpbIuh6L6XvD/RZtACWp9qrUH4
	PROTD7Us6qbaYEdubycF6AjWGOFJJ+mIDCLsBC01FRYJ5PJMSe+7SHF6Oc8vXqKsMzrSIc1xtBw
	i4IYScBb8/kO2Bhe7d+pVyW0tQczoyyugFHBoCfdikFvURp5la8JnewF461NMBJ2TOck=
X-Gm-Gg: AZFdTZcop8mBtiRBlfq7zlJ3+MRZtjn7j9xasC9H1e2Lt83CS/RtJqyBeo1bejUVbW+
	YYBh+Ed5y2/s/ZazYLl0W/tlhjQ8g1GnT7MyTVwbQ/345Zay5ih4YCUzte/QXrtQvMvBeRZ+Yky
	k2E7Yb+nHdxrHOtFcRtu4WbvUOkYX4WA9KzpxbwfimwsnOPdtxHBo14i/HtkU3GWYK9paDVC79C
	ZlodJY04duOGFnXmH3r/gpmDCkZ9mhuYK+8wUYU2tX4xwiI8npsFol69ovxD0w6WkB+Falo8ndJ
	c6TNLSPF1g9y9TPxch/vCUq5TWFjEJxTOALjNiPQvs4L6WuqNuiJZPuD2Hp2z90KQpDtul3/aAq
	fisfy8OZ2fm1g8JxqnICbja0jVZkRZTc+VCbzqlpDPPGjTNdQa/K8PeMfH5x6B7LNDHZBXB0=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr4637602185a.2.1795778607134;
        Fri, 27 Nov 2026 03:23:27 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr4637598185a.2.1795778606669;
        Fri, 27 Nov 2026 03:23:26 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm863728766b.39.2026.11.27.03.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:23:25 -0800 (PST)
Message-ID: <0d0fcbac-2d04-41dc-b596-21e6ea622e2d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:23:24 +0100
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
Subject: Re: [PATCH v9 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
 <20261114-shutdown-v9-1-5430c9f242ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-1-5430c9f242ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MbAfz87CGkLQWcDu4mDExclP3d0TPM5a
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09682f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1dD4SeorvVlWizVoyX0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX9XVeWZkc2Mv5
 p9oHfaxlZF9DQmJuzWgW/oscWUw2J+1i1iAnP+XHme+8jw4pTpMNpaI9p9ef8KUjD0OZ/AujrDX
 yQQLbpyvc1Egko8Llx4yJyQ2EVXc0NU=
X-Proofpoint-GUID: MbAfz87CGkLQWcDu4mDExclP3d0TPM5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX0czDsZVKSaSA
 MsoxlIa1bxI6ci1tO23jPGcN3pgN/JiTUceLbIWElIW64wQzuWRIm/QwODZYsySeQliySvlAXQq
 fz9LAEcsVYvvvP2QOjZO40AwOr87XPCBmT+lDk8RV7/sozAfEMxED44Tch44FwkHGlLw/H6TF7u
 Zu8c58cV84nE+eNOHUppp6WvKqPifvlnSFjfuCb2kG5fllszfV1Hd0LXWKHUE8vBOri07tehaq3
 fSpAxEKF7C1eDkTrw84XZUjG0ce4hgB1V+BhpebAWbIMBuvMdCLNOHFMQvzErCOsf9m9oOW/Nd/
 /wOiHBz+g9ri+wz+X3CEKOwOhP/cxzsNCMTqlhwt0DpbsrIAIdR8r3/iE3FWlEofc+OZ0RIqkVu
 FBHu2MfSvEpYK+OqcoMmgZjzrMAhRqJk0a9PKGZBPKygzqWTw7lSiz1VQMxiq/okyhhlmLVxDJ5
 FfPdED5TGupAcmhKGRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/14/26 3:00 AM, Krishna Chaitanya Chundru wrote:
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
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
