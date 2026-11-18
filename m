Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045645;
	b=bQBT7HFRUFuSfK80D9xIfxchDfWmoThC53pBye8jhLzV8VRPjOYlPub5LyHTuuU36ntR
	 +K5Td6S2pYQieKntzV5ZT4SXKvwfXC7GF3mA55alMqrFPSq4at84h6IQcDqg5Zw5zc4iP
	 ZgC+2dujhCyPDrj9jMdYzdcBBLvboH3XNvbExFNLMUbFlkYjBmP3UHMIe+bVIAje3ARSn
	 MOgzpwscByMpoSDjevBEFffE/1fbdv+iIypUkBRzsLkXTstu1Czn2icrsNjhVvJxFkwkl
	 hVOQYoiDkt/L0LVaqgS3yWAN7Nxqi52vRHQ/d9fjbuEIWjxKjWg01ydQ00PAtUwNKFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
	b=C25vLqEHKE0hL/Y0O5ZuhKKQo0zQKDuW1H4K0o4+/nAT8vzg6+g0rLYQ86DJb31gmL7p
	 1tWWBI70I/p1bGZDtZEdkEv1S157dEAR0YFCB9il5mh4+n4OrCPJwYfxyKGq7lqN4cTdc
	 NzTWMFLzTeEUxEj/NQneI538ZreQpY64DGSiFj4nrO4KbdEtwBcxvlxLkxaOBZwZWVTIq
	 oJ//95f6ZCfOljql2H70OkeQRbgRqd+8OcNfNqdaAErURsTAnBqfujYstCerg730KaCMY
	 tDr6sYiei/WlonQCopfjW5b9c9rmQN2TINMTbyi39DuCWUzeVhE9v9bCv9puIP0FEEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Osp/y/Pl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC35606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC35606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Osp/y/Pl
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-675617e81f9so1824432d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045643; cv=none;
        d=google.com; s=arc-20260327;
        b=eyWUzPX+RFbzVoICx+riCUGs5TGOj504SEkkPI0DlOKPt5BjU3eWmtJlxEfSy7zLCo
         duyXp8ezdepiScJ/DV9pn0qcRQn4ghpreLHN5xEZ4cA2K+6HRLCH5HhjB5sInSePOdnw
         60yK5GBTMMftHfdfEi6QOHJUX27fH5NzIvkpUYYIcU7xZcldMMSYwqcQuEjm1tkzA66w
         25uzIsu9OyE39A4pZkicTy6McYbUahR2Jt6ORV0dTn7i0AAjkCZ5vsSk/uPTUlkrt7hP
         qbR6jT3yQC9EXlQSG5We8AOWFiUXs+stkRnCqLGXu7tgoCf7axw2PS108nMIcKvfNraD
         duzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
        fh=66z1bwtUAvf5g1jZpWrci/v3rKAXZRMxnGXbyWH9MtQ=;
        b=igxFMc/AwJcg1Z9lU4WEbxX2a4cJMmUg9c2U41FTlDDT3clKRxRZDXcppdFigQw76/
         CS2fHfFMBTOhwXQWhcrVxg2Fef4f/CTyUmkPW40LQj1lzJw5NDoZp6xgxN/QUu33EIHJ
         TqKlEievxq4Oofi33+0qiXLN4s9sqizQSc4Z77/bPQi3glEN8l7fmvIS18ZfItYcSDEc
         e1UXXOzIU5Jt7IsK1t5ho27DDVI4VNGcvV7uZ/0SZvXmXITisufBTb3bNdeUw3rjKPU8
         mIuMdFb51y3819I+6nIOs3EUxfDT5/OKQT4vcxPKxObqm9Cki2Q9Ri8KImrfRt2e+JvP
         e5wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045643; x=1795650443; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
        b=Osp/y/PlxRKWZnFKHzrxrA6RwHFZSLqZVQ2ShzFVerb1ud5cGIyQ+h0gIMK8ZNhNXc
         o/UGGrIG0mxEl7BomBU2UPlQXC34Ym/Oq8kX9wIhNWPRJxfDy/o6xsRMxzmuRXlRqSIe
         I1/It6A2gc6MnAUnHZYT53IVeb14emCUOo4k0+rGPtNTX2IhXGk7QgwOMZu+DKAJUY4u
         dv+WuDr4Q5fScHz6bdBIdYJ3RfdIpy1BgrjSaoAmKxWHkC1OExDTW7hi8epv/baqzYTq
         u8xYd9LSqQ5wkKfgfnwJnPum87cIkt8Ous/92TxYQeZAEDafLA/pUa1cTvwg8qk79Be0
         69tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045643; x=1795650443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
        b=dIrBZjJby8hSEjSU5XdgI4HFh7gyzmSzo47DqDwPm2O55aVbH+CV0CTgFaTsJSsSux
         IMH+6PlX2EuFN+vxys2wf/EJrh6gzabECDISDK23Oz6+XlMOa8EuggDsGApDXWfNH2L/
         gKjoiUOIyS1AaUKTNif37qOIZjBjIW3AlPUG/4ATpJ8wU/oC4bG/VC4EJccaYRhQsI7d
         Q2nIjCRlb65vADQBb4u8kJOAPza4HOaiOevAbsviatpScwg/l+3LpSUBaHtXXscNE9YC
         Uty6Eo0DFMS0Pg0TpZI7H8IxfFqixJVOD5RjihigESUW+jRlF5be3DOVHwdAgrEPZT/M
         8A1A==
