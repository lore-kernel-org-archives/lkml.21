Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998457;
	b=iDdhRiy/dVJQ9mKan1ehPeL42Urhrspj11H+j3HOZaBYu0siIixTJ082NuxW8ZnTZJzc
	 6LVoyGpr2uTgqZqwklpUmBV9oQQWv8EXJZ05pWX9H4OIKJ9If++gfW6qDyi3ZexaBAkBz
	 OHT3ComSiyAInxJgi7GIWFSILQpEqDrQXmysuhN7womY5PqrHsX7w9ss46xDJ2HPg4X1l
	 fyUcVbAOxgDaL/kDlH2BvsZFDIyI5mKO3+nn3p1dI77TZQU5CwosHHNlDp9qVTQdPG+UN
	 RMbdTBYfOKc0h1/OrR0kEqP7kZjIjdwWTK/+eGyRpnuW975HaE+yb6TqQVJ8+tsRO4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
	b=RCJ8iwwwbJNqFMmCB6CQYvVEBiHr3VLqgQL5IwZr40nBNcidMMGoctA8B+SnVvbag0Lj
	 F0GNI8Y11DmD31jd04PguSEYechnvjkIaDLhKDl2yruwddfx2WmT3d4GHArltE+pirLVY
	 h6gSAj05VJjJlPOebEhdXfrhRxgvQfLs3LLXx2SMF48wx/5uMS4L8+K3yGSl4iQky+Vpv
	 AoJSLo7kMKmcZIxlRx3dh0QC3t/iONL6eP0zZcX/W8COLu3bma5xFrllUfIxaL2CAUv4r
	 ew08iuCMNq/8jk3I9Obvg0dGnsYswvzPFxVy6ITPFTabYB6qzbgS9AMehJEv7I16+Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j/ybjMYZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J29wasXH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B4606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j/ybjMYZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J29wasXH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kdHw2931403
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=; b=j/ybjMYZre/ILIML
	M7NzlJXQ6554KatR3DUAICoHEr9nyzyi3yWKwug8MrN5O5zwBpwdn48YBC5GC0RR
	hY6pFXHBgwmF3lpxeoJG0e0BxeTV+PZX2s6baNmOe9aIpEjVZ9QDvAzFKGKSqW8s
	5e2J3q0wcdvrOT2nxRpuc2a13x/0AfL1umSpHZTPV0D3EsTqqddvDi1JBuQg85ES
	BnlIvM/R+R6fS/enzDvRzjyNxbq0hdsWLxNUXum8JumSMtXYivf/H+EyuwRyXGWy
	J+S31BFYPDgWRW3NNXGH3a6bKtVNAGBLo8iEnwCWvSZkR6F4b253396Bl0qfUZmM
	s4kpWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jk55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:40:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so105175685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998456; cv=none;
        d=google.com; s=arc-20260327;
        b=PkqgOFeOxJcYt0tOJesEolYQFjvv+ifV50zKR/JhVFO246lEocDIAr3W+bT0557KLT
         RTncP4Vo4OipIBj2bfT/OmA77YujY3MLuB3ss8+sYofmeZIYNDPORJlhnJ7BfGS+03xJ
         1X2o8JsH8S3XzJMb7nZ/bsI8HjPvvIxGWJCmfkWgTBBdnk12Len26KUA9KYMsNfsWcU6
         r+mJZeBFrIkXj5ptqYdI5c+E/0phYRtngZQkarE6YX3TO0ZpzwTUAQMfdN0aO62wwCd7
         ROWKw4c8M3naPjRrfeGooiLSOtlyEkxmSEMR5TIw/xru65H+qowEk1+R8ojWAJlov5m7
         EdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        fh=LdrQt0WZBUvtvTFZdoli1Q4+pQaOdEr9n9LV78nfm6g=;
        b=U8gzUXhz4ILNaiar9ndfFmSx8U4m50V4N8bb1KH+F1VqlqFCG2KUYoqO+W1jW0vl+K
         5xDiZQ1pH4OJ8EOcZf6umcP/5kLDxmqNw7Y2y2SBs1k9aC0UJ8c/ORXq5AuyqChlyMvR
         UEbu9G2WfSLYw13fHqmoqlPRP//WCYxigXmoDXKVTyL9edbcVyqW0duQau7D0Wp/D9AV
         ioCZ5B/OkYNmQLybB9KG9RwXBV8gxlTD+7kTvqzoD7Etn94XEczE/eSrB0D3bmGAA/xq
         Y/GG+dcTCdRwKylLEfxqblykojMiKVP5Mu8nZ729QisapH/3wqm5ocJ7v7IY+R4Towne
         C24w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998456; x=1795603256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        b=J29wasXHQGetZIju1fjZ9QLD6otcW7h9vZ5FUN0K7cypTidVpYtO67xM5kuGh+y3l0
         rSnM1ojC84om46l+VyvyXVKg+i+NL3tzwZ1BVm8Zzc+y9teT325cEicke0L1wXgNAgbf
         hC8lvA9qqH9z5fUEi3CL6pKaBgb3eeTKzoro6QbAfvFzzvgeFEsH99SIo4Rh/HR4JCdq
         120wwX/JvZ3uZz2uAwGqOeYWsl/voHs1fJB6kTYs+B01eMneuZs7/DHgGjCq0IMbv82k
         s5ISNXhgO7vjjC9Y4fX2pgkf/4b7Rjx9spT5tHPPPVl1oi8rZP74/iP6P9775HOleSVM
         tnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998456; x=1795603256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        b=on8QONXWVhA9+nErIz7g4dxGEOepzdtB3IKbH90ObQjiwaBEikejt2Ra7qO96Etj9z
         c/GTPcG4foidkh7UATpm3a+Ut5uk94NLir12fAqDMQ3E43Z9Ppno8KiVOWwDAvi6iubK
         PF+wD5OAYcHeddK/nigUd5MAD7gDYpX2JE5PPHaI/J/eWvOjEE6DXF66HtaWNRPlXsVz
         /endRRpAs12ZRtOVNj0L2xP762U+VkvinrF9yS2/xCDs8U82lScXZ7EsfzOOuDH8/rKa
         ILUWR98dmlf+mq5zjh/ACH/Tm76+6C6WFTNECRmkBp7FhZYi5PiQNP89bVNiRK9sDhef
         Nhkw==
