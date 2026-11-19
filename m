Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089071;
	b=AKK652KXhTTfyiGV4iPc6AcHDvhijBTYETAyalvHG3i3+dLY7rEFuhHif/q4YKLDzeB0
	 0FpbUOmItjigdL9L1UCV1Ms8JnCLTseURxGMraFEqdaLTk5xojz7mKlEqMRVRfSfaolZI
	 HWIQy8cN8aJ6D6aw3WNQirkeVoX/xfplVvpD2PqHLVumkjJVFvYj6qeuFbxzFq5x0kaId
	 PjkER9OPv8Jisvtm4eiqymFN6Zip8Uc7pAqlxIRIFhYvz3XwFC2ZQJNI91uOOLzmCn/oR
	 ifch/Xo9J8PtJeLxv6iFbVLgWZcrf72tCS2/pQ19ecHQrf+H5hlLuaGlUmiwR5wNWEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
	b=V0tE40bqiST/fheOqCXWtAVrPAa7JgMC2fP8/jaEOogwXnAdHDPQVijj9fp9NX4XtXKX
	 6/j2ifKWpR27H5gzVat8Hecq4HQyN9QyjcpB5f5GD1fI1Uzz+NMGYHI7rABni2k9dcXZO
	 2Euk2BSbT7EMXUBFAfIDFwOjO3DZn2Uoxg2VCo2NwoovGTinWoCDW9Q1UL2QblA0hMSwm
	 wFcjwjRXyekOL4FlMmNl+Yyt8bxxopIbyQnG21Sd28yzCjRNYZMZbwZEpb/IOOS0sflzf
	 TXWejJFECkP3ERyxcXsETVpWjf62S/0LqB1XBbuPtLvOcUneNHMwMxl2b0t8ryomZ+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sckrKSYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F6606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sckrKSYv
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so132149e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089070; cv=none;
        d=google.com; s=arc-20260327;
        b=RNgDYwlgb4N36ITsls5VVr7ZelzLSzpxvxUpYgRq/JI1tc5hyn38TL4PBzjrVMpDtj
         99RNxuzkIzSVqIPBG33u4333t4+0U7NgN/nN9ocO529XK8tkADkCelMxJaOESu1wkOvV
         9xxONeNxO20DphW7i3Enuz/iWF2MCz22GuS3VKeznV6QVHHetia//KbYQZDWGay3e6t+
         jtDmXf18ndL2GLJ5txX8ZiJqzt1LPTcZMz58CtWKQB9scUd4ZH/RLSG8UyC8eEciBOR+
         z1STRWQixWeF0b7blVbtSRRLBGqUjVcuv94o7Wu5/7aRtfnzN/Cg/Dl6Q9nKAH3vF4w7
         sDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
        fh=GRPYyCPP2jMxB7kQ7oxSo0HT/cPQhkEG8YaLqYk2k98=;
        b=M8ry/kSPEJLh7dfIc/J3ZNFB27+u3KUdbLf56J6I0r8WvLAZTylR/fg+bkujXY1ta8
         Sw11KrlBUGDAQn/Uwx3ukxL+g6WhQ4blZreafsT2riUmg4gpm5QJVUe8Basmc1AHacfj
         d6kgwDrVLw+lAFeEt7HLVhP+IUP6zwlI43RrBXGZ5DZ2TPdYomOPA7qXAnMZ7xl5oLem
         sj38tkcpmh/QCJzw6NcIua+ZdIxkogc989tUHuuEufhreW9cWQEJOgBnhkBz/dE8lyd6
         PfxuOxaaKjrPKN62u1e8FFuxgCAoScRKm933J3h+7EAz0Mm3o9UjLd0vYle2ysGd7irt
         o9/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089070; x=1795693870; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
        b=sckrKSYv/QGVKRRpts1oVCue0TiMwJJYFBB6ebLMxtns9MI6LhhawUDVlf0pfBQ41+
         X2T6N6UhOsXi98Xmoh7zdXbQcdJlbDaOPGxtKvDTBRRCtWBhdfDXyABQr7SHcgWcv2Wf
         3rM6TK+fJC5/vTeowL+P48i6wqQYZLKRH9/B02+ByBZtPT7hed97+JlUoF5XG9mgxg5a
         y8MQza0MEqJrzUEKkHGPGUjmW6EdXEdo8jvu6+QdcBiPPMPsgBNjX2UriSJ/C/yDU+vZ
         7lTlg9n1HgCGCKBGZa6Ck7WCf8sIS9uh8XwRR+Gm4SgnprxHhyIBd+xEq3jJV7fWBA4u
         /kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089070; x=1795693870;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tqo+5ozOFMCg0HBAb6zYmJBCDosTduLpowIhzSAKiSc=;
        b=VJjkLnyCle8OpMyEiGRv4uW8B6VYfr/yg2PRpn7fW59NY7nwsrPUc6RLjXEG4ygBS3
         D8Q9xkibZIwoNtywCyzlNh2Pqx+/ooYJMd3kVjZYe0lGEgQcpkN7dZTxcY392QPJ2bdE
         ZQL5SCN/aDr4B4JMewDgMMqJnc5p/nMmB3aUwewM/LzNTpWEy8GkJ59MgqembS1W/pof
         bd6Kuhdb96kDK1c84plLSP15f0vw8Fqbhvo37HYE08H34lKtFT0FzWAQAuTdHHdNaNgH
         ba/zKV9+0B34X1Yc0PIizJwOV7U+Zpi7Lnfc2CBSyiXNEdIHRiVf4tfZ8cKgUNY7DDFk
         iNTA==
