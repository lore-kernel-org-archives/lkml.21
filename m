Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795017720;
	b=Ud3UumIauYSL1ER8S0YukXAjiB58hxxI+crpnIzYMvNcWQwpfOgOFKX91fwbwyMhvnyb
	 AvYfc0PqcCWvkNANLweWO9rS/u4t5/HkbqJCcmumI2+LuoU7q9/Zd3Kbizf2lgTuUPzDY
	 DJ1pa212j1vW7XOcWcyCW/1j5OxysEYkV2mYRuUGqcSZx9fMR6hjPUcRbFQAmy1UIF+Ex
	 Wb1w2Sbb12Cx2iS/1JaF/G20JmOwuQyjHvSjCpm8CGuzWW9xqCmtVrv+hdeySuYbSVw4s
	 5GKk/Vp4TlFp4lLYuOpb663576y4TsoE86GDFES0AEJ+nON6R6Tl7up+8EV7RRUeTHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qWeur32sDG2NOrrqdHK9VIUZ28NlMpK0IoLZt7fvp/Y=;
	b=lE0CjYBiMYqx8792+Mgo25O4Vw3fVD5bG7KM03lY0SEnqDtcM7WZ0SJjvBFDEOZpG0Wg
	 bW+25pkz5/EcyYdlg/Jwvurt6THNQaaeEA8fwBRr+jyGTAGz2eR3K6KlmWGHgiAhe73b2
	 tUDLbEJ2lHu3FkJaTliQ9IQkaFfhBB+TVCutZuFBgbNXyZNMq6cMzmTRVa9A35DsDJ7NH
	 TlhUb5O96jYdIkaFFaQ8U+ykuh8eKKKOQdc0QXcvLnzCwjrL8De+sabGwz0ggzqAAbcOw
	 bhNr1UFyKP60r8KL+csgHvWFoZBuumJXUL/AQIZ++jHjoxQeWuJ4K3doKk+nb1xV8ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t2HT1IL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F42606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F42606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t2HT1IL
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so10718861fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795017719; cv=none;
        d=google.com; s=arc-20260327;
        b=HtKmtuB1/hOLP6bMeF2jJVXeJajEkoQDEJ4BGJdUZLqqPUH0WKmAoZWD5Gzhto8gb2
         ZVxd7c4u69/hbJuQhGPtt561X0+nI6CY9vmb3f7fDu0aqhYDj9WCXvIRkd3ZR7tRgzfE
         MplFo6e7wCsCJjic+p+CiQ38loHC9+fXiz129nitbhZXF5HrResfYBgX/6XLEL2ogfbR
         5Zw5aWTbXcgjpCCkgAYOaXMbzMxLCwAXs+YQZYRp55Ka+1KF6tBgWKTuU1a6bdzz1yQq
         /c3AK+CZkWaSBElg7BmPlP/fWxWLfPwE0+5GP1fMNY3RjahLEkULyYmUFj2Q2MBlmC/u
         R2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qWeur32sDG2NOrrqdHK9VIUZ28NlMpK0IoLZt7fvp/Y=;
        fh=f0IZoqL1pckYZIzCCxVXMiaNEDM1eCv+Ll0y8OEyIEg=;
        b=Ld/iay/zA7BM/UeG8r0jYMSlOLmBNhE1rqTw4tbOjQNLYRDqI+IKOlJqVJHn2Imrx+
         WC+pdvONzW8+qWHe+a0uxL9Pp2h3CRRRZuuN15S4MjaYO6uFRpCsaRQNjtLg3tgc9uVJ
         e8p2d1KrNphAl1T72Gu4LWb/+WbpGOPBAFzaYNe9MiLQqZab12BBD4YMReuuTdTkwrbk
         2muCcE5159vqHDnQttm6lpaAPglz+m+VmLNumJ274CeUzYoEv3F82Oz7JGxId5xNfVn6
         F6hazt/expxCH5Y2iCkEwnrpwXyqET/rY0HSVZ7SOln1IziivXWOkE1SGsiGfTsslHLD
         k/zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017719; x=1795622519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWeur32sDG2NOrrqdHK9VIUZ28NlMpK0IoLZt7fvp/Y=;
        b=0t2HT1ILVORRjbNJ3cA8tlSHBgrO6VSW9rUhRGFmQyrhQmD2w5QcmUqXRcWVtF+NNM
         4WAAabROuibG6Ig2IK0N4/wlG4YoZqXOXWnHwUsULHOy3aIeZX/P50wacMjucdZsWOlc
         lt2Je6T0VWHeHfJQoBOyUoTp2Qd0RyUvfSfRvfnakGsCp9o6311bfuklZYWRhBBgoTAl
         V24ZFvETltbgQIv+GyMMDhqiwbJw4tR6R8NcbAa9qXBDdoC8eWnetouYFRqBhnBRkXEp
         Njj8KKn2D2wAl0SHEHGQZy32qOx+N11jldJqO77TGGW9tNuUKArl7DAEnErjZ3cYcEHc
         u/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017719; x=1795622519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWeur32sDG2NOrrqdHK9VIUZ28NlMpK0IoLZt7fvp/Y=;
        b=e2Yzo3e3/hHv7K3d18FO3Q5RKaLg5vG6BjWyM9vXvzKMDqmGwl3p2tifxkgalFQWxy
         QNxVYubXhIjx424XJR7kJBp9ZGN+IbAhxgjwgH24BRt7IU4K970lrb8zXqwWLiPaakh0
         F7zgFk2xWhKkaDrHvK/EN4mDsZmPdpz15qkifUu7cpkzoLEQyTVfmo8ULH2VLouIiPGF
         R67NLl2LIZ32m8LS0DDHTDUvWwmlZwpPGGqSz6Img4ag8rxFyKb24lWER7G2wZne44Mz
         ZQRsPbbAIFHdFDusfxqzcOjlSUplWwLK7pp5BkLz851musAiBUlli7wpq8SG80dgq5UI
         8vZg==
X-Forwarded-Encrypted: i=1; AL+hErFWsSt5a6Dr7hn+yXasiP0sAs3FShyp/xepZp7RVv7/N3+r83Mzb2BmFiMuOI5f6Cctp1dfD+4S3CgFzbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvSd3prHk+IIJ0+Y3uCuvRam8SUfK/iag/AHC7SM4PD2qBS3e
	L9lm3CvJDM/9xTyoBCuRdVelPlYB7IdiETUPO8VOzED7GFGYKA1l1L1CfRlwFea/gR7mnI0+5hD
	PgYolEsNzlYQgBoOt8jls0Wy3ThCV1hE=
X-Gm-Gg: AYBFou1QvGk47Yq4+foFgaHc4DjcjQPDb1DQ3X/FZRrkh1wyUkwtFZNJZwzlsZ5lBS9
	cKKDE2D0bLWr9Ba0CMnTvBzDfGhD7GDJpT84csIoq0fO9AgUIOSZuBLC4A4/PbsxSkvnOKC7BwP
	f3FzP6DQxUb078QF44nPxbF1JFJTr+aSuYY5NBZb+aWHSqk+aimCcGx1AApQSlzbkcjBXoo/qlz
	rqj2UVpQ2rlVUR2sKajKG0+Fv1E8kUnLTSfZyt+22wt0pLPj7J2VmZyl00pKexyFLf9PAmEChIz
	brbxt+BtRGe4IDv623dvI/i/GWRKQlD1clU1vhWQ5gm8/l5daBkdgxJt1TwJtcukt7033Hq4Mie
	LdcP3qHRR/9Pr6Fn4QSzYA661nEe/Q8E8NaesLfxj2AmanowP9dNILtVsqejI+/0c05pATKqTOE
	Ih2AQwPDrz/mMZ13YgB4bVDiq9baslxpG6LYDJ9Mo0/k81uZ8=
X-Received: by 2002:a05:651c:50d:b0:3ac:ddf0:f91 with SMTP id
 38308e7fff4ca-3ae670d17a3mr10433301fa.15.1795017718248; Wed, 18 Nov 2026
 08:01:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
 <20261117-ppc32-perf-v2-7-2072e9b90009@gmail.com> <53a68daf-e694-4c88-b99e-fb8a4c17c1a7@linux.ibm.com>
In-Reply-To: <53a68daf-e694-4c88-b99e-fb8a4c17c1a7@linux.ibm.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 11:01:46 -0500
X-Gm-Features: AclHuK_8SbeIetAuAxVk5cUH8H6DpVcwuDu7-4JcvC6SDnui_bzwIAqMlYKvZ6M
Message-ID: <CAEdQ38HmRZUwkh2TKSW8_Vg_O8yW8JdcEbj2j-EJtq2_u4zprQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] powerpc/perf: Use SIAR for sample addresses on 32-bit
To: Tanushree Shah <tshah@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review!

On Wed, Nov 18, 2026 at 8:20=E2=80=AFAM Tanushree Shah <tshah@linux.ibm.com=
> wrote:
> Thanks, v2 looks right. One concern: the rule infers user vs kernel
> from SIAR's address, but a real-mode address (translation off) is also
> low, so it can look like a user address. The 0xc00 samples in the
> results come out right only because the regs are kernel there. If a
> real-mode SIAR ever pairs with user regs, the rule would trust a bogus
> address.

It does pair with user regs. On the hash MMU CPUs, a DSI or ISI for a
page whose PTE is present but not in the hash table goes to
hash_page_dsi/hash_page_isi, which call hash_page() with translation
still off and return to user space from fast_hash_page_return. EE is
clear the whole way, so if a counter overflows in there, the exception
is taken at the first user instruction with SIAR holding the real
address of the hash code.

I reproduced it on the 7448 with a loop that mprotect()s 2048 pages
read-only and back, which flushes their hash PTEs, then reads one word
from each page. With -c 10007, 1674 of 2659 user samples landed on the
real addresses of DataAccess, hash_page_dsi, hash_page, create_hpte and
fast_hash_page_return. My syscall test couldn't have caught this, since
it counted those as user addresses in user mode.

> This rule avoids it and still fixes the interrupts-off case:
> regs->result =3D siar && !user_mode(regs) && is_kernel_addr(siar);
> User samples then use regs->nip, which loses little (SIAR was only ~4
> instructions closer in your table).

Agreed. With that, the same test has no user samples at kernel
addresses, and 99.9% of the kernel samples still get their address
from SIAR. I'll use it in v3 with your Suggested-by.

Thanks,
Matt
