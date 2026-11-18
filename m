Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795006574;
	b=obhkIUaVBEjiASRMRMHsJFbqSPZw5KAQnxx697ZCBbZufNfUfMgr5I16QpX2K/tQhvsy
	 HRb2lId+nPswV53EJpB5tEkHqvHvUT85iMoEfO5YRxBTaG5hZoYgGz8MRgbxCQKMjmlFI
	 FHrfGT4XiWBJqJsYBejLgpp0DcFzM+icN/ayJslgn+KNmj6HfnbIJgHkD7gIy5QTAd6J0
	 R4hkSK+OG0B1MCL/5K93+NX/yV2N+QMzpgTbwLwLil4oWgS3F9Jp7trQrhK8wTcSj/vLG
	 4GJll8doFxpJPU7GZOrAbvl/kZUtYlkX3xI9gtwbD9HQmEp8c/KlamfoQ04T/YhKYAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=Tkbpkl4u6/wMIWhAzzn2JPkPbccRRsyKhFFxZHh5drM=;
	b=SFuUeYXzShoPslrka/KGZC2baOEYj3v+PFAhVKWAWJYCUDMyg4BSeEpKodNNY53vfsgn
	 HIWQvxUrb3GLS4Nasy9O7+ncnf+E36rtdXm5gydBXb6JokeqslVQrzibL5oebDiCRgV65
	 u0/BBVR6N/E2xButKsmm0rdnrPc/6bNcn4BnBSAXAiyuCPmmuc1zHReIgq+RB0tJCJsuk
	 ynqhut7oraxcem2fFcf0cy0CcHW0QQ0cjcuUyrGhh8asSWaQ2iQxNof2f3bK4BCwfkdtj
	 bXUt2ELfUBFcJuQCyi9Ai1ji6MRwjA0MGDYCbtFf/CGm6yXf/B47nVr8YqT4/ibgmbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLITcVgX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5D2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLITcVgX
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so1732632a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:56:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795006572; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlA0k8uZb/iaJs209feRL8bePt54xY6NWK8kvZ1dQTtc/H0bo/WOrkTcTJ0YArmtCR
         /EsZWZ/1NL+oTtSkOND5IxfYZ2L/PPg3VyKCUqJZAS5tuhZZ6TPy4uV2kUBFeAc1FlbS
         V26zEuRe1uDnBhsDIRnqX5puYmSFfjcHb0T55zrtN7WJ7xJH73sG2o9/n506IzIh+uiX
         y3c8ZGgzMNZkHIlfNDqRoYb0dCZjjhq2jG4Oo5LdAAhtcYNt9ucWtgTzZ7A5HhLD2TMn
         Wby0FLvnSvYWl1CVyECuzwvgbXWWJj6rH1XhRPTXeGvH02iaLSLIc3noxDSZ36m2rWOw
         8uGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=Tkbpkl4u6/wMIWhAzzn2JPkPbccRRsyKhFFxZHh5drM=;
        fh=GeHXCM6ntiKhNeX23kyJOcyX/toRkDF7oR1HfkF+9gk=;
        b=qIWHgzIxdCUG61JaVoavimXN9IvH+VX4r4qY5mKTr9uSaplgcMie9uMHim+FDiK1D6
         lfKkDU1jXfHczp36VJeXqv4EkevkbG6T0YbXk2XhuIaYpDs5PdSpJ01Q9YIWN0ouZ+uy
         7OFBBsbwjxvrNihNJM3OfcxJWEd+jH8ouLGnRKv118NuYkihpKd10L5JVEEBCbWKQaCY
         yvtio5HX2+B+/KRt78/i0fUT9iJObHJhnJ+Mx9UJsGuQ8mzrHaxQq4/ZkxihaEHEFOVn
         Foq/ItwY9QUsw21SIsMOiP3oSqbexMOtm6TlVcPtlmLHTb7XsfkyHoIolTrCI20N7cJ2
         O02w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795006572; x=1795611372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tkbpkl4u6/wMIWhAzzn2JPkPbccRRsyKhFFxZHh5drM=;
        b=iLITcVgXNuTSh7QCsrIvLzsy++4+kHVt+A5d6Y/KHs6sOq9JbVpenyLhCtzEhe/eT1
         iaybBKENP5yaaoZgCsBFsowWtM4pyumBgYwBdhhX7gEziY9t81hLi4/lj53vdRzkd4p2
         tSlbXcb8tINbOzHEnLxr8jsRmdi6EOQuJGdwR3JBuC4HVEn1nSP0q1+ZZ5FT+lkOaFrv
         YaAiihAWuz+3sMtLLmtWB8NTkXVOjbJpvuaoBjUMGM7OO+8HmKVeJRsgu0CkTa6WyM7y
         tpJpA9CmzBsObORHbKPmDE6qGwMHbiJOoX/Iw/SVLF/1qgoxAeetONBA/i3gpo5sBuJG
         P3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006572; x=1795611372;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tkbpkl4u6/wMIWhAzzn2JPkPbccRRsyKhFFxZHh5drM=;
        b=Vrc2Owp/VtEWRB72eT6UVDCvV3jtKAkTvvoSVsHoAuHjvA3o3dcEWvQJcCC2ZtDgq9
         T8jnckFN0K6Uj8Nc324BjpyFmwI8V2DK5JdU1UjYFTqWbOs5wREr2Pt3pTFge8KFvJD3
         pfgHzFjNM5S8D+RWrDevnjOAoMAd11x2cKJRXBg3sUIPhG8HfpLl6mnnxiOIuaIRJo/G
         4mOjDnFbQCXezEXVDw4HD3kv13b/+XEDXMw+tx6Befj+NVmVB2Zx+9dRK5Izqzcl+jrq
         iff8yIUE6NMLWRTgyRgwftEeM0IFSQrvlfYFWOixs7TQzNZlGGKKu7uN9OmGgHamPm2J
         79AQ==
