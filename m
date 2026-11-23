Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440733;
	b=0fQSRVbp0VvTJoe/pcpCwGGeaqBcb/JSdnkUY0jcC9ondjivBYJKik8Zz6mUHajVZjWQ
	 YbssvsZOEcsX9teC9Tc6XcuYcfHi446aykJ7d2ANeEFl6BRNlxxztSE93qyBd2MTkmT1p
	 keLtggkr7pl0p8XAm98zq7aklCweCKT4apeXc5QwJbXOwGbIsUaRYDdPTXAjElZeZNr9h
	 FN+JhEtrMZ2l433Oksr2gj8XvbQYPHKMc3D5NmDFBRq8CE4u81tP934VhyckpPlrxcrVB
	 l21sbkLE4LaEq2dIOKnBf6qAld2ngdc+zCxaf10OL4cvNcQm4AM8IvTteSecs6tNr1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/ptu9eKd6CbNmjxebzPMpiJtVszjbsUASR3ibR5T8kw=;
	b=DDOo752a7krgL+K0Ups7DCGid0WP8pedXHaAyMiknHcxPTrRII9JYRZgKpEnUQUlXUCY
	 Tpep36dMltmptFdEt9b4FrJSsaPZXlkeBpnJpSOxNjTZ4o20kLZP2omUHTnAvJ4/leDK4
	 BrDbCTZv47yUn4vUAogs3DaZB6MZ/hn1o5tUry4BRUV6jwu5jO8ckmbYjW/7QzE6UHkYB
	 4001o1Lfyxd9LTTQz4WydajaSIGA3ZFPoOvmdiC6ZVF8xTzVHYSn8+q64M4uP5nI4c08D
	 KA5exRbaZpvvasOYM7oa6z55LvltN1NA8GTe5HzNrnG1aNpjO84J/ztJ+TRRVr4e6gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b="iFO/EmQO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF94A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=iFO/EmQO
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c515369b627so287178066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440731; cv=none;
        d=google.com; s=arc-20260327;
        b=A9gjvLbbjHPnQRSd9HWV0+uiSnSMERfy5+0nhWEJ+KGTi67zkVWbf6CbAtMyMTYlu8
         Mr9eQRH/o1XcIwplfMXL4VwFAjM598W2cGrNEHMSHAvuI0A/0w5NoTBOJcAP3oGBPYG4
         HlJjLtx/mlAUTovwkIoFmPzLvnjYSXuAJj0DqL+/EWd6nazG9923Bap4P0NQul0Xfhd/
         f8b82DyHP92RbyJ35xbB8W78btRopf3nibYwfqK6bEvlPvxSM6Qj2HZrzx5BE4ECwS3a
         AZpoS+mw1bnQC5x7usaIF7U+f/ByjkpT33CMeE9DkuAr54dgkKBbiLUqVKcQaQ6JyWdh
         86Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ptu9eKd6CbNmjxebzPMpiJtVszjbsUASR3ibR5T8kw=;
        fh=H3SXEnA4+HhA0ckdXEx/8sDB7As5XuhzvgRB5bZh6dI=;
        b=CRcXQ4CUPPl+OscDphyPI3eQpqbfISPBu15WzwfXiR9UXnHQ0KO1iBcj247RYPEbZP
         BT9p/rKCC83CaXdvDaZQtl9T0d0XdfZRfHjcTPVLwDqDnvDMJurmpppbI5sVfGi3ehh5
         yu8ul9kRzg2twK9fuI/btQ3zsokbVdFsiONsvfkNNyPmsYDrx1k35dNFIICDxqbpPfcy
         1dZLG+sQmmWAfmrMNhmJ64hxzn5lWZqxe4cbmATpwOvrlp2QA4CZrMJbTamqAZZndyqM
         9lHjaWQGMuJpdI5PcpeZ99txsczS8N0o/tYZqvqUArHOETgqPEtCpiLl1I9FrC0I1Qk4
         uiDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795440731; x=1796045531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ptu9eKd6CbNmjxebzPMpiJtVszjbsUASR3ibR5T8kw=;
        b=iFO/EmQOcIGaPYtHOkDTqzdZT1Pa5L0tJ96qApHbhpaovnKIi3E47tWLG4E3f44rzW
         xZqou/M4/dTRWtseRME16zqssDwxBpjL0q3Eh1QF20gD+vjeOBb/z1TuGDuST+r+YsvA
         uJSI7uJ/TRRB7ezlmRzJG5X1dnOHM60JSU42QReRmrqDxtT+3JFW7ZdV0Z+dXXGnk08D
         OJRGDQhGleTjuiwhwg+v0uy/bnbfO86nfOr81PLd4hMemK4D7I/snRJa1/XfxMOTCZNJ
         4PexSQPsrMiU/eJWJzofUX4VC6HI0V2pgk317ONElrIqFAc3x1iLthXIAAM5m1NDw4jg
         x+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440731; x=1796045531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ptu9eKd6CbNmjxebzPMpiJtVszjbsUASR3ibR5T8kw=;
        b=uDs1dx4YeMKNnlEsSwR/FeSJYEhherVuWq5RnQmSc0Dr74iK2Pki8JOvBbqrSufSE1
         PU9X/xtG23saXGVACdpQV+25YgGI5A20xHhjVT7Nkl9KAa2qhgTI7Z/A3csny60m/vdV
         3y5VK20G/VrQ6iqdLkdU2PqeyS+j+q6m/3IIUooZIpx8s077I833Tpi7E68bj0Zt4HyW
         0MbVU1MHVBkz9puGjrkbjrRw8t6u06ehrtJptaV7VvXonpHOSMFzDYUSCuDSebm4j0j4
         f17VPxDGdmH/3hNe0wgDRAR8C27/UbqCES43dE1jzr82HqDniIHfRiycSegvnl/Sqteq
         1tWg==