X-Forwarded-Encrypted: i=1; AL+hErEiggEDBvDkPsfFZN15gbnJaUCPEzL3Bf+WGwZHCG1VZYw0Mv2F6V8j3846lM/+3qjaVMQ0N7rSvaRjBwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hQV+OhjMPmpONrxd/5VkQoyn476Ekkxk74B4XptjaJuTvDVz1
	ngxm1hxWdajv8sxOyq3RvltHhkTCWqjmvlpYUKttwOEFWRdo5VO7KiLUAfvSWz+ZuATWmGcCuoc
	iNJ5m1K487M752SahaJBkuyV4eKY/FKdt0gjLJKseIAjcZzudxuEesFxI2y14Xn3/r/I/hK3fSe
	5QBJHrAqf3QgXdNb0H6QaJuoBa9GV4hAvBOZOoYCDJ/A==
X-Gm-Gg: AYBFou1gqhQbefbJURwhIUL3Ow/qkxqCPpkQ+5hXytxjGXzSPaocTKwJosNjgEKdmhr
	QYak6DNDKR/BKau+f9Cx2tjXL7Ao7Iyl09kgKG3ncED2sJ6+oBple38OGzNGkESvNYVPaTpdNlq
	5UOY6UsXtZIxPTVgzYInzWMO2/lOoZBVIHNjmtErLsq8pRT0McUuGCcT8IO4yICMQWkNRvK5bwb
	1PC9FmQMiGxDFQ7C0Wi1Qv3vLMjd/Nww6szJI0papHj/vDAh6ynUq/rv9C/565cHDDUzceD9gbi
X-Received: by 2002:a05:620a:838a:b0:93e:78b7:fa4e with SMTP id af79cd13be357-949995d052cmr388638585a.37.1794998455545;
        Wed, 18 Nov 2026 02:40:55 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-949995d052cmr388635585a.37.1794998455024; Wed, 18 Nov 2026
 02:40:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109110352.1621-1-xing1989093@163.com> <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
 <20261118092814.2275-1-xing1989093@163.com>
