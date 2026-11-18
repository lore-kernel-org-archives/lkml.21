Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029363;
	b=dk0b48yFDa+J0L2x5WJ7EJ+RtrAoSJ+fHPlLyDPo16uIVh1Tyf6KsScL0cnjP42QzrH1
	 KUEgt9Xv5joUqyRreQCrypGhBdaa5w6u9hnPi+cYgYL3hU9kCRfN3or0iOdA+b/jHpRBc
	 tQeYUKbFkfIhWuWwREzMXM376NWliamZl18y/FR9ktrT1Wo/EU0zyE8YgBgBKtztvdzva
	 plS+dW8gojCaN+jIjmu+ux1p8okv6jJDcQL8N0xEhlIrn67HGZsvs4TCjBIPRCD7Ro6jc
	 aqWpSsmkdIa+03ClyBBa1AbFVtvQrD1TKUOU/N4l86lQRI+8qO45SO/Z1AT6vzIBR+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bStvPDV/J1vGilix5sAk+qt1tT2j9aOVdxdc6N/4kWM=;
	b=BnBWTuPkNj0thNJLKlemw+SH2/o1XFFFazRm0GTnzWN5TQ3XVp1yRm/sK06qoayYEfwR
	 tZV8lPX/5G6cwcTuqsp8gzltyF6XB30jahU3XiL3DIyHb3WKDyx/dvUz/yfSp1XNnB7RA
	 fAFgxH1VScf5BSkJ9BK0m+nj5N2U9mB9IgD0O5p+eDF/53GaAnkofcJhHQOtwOocDEOji
	 ID8hEhtSR/onKi1QedtPDpOCclhwiiwkcJ4qRnLnLw+RXzRtXuqAGZfkObndTaLm4jXSb
	 2wJiNr1Rz4TZEsckTwZCBEUnktXl3ZslIP2q+kVWVOw4p+qaKeqok/cUYUD7HlOkkBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tcbH8uTP;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E1606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2E1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tcbH8uTP
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a357b1c649so884338f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029361; x=1795634161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bStvPDV/J1vGilix5sAk+qt1tT2j9aOVdxdc6N/4kWM=;
        b=tcbH8uTPPIacl2pUnV5ukIA+K9TumGFleoI7xLZ2Xn+ePxR1rMivlDRBkpDn8EW3rB
         htVG+3pm4FG/lFIwYA/E8nk4rTAShbMZTrh/TQBkL4BHT/toPKtTOj2FwSz9FBz7pnK7
         d+/ndS7FNaKLnb893geujjVcHVWtMy7aGdx2QHl/xTppWMSKxOWh9muHq74LzS4GIm1l
         IeTjsNbK++tvogH5AzMHzQfzeQVVSjSQoq/bUm9/g92aL17xyZpfrPzh/XjlXE72UWm9
         /7mVawSfF1Qs8POlwzGq+j63yK6ZP3DfguKnl2ocE0Ozfi+xM+3HRR5ja89G9Urs8RPO
         t8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029361; x=1795634161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bStvPDV/J1vGilix5sAk+qt1tT2j9aOVdxdc6N/4kWM=;
        b=nqkqDMcwMxXnVoaAxDgZE1JEoScMi7jK4C8ksC0PsnineNjKXEAoKw1pCYSHmAQPNz
         6Fn3WVcJ6Is0yFv7RvxjE04w8xGwaDw+Hvk99WEP+ckRbxkx6Kc3Xl4oaLS6Va1dWPtK
         3jQ+/NokjNJZCVok0ACfYJzEPjwatgUDPiXumo0i003MiPlTXGHmiB7//bgrEzYidqRJ
         RvOb3w4g6YQDqGyMVRQvY2NKxBGDfvAJ9UNoZTqYYTrXiy51d+rrNMlMTvnYGri80J2H
         zJZJY54LtJn6milXkBMDpmE9GBu7NFdW2wgYHSCTenWZTcIpdpUYgkN0QJ1S5hNqXO9/
         NbPw==
X-Forwarded-Encrypted: i=1; AL+hErFgck7la+k7qL40zeq25kQPsXv1s80NPcgGidlZ5fljPDjVHlmBumaA+UB4EywqxnSq8+x4HbzrTeRvo2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jG3dxLiAEp3HR0mx6jL5Iv8vWIbnR5ngYDoOSh2L5IuBaMJL1
	XGGUj5wJmhIx6qHeCShd8Fjdy2Sg5+AnxW8Vvazm3hJE9AUO17j18dUf
