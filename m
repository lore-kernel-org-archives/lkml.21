Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513182;
	b=FXk74PiabS8N1WGtvYztJqvQ9ZOuTg+Mh4WLZM8CEYb8YuYTtg5aPgmE3XYPkebL+mJ4
	 IXnGNIx5HM0JRGMlbaAInWRXzppV91jK/NpaeGwJQ5posHzMZDMDk/3TDEss6kqb5fk9f
	 PmK2GElYC4OKRR8iY0YgcGFymY9zGaEhZJSt9MiRZw2GssetgHbdpxjgwTqCnjSmlpCxv
	 6mp+RkmYNm3/7e5IL6rk0mrdiAPM9IzIDwBC+6vOqpi5voqu4IkEciabQrcWvsT4/AwEJ
	 jaI2UBDTHIHuUys3JwgfxwqUa3a0asro3iap6Hr8csYm/zeXg4u8Gxp5fCIj20ihcIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
	b=ToqrZNBdXntgqfVQPdRH9m3FZy+drNqYXvWk6nt9MF/26lwah1F9uoueYlRLDlYTR0j6
	 WEdiOVH4IUBUN8a8vylsbDp14fy0kIO8o8h+nMVPrAXbjngGA/OFMnIWAzpT9H4Yze0wJ
	 1rlK5lT1BSe15tCLDMXcCqXIhVhhHnYT0rrzYnG/8Vs8glMDpzrcASuCBRNzsF6H1n8gx
	 5vtR6CoV5WgVXGMLBjdrXn1Nxvx7jitt0y1Nh3Ea9UtZoEdYqba8rRi98N5B3vYvQRgu9
	 P+a7UTItQBRerz6t93l1e2iRP//koWbeMNySKD4EiP+i860ePU0Hqpf3uXe+bI/MERQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WMXKYfH1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC59606A6A4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC59606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WMXKYfH1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8dFek3701144
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=; b=dTk8bDSEiqxTbg3U
	oCSrJdEvIJRJSkFKq31xn8QSz8auMxz3OMom76294AEERLzHdUhss58H0lSpKtKE
	0GaaohZUnx/Bm02qtXna0C8ZvNdydTqmfOgYz5Ya4BooN2AIlE0bqVFrAUr2M09x
	WQBHSAzzCxlU2JArvfbOf0Ox0TJa8kCd/xsj9Uzb2ifO40ZhaJnSYI+tEP70a6zA
	MLkmsFiPQApe8HUCQuUGxINbSA2bXDDMhBVvw1h7NCf+9JCRZSx6LFOsX4edZAfz
	SZmzfte0A14PfJlIqWFkZdr5BYc47qJjsmfDDLW6UL8dbAJAucpUZzokS4tWxnBt
	SD+UPQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky1tx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-86c3a053d9bso59043557b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795513179; cv=none;
        d=google.com; s=arc-20260327;
        b=CYOptv9nQWq73iCyoJESStXlSi9H36av0jidfzM4mJYf98tf/n1Gi4GZckvWYVGX0g
         UhKcfNW201AWcjzUvhk2Ra3JBD5OAk9dO9ivu1OzI9RJCbV011ekVgaNGBPqsGDX4EV/
         Gi082whNLcjfLSEgEf2iNBKh8GZZI6mb9Y7TM2OXhn7j/mwayZe0uxA2d2cAUzxUKx3L
         iiTOm584itQr7esYpnDW2rkuIzkwEZpePYwdZvdR4LfrU40+RF/FtUnHDwXQkMzkXp40
         m6firF6hxGSuqmEFMNEAgvm380npnXAa9TOrpfrFxE0IUxpWf2LgdFXvdANcGCoHGqej
         SBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        fh=4JW3/QBWv94pG8yKG+OIpy0KzonZnQq88Re1Zv0tYtI=;
        b=Q85Jr3uWuah/Q0AAb5mz1lfcnR0wbb90QKclPVtxCR9Gq9n9CrUVHtH0hh/TpLvgR1
         B2Jim620Y04DgOkJwXcWcstB9bfWRipjhxcr7zJtQLKK2/mgZjkBZ/TA9irMyHXZr4WT
         sew3gIml+sLyOFL+Td6NnhrkBrZvw8i/IZC5BwbrBIOLkVF9T2Xjk+UqY2E+nLYnQQSI
         4qIAkZQSLD0n4B8FNlMWnmb3kuajvFhFy9ia/O7iR5O/TxgfKVFRjhFjpQt/RrqNAB+t
         QA8tx+F24TAtBh5yhGuEWPDl0FQ1dKjp6Jjkor5bYDEnEALFghGEQsCQWRhbts/7oPKk
         Cmuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513179; x=1796117979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=WMXKYfH1GbLGA0n1SAP/AWKZLVIONJPyt2UyshxCll64fTWkZJOjUL1Mi5HOzsP53e
         7JW85+JF7Z5MLE7Xblri4sxL657aHOXUG2tSSKJxI06oiUGn0wRa4Osqk1kRdFwz//2n
         OQEp2pOqH/JRxDv6LVvYefbfdEzn3mZVJ8HnrYbAkVyvnN9axkvA/zvZkKS+dliBEsHd
         Lqx7Mpw9Ae0IYdSU4gXZaLJH7OOeLKnxRRZGXhilI6LiP4+kvLxQl3sg0+ntNNO8cOfb
         dp8IIQ+lNRoYxC8a2xkldVycdMXISwp0LJEqfTex89pGWeSk0RzEgzCiU3HRlzBErng1
         QPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513179; x=1796117979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=ojNL1qi6sG2f+O7vePBlDPpY0mMXtxADs3Caa97dZlVWuqvxHIFVhfuyC9enjvwJQD
         Q6A+VIqcUuLHCUtzU97UOggT0R2EJaGKm9cF5znUoQiDEcrkmh/CNXMVbLA4uaItuPdu
         VvF5cUqRoNLFEWE4ZBNUdGF4z0yc2/xWWPonHbZTVRj66t073W2W75DWOmZiC9IsBFyW
         P5wsL9+9v9U0HWN+hRoUF+5gN1PImIebHshoJBi+Kl5ugKNaqTDJyfvawa3x2/a7EHYS
         jfcVsez0iBEqMiPpP5GVk2q0uUyIK6gdo8oXi3+Iby9XNXY5TrWirqE/oZTQ3SCO0fm7
         gHNg==
