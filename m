Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022695;
	b=S1LxGU4G+qiDU8UM7LIIrRzGES2utKK4+bX5c6T5N6tT4aFGR/9frFLBg2A03/6i8MKC
	 RF7d0O3NxHy0pxHyS+YQjaIYeE8nIas67elGYZfgucqH0EK9I3kl8d6PPSUoZIWUy7ETM
	 ivudXySQL0a6u629l3KgRpKviLVX72lkpmVJKk725eInJLkA2BFpzKphb9co07bxhOLXv
	 uqboIXCZpVyIj8qiH/wH8MFZd0edtgiLtHKj2AW0rG0ZOC+ATOJIRJobuE6u3O+DFpbd0
	 9lKG8BySrR3FF2jK9J07ERYDBeVUcdGgDSqWoHyZ9RLpgWZZsRlW/ycq6grzcmKprQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
	b=PjCFz5Z/AXE02qE0NT4BXfHhIreMjpIohHDzirl4sBfWlS7BIP1AoJTAAg03OsVtnvZS
	 5ZEX6L4WgImU3hewCDUqLrFoK46+LkVmo/PyicgDLys7zeioAM5wBZybxH/JzaCDHQbm3
	 G7MyV7hXit5kfTZ4YRILA9J2ar52vZ85war5X8jQ/TNj+6elJdZRwTHiU3wT/LeTmLLhz
	 cLi9WTrxDyehk30wubRmzNLI2L40Mvx3C/+BaHW2WJHLV8zZJ16mw6dXMRue7y+UTUm4u
	 qg+Pg2vR2hBOqPgDEXUJhtDaorGpn2FQfrsTvhOL305Sc22+59huejnstG7XupJXDvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jJbiSWWt;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E2606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jJbiSWWt
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so1388508a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795022693; x=1795627493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
        b=jJbiSWWt3hjRc3O3pRosjO6aPvDoWH+lfJn2T/ii66GQdei6mpk6vHr5fPyRh7DxwU
         1ubr3/w1gE2fTdfHX7ec1hoIkXgRThjFlaoHZB9IaSYv4EOX/3boMDgMtlqlEa5YU8j3
         MS02dDpeVcL+v09aJ9zFDBRchKc6x/unzzC0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022693; x=1795627493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
        b=z8Oknt5gjdIYCuiVQQa5/yzs+WpUMdikCQBTzB9pc6RW8+cYrgxBhUJgiRKutwBmCF
         9pjvemby2h+2FlVMH8GVSN3/3HzOqNsFS8rIkvOSvpg/crP0RaAErC41Sa0N27GoAWRD
         wWFm18fAficr3kp289XYwFTDLKTUdPdlbXaYSmdvBiLI/BdeXtX4fBD0MVKIvHgRuUNc
         reB3jZyliYMZZ+9sW8Nmnn/GugB+tCFX/8ohyRDi7vsnCtivjPpjSZSg2TPdOf/W54Z7
         FCSC4mLHaT32Mlvz7uBDzz0dzYF6IxBER1Xna3gwAGR8HfcocHTRWWCJgzgPei39uAop
         B+3w==
X-Forwarded-Encrypted: i=1; AL+hErGfiRioJ94Ir1UeZjXzfexRZaJglOOdHg9BmOh6jTg4Y3SbF1AYtuphmBs7kk24e4+4wjAcfwE6s/eZL/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/nKrPIGeY5t8WdfuwlHjMit1OjDI7Hcai0JDeXI3gjP+wG2Nh
	3kuwyXvpo3tayCwgGxFUqqPIvKh9LZsvsZu/F/HF2GLS17SmDMFhTfPTnR6ztJE7CnMGcOmtQ2r
	RS2oYpSM5
X-Gm-Gg: AYBFou15RsS8/GE4Pa02R3QWbCQgi1Ex0BO+XOetN/JfVbZ3kBBOkIjJAOzPMIjZU3n
	pXLXd4H/UC9xmlBzKoKoz88fl9wvdiDWMkhJZ/UgkPJmdIpcvo/8TGj5NBr9glODCIgKZwSsTK6
	5cN8CTJBByRkZHca553+l4UfqFhkt7Oa0hX2PEX9dBGGXxjr8u7APIBo2+xO3/XJEj8fjDr4eTJ
	oVol8c7yadM9Qheslfs9qqzhZJ0Ls5eM4WjmLjl7gTOpd9YID6fBvD4TiftXD1mzyCcz7Xi0xun
	A1YtFLTnjRas9LJNm4/1e9VVKqEG5BzAg1b7CmrjLDU3OeY543dCWyvKOS6NU7G7wHq/EI9GJ+h
	ueRr5UTSFQX14hUv8cl8Kz2K1vjubR/cTPjDB2HQ6c2i/Wov2K4VhKvpiyAwQVXuTlH0oB0vrZz
	/o9iBRGTQPrmYg0RTGjKklrw84JeRDgrjZ7kjdbuDxhppkLVsC9ksxmEcF0bvzJYYMM0UabWxqz
	EHfMf2Nh1uxTbzrry2rXlklUtzVB9X1d+mKkgbDIvIpRfvanT3tHrilISdcv6dk3GBhLrmBc+Gd
	DeWoIM/8ijPuuGTCyLjrGl0Qp8AwzJI8layp3HObethtQ3XEhX3qGjOpGxI0yVBqRXWF
X-Received: by 2002:a05:6402:2115:b0:6b4:1037:2b87 with SMTP id 4fb4d7f45d1cf-6b887ec4d11mr2911385a12.31.1795022692887;
        Wed, 18 Nov 2026 09:24:52 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e08csm1395789a12.6.2026.11.18.09.24.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:24:52 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1150273f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEWXLaDMDE6huU9IhkVPsYaVmotr+i712T86+kq2ZEFG90OL0atOeuE4sIZMwRsQFKE/PlOreYNvK7jkw4=@vger.kernel.org
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id
 ffacd0b85a97d-4a63ab743f8mr5132205f8f.42.1795022690305; Wed, 18 Nov 2026
 09:24:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
In-Reply-To: <20261118095418.51d30ee8@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 09:24:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
X-Gm-Features: Aa3M54qmwNkSUziy75AZiIFWCnPWMk25YyIyR4JL-u3z6SIV6TTagFPK9tSRagE
Message-ID: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Laight <david.laight.linux@gmail.com>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 18, 2026 at 1:54 AM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 16 Nov 2026 12:53:05 -0800
> Douglas Anderson <dianders@chromium.org> wrote:
>
> > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > across the string table (`for (p = strtab; p <= last; p++)`). When
> > building or modifying trees with large string tables (such as DTBs and
> > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > byte dominates serialization time.
>
> Are those symbols just in a linear list with embedded '\0' ?
> That doesn't scale well at all :-)

I'm assuming from your :-) that your "That doesn't scale well at all"
was intended to be wrapped in <sarcasm> tags? :-P


> > Advance `p` between candidate first-byte matches using `memchr()` (with
> > an explicit `slen == 0` check for empty property names and a `tabsize <
> > slen + 1` bounds check before computing `last`), preserving identical
> > suffix-sharing behavior.
>
> Might it be better to scan for the '\0' that terminated/separates the strings?
> Then you do one memcmp() for each string/symbol rather than for each time
> the first character appears in any string.

Two things work against scanning for `'\0'` here:

1. `fdt_find_string_len_()` intentionally supports suffix sharing (e.g.
   `"controller"` matching the tail of `"interrupt-controller\0"`), so
   scanning for `'\0'` can't check `nul + 1` (the start of the next
   string) -- it has to start at `strtab + slen` and test `p = nul -
   slen` before each `'\0'`.

2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
   a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
   `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
   per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
   3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
   scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
   `s[0]`.

> Even with the code below you want to do the !p[slen] check before the memcmp().

Agreed. Since `p <= last` (`strtab + tabsize - (slen + 1)`), `p[slen]`
is always in bounds, and checking `!p[slen]` (i.e. `p[slen] == '\0'`)
before `memcmp(p, s, slen) == 0` cuts the `memcmp()` call count across
that 855-string replay from 187k down to 14.3k (the exact same 14.3k
`memcmp()` calls you'd get from scanning for `'\0'` with a `*p == *s`
pre-check, just with half as many `memchr()` stops).

Timing 200 replays of that 855-string (11,259-byte) Qualcomm
`dt_strings` block with `gcc 15.2 -O2` on x86_64:
* Original (per-byte `memcmp`): 3.45 s
* Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
* Scan for `'\0'`, `*p == *s` then `memcmp`: 0.36 s
* Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
  0.27 s
* Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)

Since you already applied this patch to `main` (`c954f9dd8357`), so
I'll include a 1-line follow-up patch swapping the check order (with
`Suggested-by:` you) in v5.

-Doug
