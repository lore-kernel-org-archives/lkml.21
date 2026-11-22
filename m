Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316692;
	b=X8f+aP//xnM9JSgP4WqA8tkeWy1DxnDX6OX2gz1RZ4xubIAfX42PpvQXeAohS8XAzsbX
	 2/dSfuDSSaNyMjw24jQFJve+tIPN52KkXecl3vZ64YmvME3rCeEgtXJFoo8vPtVuy2hH/
	 ENP4e8QjNkvVxvjHUVjpuWCTCmUs84TZnItwUo3Tc9mTb8HQLZvuZBjYWJ9gpADfD89eN
	 DGV8Zwu+pneYoDAj44o8FXkWpDPrTkFskQfFdXfDZQ/Y0H9wUalrqfzYOsBGt5gETyhPS
	 YYJBxjZMWcgL1HpM+QTjpcWp+PXZnXr9dbxXNBTxr0mV4NGLfjLBcQZthAX3oHDr3WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
	b=wLYegFmoVqm7k4X6iwzodvTIZXPfBAUHi64Gprt2iSiFZaQ7KI9ByfxB8PVihZGVWCRO
	 74A0LhePw4wuxOkTEn2JqYI9FQ/mwx5a1yBWM8mcv/pwFvy3DwiGikDvyRz5r2nL916G/
	 huuPyL8s0TT+Y5voKuAd849PVZ9AlvmxwV0sHwxMR4csYIfE+qvnAY+r+gJSIXcGtnNu3
	 g2Q07pyt2y8whCtgWrYa9YWKTKmLL1XmdOH4jB/UXOtxLJG0Z9Uoz7XWS+KKiZzPCNpDk
	 ZQTiRiwDPdUy2+vxQWxalstJFECckuO4ghA978Z2xkPWDgBwnuGoGtBWjM86KRTUvbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQMapLMR;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD01606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD01606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQMapLMR
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380c28f9e35so3166915eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795316691; x=1795921491; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=lQMapLMRecxhRuMkTSymbForunIxX0OPXsGQ1CXe025r/577yULQNYi3TNrBG53/Qv
         zYU80ixAjK16x1kduXUqa1QZW9W/3ti9d/2xwfANhvwcppx94XY1wfu52uKp1wNIi+xo
         0BbROgPXyu0B62JpFc4+zEJIoiLBcGXeP+W6/munvXDcClY8J5U7eqCSCyRjBp3WeH4+
         q1p1SE27fCRmjWxB4WY3p9l7b9yn5x1FejoLmUjB8Y+BhmVh9oZGKVtoBu6VvuhXecB+
         kqHQVq97TpxJ2ylXI5iv8vW2n/kYW3PMkK+9IBmWOkrDx9AQECQxv8quTTJlItW+6/Cb
         tThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316691; x=1795921491;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=n5ncg2/9stmFF/LXSMAlTw3kgYhXqOiPYMgZlubcg9iZ8ZuaXf12hbmDUYSCT+bD4N
         ipOPa73LK2zAmrDwcAcMeYQwGA9CAu0F+AX/qooJY2yEqap2JZJs0KoQ18NEgNDuMlS3
         cmRskdxxM4c1cF2BH5fzejDZJEsA4EQIex9/+XDWhf+x1Bqh1zmZy52ROMFNxjjsqwKu
         JESdR7MaNM/bYzMue6XYs/sbV1K3VkXiKD9tiTkxKh3ghkMq4nRZMXMIrGFxpWbGbfOJ
         phdre6tawb40c3cyyRAPxt2/uLePaDdEBctdKBNomHBft0V/wNOcuu34BM7TEG0YyzaY
         lThg==
X-Forwarded-Encrypted: i=1; AL+hErFCZ/brOHkc05hegLVwNpU343AxbIKeDx6OwldPBh7vQrw32iW6zWys+vnvbP/mT62hMMRnQoELfc7yzdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/dVrpAVIb7Hml2i1tCLrwK6Hqaj+QfGbGVvmlElxSDXiRjSfB
	w6e6NM4Hzo+mEHaImFpr7X8Uj2vty95QvSYU/3HjDXIr951nQHMiZOYp
X-Gm-Gg: AZFdTZerNfb1QsEq5aNVwl7a83v9Wi4zOMjPvWtDGS8rXJscxiP7wMNs7/pi28FBAIX
	WMQ+M6ntIz8dODVtdbAnN+16wY29yIsbCVv6alSkU8zbWz0UAlD5WajHVtK1ogs/nP6MYRDQF9o
	go0sJvCndXkblKKFhgybGjObhyp4tqf7ZrvpyIWsHv9UWHD3Wysj2HRiYaHu2xrTa2z1QIaVQeI
	juRNnKvZYKJ1Np29vx3uc2vlWesKjlrn+SC3GgciiMkO0o8xaQLKvIws8NCEI0/LLIQQHnv1q7L
	mro9LtlScNNq9URdwMcHhLglI3C4PfRqJp7IjNMelVqyR8ACxlxyi6EbN9vr76HH28dqYEhzecP
	rPUq4dXhwK+clNZAQ3K2l+25xGdP99X+C5mzKzL099BleCJHyyMOx+heU2kUrsfaNNaAVK7PpMv
	EhSMDZXU7eLEsRJxO0OMP/CX8p6diPLr9+Jk+Pz1MCV5KUcwq0+bhCD7pZr2+j392nDHEH51Vov
	l3khDPGhonrN03QfIXWREKWJqgsgZ/ZAZ0rO9vtftzxA/qeZAL6TstKvIslDjsYpRZQkYNWTgCu
	IpBh12YOsoKLno5r4MT8I9/n7DGNvyt95YvcYzbmVo5fazlA
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr8869235eec.8.1795316691531;
        Sat, 21 Nov 2026 19:04:51 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm24302948eec.27.2026.11.21.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:04:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Sun, 22 Nov 2026 08:33:10 +0530
Message-ID: <wlq5k1ox.ritesh.list@gmail.com>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mike Rapoport (Microsoft)" <rppt@kernel.org> writes:

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

No function change observed in this patch (as described in the commit msg).

LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc

