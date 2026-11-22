Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348936;
	b=SvThAZdJAz1SmxsvlslRFdl7RP7dkOWYVakZNksyoCUwA2Uj53ReQOjZy9LUfzmGGvrT
	 1dr79nNRYvetb5rWXD4jXveaTgyNVW9FN2nN4FC+Tb8wzfsaQaq/Rn5z6CYP2VT+JhmcR
	 ReMqHmzSdZNmcp5hqzy35JkNNtlVKeMxaZ2MshF4IEl0SqwqcQxsCRXNwlsQggrdLquxC
	 KVmNDdpyEZWKpsiqcVqjOnUmJB8UNtSmNI26sP5o2uGVDZwpLb2SdMVxkFa3aYIIE/iH1
	 93XyRhRfosKwjjgoM9C+VMRR+WIUFjIZsATG/z6WXujeMSOICu5gJZwGvqj+5ZFkMBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mnbTDI36WLghMGaT+HXY/CzkNS4R4z0S9ISRupt5aH0=;
	b=rM+1RGY1KyDVIzDEJs4V6MgHEHuBEarzzHi4o46z6rDIRAJg7PSfvGwpbo/h7LeNSFfH
	 Z3VWENS509qrwou4WSfjRRcWfcFpvGiwAeEK8WtAWjmIaXRAjcwPlfuzyZnTvtsk0VaDp
	 LcOZpZ5/bLhdE3uCuyynqU4EITqJg71BXU3OOSavTtExkaFDGE0g1iPuirfZD8xyblV4E
	 OTGcRn5MpCXDfYnjoIMCbMMwIkKex7fX49+ov7fQFnnqhZ560EHHYkFOTw2ArQdRowB1G
	 8aV3rQT2+gCbvRR7WW3Kl2cMPyosaRetg+My3mYgOQm7fCUtlljqR51F9YEfp82+Evw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnOpkNxN;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC031606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC031606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnOpkNxN
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so17163215e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795348934; x=1795953734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnbTDI36WLghMGaT+HXY/CzkNS4R4z0S9ISRupt5aH0=;
        b=PnOpkNxNDof9KYKwZQJxnSwAs2aa0+BlbghaZSdAaX0NpKtkUrzeKxKoLdFP6lUcp/
         AHsw2JRqRLMMwekZUZ7SkmZ56tJJ68q+/EsfIRG1Z0wWEp950hffo/Tn9Zqf7yZzqLg5
         rs3LDTyx3yswYxxQx64tAsJthNV8YnqxYhKJfyLmdMpQnI5PVjNXzSyE2u6kR9goWxgg
         oKySfBnD+C/CNB3AMVD6uHwbpdBarmwNKN6kIXIl1zAvQQDrg+zYs/rRI9eKyahHarZX
         ELIbAqumN2v+YTeXsmmmeYOfCH0c3Fa8hoFEwRkVFDmz0BW/6Z+S0wN76KZtwP40JuTL
         dDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348934; x=1795953734;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnbTDI36WLghMGaT+HXY/CzkNS4R4z0S9ISRupt5aH0=;
        b=S+956fRAmst6LgezqFH+uUe+jxsUzeQ0UUnN5oxB+1/qhTOIpnIwHA9QUUKDjB7uGe
         2gnBJLi7SaeoXfHb6I38PAmIweXRJEJjyHLuOCLnpO4qC9SY94ZnqMKiE127pV3Kr/tM
         FPV2uMMkXUzRCfEN9xLL38LdSTmGW2FKdkhIb9Hf/8Esl3/evvkI8EO//ECkUIXH3skP
         Fl6+JgeOyfyUh99LMNI/VXGuIPsCljGnbple99Vf82lBwZbKebhxGbFwfzFc1rqLfvy0
         IZ5jQOC7OrsZw0TSZhXREfB+o5/NOyUkGALxOOvxO/xSGpjI1QT7zA2gYYVZAse/rLBy
         uOxQ==
X-Forwarded-Encrypted: i=1; AL+hErFAFshLTavEG1ZCRnZVL72Bx5sefjoNgS+yhQpUIxyiXZM4VSnhrb580d4AZiabGfaxNK82sD2hINyeYrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qE6loTF5FomYHre+78reb0CNpexCAfhAPCcFOZilsPeM53/mM
	VdludUxiWyRd+qvcQycO3A8eyHt7o0S8WAOCpeX4hMUPgjm8txDnITVu
