Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795594818;
	b=UMBMbgDBB6oXktZ3OkYJJ9covu+3tult7YD7NYE/d3evNbOWLhrB5jIoZD/XQv35cTCq
	 8QJvLtQO1JPE8y5HBgFLMIHP/MfuhNql9XnjeofZsxChUp/IdJbg8nftpt233hOlPKhoK
	 DUgBzKBu/C0aL3f2nLs57LiO002fI4k8pB/EvYjQXsJEFn+G/fqYOJiB0sPTJAWuD6nXr
	 aDbeJnc6ICGrGahutX3p3oAsoUUUgRKCbCHCmXjga25UZfEq211otr/MBH3QGsVohDLdA
	 AU3A6EvDSr2aQCgoV2DV/nJcYmCXSGwYkuclG5gaFewhJpr80oeXyVZRQqJv758bxkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
	b=2Dv3w38I1t0CvUJswfO9w11g22+lYjiHHr0dSn4jGCMEkytls0GTQMyTtuytHG/sZVym
	 /5ZuPm4bEmGmrN4Igd/JCI6syNUyYQ8cb4v2F/ESGy9olJ/F8nNsHM/JVZWuXVJ1/TL+v
	 utG7y751gJAAMi12uKv7kxYp8uwc48XHCkRkNN8ZCaMYsJ7hTJL3au8uNXU/bf+56b64I
	 U1ij504dSFx3jOfxXtomF7uiSrQ7o+/uYnpN8IdzHI8Hu1fOUap/jOXZw5XPIi93vvj0k
	 saAQHQYRlWyg6kUEAZSORTQOq8UvtoZWw+a1OO0U9sxrpMn/4KdDmg0Qc7o1ayYm80w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPk+Ing0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IbCoMHUp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F62606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F62606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPk+Ing0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IbCoMHUp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Zih300022
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=; b=XPk+Ing0LGpXGmsj
	SrqvLiAHuaxlOskwlC1+Q12P6WupG9Nl+w0th5fjp5sYsaNteBZlKAVIvqgIob2a
	fyj8RKtHnwwtmwlj8ZsbBHEJsSQOjJKnXtNU05wsFEBju/E3NkXwylf9yav1m0Z5
	bT6QjvKQ9fJeFe71fFj9n9J+rVyVfLxrP7lPy8Sm8H9DrEMwBWc/icnrfNW6wSvx
	Q4dxKio2UJrbiC7daea8C0suhmeU3Uf3N/ZucjVoBKT/V93rr0fN7cVkQPDi2AHf
	pKi4dONOw8RrqJ8vh/DgsjCDEz8osc5tVKe7ogdB7P9F8j/5tIx3s+4Ak0lC4Tzk
	97eaKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsjgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:20:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso964296185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795594816; cv=none;
        d=google.com; s=arc-20260327;
        b=hyriq5T05kmLx8eFeI/e/QyHpSu2JpAISmLH0rcVMdz6NkeHX0wbTmtwyImZ41xvdz
         71fqw4qJODcTn+ECcXEM77SK96s/VofY6/wJxsj5fhAIvUEtXBxdBNncatjyp1ao20cX
         rCmGKZvtRgNzDJ/cp1EdsfVh5w7SIOBLnzzmGcmZgcIgglI/+LGJCD9H0hZmToQIqvae
         nhobcXZV3IW7vTEfl/sqDL/cixe2dImdv3P+oEuHMrmT6ftzJKHHyyus18ONFryCZV2O
         TsRvumh50MJke7Rk4vBpHR1y6gZ2QqxWQUOZXTEFfYnJ3FQmWDSVbEkER99DostvOEEb
         vWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
        fh=ZfaiTbGcNNvilXxOp+BJnNCvd+IGJXX5QRgLJUcdwnk=;
        b=E3y0my80wQwvbx+E1InN5CumvcENX38sbUmirK1NWyhLBnCFwcpqp0T/yatUXd91IK
         UJH3XKNdDOdVYPlmcqpML1/3YL1JP37+1QEvty6fosGWnQGe5jAoGoGLug+aAqoysuNI
         OSLlyXv9GGuPNLxpUbsvK7lX828xHwWjxrdfQUgZoV6/mb7rcVVF1y6scbs/4ALyO5wT
         L6jQ5EHzsszCpWiIjcP/Tg5ecGJpmVURWewBzqk1O09hmqJcorjjT3XXbnutXspjmSRu
         SyHMrRB9p5rhNbnBNut0aLWjd18Y/Ed3ldOkO0fy/7v8/pqBJTqqlwfDXXbsZAJMa1zu
         tpXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594816; x=1796199616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
        b=IbCoMHUpnSa8J1fqNptz5m7x77HyJ5beUB6BnqsnnDjixXGv7p0VHlJTVVUAxOp7uj
         b97Lp9P2c47YpAsEu7FAPHwEZbO5FVrG0T2p+wMlw6kgtT1XJnr80EH709iQm4jZ++GC
         25MLNb3I1uhX4/fS9bk0ys2fMZUAmX3a5cTG5/Xn1xbNcf3nxtEqPzj+5oYE0DCtxyGH
         pG1gK8HgYzqju2Cn7LSPYIVZbSquUwSjO9TO9HhnSyWaxumeR89s9x3Trt9iX7bfHAmm
         1D2nPqp6fH0+rnx/WzLx4GxKVKlRKxHPwywcweMxIb/9ekKkvts57kBOntFre7svjif8
         4sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594816; x=1796199616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
        b=if3cUYkxU8AKCExw0ud5oxHy5bpV4mbM8PveE41ADsdRhlBr5U8Qv/zpuaDPkmDhyK
         kor5y3LVLPvinns2PvKLnGhoGNlwHBZ4Dgr0GC/xuLjTtQxxsqRgVawqBXQfEyBZe+e0
         5Nnzc9aXQ6cn0TZfEmA/DkpyL3PXyBzrmhIdJr3JNu/qAPVRnmsFHmtonWM2b9jk7ozr
         x2g98ZqdHaEWOqSVQvRI3KFLYS3lx6V/vR0EyRbxNDK6tpR/TMqJIriPjk5iUFXp684O
         ZdWSr4Q0a8RVol9t/JiwUQlTw8+4C5HNQtm1Fc5vc1bFKv/5XgCrAZL+MpPweS3YEJtB
         xd6g==