In-Reply-To: <20261118092814.2275-1-xing1989093@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:40:42 +0100
X-Gm-Features: AclHuK-FT1CuXYUdW7m-nWwmIULm18l1osWT533MIe5VVPgbaeB-OtNzu3MF4w0
Message-ID: <CAFEp6-1pJd_==NodGfp1X=P=wsxbBowezg07DJpJfd6GtB_=pw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: Hongxing Xu <xing1989093@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd80b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Byx-y9mGAAAA:8 a=9cDAomjR_99duVTWh8cA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oJk2JLyZqJY2YzoQt-umTMMWdbRdlTS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MiBTYWx0ZWRfXzHmcFwP9ekKa
 ky3D5338TodDxQZVoH5qHago9JJta+tVyv6RYv0yr4G2chYGAxCOW5lxn+S/hGADSm3VmgOiB3K
 R4mAopmeQTD7E3TgUrUqKirN1KOEIDPBNaE/+2QvFab5LSEU+YPAwIl5/CKVjql54BB0OFg0lAN
 yBlWIiAfqOUVJMnfvOGoCN8XJY/BnOaLCRfa/+els5XfVQRxucDOfBRefiW60tgubJqZgNbkAJZ
 tQ4Lbq3VBUMCkbwZXzMXHIrt5Knw+8iGbZeHwM/o8L9zF+66Es1dG7nGTLB6lKsGWrg95gTC6hC
 /V1T/7zqolZz/aSM80Djd78IxxSZlhlf7xQ9XoPZdIyeS8n19CUOHexLumNkuOVvZ3a3pKDDn1N
 NyGknj5Py+UXPig56a/RNtCPOuCgBolfbxTdEdhURh7/4c7hmwKGn7rQvEOgOQY5fCQWJVExcbD
 F09oIBqyEKM5B10uRqQ==
X-Proofpoint-GUID: oJk2JLyZqJY2YzoQt-umTMMWdbRdlTS2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MiBTYWx0ZWRfX4DLC/Ms1JCkx
 IhxYbYQgAhfCOk2YWVpOYAgMDvEyEfz7n14GfmNa9lyMy4ogdoUV70FnE7yemf7ukVrf6AUIKeP
 xrOCkVal00oCKIPhb07wEofJ+jkMYiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180042

On Wed, Nov 18, 2026 at 10:29=E2=80=AFAM Hongxing Xu <xing1989093@163.com> =
wrote:
>
> Hi Loic,
>
> Thanks for the review. Let me check that I read your two points correctly=
:
>
>   - The reset method should not live in mhi_pci_dev_info, because whether=
 an
>     ACPI method exists depends on the host the device is plugged into, no=
t on
>     the device itself.
>   - The driver should instead walk a list of methods and take the first o=
ne
>     that is present, from the most generic to the most platform specific.
>
> I agree with the first point, and with the idea of a list. But I would li=
ke
> to suggest the opposite order: platform specific first.
>
> The two entries are not two ways of doing the same thing, they are two
> different kinds of reset, and the spec keeps them apart on purpose:
>
>   - _RST under a device scope is a function level reset. It must affect o=
nly
>     that device, and it must leave the device visible on the bus, so OSPM=
 does
>     not re-enumerate it.
>   - MRST, referenced through _PRR, is a platform level reset. It power cy=
cles
>     the device, so the device comes back as if it had been removed and
>     re-inserted.
>
> The spec says a device should use _PRR when its platform reset cannot sat=
isfy
> the function level and bus requirements, and that a device may expose bot=
h.
> That is exactly the situation here.
>
> On our current board, both are present. The function level _RST succeeds,=
 so a
> generic-first walk stops there. But it only drives the link reset signals=
; it
> never removes power from the module, so the part is not really reset. The=
re
> is nothing on the host side that can tell the difference afterwards, so t=
he
> walk never reaches MRST. A method that exists but does not do the job is
> worse than no method, because it hides the failure.
>
> So: would you be OK with trying the platform specific entry first? That i=
s
> my suggestion, but if you prefer to keep generic-first I would rather hea=
r
> your reasoning now than write v2 the wrong way.

Yes, from specific to generic method sounds good.

Regards,
Loic
