Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794972058;
	b=dA/MHP/f16CqYuCAQdb24XhZ5ubBSjIV/Xanq3EoZK65JMoaMyAadHvX1ivxeCSDGrhl
	 S41difRA9Ax0hEQ2CfI2gvGE+BPuDpJ/RgVQiqXoe7MvfqlZQ6QbmY1rkd5B7aSIEK8O8
	 5v00DQS7QwW3M0QZkoYlBmIcUUe9hJ8z7f9jkqX5J4166rBPp62wsKfsacOMPoFO76Tb8
	 jSXaDI7jP/PO4yga5Sh67A/dpIq77jlqxeZkYdnAKPAWbbmh2iom2FK4BIG1YcQEc4njh
	 8OQw1m/qgFtFjb/gP99YC8cSFKR2FeWhpaf/sOPBAICzW6sVAe+2NVcEExm58kXZY0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
	b=PtZvzNs5q2zwHtdd7x2vVBnTNn1gFooNfFtr5tjhivrm6iIdAGb3Af90uNfI9Ywn1HPr
	 V6C7+dL81sXP9567fD4kt84C3+Q/ollGLmHik7ISlx1PiEfH1g2dEKKIUZHPMRGan11Co
	 tP7Typnlrgw7G62LgH+h5jQ2PZe0FXHJk3v6lpADCG5oZ9En5UXBiLGa1WfYItdt+kiEL
	 zBwwXIVcsSg4+kGyOshddeG/BpwQIAE9qkTEpISTUzGTq0GJK4WxgkZWX1ZntunPmD9at
	 H9QP8km9sBVkuG5fyxx5KqURU8uWCiZXcVJjtspHffYOPPYWnFH7xCrTG9qPunAdksA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d97xzqa6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ej7tPv05;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d97xzqa6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ej7tPv05
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3EB472699
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=; b=d97xzqa6LQ7Dk98q
	i91jwJv6I43Oovg2DWMbwMpEGlG1mNf5lnC9PpgMtJ/6CBONHDZbq8YM+/M5VkJw
	TBdmjDd4nlEt7IBghIOWaEt/FszuSHWIP04O0DuvDyhtiqKUMdqzGHfCqgQfscpH
	yWWoTVN5FBWkz4YFZbqQfnPV/lvsEw/yzvA9kshZXFngJYH5I8GczGLKh6uDyADJ
	DZt/7mHPBIoQ9/Lj4AZVXcpjzDajwXhyqXnXirvPvPO4HhEomiNt1PDe/l9uv1DG
	Or/nRAnYZSROqBPuZwzDT1gV0/est4J10AvEo/0HmmDVgFyraoI9f09YOeij2DYb
	uoOYAg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv88wxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:20:57 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-869553205a7so7573237b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:20:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972056; cv=none;
        d=google.com; s=arc-20260327;
        b=KUPiQHL9SDYz76i0a2EJjOIgqvAnLXbkGlBRwIwc3mLBC76eP1jMEdTai/DhGdXKFp
         vZ+hvH6cWCzMpPBllP/ssFBZZQ7LCCrUV1jgapTD9q0Zly+aEIohk756rvPWC6K5eSoP
         epI+CrEHHxPaZhMjrXg1d4d7k1QjlclEHGJiKK1lxxX5+SNkdL8E16uovgNwPb88PKl2
         yduSFsKz44gtWXguuckjnajvXiZmcdPAdeyutsiM3nqRSpC0bndLLDq+cHYnob6Ejy1r
         1np+LGBPmDrxFmyf9pMBQI7jsMpNx3mYp2x34sn9kO+HW19Pbon/2bgTL/DgDf/PEX22
         usog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
        fh=sE1YFcJbT9KxVrOj29aGQ6C2mhXBIKdPMkBy3xkhCU4=;
        b=fdi5SYad/Veg36DhiwfjQETizwN4dDmqGcW6rxsWF4xH1GrP6zl2amz/k10CpJJNdo
         o9XCMk9+PYzo8oUfIofTY2gAKoIXGaf1B7lb8Mwph0SdgpqOx13hefkidtJVCMCC1Ysy
         i+F5tX2Vynw0X0/h6wbFDhBae1U11xa6A1YpPQAZ/ySoI3iz1Cx32Ag6YUqQE7XFJFgt
         2eROVR/AXZg2CbjJjDnoEXm8jipWm4ouyVte2E2Er/VEFDJWO+JNm2PSYMZgnPiOOKde
         x90HoHLFgyNbvHPfMKq+PvCH0UQbWq8wIvpx+W1asNT/i5+ZbxDUQD1PphIVm0LTWNoh
         FUQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972056; x=1795576856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
        b=ej7tPv05esCSswuwjXdeRHM+uvgTbjx5/HIzYSl9DYDc0uez9J7t7/VtY9mqEAWfDU
         D487S4rqcRK99G7FiqJj9TzvJ2jEYitT52InaF6Kuz5LX+NojMnd4Fr7xPUMRiJThoWr
         0oQ+b1Pcs6xmnzJOcdSzjp9PMxUOtrendv59tHEAY9A9+ekWHa/78A0JZnpnb5eotMoI
         L0vHSt0YMIhuSZWw+2HmPNIrBXheqt+Y+bSagoJTyggMsJ6X6jVUDJfzgv5ABe7os6w3
         Z4a0mVnKw/UuYkU73IrRjpsT8Ug5eEUOOTo2G8EdaUETTgL2SETEpi4frKVGo8Jiptv0
         B7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972056; x=1795576856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zBwahOvwD+DAL7Tr2AsdmugxqryOiG1hPbX8Ut/PPk=;
        b=1/JXjLx7zkbYz2OAtfENd7P33w905R/wvFerd41mHvLMvKouqMTMyRGEunoct7PDiF
         MUQ0iiqK9E2G+3NOUmR3KpB6kKxIocn3qI0Z21YPn+vnCetszX90KXGKpWFehSWopb1r
         UhroEPdddzzCB+rkjm29fDnDtdriH8mSDV94+PqHkH+W+04AT49nlO/9vrOge8K1Kt/x
         QEC722+akiVNVVdsZs32TXcnRnQehizAcWcdee3rM0qDtLxwDXBfvWPSwek2RmQAsP3/
         bnztyLR8po01HUXg3OvgZRDqsyD8bbUH2OKXs+wGF8m+um1i0VHAEVo62naujOIKB75L
         kv3Q==