X-Forwarded-Encrypted: i=1; AL+hErH4i9ArbOqGgg36w0S2gJvv8EIaOi8HRNiR9Oxt4NzYLh6U6BPv2xIlO389tD04fax7aI+MvvFoOW2ski4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JY1G1iqoR/5gVqxP7Kev+rUTNNLUuLf2ILfbNpjdceD8b4u5H
	fmAh9T73HN9fwhcIQuEjqlZsCOvCp/KIMxT3B1jupekZge3I0KBCtZ2v3oN+9dNOWZ71wwwRt6W
	JUMogDo0oJS6nlCn/7goJDh70zZzBwTtSCN4W3RW+hg==
X-Gm-Gg: AZFdTZd9a811zAkgVA7CuxCX1oBTD5Pj0avw5z5ujHYV8Ol4efTRf4eSrVrKHTSPoM3
	Nuo9zBkCJ606Haw0e+CWLF6hcmASrRWjIZ+XcTXWiHpfy/lysTbhfkJOuHnbu9SRLkAiDh77uQx
	vRKV2lMAyU1v+MTRAVrV9+RoO2DT3Ebm2Yg9apBejT4MEQyfuKlLWcwIeyqXzhhJCnG1d6YADSC
	Jky+u99A3dDvtlzJd+8FVqFPw+7/UmMpDHLT/RGiEPjR3kR0O0+zVH+5fE2XwlkrJb7BE52uJT/
	kwocrhzUWOKgSs99Hk0xlwe1CkOcSnWsdIKP4X2U8rSE7poKDCnusTvQ8u63sN42fcZxO80eBP7
	C8hZvH0FHzbX3Ed9EJUxCPFdq6KAjWjdoajfx5/6lHlBoBMTwkj8X7R9A7xiLZSuKnA==
X-Received: by 2002:a17:906:694f:b0:c50:ff1c:22be with SMTP id
 a640c23a62f3a-c513aace676mr685329866b.16.1795440731316; Mon, 23 Nov 2026
 05:32:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com>
 <20261116081403.216452-4-max.kellermann@ionos.com> <92bc11db-ef40-48e3-8768-9af36bfb5a7e@linux.alibaba.com>
In-Reply-To: <92bc11db-ef40-48e3-8768-9af36bfb5a7e@linux.alibaba.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 23 Nov 2026 14:31:59 +0100
X-Gm-Features: Aa3M54rFMydpSO212ScIFwe64mMnhlUhUt1F_GHwaP5Pid0tLkWi9Npl8x_Do2s
Message-ID: <CAKPOu+8vso58=3Z8ijpg+91q=BSmJ-M01KyNY=NwUH-9HV_ikA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:00=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> > Fixes: e4dde56cd208 ("mm: multi-gen LRU: per-node lru_gen_folio lists")
>
> I don't think this fixes anything, right?

Right.  It fixes a performance problem that leads to RCU stalls and
soft lockups, but it's not a bug.  I added the "Fixes" tag for the
commit that added the code responsible for the performance problem,
because I thought that might be helpful and appropriate - is it not?

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
