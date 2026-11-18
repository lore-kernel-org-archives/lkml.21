Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999730;
	b=LYERS3g+0dy1rr3nXMr/91jp1j4EdzoS+kYt8Xg2i8Caulv3yiznDPHSny/Bjdyudgds
	 AqAVfOzUAKHID0x9ZiadlbVQyU8V91hOu5hv+rYsGYzkuzhWyjxL+FiLnMFe3rK3Hyz01
	 aWgZAMRv4YfDY7nze4H9g8ipZIM2ZMEDFfMmZWBasM0+9UQPGGA0mrTy8VSPXA+tWEgqb
	 6ab1gt6PhEfju9fVyHkbWE2goBLjpmYIT8CaLJDxuKa9SZstKhhQL0sORikwq0xesv9sb
	 +NOi35CfMpbh9AEsPq8BMw9/ZdF1d2ml7N6Mg0ApUyvTJUiAysJQZH94wfGWWUPPmYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=lz6wQ0mKUNU0UkbDxsh2f3DKCiv42RamE0uqFpw1ylQ=;
	b=QC5V1CSVD6xeXb+sUjnOxhqn/ka81m3A8JAhsCrYMawx0ixEENXtaoCZMpoj4xalEwUL
	 CdZU8zwcB7XZcE1QPo8gLvESN6JfzzHlnPIkmxfzAlnGIT5Ak6bUNLWsk5AAAQQtRAa6F
	 UB7zHMA59mLlIZd8c+eir3uWf7+qnDOsppwt4XgaQUrW2HJ0p3EM9Xace5M9i0IuL+8Mg
	 ViA7KFfhI8xrQcD9+lViLLLQSMpNPzxLYLr2ZP0RbnuMNXNvxthTnUcid7yxLuNLhe0Fd
	 g8CkzCck/VXufl0n7D5aOlqAYaocUppIYoxDo21Ji+M6pSPi3gBO+338d68cgRkRyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db10RAlg;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62012606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62012606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db10RAlg
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40312e2so2426389eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999729; x=1795604529; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lz6wQ0mKUNU0UkbDxsh2f3DKCiv42RamE0uqFpw1ylQ=;
        b=Db10RAlgUJT1LdsOQzJ7fcLavXBei3dJ4+oWUC6WYljUFTqrPbn06u3uDFculCFNEO
         gMZB9AJ2KVvAMasfN9WEl1BFwjq2HiHXcLYt1iyGAplDPAa2xYQWUaR6CW7fANd3Vx5Y
         cFLWYu/2m9suxe3871zBW5tj2fIsN6dBjy2tg7/wKA2iZI/YXpbOEYaF8u6QioeizaLG
         gAjTiIEpJjXG5ZRrySx4OrL8Y02m33m9gF5w+PSUXXs2aluRFgytyfpsJxqVqvc9bXA4
         bMxeRNlvxxZ+UTvIs1mlUj2STK4+VYyXVzxdYCjkgn6iAZiROy900Dnw3oN5emZR2Wna
         6HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999729; x=1795604529;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz6wQ0mKUNU0UkbDxsh2f3DKCiv42RamE0uqFpw1ylQ=;
        b=xoRxlxy1by0yWCH7EpuhuaHNOgDC+jQye9keF+ZyGHXiE20Ro8dE/B4J40DpbB3U4d
         vUombvv7S24EjZhvk9w+rj9AZmcA6F5euUa5wfIfUfqIIqDR+sv8KQuDHThdZugswGK1
         gHJEAgs2gfTogQjQKyZM7fUmoo/zRwrzV567MqdfV0MEt7KJUuJn3tBgU0RNtaQLWsjM
         xGRp0574wKnpOyf2KPPCUJTXdO0VWrgrh5f67u8ZOQZuKCh0/2lbU8ZadstyFI946EQH
         6Sjh9N3xxQ9mDtwFsVGdSeGXRfCmWnkKvY8eyJfVzqForShaOmFgbk0ndaN7L0kiyUAR
         BBHA==
X-Forwarded-Encrypted: i=1; AL+hErGQvud2QMrcBOkfqrojOjtiF6Xm15wV5IipCKb1C917ynqnVb12au1K8vxfhRtHmfHsZMllTk28z1orgKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BMrHKJYhvrc7sQ+qrOacOAtHXo3TNwMYygKmclHCyleQeq6dP
	mbbphEK/sgAS5ZgM/DwZxd+KEAZ8qKbHySKEs9i6VzkkSq/Fa/N3KYWOggd8Ng==
X-Gm-Gg: AZFdTZc7JHEX/5eM7543tska5nzkU5JwjzX5jzj4sR2PyEjqJKHVdSy3CNfxCZj1ISL
	o+TUzZJmr5Ofpql3Xa2z/rWawLvRyeuqWZCY/KaweYW9CnWBCltNc7I7yF+VTDrwDj+tG/0AoA3
	eCEJBg+Fq/CU24RqbaKrzO2OzIdvQpxqtSiNLS2VQwFuhsnzSEQP8alZEdOyuk6D9LPyh7/qLzM
	hMaw5NwYI27lnu1Lfgas3Usj5HDH/IAer9XW3qdpNJ7Qm8/QkcGhBtCyWSE/lSKtxhnC4ANMDUm
	ILMH+2b6f8JC4EGKh/bdxaXoYtnfhPNCBQ3zEdApE/oi6dGeMY7x4hIWvv9FOPEkX2Dvu7mCTd+
	8I39kBRpANxP+2SlwX6736EEfyRbKDTR0RJ928TRY2cyKB4cqutIxRJLY5K70irrAOuIyxJHMKG
	cHSuTBU+GGmzv7dCSJByut6XlWmebqJXuigS5rPUY6TVpQjBliYp6g0hySsg3Y2Nma+4WeIkY3M
	ozIXFKMWPwTHx+dCys0/VhU1w2eLGPht3d96PStXcXeoOUFJhn0qjnydsLNA53qM6g2ZCelQtBy
	fmvt/VCDeD0yGadVCCmLkp1jRkU=
X-Received: by 2002:a05:693c:62c1:b0:382:1c52:da74 with SMTP id 5a478bee46e88-3828101d214mr2495287eec.25.1794999729242;
        Wed, 18 Nov 2026 03:02:09 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm6984944eec.21.2026.11.18.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:07 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gaurav Yadav <yadavgaurav386@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: BookE: Use vcpu_err() instead of printk() in kvmppc_dump_vcpu()
In-Reply-To: <CANo8Ldu_Y=GduFxxukfbNQT-MOQmR8N0V8evYQPpO2+i1L1hSQ@mail.gmail.com>
Date: Wed, 18 Nov 2026 16:31:23 +0530
Message-ID: <pkw2769o.ritesh.list@gmail.com>
References: <20260807084050.25216-1-yadavgaurav386@gmail.com> <a4na92vc.ritesh.list@gmail.com> <CANo8Ldu_Y=GduFxxukfbNQT-MOQmR8N0V8evYQPpO2+i1L1hSQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Gaurav Yadav <yadavgaurav386@gmail.com> writes:

> Thanks, Ritesh.
>
> Adding the tag and sending a v2 shortly.
>

No need. b4 picks up the RB tag on it's own

-ritesh
