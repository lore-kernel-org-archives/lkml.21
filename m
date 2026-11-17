Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954007;
	b=z2n4y2FoheHLD92VpWth5fAT1Tzou4DjhHluY1TACPFXop3+40Y3BTmyE+Qe8v8Rw03m
	 qhT+XpdM5U7jo3vp/QLpcDWuyeniP1T6WL0Ap/omcKilDESHnaU6MCfhvNPhtAydKfzPS
	 e7Ss4VtuY83RiFYL9GjjO0p22YCwcg1iZX0tLZmqszH0GZhcbAN7Ep50gbItfzJp0thUg
	 QP2r736uVe4GL3bIlALWkKO7omPJKsLM/zAT4F+N7QGJbRG6913u16dOXXNxcsKRdPpG2
	 lhEDNcCT+PNdhi4Rf8/73qoU7eAnMdNcEySD10LCrfePTnEieBVb7WDrZdOAJf4uDQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
	b=zsWkolRtJXyYf2KXZl+VO+S5fnEX6rqbB41hhiZDZTjLyxihGMbH13DzkWHQLFSBKgDC
	 bFcH3kqWfFLRaggx5ysqVwDrhnSo15GWw4sO1hta6ZtEddmLFH+XJhG3raqgCSQfXZxtF
	 bL/6LVCXpXb2J2xQow0K+HVREj+XRr7XOgREru+Sk/fkVXNWU8zpWuiMpe7zxOkIuELbW
	 ITqPvQpcn8ROWnKC4J8Rgd+5GuiWLl4+gKr/NU1n++HXe9RZw9OSTWEvLFpkyaXO0g0qg
	 zig42jWqMmAt9sVDdZ/b6jj6ZsmWp6poyhICMFT0uZI9r4R1cQ3OZbRvK5rP5ipUJCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDE606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6DDE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM2CNL1184067
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=MrBB22VyQQ3
	4wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=; b=de3QWr9uJo7zpRux5nSBZrQPJI1
	ZuT9RzWRGoDJ4aCQ9SrU4Xxw9lwDJ7b3OmHlR8+w5tIEz3UPpJzxlfS7NWR2ntEF
	Sx5JJxBsNLgjr1SvG/Lb2/HWRTnrHpAqHnl2JEhCnWbe7ecSMNitIJpelIQxT7L/
	5ownN3a8BAw3B6TX+M2l1KOePj+0a7YZornHlcIw3dusVrCnZ3PNUvjXrb1W3Jbq
	9eI4VDUod9rq0HPbutUCHOxnMkEyvDODXmpDon9TP7Jv9fAYKQLTeTydSUIZhpUC
	6/Ldc6GrPMpfUutcKYiSWDp5WJmepsbra64rsMl8Xl+kkyO3/xGEv7ORWJQ==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0wxc16wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a4191ae436so242053f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954004; cv=none;
        d=google.com; s=arc-20260327;
        b=oBcHJ6khBrOaq+C5Yy39wY6EhCVhSRhGFa4M2e/onjQqRrqf1xxMZRwYcLvUIyymsG
         AKlYsp1Dgup/GTvBjUod40jKZiffe6zQ3lojZZg9m9DTU9ULaf6FJqluBrqnSO+sEAAb
         Zz66QhPFgKH5kkyl86WxJD3VZUdoUPwdFKEAMstBxVy7VF9qwMUUYc7Eb7k0kWZiF0vP
         cid4I+gWmNrRxtvQrdgxUIbm/ceWiHuYTd232ANb1OBgtAB0ddrApa8GYSSlOkclrRYa
         NBU4jV78YPtPneijq9TIsOuSzjXhuYdRIuEKykRLWtsgt9K/F3DJ8hTzlfZFJ2Ns0JLp
         LUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        fh=3r0kqwraq096FqfE3V7DabhlE98uEwSRWJ3V75QPmGo=;
        b=JrtpnWd5Qr2ZqFmrSJpukSYBi2+TQThJQ0CEzXghzR5zNQUI5+HUZd4QfjhSRjvXIh
         rq3ipPNBNFhE2XNV+9gy1bZV/kC0NEVBqyiCKgFIgm61TuV7i6APkq91O83W65xk5KMn
         Vt7eq5ZuSiUgPN7MkkG0mYmQy7UwgpqPn1PDIZW7avPYBqiLe/Ta7/5lrjEarmGIJcFr
         PpBdQ1kC43QXUhzDRcxIX0mSkl2SFZitCI0CIBRlaQ8pggTY0wBhv7ArDvSj52+/C4JC
         AYdfNrjIWUs3zgb/qQdggr/LwLy3FpF2QzDPpETCjjJps3nzCVfmS2fM8JrtlCvTCLRc
         e/XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954004; x=1795558804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        b=kQb5qTTuesZyKKgDGYapuGwESoaLgfsiIgbqaoIaEc6+kuEcWyDnOahyiJ/JQCPv2H
         14H7FpdG2pohQlehDAEzeNfDYogUo53BBJpakTwDn/tA9JbZihv6RqhvBAO6hQxUO8iV
         Arm1Uhp323sBj0NhJn6caPcvIdLamLn/oaimgrr7gT5fw0Ttgs6Pak/b7eQyd2m6wfEg
         q6kWmoglY9KbZjsUqxKATJJpZAz2Oxg66LMuZBug4IW1rlLU/onnTRn7gj+vFWOloodg
         t1H6R8YzemfAkAg61t6fz9aMBoD1pE3Ad7cYi0fMkHlKGpjItNnCXvyS3dEcKYh7iV0z
         EM9w==