X-Forwarded-Encrypted: i=1; AL+hErGR6gSNJw6oyHXmb88F0/3hodFx39IKXS+CL3RAcEOBTvGgcoGDWFEI1ZGNyZFCduf/rDSyNCZ4qFo+nCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xz6QPgGnRJBeJu9OPPOXk8/w85KA6N15gJbxhtRU/ItaL1ZaC
	eRO80WiSDIWqKq6KoeDRVIuu5oVpgFX35ops+ey8+1Q3ikzfhB9rjsZS7a3gVlOCzSsOJgiOuw4
	SCdpEltGUQr2A9xwKZ+vIfvbd14IwJLdlZ/eqZWIrBSXakIy6Xw3G/8LFGW3UNiHi2Yd5LUoeZo
	wqT5eWBQrsCwgHJkrXCbGcY9aUzOi5+Rt6W9Zq1LnAAA==
X-Gm-Gg: AZFdTZelf+LzcLiG95DA+N5w+jpfwWn49lon124n1qJXM4I8mmEh5yAYh+2FgbMN9QY
	3gRKz3JfSpB7djoNhMWEEF0JicFNO9p6GvF41gy257g5/XyP12rHKZkC6sx2l7sdUEm5HEylWHS
	Zz2W72lRQRFlFyVUoKRTsyQMso0CAtVsfZ0koeot9AX39L1DLO3A+7+NHKfOGFdKX2pjJoraRTs
	wcJswVbi9sTG6/70z09myxes3bzLNDXzEjdbB1sImPhjAC0a95X8dxBkq7oP9U32xBjYf9768Y=