X-Forwarded-Encrypted: i=1; AL+hErGYMGSqMMha66ScVAMWc6aGEID2Ev0rvYQaoj4PhtcrTpxqqB+nh6MYFwRTqxDkhI3m2DeX6nhxYKVC0F0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CO3y3vwMx4KSzRh2L5feVh7pSz7m+P5gP5vFk28mr85Qa8bIS
	qqxlxkNwIuKXNlAbgN73oxQtPzYG/SijeIs3a5pe7YJT5tpYBWPUXWDLrckLn9PXTABgEIMKesE
	AkDuIHrs/GYP1ttaKK6Ao3tW+9blyraY=
X-Gm-Gg: AYBFou1XCQK1B1mIYMW2wPM57vmk+W28RHzg/3ja5I/P7Oi9fVz1aTaHKIDIl8xI7Lx
	P7IZtCpTblwajhvFEyfKypn/WDB7bNfUwCzgZ4KrjqzzrDHtUPv57cv5qfCjRm2xEApQ3hJfSOY
	EhWDVJ4ehNKnW4fwmDfIrkToRL3rdfA4QyHfSu/4wWTdZtcMlUBUoXD7vUE6mO08xn5MUdkZqUX
	VGS5ZWePYkcQkVhC9qvryhxwmyb5OPggPKPsMbHKsdsZ39qdHDOXOoukRZuO06+1ZtxIjby7kTP
	TGyyUx9oeUg7QpBvTxHkiWr3qUfoA6saNcHjvCOtmSyoI0+kd9yPd9XA/DEy1YpuRX+fIK/6lI8
	b+SfSTI3cVKHGRyDqBzKn+pFGEuJBNFwH41DDbOTWHSR+s0pz3DA/h62qkw8agM4zcl6wFOJpIH
	fe9v/EhKyLxOkGlb8iTx4knmGxqJNerJDn/2RyIwfiRbmrXZw+NHCEYd4UU9IdVMbYYs3XUZYT4
	zQ=
X-Received: by 2002:a05:6402:849:b0:6b8:7d98:4836 with SMTP id
 4fb4d7f45d1cf-6b88810e80amr2170180a12.35.1795006572483; Wed, 18 Nov 2026
 04:56:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Wed, 18 Nov 2026 04:56:00 -0800
X-Gm-Features: AclHuK97WR6FrXWOKPivI1qa_ids-Oq6BCpGZP0pKuL1V6w7FkflKePR-EYa9ms
Message-ID: <CAKSQd8Xi22AXCF0OMRsF43KymVVM3ftg4g2TjBoURPeA0dcxDw@mail.gmail.com>
Subject: Re: Re: [PATCH v8 11/20] KVM: x86: Handle EGPR index and
 REX2-incompatible opcodes
To: Jim Mattson <jmattson@google.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, pbonzini@redhat.com, seanjc@google.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	zhao1.liu@intel.com, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="UTF-8"

> Per Section 3.1.2.1 of the Intel APX specification, all opcodes in row 0x3* of legacy map 1 trigger #UD when prefixed with REX2.

For the sake of completeness...

EVO processors support 0x0F,0x36 and 0x0F,0x3E [1]
and they actually do support the REX2 prefix for them.

--
C.

[1] https://lore.kernel.org/lkml/CAKSQd8WQDfSax83Fyja0Y_aF-jq+7qfOpDo3GU5bz-8wEVUA1A@mail.gmail.com/
