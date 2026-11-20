Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203320;
	b=Zfj9rgLeylV7fV9v5F7QvOx8pOcsgXq0k1BwvVmIzmd0wmZ9wj3i9qy+zEFOgsQnVM1D
	 J4c0M2pjsbNNyg7F9woyOCNDr53Rhse+1XwnW4VXPg6g8OSy0w0cQfoNbdNK5PHiPZJuV
	 cpBJ/Y7paISPqM4OZ/QbDtp0md9rymmsGfAxligcrxI75w0go/B7URid2OvM/0YxNVf/p
	 0Bpef4QNEM/8X1t0Bvw1o+C65cWXcoOF8u3lBIPDNDhqThDb4/CUuMjce3V2RW/qyLcVf
	 d0dKMDxBYS39/izUjBf9bCejUIWjCPwl/zI2k+qJ48WN//GzRcXuZVffuPIyYKnN6HA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
	b=m1/rxMPxr2MXAlSHJr/zlhnUVJeLhOFFZ9qz6InZG90T1A7jZLLXSeYEDSQsJDtf688+
	 uEDVy/ABLR8qd+yVk29m6mglX447QC46hCPn7lXAmaFTsZQhbSalvqBk/FCo+9B1EQ7P+
	 NptPQ6l/o5bQmJ90/p0RzKq5D3BGYwzn5o6FW+bL7pHdvQDaoj1rg3STD1M1dT6n53q3o
	 HmQJJ+R/fBiNEosWq0ahp/xPwYj/pbAbSCt3fBtEEbkpexSB5YV4Rz6edO9d/0eURYxAz
	 tRpY7nny4jEkGbRhgpZGPLXJu+mB9mCuUTNmBLRTD0zFx/LjqMnoqi4KmF73RqdM1Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEayzNdI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14B60A260F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C14B60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mEayzNdI
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e30c26a4so512397466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203317; cv=none;
        d=google.com; s=arc-20260327;
        b=oodvAZOlVuwJh2gf/d3S406TmqM3ayZ27Aimhipth0icG1liaqggztlZniIunQZIrI
         MoL3qMMFfufxgT415VoUaZWXgLtSNT9lJ7X5GZkAFWS8yfZOYUD3awNzag3CjhPO66UQ
         Gmc1vCcA+9T9EU3qCxhf6m5FzPpFQpXmYH+N4im5gr+qwUww6BwFxKo3MlJgedyn7AmD
         IVDXnoEoqIjWUx+X0bhUP6MtXlO8bKo0to/v18MSr4HNJZTBMudU5xf0IpwUyKem6s2j
         X7EoPSchjphu0QnT2ITKNUkrXaWClrcRYC7f/Mti91RIq0bZtJ66BRd5J3qAO7VFO6M9
         Blyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        fh=vwU+TD8hl7TXSdPC7piWrbsDt3TquTlW0ifnVJr9AVs=;
        b=fGDEcZ+nrbnsQDq8aWQtCwzRivPLgfCKFeIpjkgTvnEvIDGWs6uhHXVhK3l317e7Q3
         hw4VyxO2y35JnjVOfOnxicVZ8/GwRAsZHfgmjxBbwmIsW1fHxm1H9ifqMPm5Jbht4VnU
         Nq9hi6UkEsc1MqTHmlJ5VlPQSu5TAHZn/3Z6BluoKZRy58ZwiYgc/L1lzqB9xjWAz5wP
         mb+w0kZ0dHmcqgbN5GiaqTatp7v+U6CnqvU8npBKCJa48w0lqa3qZ3/vnfWXRNAhQfU+
         QTi/dq1qQTP0G5jsMFKBL0lcNxZq7VZfJP04On1nLkoZFv3ivhzU2olLvzNzWLbxWQaf
         iMbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795203317; x=1795808117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=mEayzNdI3RbBXowLZsBRN9QL9E85SiUM+2Zma239sU2Kh5ksSQzTSY0ziLpiHV59CM
         7SYo/SGHf9f/BuaQcw7L2iv8PrZbptbwejj5saAaosdugF+c/B6mu2N2VcFs3P0J30Xs
         iJONriwUSnCKSsvV3YNuTBiMdGh2ko87iKPSXKaspCKEn8Eg4sIKq9PASEMF25S3rqL+
         ikrtvub/lopTx+V9oIV7ULiuNbYeJREQZANEFrs6J/Ra/Ji6BEJHH9f6CAD3wgAgK2ZV
         tPPXZ4d3w3MMsU/kZaH+NVG54K7lHkycb/em4YaaXq8r36ZApv2ERWimswbtCLQ2nAOA
         NkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203317; x=1795808117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVJmHutVQZugQ3dWxOPlJ+2HDsz3aYGVNDsjIuC8ZbE=;
        b=h/xo5pqeC6eR0+dQZDzbhvyvz1UkoD1gnTdAV0Pa7EdiWbqvdJA+JtVqWrNZ2Cz4ny
         58fSLkeTy96pyWPB5CjDnlGSf5Zd/KGCgLiXitu31KiAyW8tPTGrKg9K8sqTgPynqh0O
         kRMfo9xCwZ4iMessL0qXA7ihhTO82uO82MIaQs90ZksvCukswhazli/y6MBr29D/DRQz
         1HETYezRBcC86iFOPRNqe0MlSSdDQc8fommmWnaMXJ/+rwYE+8HsO7PaLlVHR++iS2or
         fbgKT9iifWULA8eVpjmKLSRczMCEh4EVI4GuoMfjStQ5JYvcubyWTZ6WBZXcCafq7n2r
         fSfA==
