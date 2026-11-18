Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002759;
	b=djIA8VNYort5ZOyLSwiujxyqzRICc1BrOczE04g2D0ZUsMtSdikAT7DUyLLkvT08/dWm
	 KevfvQZxx/STFbwx/S8Um3ndk0HqGF1olIZxa1YGFulfL3PVYUbd8nR+XIbsF3vdHdOVD
	 SAR/NdxWz4EK1HVVBAQbmPrjZVW8JVlHqMP/y6C4/TF3PhbCXVWApZJ71kVpFV/lxOmea
	 xEZMK4xHZphDgS9SF8OuH3GUGGOfUH+H8/omE/GxUynvBeeF6qEBHxjaiytX1bCs4XlkQ
	 R+mezwalGq668t0N7E4hls+GHoZZ0Vuhdp7pYqmlKrPsHCEmdUsvfqI8N8IQm7e6Vzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
	b=Qp3+4G9gReIdf1DSjX+g0T76iVtpE1tC6QIgGy+/HoFhDN+qIX2XCr9ZTlFSVtNRQp5s
	 1Cwj5Q6ssjE1a4HCxf0IFSZnfvZiGz6PygF4VNPiPV78KLQ3T/Eal8rVjhSS44winHsWx
	 0K++dDr8AqkR7HkER8SvXyJKTYMvVL+wZ57gpB45WXLNMkE8UJL+Z5wEYiNLm0hTw19qf
	 GJya0/MumaoY0Oj00MEG4D0paal//SvWd4Ei+UBrtVVLH9TT5yZcGQSG/ZRhnAXkRSXsI
	 2P1A6Bk9iFrz5quhZ4B5f4s5qzAGYkSAuRGsMv2W9anq0ABWavfspRgSTF6D0Cce8tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="RhVRkjk/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kY38V42X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CB606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51CB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RhVRkjk/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kY38V42X
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBknGV3199793
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=; b=RhVRkjk/yo2LJeGc
	YGPikUMNkstbY0Y6YCCZvIDpUP6Q5NoU2K67MCAUvISTeJ/iSWiuFTfQsaVwV5Sr
	hBBvLr69HirHz7qzgDTOMxL+PQA7POaN6n4ocweh+taAYVH4dRn0LKh2bhOW/fDc
	uQtFW3S9tkzQZQZQ1YUD/0sT+w1ILy9v2hgVUFwNq0V7fdvCUeNQz8ltpYpj9pZV
	LORnE1ujmGGseIxoDeBW1jClWzffPoUaHltuy3JiQADweYYm0AlxveEMxH4ZlZmW
	ROQtx023bszzSMMHJ72c6rQz/niMDCVsojZp9DobXA66So20Noq4UIfvhFOFp+fu
	e8iIEA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9ju8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:52:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1102266a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002757; cv=none;
        d=google.com; s=arc-20260327;
        b=CA6uJZ3U6BF3GI9Vall1ZQ3rGUz1QlxwzR/UsbEOS1N6gLGRcQkGKLZ+pT1gzKj0mO
         XaAaFDQ2GfIQ/vfU0jaZ2PlPUNBLr7tXm1Q86ryeyBoEfpdwimVHgENSBR4nomIqWGCo
         bqX/O2XHbM8QfCnmGzjie/IeCN9hG87NhcXwcNVZehBMp9I/PfTgwmwNTXbPNrNDFW1u
         SKPJ895cD4lBQhFHXvyNRLQYGv6HylzLvTSdJ1fJYkN6zcdHCqsrj1Uk7YlVV6DQmtwx
         yzbR9ABzkP+0D85GzRUm1zUtTyYniHD6F8mQZEPs8tY/t9f+unnytQGkbZXpVtxIyGap
         Hj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        fh=Kg+stg3hRpQr05rw5DHAg0vyTBY5OCuNorVgKw8gGPE=;
        b=elBzHauuNw00iqnG0iK2B07Dhwe2gYcNmtx1pyx63KXFM7J/BB9T90Xxx6bhoasNkJ
         IqWkk34tt8PE1FV2RWFPiQVnNfe+8Hc0bwDlZs1JcLRlpBryKf25+ovJ+vsKJmUed6mB
         kg3qoWcKadM1xNktRvI4s/W5BQKJsXEU5ArQgCqDxJfQnMly+7v6RiYre49fNOBhJCjV
         BbYHlZcFxtGV6++BBht1j1SuemzrDeK6Ygg7n72uFH0FgEfzXFhz0XJW68Y0jLxoFwcP
         lVcoJu50jBPOVWjC8ZHWCH2S+Idbse3p3CwvWCVF8s6C6AclBZ9WfWyydMn4uFMtSM1n
         zHAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795002757; x=1795607557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        b=kY38V42XwzNikW1SF7HjjpYMHD5FfGZXpySf37tXm7tmnOuAy/307Z83U5Laq5ax38
         eiXP9UOqQlqr7OyxoC84eK7C0uxcAR9PvPXN+1N255Smus/AEhgbkImAUreqGBvbe95a
         rM9y78vyIG/AHxEUWXoJAByGl1Q7/1UXUe09aHWovnAtbnymxCN9Ux4O4Tm/VF9B5Ybc
         +pXx4yB2SEqgKxoBteeFRdsAp1lBgVY/TvAjJobPCPnPpJKDHpG7zIbbBP3AwDHsESK9
         2D0TW6oACjSQE/T+dvLuM0cs8uDgJecefp9f7U5kmW5b0dd2NUf89c4MPTfLTRmqK+kp
         E1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002757; x=1795607557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        b=R4+pt6MJkYGVi3OFFGLOqR2L2Hh01EcR21SfwhX+PRMTELt5NfDQZ0/hj17du3kAbZ
         WbUN6uNUjluqu57eeqdtPqNKuNfTIeGmaHX0ML8a4NmRI2EX9wl1y1ZSrhXaOcSRJGWk
         l9h0UHFx3btZOy8NH3z1UP/r1bkRKxF2TKEGMbCQA94ROyXa4QoIp2slxrO6BNMJ+LCe
         /Tz0t8c6ZHkpp089QvhkcY6KrGp977Arovn7WtSvk/dnXrZcfkzd0LzMzWzeBkWdPsQN
         Y21Nqu/34BfQ2ltYIAY+yurPUmO5sVKhQu70E7fDfToz988g5XfAosOsn3/VC7Nhc4wy
         kaHA==