X-Gm-Gg: AZFdTZdtvhc2Mqilq0W4B/kknW3weKxc1Vp51jJPgAuy2SmsqeDOQYT+lFF8HOgnfvY
	i3/XIieLeMejcqW55I/V48TTLT0j3TT/m2tqMMGvfahz/+GnT6g005eCN3836oOK136Ep9lH+nd
	ZpZVf4XmxYrjuTjk1vYw18tK6rq9cuwCOBedOoOsXuBjnogCVuGc6H0eVeHKdqufEvwQIbLUwcf
	cQTBJoeJoqfkFSxhK2qS/FpO7cQqdE/Dmt8etflIs5KsCfKoxFW0ZlMwQsNy8XtEsS6pIvNk8d6
	iuFURiMIfPAQev13oIym036cYn1PtWEL+pAeTlXKmUjJYykyLjBPQlYSQjP2SQ9UCO7C5Sb5MHO
	iul6pMmQmbFucxEZOFR3enJVnkVWttUgs3BUxqUax1on08jKlNqeiY1h9MN3FF9MLJ3fInKPxDJ
	zzA45NRa7wo4iDGV+E3WZeJorModOpAooxtdiyGjsKI7tSm1ZfgiLUhRISoOK0YCgbiJ0TtQNaf
	jRUXqPEMmnLxZpevHC/ULXtnrQAYYMO5fENTcJg/X4wscyIHsQBVm0hypyBnPHArVe7ReB4lzOB
	qJOfIUuEoKVv3vEtIv4uuXacR4nXr2x9ru1nf7Zu+/b4OOGHazv6jj8vM0iUzRPYbRtby6XMhPk
	tj2CQqeQF1KU=
X-Received: by 2002:a5d:5d12:0:b0:4a7:14d0:9c4c with SMTP id ffacd0b85a97d-4a714d0b8b5mr6051587f8f.6.1795029361023;
        Wed, 18 Nov 2026 11:16:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm6131023f8f.6.2026.11.18.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:16:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:15:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Saravana Kannan <saravanak@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Simon Glass <sjg@chromium.org>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>, Julius Werner
 <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <20261118191559.7a39c37f@pumpkin>
In-Reply-To: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
References: <20261116205320.1621386-1-dianders@chromium.org>
	<20261116205320.1621386-9-dianders@chromium.org>
	<20261118095418.51d30ee8@pumpkin>
	<CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 09:24:38 -0800
Doug Anderson <dianders@chromium.org> wrote:

> Hi David,
> 
> On Wed, Nov 18, 2026 at 1:54 AM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 16 Nov 2026 12:53:05 -0800
> > Douglas Anderson <dianders@chromium.org> wrote:
> >  
> > > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > > across the string table (`for (p = strtab; p <= last; p++)`). When
> > > building or modifying trees with large string tables (such as DTBs and
> > > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > > byte dominates serialization time.  
> >
> > Are those symbols just in a linear list with embedded '\0' ?
> > That doesn't scale well at all :-)  
> 
> I'm assuming from your :-) that your "That doesn't scale well at all"
> was intended to be wrapped in <sarcasm> tags? :-P

Something like that...

> > > Advance `p` between candidate first-byte matches using `memchr()` (with
> > > an explicit `slen == 0` check for empty property names and a `tabsize <
> > > slen + 1` bounds check before computing `last`), preserving identical
> > > suffix-sharing behavior.  
> >
> > Might it be better to scan for the '\0' that terminated/separates the strings?
> > Then you do one memcmp() for each string/symbol rather than for each time
> > the first character appears in any string.  
> 
> Two things work against scanning for `'\0'` here:
> 
> 1. `fdt_find_string_len_()` intentionally supports suffix sharing (e.g.
>    `"controller"` matching the tail of `"interrupt-controller\0"`), so
>    scanning for `'\0'` can't check `nul + 1` (the start of the next
>    string) -- it has to start at `strtab + slen` and test `p = nul -
>    slen` before each `'\0'`.

That isn't a real problem and doesn't make much difference.

> 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
>    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
>    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
>    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
>    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
>    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
>    `s[0]`.

You need to count the number of times that a letter that is the first
character of a string you are going to lookup appears in the entire buffer.
There might only be one 'j' in the entire buffer - but you never look for it.
(But I might still be wrong)

> 
> > Even with the code below you want to do the !p[slen] check before the memcmp().  
> 
> Agreed. Since `p <= last` (`strtab + tabsize - (slen + 1)`), `p[slen]`
> is always in bounds, and checking `!p[slen]` (i.e. `p[slen] == '\0'`)
> before `memcmp(p, s, slen) == 0` cuts the `memcmp()` call count across
> that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> `memcmp()` calls you'd get from scanning for `'\0'` with a `*p == *s`
> pre-check, just with half as many `memchr()` stops).
> 
> Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> * Original (per-byte `memcmp`): 3.45 s
> * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> * Scan for `'\0'`, `*p == *s` then `memcmp`: 0.36 s
> * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
>   0.27 s
> * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
> 
> Since you already applied this patch to `main` (`c954f9dd8357`), so
> I'll include a 1-line follow-up patch swapping the check order (with
> `Suggested-by:` you) in v5.

Have you tried an open coded scans instead of calling memchr() and memcmp()?
With an average of 13 bytes per string (26 for your memchr()) the code loop
might be faster.
But beware, gcc is likely to convert the code back to a call to memcmp()
- it certainly does for strlen and memcpy.

Oh - and if this code runs in kernel the timings will be significantly
different to glibc - it uses some magic avx instructions for strlen()
and memchr() is effectively the same.
The kernel functions are likely to be out of line byte loops.

David


> 
> -Doug

