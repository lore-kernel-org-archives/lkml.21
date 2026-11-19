Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073725;
	b=1KHJcwGnzDDmXhbvuOoo6XoppZojW2hBb+yg9KSLYpOyHwZwRKefS3/WNgI553sSNYVe
	 VDLJl/qWG9x8YYE9WJKZZdNYrU6DIF+sNVYyJ73BaB+2lOMx+6/Jv/rurgVMHWv1yPIUR
	 PRJYOlSOmagpg/3XnYm2h21WlKmF/SepEpfjkBOXRtM67Y1k5u9gpve8CBmIaml3gD5AL
	 HziNcjA8TNFJLSdbF25aMu0jgWF6vL9YMfcI/ju4CL7rD/l+Ats1n/ykycZYPG9CNszjT
	 SMBMUhoKqQPqOOmWnvFKCXZsWoasBbDiv2crTHG923QhSgAeScqOpqp89yj5hSK0zVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073725;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
	b=wu6lhRUgsFsuDNUyfAkJOv0zJAUmVERMZ/yBMeum72zLUSjbthDZiTPL2tn+3r7ZDeLU
	 UlbjhuPTUVP+9wQjXiKC9vgQxW9qUVdtrjz82e0HBQyCAj0bR39Ewl/C8DZOR/kmW4Xbh
	 zSCLUy2EmU482cehV6KMo58ilkPM3B9V1dvp26I7dd+1YvEVI1RdYeCJEjNHofF+dLCGS
	 C3TaWiCcr1pagRUAKqAj0xEgV8ii3gZ5zrZJA9uVmH6Da6GBdP2WJEouKzIBi1NeX1EF9
	 AQFPWcQzT4NJvP0DeJZ4+5MHoNWe80fLKVApfPqnng8Y72NoF3yRbUsap1tZGV+Yg4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77198606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77198606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-563a0462094so904686b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073724; x=1795678524;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
        b=T1FaYAv5lBv7J6TkKseCpoFdtF4TQzk59gVYNTPFcXBiQ51YIVCvOQ5ysFNhkLB/dE
         qghkCQYk4czMjnkzkWBnsv5AwU4tGVpVKw/lZX9CbFc3zotPN7ywbQOT0FuAPN9zpOGG
         wokNv/48cN7qHu9eesCyuuX3+hnGkCrBCsozN+G4wePjilm6LLoxxghhbemgzMoD7ES/
         nbvhIWhJ1tYEdbrwheIxgQVnoabJFQrut7CV4NM3Vt8LDmYr4PLC8IXvd8UI2LLTz7hR
         9KsmRe3pbZcUj0EkXQkMrBdSdmTUERl5UTo5ZhZURIeuZN/Lt4fHRHcN25SGAcLqSQuZ
         adiw==
X-Forwarded-Encrypted: i=1; AL+hErFDC478vcGSPdQMzjgQ/s4PZ5RwCglI4jboRD/1Q7ssRU8uDtfNVonITq2TzfVrM01uIpKyzjeHuf29Sck=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GDCx7VBzYY/bZbjXkRJ6xAFx87HYUfh7nEI4BhTeOr+0qWLMD
	YfJms8bgiSONgt/I1vvjUHU4VChi7YQmHHQwBJeIOpizRPceEPCdJnn9s1W5DCIp
X-Gm-Gg: AYBFou3ebFcFxEn23W53R6oT63OD8fM8Wzrj7SI0a7WBnf3jmALNvj/I55Ndb3AGsC2
	qLSqVorZNJa+1aneLJGeRcvJx4l1TmWnfY2iOVvH+Vx2zxOkl2JD1Kh22HOJheJ/2rq4L0zKwDW
	QvVdFWilXC8RrbqLRR1+876mA3dM4m318x40Jv/emdB81T2S2srzDHMbC+EIEqJ/v1lFASpuWvj
	CqvNBOWWVz4WfmZaP0qELA7vSSL61r1QRkA9mtVpm8NRnCMtXo9VfzrjU2y4epfmtZ9n3AUKZ9c
	TPIqsvUXtLqit62okufpFRRcnxQqNia8fGaYvyseKaYqmyx0C2y+cF42TrfIHouwAXUdL2sz+pj
	umA3ys3CmNBmy9F4/+fzjsvihJF8wafTn1OAjksv7B6CcyZPHozYFWstRYB36r586E47XvD3fet
	7oWxQARn9YUm2XpLOhIYO1ouX2s+3eQV4R+Pregg6foSy6YYdoZKmHk7vFBCebdwj9gqCPb9XYX
	4NXtQoADgC4hC7bANRh9DuJL234Egolx5aDw4iQUyfEkF0HAcQk/TzaR9TlHPHu/I7pjkBoul2T
	cjDAQ6KKa/aJgnwKVW/bqW5r9WmiWNHVowoBp9bIlE2hxDfKO0/uhXIJmt6X8NXdisc=
X-Received: by 2002:a05:6808:1520:b0:572:1c6:60fe with SMTP id 5614622812f47-57742719ff9mr5634124b6e.30.1795073724235;
        Wed, 18 Nov 2026 23:35:24 -0800 (PST)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57775461e70sm3628990b6e.0.2026.11.18.23.35.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:35:24 -0800 (PST)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a85c656c58so1298540fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:35:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEA45N1s5nsV3y5ZQohPpKjWYhygCzBHhE+QBLt4hwqQ1d0qm4YaHmyvhsLtdmGXqsVPQxdPYyrR7aHxTo=@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d6ba35b7d8mr1806982137.13.1795073401089; Wed, 18 Nov 2026
 23:30:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:29:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
X-Gm-Features: Aa3M54rf5ygj8ORK3fy8Y6Bg5UcrfzvYekQ-eoJmIgxSYs0ZeBrecHV4-2jERSw
Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 07:17, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