X-Forwarded-Encrypted: i=1; AL+hErGBWlnwI58tWw2piMUE4x348tLt1lrwjbDaWcmYotBURS0ixfI5uNOD0oFw0cvfaKza8QniagCJ0BA2h+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+QQGxMXHBNqejrQiSB5So82MCqnPopmJNuiTfisIsOfD+e5+h
	o2Cbc+I0iK+3IR4q/454wL101DMX9xevn5ir/zXMD0vm1cFoDLGZbhLtzBL9/1PpqT4QP+gT6XH
	babuZE2hd4B8cMC8AIc/rOX/E0XnSgSI=
X-Gm-Gg: AZFdTZcaMgVfHxvhkgJNG1Sfx+3CnaHVPI1Np6ezBmL0l0czVwIFgqFvaKW2H7rWEjK
	cvTOSQNDU2hSstK7c+4/iSku0j4NgNdkx9nojTPzdAgVkzFcrRrbdbH5DucRGLw/LtHeCSUQOKk
	t6OkUW9YrJAajX1uZZT5JL1unM6eYlJ0Ybtis25I6rToxVV80GN/SvDKOQsC5fqvBZG+7rNfWAi
	zuFKplaQT0xZNrkqEX0e10o33CpUncdgzv+DoHgBdbrpCRQQ0BTQ80p0rATUeUc4LxC2XwCHvN8
	SEGqivA1tElWuET6wVUKmas/zpGFETVsBC9WH/dEjcFeA22r+AEPpi8HDsS9EWt8i37GaawGABH
	NeoKzOPCA0kfmq5janRFbkr0u2Xt4qZL0EEcNve5c1vDhQs7b7shJoVjDsMNrZC+iIs3kubvkIA
	Pr8d/2aWU/vGll/vnIx5leobRUHm6rXNHuX6V2/N/HGeCSL68IvLC8Mdv31Jwt1OmZ0ztXkjthJ
	nCB5vU=
X-Received: by 2002:a05:690e:43ce:b0:67d:b262:92f8 with SMTP id
 956f58d0204a3-67dd3fdc0c2mr1270228d50.46.1795045643596; Wed, 18 Nov 2026
 15:47:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117222224.1465328-1-arnd@kernel.org>
In-Reply-To: <20261117222224.1465328-1-arnd@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Wed, 18 Nov 2026 15:47:12 -0800
X-Gm-Features: AclHuK_2KS4BekP-0pSMj9w4NCC-36T5SpqBDjBsi3PNo1diUcnpEXUOY_hCT2A
Message-ID: <CAE5sdEgtUDxOqnOHn+Z8PE2xgA7khft_62J5KOH824SiviUNoA@mail.gmail.com>
Subject: Re: [PATCH 0/2] st64bv0 support in iommu-sva
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Navneet Singh <navneetsingh@microsoft.com>, apais@microsoft.com, 
	hargar@linux.microsoft.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Hi Siddharth,
>
> Here is a what I came up with for enabling ACCDATA in arm64 Linux,
> similar to the earlier patch and rebased on current linux-next.
>
> I hope this works for you, please let me know how it goes.
>
>      Arnd
>

Hi Arnd,

Thanks a lot for putting this together and rebasing it on linux-next,
much appreciated!

I'll review and test both patches on our hardware and get back to you
with results/feedback before this week.

Siddharth

> Arnd Bergmann (2):
>   arm64: add HWCAP3_LS64_ACCDATA
>   arm64: dynamically enable st64bv0 for SVA
>
>  Documentation/arch/arm64/elf_hwcaps.rst |  7 ++++
>  arch/arm64/include/asm/cpufeature.h     |  5 +++
>  arch/arm64/include/asm/exception.h      |  1 +
>  arch/arm64/include/asm/mmu_context.h    | 17 ++++++++
>  arch/arm64/include/uapi/asm/hwcap.h     |  1 +
>  arch/arm64/kernel/cpufeature.c          |  1 +
>  arch/arm64/kernel/cpuinfo.c             |  1 +
>  arch/arm64/kernel/entry-common.c        | 11 ++++++
>  arch/arm64/kernel/traps.c               | 52 +++++++++++++++++++++++++
>  arch/arm64/tools/sysreg                 |  5 +++
>  10 files changed, 101 insertions(+)
>
> --
> 2.53.0
>
>
> Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Cc: Fuad Tabba <fuad.tabba@linux.dev>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>,
> Cc: Catalin Marinas <catalin.marinas@arm.com>,
> Cc: Will Deacon <will@kernel.org>,
> Cc: Mark Rutland <mark.rutland@arm.com>,
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
> Cc: Joey Gouly <joey.gouly@arm.com>,
> Cc: Zenghui Yu <yuzenghui@huawei.com>,
> Cc: Steffen Eiden <seiden@linux.ibm.com>,
> Cc: Yicong Yang <yangyicong@hisilicon.com>,
> Cc: Zhou Wang <wangzhou1@hisilicon.com>,
> Cc: Navneet Singh <navneetsingh@microsoft.com>,
> Cc: apais@microsoft.com, rlmenge@gmail.com,
> Cc: hargar@linux.microsoft.com, kvmarm@lists.linux.dev,
> Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
> Cc: linux-kernel@vger.kernel.org,
