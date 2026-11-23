Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795451315;
	b=BBx2/gFryc5BYokFj09fZwZ2Z53vwbW4/gz1dw+XiKQSFO3l3x+5KEbti6uMEgowh+19
	 0PWOx/TODgLOW7bxIjwsU+WXTTlM3hggzQu+bSM7uyhzYC21+lL8QnA6QB1LWQiuPhwqC
	 VXmzpaJwO2jxZ7pwFf0o4zlTkFUmowZv3Te42OGZE/WsUo/y/EtvB3k+cl6iq8OHyrAlD
	 IZhsrri1gsdxiV1uC5KYqjMnhv2Px0SKHXWbDt37KSJNH754nouyQxJqPsdX2klLD+JiA
	 WyZop+Kxp+0werneZZ7ScfEAzaS3UqnYlRjIZ7Ab8g6jjmOJRQ08EI2cbrg7Gp1ffEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vRsattF1Rz3wlZk1sO3QBcklCFu7YC5VSfU+TN1COtU=;
	b=4UEJn+WFtkoOzTMCm2JXzbnVa7uNJr1DhaAeK5qmYNdugVodjhSNpsWqJXzoKI/DyrtK
	 0m3/7GMffONl7cuJfYI9EARu4yRlfghU3AD2dD8u3u6djlBqs7DgwQJpI0iEPmzRNTlzM
	 CKMLLQTMExaKyvk0iMQ+LkB5kxj2TwVh/ust9yN0EWmbs7Aqjp2D2aHJyP02QQrnSeR29
	 +4Qr86x4m6JlUnqgaEEUsBYoxvj4PDdhi1zGiR/VhT8KOv59z1Ax79GjWpbHBPKo4pbzw
	 BPro/8xr9jRg+xkt0GviUU0Ng2FnvgQnR3nnO2ZRcCMXLtlNWKm0+efze5jUSwzS13A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fd8bnhKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83266606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83266606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fd8bnhKG
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso2427233c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795451314; cv=none;
        d=google.com; s=arc-20260327;
        b=d+tvn7zASdyO6trXvyeVywrtBGRpQCH/bEYKB2O2oop3LfIN1LxzGQgXjE4+8x0uCO
         uvnpvwN84pw8K2WF4nH4qTAEdOjBldW8PULCjO2bMFNapCSsBvJ8SBvx6cn98cqUiY+I
         4FsWSn4DpFsTHYSOecOZVlaaQ6wAZj7dWN0ux3+olBSicK/j+wWGVfkDmQU0/m5kbayz
         yuQTZnbmI/DmgTylw6qYKpPtiPPLodK2wsyAxkvypv/yMUcJ8rifPw0EKdCk1rs4U5Rv
         mRds7XwJRsZHOMVCpiGhkz202BRQkCQLN3/FmChpX2RijOh0B+JhKlbiDg3QyFZ8fA/N
         CdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vRsattF1Rz3wlZk1sO3QBcklCFu7YC5VSfU+TN1COtU=;
        fh=MpPuGIUvwiaGbh5g0QuzTiHEIF1WE0NyyX41F0xi/2Y=;
        b=jx0PDgt6TGgVUPsTlRoR6PnFxQcSoHOC5KIii9Vv2qJBdOyxsAXMnj1rgvIJD3HQdu
         phfr11HHggs1E5CHUtxBNgudXvglzQeRgoAawL0WIHyANJzNJGWZClPhVXRC7UdyzGwz
         O0LCmgRnhT5bLKTggWHbMV7lzvTyB4nmKk5/2wWnqjCRpWZ47UEwu6cnAC2OwzazjOBg
         7k0hPQD7nw4epz0bL00cvvBSJBZ+eoPYoFDCctzxqfiirflraemjFpIF5O1jkwPe47G3
         UsibYF1r65vHMyao0GQ9H7025t0IF6tfDu32oWl7SAUVak/JHnUarQPGMyIe0LRvYvx8
         YtOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795451314; x=1796056114; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRsattF1Rz3wlZk1sO3QBcklCFu7YC5VSfU+TN1COtU=;
        b=fd8bnhKGcvIoNrX+SW45rlMnKW4h/SDa1+LuJvD1JpnZJcLwCSI07aNRG82hkc5VaD
         UhlMtx8KRfiRIAgMeRgL5a8d4582K7N+bnNhfZZp+6dyek5nYJBdrKHTQ1Wfu5uerDDW
         c1uIYIDvwZzk0R1MFv04dsxZLbG9MS566GpXUFrn1LT1Y9jsGHqmSO0EqcjIg06YvzDD
         g/uifB9GJqcjldha011JGK8xsmVHx9sIz5Oc2aey3zapC2SXll/soXZj2IrbTnuJuzjz
         JFGcTWDA1N6kzHnf0F+eT59aYZHq4Nrn/6RCFa1SCIpriMdmwVMPjiXeGFMevcBtRCie
         lTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451314; x=1796056114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vRsattF1Rz3wlZk1sO3QBcklCFu7YC5VSfU+TN1COtU=;
        b=iyrbcF9jl4H2P1uqaqR9HmRU8JaERRwh8USk2tX2s96vRBFghRFNyGPIGne1mjpuRV
         5KyfIBKNb54QKt5C5RBkUoQCrJX4UbpK7OB5UoweMfedCEv4XGcRV/lR09RHwCv6VvNf
         MYSfkzAA+ogxWbDAKtHcBpzTPk6HmfEdFSp0ZCQi2mJtfiHSIfwnc8POIhZSyqcoICwX
         hq9GM3uL3mr428MwLthYp5fGROcqCW7RRJ1VbfpiyB+t8wuDlzTLjp4YGOmjK2YD7hXf
         prdw/2Xofsbc1IIQMcJ9Q4JAlKIYPOMVXQW12yTGsSgczePOvBlUIeCkl6+xjtYRm0cs
         GrEA==