X-Forwarded-Encrypted: i=1; AL+hErHzPxMJHG5iZAJkAIihc2bAG1umv/rH15CFo+spij1T0+n19F2JcQSc1m3elF4dlU404VAmtxcHgfsn/G8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TCncTIsrUKPmPGlX0m3TZYjQKKpSXDcTDCsYVhsWGLRCzb+a0
	c3Dt2XkKhH567xpJ2fnj6V9oCmG2vDZZVIxmwmOLH3ht6cIYqO93FTO87Y89LS2RcR0Ew58AiJD
	KMDU7/CsWRkhNaWnnahuGCcJ6w43LdHs=
X-Gm-Gg: AYBFou2vKcOHhSkPMnJ9IGZhs9Zp8+mXfYVioyK+5tA9ZZy0U5f6LySUy3+ox2g4iLG
	zMGtaT+erIq/27TuogCpbrmoUDj4nCtUxJVsnQhzJT3/3s1BJLrc7sD6w9jmrU2NKgnQ882WAil
	zfZnwCb8hu1SJYGjJRCh0RbTEYIF7Z+RI1fxQMi7pv0mcho0BzsBVtBf5JgQVhDgqaaUY/mPCnm
	h1Irnc1KXmzTFhPvF9fLzDJ6JsgsH3QzI0Q7Vd8MgS5uo+EkykXtd2mS55mpJHsgZc+NiM7s9MA
	XsiJPURxFmr6IzVknu7f0mRwaR+Ak+hXRRwxj3Vo3Jix9uRD+GPSy90IqauxOI6tgApXuW5EQ/4
	dyt58VqZD87ZDqKdxSdRiV6aRltOHnShzHGDfrHfUtKVt9LGsaEKv7qZ0Gvd3+afd697J9n7N3F
	F/CpHE69bdkv6pVXhVCw==
X-Received: by 2002:a05:6512:228b:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1aa0397dcmr2129351e87.3.1795089069422; Thu, 19 Nov 2026
 03:51:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-4-chenyou910331@gmail.com> <avVQdrfqVqRfY5ex@wyuan.org>
In-Reply-To: <avVQdrfqVqRfY5ex@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:50:57 +0800
X-Gm-Features: AclHuK_Q8YqRxZ-ygE4RiYk1Kbl1desnGLkbZZB8OsP3kRuJBXbuWZE2W-HawRA
Message-ID: <CAKspUhLvHoWW9unBOFfFrykdxpBswBraaBJnbxpC9rg7yvTFUQ@mail.gmail.com>
Subject: Re: [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the
 English original
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 01:36:54PM +0800, Weijie Yuan wrote:
> You used <tw_codingstyle> label here, but after rendering, the html
> output is still "Documentation/process/coding-style.rst", which is
> pointing to the zh-tw translation, not the original one. So it is
> inconsistent, right?

You're not misunderstanding, you're right. With :ref:`text <label>`, the
text is displayed as is and only the label decides where the link goes.
Since the label exists, Sphinx has nothing to warn about.

> I suggest that in this series, either use the full path to refer to a
> file directly, or stick to the discouraged writing style and wait until
> once these two series are completed, we can then carry out a thorough
> cleanup. What do you think?

I'll go with the second option for v2: keep the :ref:s and labels, but
display the zh_TW path, e.g.

  :ref:`Documentation/translations/zh_TW/process/coding-style.rst
<tw_codingstyle>`

so the text matches where the link goes. Turning them into plain paths
can then go into the cleanup together with the label work.

To make sure nothing is missed, I checked every :ref: in both series
with a script. Besides the ones displaying an English path, it found
one in embargoed-hardware-issues.rst copied from the English text as
"Documentation/admin-guide/ <securitybugs>", where both the text and the
target are English. The zh_TW security-bugs.rst has no label, so I'll
use its full path there instead.

> Regarding the "ref" of one specific section, I remember that it could be
> referred to using a relative path, and with a label?

A :ref: only takes a label, so a section needs one, like
<tw_interleaved_replies> in 2.Process.rst, which points at a section of
submitting-patches.rst. A relative path works with :doc:, but that
links a whole document, and for that a plain path is simpler since
automarkup turns it into a link.

I'll leave your Reviewed-by off this patch in v2.

Thanks for catching this!

Chen-Yu