X-Forwarded-Encrypted: i=1; AL+hErH5I24s8lPEUSTgV712XHuf/mApq2EVcsxlo5ocdbNQF6lo5N8AU5x+zRhhP2fNDBeiVAMQCOzFvPQYdrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x91USS3tTql1ye9jhG8BzGtVhQlIqdPyniasba/6iNeEVnQIZ
	4ZY9qBm9qbSpwCsqCX5+B3QT0aYUYM4QQMSfJ7LaXmbQ+OCBbv6xFufozbDfS1eLO42gsc3joQZ
	dM+qK1Pi6eGNIuOIyVjqjtbg6UbG9oxjlkEsbNnudfH8ULHFWfgEYRZKB8+6cQG3LosN/ZS5/iK
	7yjsiD6bNlEAgeP7uv28100XLjMnrhjWyaGSMp7awSDw==
X-Gm-Gg: AZFdTZdU/Lz+9J1DFkdN+sngIxfNIKNEEvX6BnTWzAi35v16CZZpQSOuyS2YZcHN5Aq
	SFhKk7IkI6R5WDMnyvMkXdj0HPMCzW+p8Pq2Jxork9xK7E50qdbOLBOU1ZkzR7aUr/coyO/JKTC
	I6RCS57NX/Q6WDbGet80lbA0POw7WdCddXQy7hMRlj1Nn7UNvszXvFixk=
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id 00721157ae682-8b5204e150amr61751797b3.44.1795513179518;
        Tue, 24 Nov 2026 01:39:39 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id
 00721157ae682-8b5204e150amr61751737b3.44.1795513179141; Tue, 24 Nov 2026
 01:39:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com> <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
In-Reply-To: <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:39:28 +0100
X-Gm-Features: Aa3M54r9dlpa1zHkZUYs8QQIpfUY7qTgP8CTQlWBurbJeaYxxsFl26_dQcCj_Yg
Message-ID: <CAPzfCAYSMpReEtrendxOHPtQRCEf-9UN--MywjS+f=7OOU4HXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB Debugger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b055b5c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rs2CXmWTE79dq6mJqzAA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: YfZYKX9hjqrJ0HmiVN4P1q63evvJzZsJ
X-Proofpoint-ORIG-GUID: YfZYKX9hjqrJ0HmiVN4P1q63evvJzZsJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX078F2Q4Al8mN
 dmw8gqaoCPpR5YH3mpDB93UZkUJLKIeI9tb2PEtix+8f9zRGPe31i293FeS2GHZg4TeA7IH7QKb
 lgsnAe9kLndI6iJY4zAo9R0ZtIVkV50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX8JFCgleD2f3A
 BYzJzEp4+z53Lnyo00fEPdTB5uP0cmbKPnd49eBjMNp/9zxRLMzL61F2zqgQDGmDrsEgodhJW7O
 tP1At+GXhQKf4a8cUCKiNC03BOnxNG5dxXlxa7/0mT4MKqNpgJHxYoD5202qoBMm6BtGuHwQTZn
 YZd6/4Zo9ftJN7aZF4s1YkcKn8FzfISdPB4OUZnt1i5l3PpI8EpRJSdVTIJQcRxxQD8Ps7IkDQc
 9njTvLsFVzw84EsG5q0Bk/VX106YFdsGc2OrmnNZvmsR7xI4BC9Jc3ziVkaOSZr6ht9W5Eqpacw
 vdeZhrdGapMNRbuwuj1fSY5AQrdfKc32a3jHyF3YoAD0r8IB4E5yLoG4X/iWoCHXbgRqKdMPOb2
 dWWxqCfR3mRddMKa98veQXwsTpojXQYi6ElkgNolenip/axF3PFyk0ZLaNrSAwlbus4G5GdJjHE
 5hkVAsVGGwEEowa5LRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

Hi Krzysztof,

On Tue, Nov 24, 2026 at 7:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/11/2026 17:42, Igor Opaniuk wrote:
> > Describe the EUD:
> >
> > - its CSRs at 0x1610000 and the mode manager register at 0x1612000;
> > - TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
> >   syscon;
> > - its interrupt (eud_int[1], GIC SPI 189).
> >
> > Hook its port to a second endpoint of the dwc3 high-speed port so the
> > driver finds the role switch, while the board keeps the first endpoint
> > for its connector.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> USB parts in this patchset grew here, so now DTS must be split:

Will do in v3, thanks!

>
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
>
>
> Best regards,
> Krzysztof

Best regards,
Igor