X-Forwarded-Encrypted: i=1; AL+hErF3erP98J8F0Os1ihW/hPZjtCVshF2KCP7hN+A+g+nIZGh2TGw/KCvq+wRB0irHKmES8nXmFV5rf0yKx9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PZ6rik1bR/1nLAxMLxsahFrG/D3I1xI0v2a1hSwofnAvByeWE
	EFpY7EbTIonETbJMN4YcL694lhpIygGgWEW1XGXuC06WZ09lNGRI1maF+/ns+KyraAJkjefCpyB
	DvIzL8B1JiHi5fxCOR7lAeeTo9m9bjubf2nqViAqs58fuk1Od4VryOeJrGganGzjvBCFafXqN27
	HIdTN3JrerdvuWrN5LawwgYjdv/m8ccyj6dTJsRKI=
X-Gm-Gg: AZFdTZdpf7LaQQ3LPEgkdpY1ABP7yfIqtWBoR+jg6M8+LAS/2GIFXiSHfOAsktD5uGP
	oJifSUP3LMHdpTIEuo3ZoMq49sNonAdn9EOVt75HJJvtBac0dqF8oOUBuEr0JvSkEuS2IMMphjf
	0X72HE86UkyRzuSKqL2QiJGSGhCFSprMLhuvwJmourA/hIG34cuv70/9pBvbhBFf8baTmItuZbA
	wDniyrobCRU7fRvrVftaUOAclYpFYTN0wK2socCRgHSlXAEHzY=
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id ffacd0b85a97d-4a6331c6cdamr2082692f8f.4.1794954004433;
        Tue, 17 Nov 2026 14:20:04 -0800 (PST)
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id
 ffacd0b85a97d-4a6331c6cdamr2082645f8f.4.1794954004046; Tue, 17 Nov 2026
 14:20:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-5-toddfreed@meta.com> <179471269504.2199510.18115986956046547098@kernel.org>
In-Reply-To: <179471269504.2199510.18115986956046547098@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:19:49 -0800
X-Gm-Features: Aa3M54pE3seHebOeBtbI3cDpMgrW25pWhWq5MbBS5In6ZJStfYB2VZ8sEpNY7Bs
Message-ID: <CADh2yMyRSH4ZKZaGxFLVXHTE6v3XF38jh2OykqXRxvP4=0TKgQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=BN0mP1QG c=1 sm=1 tr=0 ts=6afcd315 cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=6yLQ_yHwUL-M3baYCL4A:9 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-ORIG-GUID: PPxCgEPBwpWomayf7swrbuyV3Ser_Rj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfXzslorVz2xSt/
 phrfEFmJKRoT8YAA7Rb9CyM/Et8m7bLPD4Gz1HtVTGNOPjxgUGnFwx/lBlwg5OByXmQh5Icp8vV
 /r3ViopfcqcJOd5JlknG6JKCxddvrEPPTYuMur+Dtc+rlj2k498Gl3fYgZEJGHF+HUWFEZr2Fq9
 F7gy1hK3C2qttbzBSXI10LjZp428Ir2ZqH1xLqnYUyvtET6NFSMH7g3q4wjBLWLjbTjG6Gdq6y5
 GKWR4MUkrAlXAENWZXOrBqhuRa5V8HkaDCA7hKxwiiMOUvUTxzFcUX2cnF1j3RNmBL0yBVmgXwQ
 ZFFMDIVZ+GZYhxNYXjorhSIruQic3aO+0mhHGcw7ePFZmpp+EvVjqoaTvIh0xqS188LwVbZw2sE
 ivZIoCoMOezPV4Ds+nHQ4DjIWzuZPEAkfsO8i/B88ZtoOq21zFj6LPFW9fACrBCpDUSa7I6LKae
 0mQ83ypw4/BPI8GeMWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX3Du95kdD7UDO
 SVwsgHU819AIgnRiwqvHTUictq3CYgerUj3QgcorJULzPcZyF021CDRO5arZGGclfyLB1jQZ739
 0Zx4N/vsprp4A7oFGBL223IiCfq4zUs=
X-Proofpoint-GUID: PPxCgEPBwpWomayf7swrbuyV3Ser_Rj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> > key material enters through netlink and is never reported back. no key
> > is stored for rx associations, and users reference associations by id
> > and never handle keys
>
> [Severity: Medium]
> Is this paragraph accurate? The code in this patch seems to do the
> opposite in two places.
>
> ...
>
> So user space does handle keys, and rx-spi-alloc does report key
> material back.
>
> Could the commit message describe that more precisely? For example:
> "the Rx key is returned once, by rx-spi-alloc, and is never stored or
> reported by assoc-get".

Yes. In v2 it will say the Rx key is returned from rx-spi-alloc, but not
stored. In v2 rx-spi-alloc won't create an association at all.

-Todd