X-Received: by 2002:a05:620a:3914:b0:949:673f:72c1 with SMTP id af79cd13be357-949bac9c6e7mr2425266285a.83.1795594816188;
        Wed, 25 Nov 2026 00:20:16 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:949:673f:72c1 with SMTP id
 af79cd13be357-949bac9c6e7mr2425264485a.83.1795594815810; Wed, 25 Nov 2026
 00:20:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com> <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
In-Reply-To: <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:20:04 +0100
X-Gm-Features: Aa3M54pwTvkfIe-W3xNrwvsMb_zCkwbrzBCxL0-Sy9LRsk7i40hR7jCMjKFN7w4
Message-ID: <CAFEp6-1vSybYx6QK2pq13mbuM-eJhto3UxhsttvshmqNN7BXvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX/5Mp7qXO+eUP
 sP7jU5RLXaq/NcDGR60zHLpwIkDVWwlxw6CGM8RYDLlzPKuQuQGByup8wIqd/GfXwCG4/DFE8xU
 kVhNIyNS9jEPJsRUWWQjYgGKuPn9xP3fy3ffEEL7rUw4d3bA6d1YNYeQH6m7G86qDDUC7eebV9w
 jiYDqBprccOH845rmT6GBT9S3GV6bcmdpQIigBte/CYfbXQlsQU0qGvQYeRL2J94B6nyPWZOOJv
 t3fMo1INQKQ2FMhf5bWIMz1QDyLDbn0Wkl9Wgb48LvuK/Hv5IhNhw24QR1u00elInT7QRhW9A03
 tRsHsZCnVuUmGkJa79tPcch60Qg3QClGNa//7uq2OHQ+hyeTbtZ7Tcym5QUq1p9/O9I1Yzgg3v9
 hA3bHjCbCAqvhSZ3i0H7fmU0HJOZr8Z8opKJTa6FHMeZ3YYRd2mLa4BxCoKu+dGsahYx40x7CZw
 xfRrQpJX1cPrDuHocnA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069a41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Seq3w46qzr7p4GGkWVwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HgzIgbU3DC9WKAda2SIH7UhbmqiaA6Q3
X-Proofpoint-ORIG-GUID: HgzIgbU3DC9WKAda2SIH7UhbmqiaA6Q3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX/1Z3gm9CPmLu
 OOHJxzo3E705FzTcH/jsb9LNF/dvklIzHDF1IbC9mXmENE6jzydPqyLZyGTNHk8/YeJFgIQs7u8
 FQTSHE1nPeH16kDWt1j/WY2YYE+JSd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250032

On Tue, Nov 24, 2026 at 6:33=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/11/2026 16:47, Loic Poulain wrote:
> > The buffer address written by vfe_wm_update() has to be made visible to
> > the hardware, and the way to do that depends on the generation, the old=
er
> > ones only expose a register update, some relies on a FIFO, while the ne=
wer
> > ones expose a dedicated address update that triggers the latch on its o=
wn.
> >
> > Both sequences are open-coded at every call site today, with the addres=
s
> > update being additive and always followed by a register update. This
> > leaves no way for a generation to tell that an address update alone is
> > enough, or that no latching is needed at all.
> >
> > Add vfe_buf_addr_latch(), which calls the generation's addr_update() wh=
en
> > it provides one and falls back to reg_update() otherwise.
> >
> > The write master configuration programmed by vfe_wm_start() still needs
> > committing, so vfe_enable_output_v2() now latches each initial buffer
> > address inside the loop and issues a single register update afterwards.
> >
> > Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> This is a bit too wordy for me.
>
> Can you reduce this down to one paragraph. It seems like a
> straightforward functional decomposition to me.

Sure.

>
> ---
> bod