X-Gm-Gg: AZFdTZeEvbtRMRGAiAkOmkiBa33KPNzFdJ1QnEOQyvi3Y4cShQJPHH3VUrzcHJdQKVF
	C9DbVg3y+scriK2XyNW2fa3hFcgZlgyV9GsQHKJOWjxhNG1j7J2V9RCB/NyRNvxXhbofmESGKnj
	JU+++n2lkWyYg5LumZ/2NR6Q7FdWz1KD+5XAxemMPhI2VWMMwEiN9adBrAJmOYiwaOlMjJ9XNcl
	SMCsDgDGmLccy1P2eoTHkXLYvbRyDCR7SG1KGzDobTLM6TfW1Lo8cUJk5tkma1V1V3slfJD3h1S
	cYeyeJ4fp59+G74pYBPfi2z2Fik3XFDpPbDTrvZul0Woz9MV35QOGakmYz5TemkTnIY4BepSuz1
	oInJUD6KZbPz53s+8TlufdsjUosO0gKWf7DYSwQ0KHww68iwYNefNT6vuo1OHdGonvDVaro1F7L
	jM3djrcnK5OpE+/bS4Ce/ilD1d9fTKCTdsYGjn/1KZW2R8Am/ynxPVyZNK2djjwFWe2/23WaGou
	frR13z5SQt+KzF46GI3dUfnSZI3RIMq/jtknLtS3bMH7Ps6mti6nqYeYH8kf9nrkq0k0tUCJOLu
	lhBY0sBw/Rl8IEczE5WCnBl7KLDs++VWfQi9hh+0XYlM+GOx6iZRlOeTwHgSHxVUUg==
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr176469865e9.31.1795348934167;
        Sun, 22 Nov 2026 04:02:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm120387095e9.3.2026.11.22.04.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:02:13 -0800 (PST)
Date: Sun, 22 Nov 2026 12:02:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Cc: jim.cromie@gmail.com, Arnd Bergmann <arnd@arndb.de>, Jason Baron
 <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Andrew
 Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 0/6] dyndbg,vmlinux.lds.h: fix i386 section alignment in
 BOUNDED_SECTION macros
Message-ID: <20261122120212.0dda7532@pumpkin>
In-Reply-To: <20261121-vmlinux-lds-v1-0-49818f3f5cc0@gmail.com>
References: <20261121-vmlinux-lds-v1-0-49818f3f5cc0@gmail.com>
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

On Sat, 21 Nov 2026 15:49:18 -0700
Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org> wrote:

> This series fixes a latent i386 section-alignment bug, by adding
> explicit alignments into the BOUNDED_SECTION_* linker script macros.
> The misalignment appears once __dyndbg_classes is split in 2, and the
> 1st section has just 1 entry; the 2nd section implicitly gets ALIGN(4).

Would everything work if all these sections got an ALIGN(8)?
It would simplify everything and only cost a few bytes of memory
that no one is really going to notice.

(Apart from BTF which seems to be page aligned.)

David

> 
> 1. Refactor BOUNDED_SECTION_* (and HEADERED_SECTION_*) macros from
>    vmlinux.lds.h into include/asm-generic/bounded_sections.lds.h for
>    reuse.
> 
> 2. Drop the unused HEADERED_SECTION* macros from bounded_sections.lds.h.
> 
> 3. Add explicit ALIGN(8) defaults to BOUNDED_SECTION_* (with _ALIGNED
>    variants for non-8-byte tables like ORC_UNWIND_TABLE,
>    EXCEPTION_TABLE, TRACEDATA, INIT_SETUP, and NOTES), fixing an i386
>    NULL deref in dynamic_debug_init() caused by 28-byte
>    __dyndbg_classes misaligning the following __dyndbg section.
> 
> 4. Remove now-redundant outer `. = ALIGN(8);` directives preceding 
>    BOUNDED_SECTION* uses in vmlinux.lds.h.
> 
> 5. Add include/asm-generic/dyndbg.lds.h with DYNDBG_SECTIONS() for 
>    vmlinux.lds.h and MOD_DYNDBG_SECTIONS() (`0 : ALIGN(8)` + `KEEP`) for
>    scripts/module.lds.S, fixing lost __dyndbg* sections in DRM modules 
>    under CONFIG_DRM_USE_DYNAMIC_DEBUG=y.
> 
> 6. fix checkpatch to skip macro-rules checks on any *.lds.h, in 3
>    places where only vmlinux.lds.h is currently skipped.
> 
> NB: most of this patchset was split out of larger series fixing
> dyndbg-classmaps.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Jim Cromie (6):
>       vmlinux.lds.h: refactor BOUNDED_SECTION_* macros into bounded_sections.lds.h
>       vmlinux.lds.h: drop unused HEADERED_SECTION* macros
>       vmlinux.lds.h: Fix ALIGN(8) omission causing NULL ptr on i386
>       vmlinux.lds.h: remove redundant ALIGN(8) directives
>       dyndbg.lds.S: fix lost dyndbg sections in modules
>       checkpatch.pl: generalize linker script macro exceptions
> 
>  MAINTAINERS                                |  1 +
>  include/asm-generic/bounded_sections.lds.h | 32 ++++++++++++++
>  include/asm-generic/dyndbg.lds.h           | 18 ++++++++
>  include/asm-generic/vmlinux.lds.h          | 68 ++++++------------------------
>  scripts/checkpatch.pl                      |  6 +--
>  scripts/module.lds.S                       |  2 +
>  6 files changed, 69 insertions(+), 58 deletions(-)
> ---
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> change-id: 20261121-vmlinux-lds-b59410146885
> 
> Best regards,