X-Forwarded-Encrypted: i=1; AL+hErEcf+0YWSYp61Bu2Ni20kSkGsEjvUaExR53cONkJmGUOx9yNJPskhbRUbLg+p7zTJjyx3DmnV/vsoG+2AU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fD49h45noQI3NGCrv+SBhGKOewP9a2thm+0xPkwUwV+UlLx1q
	5ycMFJX+RElmnjH/nAk5sJimUrYG9w5l72ZOdEFl1T+Mh7Zp0Xwz9rNKn2i6UzbCAeCgeQlRxwV
	znuegEpffNBc9nox2Y3X2HxFQhZN9sPrLrGOk4OPfAuJTQK47yrhLlP3tVJiqBHHLK4BuzqmNjr
	ltKKt1ErMqJbHs8Q+/BhwmX0frVHVk5l39hyduvdVE7Q==
X-Gm-Gg: AZFdTZdZH8Awdzm6jxJCmgH26rbTXFoL2Q0K2rdTxc7x2axuOvQtDed7yEH7f67lOrt
	GCAzdMrlifH8HXylnonBN2/szJZB1Q0n6G1d2g1znMJTQHxCkYChCYConm+8p21WS02A0G/OduS
	5TPnWMndl640PpkuOh8sP39pNAdPUV3LqkIcfK2cuUiPwi6OLk8oFETABKQA==
X-Received: by 2002:a05:690c:3682:b0:8b3:5a91:61e8 with SMTP id 00721157ae682-8b4fedf227amr5439017b3.69.1794972056415;
        Tue, 17 Nov 2026 19:20:56 -0800 (PST)