X-Forwarded-Encrypted: i=1; AL+hErFyT1H1ByESCfqY+lNsBqDj2xkS+8gVON3RJ90XQ0rDu5KAD9Gz1797BdqHjvEF9aOTw41bTC1B1IvCqmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Cey1otRVBCmX2s+GnUDWDn+7djWCUqVbKDNVgoTQvwCfeJQ8z
	f3Qf4EG8IVCvIJGr2mT7SyS9UUU3Fv3qubMPiqJK3W7lElTucIQGAq0QgOqu0ZY/AJgG97k7nkF
	+KxUn9M6UL8daSJMPk1X63OFxQTXknj5LvXXDAAzU
X-Gm-Gg: AZFdTZeQsa3iXbm3wRKM1dcj9P711ZC/8y1A1+A9AmMn0+40+6cFkkTzxyUtf4kNqun
	ao4YdrlTuLKgWJR7CkLi3ZpRXNmHLuf5auqufXaDf3B0NuT/BipwFTpIxyRouJ5LbZ+xY/OWhyK
	nzidRL6pomvJhJvB+HHHcdoUaWhTBnjZO+1T7y4pKjUitsgH2IRQ8Awx4QQh1pfVYAUvwM2fV0U
	ZYd5J7dXsmTRVx6UxkyPUS0GTQ2rDVlDYPlkCAsyBFPM/MKkgQEehm4C4mw7axKil6LLrMdGBqS
	LNLFLVYiP0CxPQQz9/Z2UDq5n3psw+W3ybLhuZTpPkiisOijy9m5g4O8jErsMzxOTcN4KEguTrY
	5kHAM9z+ImDUgbP1oeJZWhbW7izdkp3xnnfqND9rf1P2DgThn6ew/Nqga3TWJMDDjRBlM
X-Received: by 2002:a17:907:60ce:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c51317e322amr590730366b.6.1795203316417; Fri, 20 Nov 2026
 11:35:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-12-wusamuel@google.com> <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
In-Reply-To: <20261120-antitoxisch-flott-sense-8c2a09fc9679@brauner>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 20 Nov 2026 11:35:05 -0800
X-Gm-Features: Aa3M54pZ23SffgU83N8qfNlS7foyPp12zk6Rc2qBKf5ucMmFiR6202xmw20UsI0
Message-ID: <CAG2Kctri9R6b-_OiKcsabdBmLdeWGVY_zmpqqFgDHLKKCDDezA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/9] Documentation: ioctl-number: Add
 PROCFS_IOCTL_MAGIC range 0x10-0x11
To: Christian Brauner <brauner@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:23=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Fri, Nov 13, 2026 at 02:12:46PM -0800, Samuel Wu wrote:
> > +'f'   10-11  linux/fs.h                                               =
 conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>
> Those are PAGEMAP_SCAN (16) and PROCMAP_QUERY (17) which are already
> in the tree. The two ioctls this series adds are 48 and 49, i.e.,
> 'f' 30-31, and they aren't registered here at all. Please add them as
> well.

Patch 1/9 here only backfills the existing PAGEMAP_SCAN (16) and
PROCMAP_QUERY (17) entries. 'f' 30-31 for 48 and 49 are respectively
in patches 3/9 and 4/9, where their functionalities are added.

Patch 1/9 is standalone, so it can be picked up independently (or I
can resend it separately).

Thanks!
Sam