X-Forwarded-Encrypted: i=1; AL+hErE+Du/DtPeldOKQaxiR4LFVsiKcIx0dZLnWSaE4qnhKaK+NyPnnlvuiKuLekA6k6VSE7PqjOxyNJ7w2Mf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VJ9lpf1dSV7pEOzIwutM+XyD4dPT/Af++WCchpR2rlNpXY7Q3
	TiWtMhgpJ2XuX8OLPKas8vLRXBUCgmjxL3el9ozn8eqNFd/1xfeQQJsd1q8L/P0aFKlrhqRNkZZ
	UG4zVGQcNoNf2jafHdp0bSVRD9JbcdGEpkHf48BkLd/lNHNRGNhewGdGUWw5eC2T7MEovGFMZ1u
	Ey+N/7sMTxblTHYLoI5cAMYDzNoeRbQ0lcF1j6STYEVQ==
X-Gm-Gg: AYBFou3cQHboDT17oH7tv3evjle6bj+zwDIW9XBJX3w1VuSw2ZCuA0hUGGwkMIImmzQ
	NqVvB/bxvjhnqI7eXCSbXILV4pMGD8ylmZM/yRKgDpxWrdIMqDwMULyZc9jI9n6Fz22/9YPTaq5
	vb0cxz6Ugd4fsEcomTP7dApBFs6TgOs0r3MGa35VJm6Bz1AjF3+Gu8EO9D9R8=
X-Received: by 2002:a05:6a21:7784:b0:3ed:bdfd:23a8 with SMTP id adf61e73a8af0-3fe8b0fd138mr2284404637.61.1795002757184;
        Wed, 18 Nov 2026 03:52:37 -0800 (PST)