X-Received: by 2002:a05:690c:3682:b0:8b3:5a91:61e8 with SMTP id
 00721157ae682-8b4fedf227amr5438907b3.69.1794972055754; Tue, 17 Nov 2026
 19:20:55 -0800 (PST)
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
 <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org>
In-Reply-To: <ef5c8902-2a55-4879-8deb-5109f7bd3cd2@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:20:44 +0800
X-Gm-Features: AclHuK8GIBy0xoigIsjIO5R7OGYBUdDSTyKIaJPZM9Gy857UuVUIg3lY6I_v8mU
Message-ID: <CAPTcHHTALv+Atqf4PKESvqRGDKf1+dPmdJCjOsy_Zpk8ZVJ2JA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YKuA-DdKiTnMQ4DbLR6t2eCG9uku9q_n
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd1999 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=-c4twqntNXxB6aNGM2cA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX/ofF1CZzbfon
 1/Xu7RRw0dA2XMyHAPCAcWGbcoGO+7J54M0q7gYOHSK5dXM4dMaKociQpdKrz9yIpS7uNasLL6z
 5SO2R48Hlbxqp5LhosnAI9X1NS2+LgB67ZT6ZMzPanP4ZFYXIJUsP1uVHWbp/kb5h+vqho6n4qN
 quyq9ktZvyp5M3k9/RRQBAq7Z376rAkbi8qoGL+wqg1fOaZQ5SmAopBhZUHV4PUek8+lxc6gmUp
 X6QRymfOXhc5O31doYhMUat91oCqZt4APzkhm6mJA2VjM4RciyjbEOUoJVxw90TOFuZ33V9WuZL
 ga0HIhF2OBX97IAQ1EmZw9PsjnPgqfgkxmpCt7Ex9cpu8nQDw7LxKAwHz9IHhESFvGdW8+XXxvC
 Lp/mD4jlHXdytJyn4SpxmV5TAS/41yQeuTEVzHwShGgdyQqSD9VWNG5gyswfOR/XAVfes7oxqQI
 dwTBeCUoCT5xxTjEByQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfXxHCWekVrWtZe
 7qkM61uoGyvuVoxOuuSsf5R6IkJnQ6Avs87T+LxLX2W5MQVylVt1N1IPdrAg40hy050auswWx3Q
 JhTvNBAnppcle5heogC4Nj4qeLSzaHw=
X-Proofpoint-GUID: YKuA-DdKiTnMQ4DbLR6t2eCG9uku9q_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

On Tue, Nov 17, 2026 at 11:29=E2=80=AFPM Srinivas Kandagatla <srini@kernel.=
org> wrote:
>
>
>
> On 11/17/26 6:04 AM, Hongmei Xu wrote:
> > Add the byte-mask property to the fixed-cell binding. This allows
> > selecting non-contiguous physical bytes from an NVMEM region to form
> > a logical cell value.
> >
> > Some SoCs (e.g. Qualcomm efuse controllers) store a logical value such
> > as a MAC address across non-contiguous physical bytes, with one or more
> > bytes in between reserved or unused. byte-mask lets the DT describe thi=
s
> > directly in the fixed-cell binding without requiring a device-specific
> > provider for a common pattern.
>
> Pl take a look at layouts, which does exactly what you are trying to do.
>
> --srini
>
Thanks for the review. Do you mean there is already a driver in
nvmem/layout that implements the same functionality as byte-mask?
I looked at all the existing layout drivers. onie-tlv and sl28vpd
parse proprietary binary formats at runtime =E2=80=94 the cell structure is
unknown until the device is read. fixed-layout just wraps
nvmem_add_cells_from_dt() for standard cells. None of them handle
statically-described non-contiguous byte selection.

Or do you mean I should implement byte-mask as a new layout driver? If
so, the concern with this approach is that byte-mask is
hardware-agnostic =E2=80=94 any NVMEM provider with scrambled byte order co=
uld
benefit from it, just as any provider can use bits for contiguous bit
selection. A per-platform layout driver would duplicate the same
byte-compaction logic across every platform that needs it, while
implementing it in core (similar to bits) makes it universally
available.

Could you clarify if I'm missing something, or share any concern with
the core approach?

Best Regards,
Hongmei Xu