X-Forwarded-Encrypted: i=1; AL+hErHr99CHyTpoEuYLN9xtGgK/tkApHeBSKOVFZC/HjkMwPDUr1JPtINI6LmhDY4sjVzDkBTNJubmlCO2K+p8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fNUnDAslEi5BeSeR7eEJbiCvwfj4s/9YraLzncpJl/VwRKMPH
	3BD5RU5PR3S++h4DOa7iMDJdEr55OfuxCXXOearMb80dXev7P+8zwMET2S6cMR/KwO9w159AQSr
	lsvkkJIW1DKhHIXGNlztnOXld5z9jWs+PWcHnkpHK
X-Gm-Gg: AZFdTZf32xfIqExWYS7yaPWbm+tFEw3Da5WGYD5A4QgkMVBMMez6aCkn+NkjaRi/7GJ
	snHhGhKjMvpKP8clYkkxh4SqpqY+PwcbjS2sSmY/6ers0FToOJJroFPw5ze96itfTZPNXrm0pHn
	QyhVwcJf/E3a+Bw0WiNeGIxMfoZP/LdJf/+gp+boJGQyzZKdN5kPx0QV0f/eA3qRKxutxIed/Kx
	qWHPqbJZEZpY3VaOqlIqvl83u4LitxsMcE+s4Miy3uxhKb/HnrRX+J/vTtFM6XbjfsU+HUolnQN
	sLZ5LOXszyYbFAy8zbNt91d2P9khV9JC2lXWzxxkS7yL1Bymfowlu/nkAC4I+3Ad3uT2V2N0zcH
	CgAwOIj8s42BMD2mYrAdUfOlOrVHv8JvBX/JskikOh5De4R67+CGVbmdQ2+OL3EXdCg==
X-Received: by 2002:a05:701b:450f:10b0:1a7:78a3:bda8 with SMTP id
 a92af1059eb24-1b56f87ae87mr4771793c88.27.1795451313861; Mon, 23 Nov 2026
 08:28:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123104616.226112-1-elver@google.com> <4f7c329e-d722-427e-8279-14c55fce7d71@acm.org>
In-Reply-To: <4f7c329e-d722-427e-8279-14c55fce7d71@acm.org>
From: Marco Elver <elver@google.com>
Date: Mon, 23 Nov 2026 17:27:56 +0100
X-Gm-Features: Aa3M54r7226v11V6STsNIBjJkWPCqk7bRTsVzfqJ-i1JkqSXxWMh_d9IQN7SFjk
Message-ID: <CANpmjNP5DqQwUuO5jKOK=KM9njyBNnY5xHbL--QF=r3ZjfRELA@mail.gmail.com>
Subject: Re: [PATCH v3] coccinelle: locks: Add must_hold.cocci
To: Bart Van Assche <bvanassche@acm.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	linux-kernel@vger.kernel.org, cocci@inria.fr, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 17:26, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 11/23/26 2:45 AM, Marco Elver wrote:
> > Clang's context analysis treats lockdep_assert_held*() as an assumption
> > that the lock is held. A function that asserts instead of being
> > annotated with __must_hold() therefore passes the analysis, but its
> > callers are never checked.
> >
> > Add a script that reports functions which assert on all paths that a
> > lock is held, where the lock can be named in a function attribute, and
> > which are not annotated with __must_hold*(), __releases*(),
> > __cond_releases*(), __context_unsafe() or __no_context_analysis. A lock
> > can be named if all identifiers in the lock expression are parameters or
> > member names, or if it is a global of the form &name or &name.member.
> > Functions that mention the lock before asserting it, e.g. to acquire it,
> > are skipped.
>
> Bart Van Assche <bvanassche@acm.org>

Thanks!
Ack or Reviewed-by?

Aside, do coccinelle scripts go through a specific tree?
Otherwise, I might just take it through the -kcsan tree.