X-Received: by 2002:a05:6a21:7784:b0:3ed:bdfd:23a8 with SMTP id
 adf61e73a8af0-3fe8b0fd138mr2284369637.61.1795002756683; Wed, 18 Nov 2026
 03:52:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com> <20261110042920.2108205-1-leo.liang@sifive.com>
In-Reply-To: <20261110042920.2108205-1-leo.liang@sifive.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:22:25 +0530
X-Gm-Features: AclHuK8gGyKNzxG61XNU0OfhAW45im2YjqVMYzhmxWa7gPFxF1N6yrBDS1NwRIQ
Message-ID: <CAHuiULCcenE-489qnfepHO0dEf4HihzgiHSD-SgYQQd3vVoyhQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd9185 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pFyQfRViAAAA:8 a=Vcmy69C8LHsApJ-CToYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: 8jxKTeZIDEQyJRfcUg2QEFLi5fV6KECe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX6F6O1TVP9A+K
 ZlACgdOs3r+hQa9WUhBPv7X4Ik0EUGkktSygTy0ghQZxFWrCdkBZMsAdx7ET0hOb0vkd0aJJ5DS
 SWUFZpDIkj7KumpeAd1zWmfMPduWoJL20dp5PEd2n3OcBVwhJ+82J2WuoYvjxeFBnFCKpiZUTFk
 Mrc3ED4UZQJVXql0nC7gGSy4JKywAsOrD3/JwBN9lcXNAQZZz2WgfbOWBfHvuCOn5vSwzyA1aYP
 P1Ba+FLyOuBGYkEqMOZELrTSuCMYBbNZGjwlFYa5NonSVxK0n78S80EQy30QqMgDl1NLWPRjU2i
 +VDIugL5rgi+cUw7RBIOuw2UhPLaZezBR1pK4Kffb3I99GbBHZ5LxIVms6E4u3rCA13J1fFhWig
 SeN6g6ZQttZTbZNs2S1pSgw+k7uFDdp9MfpjSZ4eFSXajGS5q9xTOTTA/6WYIM7bAdKOWG5tLKd
 292qbDLC0xmDGyRJYOg==
X-Proofpoint-GUID: 8jxKTeZIDEQyJRfcUg2QEFLi5fV6KECe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfXxzhwn62HrvSj
 zF6W9LbXf43D/Jk5L5XPV7kUEERwmYiTmG6s5ChjzxNp1oZFQKgm5W1ik0m5XJQADGTumt6dMy+
 q8ODQyvaILerYL6YmToXYuSoppjSIjg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180047

Hi Leo,

On Tue, Nov 10, 2026 at 9:59=E2=80=AFAM Leo Yu-Chi Liang <leo.liang@sifive.=
com> wrote:
>
> Hi Mayuresh,
>
> On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> > +     list_for_each_entry(node, &path->comp_list, head) {
> > +             comp =3D node->comp;
> > +             gtdrv =3D to_gtrace_driver(comp->dev.driver);
> > +             if (!gtdrv || !gtdrv->copyto_auxbuf)
> > +                     continue;
> > +
> > +             *bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format)=
;
> > +             ret =3D 0;
> > +             break;
> > +     }
>
> This calls copyto_auxbuf() of the first component in the path that
> implements it, which assumes only sinks implement it. On Eswin/EIC7700
> pre-ratified trace hardware the encoder and funnel each have an embedded
> system memory sink. Whether a component is the sink depends on the
> topology: an encoder connected to a funnel is not the sink, but an
> encoder with no output connection is. In the first case the data would
> be copied from the encoder rather than from the funnel, and under the
> funnel's lock (the same lock mismatch sashiko pointed out).
>
Ok. I will update in v7.
> Only the sink holds the path's trace data, so could this just call the
> sink's callback?ie
>
>         struct gtrace_component *comp =3D gtrace_path_sink(path);
>         ...
>         gtdrv =3D to_gtrace_driver(comp->dev.driver);
>         if (gtdrv && gtdrv->copyto_auxbuf) {
>                 *bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format)=
;
>                 ret =3D 0;
>         }
>
> Thanks,
> Leo
