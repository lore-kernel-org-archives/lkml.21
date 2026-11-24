Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795487665;
	b=vzuOaXfHcDMhebMsuNSqa+y4EjmhZvz83hitVdNbhy9CNBf3/olhsyg/l+7ZCA6wPw2B
	 ZTS6Ec+p15zn6h/CTleCE3J1PE8tbR5UUwKyaYXUIEOEj2LILXqXWG0TnUm9H86+YUot1
	 hDzBOA/vIVpQW/eGcy8+xTILlPI+D1CFLsiVwaCps1kx3/RWa6XKxtRagO3WATJNvDCh+
	 Z8r6mMoj6zSmCFIRob8xE1zoIGn3tSYPoxCbsXDG2ScceK6aCx/9W+yrgpHgrOyTm6WZm
	 /CEvidkN/XzHhXXO+MbJPfMRj0OGIMEVm1junT8wFNrWfmvnRWiJwzZJFgzWygvkV7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=syCWviLhKc8HEd/Doho3DCGH7TWvvwwtNfK52176Cc8=;
	b=p6jOkghO+LnGhNXyZEkjryVD52XiC3ZUklhmOk/YYd9lpsOR8Bc4vNocNCzc2JxLDbeh
	 fW/NHmdYTUfigca8l7cq1gq4eT99kuhWnCQf9PpxozbUFQzH2zuSI0d97GkgOfb9bAWHH
	 m1j3wExJ/9FPEXiNPrBCIyQIpPsqG+r/TP33WjbD3u4Z2cRtrG0JTAqXiNODjB12G8fKH
	 m4044qJEUlymJsUQDxlmPzc67MzXk/cWgVMaUxo3tk4oOJQUHLYkXG8bko6Wjtr09z5DP
	 L9Br7lwrk/gS1Xp5yVOjm/9XtihfX5F2tG5xBfMwZ7SBwYc9BX8ghSm9v1dacNwVGbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FzzBcWWN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC69606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FzzBcWWN
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adfc004920so37304971fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795487663; cv=none;
        d=google.com; s=arc-20260327;
        b=osP79+zu7E+KLT+gjvW7darM5/5dQLvPv9Yubj65yqHnPP4OjF1RTdVhdBkH3isIFy
         lO6VIZgF3oVb4t+3f7PaouzDfIMlkj5CLPBmKCxmupbby4LtZJNajDdEbtAWr578Db+D
         bUZBcJvFMOv0iEn72coN8xN1L/kQeTShnb9QqiSoyh/5mw0WDOXTRgv5AFofwP2VI5rH
         AUIy6n+cA0Z8Dxv8AdzkW6Cx+PA6A0ujyQomZJM24rUZSOA+H5zSVTUUSzZv0gzevd/I
         pn7+2vSChjsK/bQvb7CzcLaodx8la+yJoBjzEeioUj3Tz6cdv3KvDNby/VdCItgTyJYy
         pOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=syCWviLhKc8HEd/Doho3DCGH7TWvvwwtNfK52176Cc8=;
        fh=d5CPhmSrZPUWagB2g35F/W5jCU3G6uKIOFOvxlOH/nc=;
        b=rP4l5Gh+rBNe+bhWw2pWfXCah3OnihpUfuRvSP77w0vqqBn9BQagumQzrZ+m7PNeeJ
         thDgYGXDkGPTuWPXjgX46Y+yR7gpGVGY7TpL98eXOFupg7rOsEfN5q6L9QCmYrfJqCr5
         kKSv3RVdqU03pZbcAyzepOPLQ4zX2a54NfPRDyfLzNTNA9wcpYO9Q0LkuR4+BaLXpSAH
         ooMYwXGn1JfthaEv5sZ6zNBIuiR4Ggdkn5ksDyKE3IABDOm4vrbmErjiIxeoJ8XuI0LG
         bkHPvDagYiuQxUw0q3qluBMzihmFYeFwNKxjMCUBSwCqvjtvegHsWmg2sjJQ7J2T3Z9a
         aFQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487663; x=1796092463; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syCWviLhKc8HEd/Doho3DCGH7TWvvwwtNfK52176Cc8=;
        b=FzzBcWWNW7iCw6bu7hCm/vuKc7jaBSwA/R4Q1Z3tuKeUTWU/uxc389oP5JAr3eAe//
         zwuXy1XCQx+QVzADE3DTnxzvqw6JtuvrtF/pQ2Mrpl0d4DyeWLVK/oznWptb6YCzj9h2
         pj7klLSLe6XI8+Juck7bVmm2DFFQw03GoCfQK0AZHEYnnsXLgNnYk85Vyy0zDOzuKGNO
         YxYro1yWJ0h5PncZbfhDzOwj57gdCNmJIgKwBLKL0fm3OhmQQfRDs7Eal+vt2WwrKgP/
         d6hX2bBK+gC+GgE17VtlRENEec5v2yhQ/KL0AjUFdsXNJrGRtDyzKU7QZbXFVqWhZ/AR
         +7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487663; x=1796092463;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=syCWviLhKc8HEd/Doho3DCGH7TWvvwwtNfK52176Cc8=;
        b=MdLN6E7fhhCuH0DNg66WHAByleZFvCw8nUTuXGnnzIMxuh70MnSD15ukAh7+2DhiNq
         0FMy9cLhKc/XQkRJge/It2xVnmDv4mxaQSmx2aK2+IqmVHQjAj5tTH2vVoTXvB3BOx/1
         nRzSGbztWPmZQ23MMAnC0IcvJJVxXgVYOByl/0LGTx22Dz03VZcv8dtg1vtqp2K1mclB
         0qdEMxVe22CQXfWotDVHG0dGtK2UgTUIl8eatysi2IaB+BF+w/ZwP5763r4VBNHSti7/
         C48BWFB13GndrfcKFbVo9PdRFhX/4y3x5DZ3PKpNNMP+Nt65TTYg4ISG/iSiwwNeYe7K
         1fQw==
X-Forwarded-Encrypted: i=1; AL+hErFFwjNgeDZVPPDZFo7/d+Xbm8GJlPKJ+NZPMgvEMpoltJ3JSvsOLunUE6ZWcbLt23wUcNMd8goodQFEGOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+fbSDWwTRBZZBxKgoiS45Sagqv4VMoTH+1YzufnOuRrNtUS5E
	LuYE00abLRSzbFHUXeH+NRBM/MlGgG43MavC58kDci1GugDXJgvb6NUcRQ55bZygD8qyWF6JlZ5
	YMCfAMvWj22bavx0qUgEPK5aucTwS8VE=
X-Gm-Gg: AZFdTZfkZgTW8PPy5rsIgAS0xdu4Nd5T5MHkKnhGiXrJcVKcRM0rK+XNhBQt4wFQOT+
	wfndI4bCCA/L8uaqDKusHqA5pFTYzRsigXRQ5E6g4CsvzwxjU5KRp8XrME/JGKXz3HzKjkiytpN
	xqf3tixPUPhr9a2QfkYlWSVLJn6wCe1O4YTKIKRxcduXyHscNhZwZpV0sMJy2bM1VwSFvxXCfog
	ET+FiO56tjbFbddd5B+303vnr4tt/3xggYmwn8uSjDQE1AjGnAMy6rtB6Cbd62mSDSYsVZsCjXd
	teNkmVtR9WKgp4WTN6A7EUqiwVE7Ev2U/aPCw6RbD2rqA+TjJ4ZsdHdYC+DmkJDIRjFEPThLlER
	3wc2D0JE/r9C//DOoFtRof+mPl+d1AvnPmBiZ
X-Received: by 2002:a05:651c:54f:b0:3ac:e14b:4233 with SMTP id
 38308e7fff4ca-3ae7fa6909dmr41897861fa.26.1795487662852; Mon, 23 Nov 2026
 18:34:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111015250.1037116-2-oss.patchbox@gmail.com> <SJ1PR11MB6153C84754841451300463D4BF782@SJ1PR11MB6153.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6153C84754841451300463D4BF782@SJ1PR11MB6153.namprd11.prod.outlook.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 23 Nov 2026 21:34:11 -0500
X-Gm-Features: Aa3M54r62-4InDKJw9hPjR5eUSXgR47wB9UUHtprcSyuMey_aZzsLMj4AcUTZFA
Message-ID: <CAGG=RgA4Bt=DEmJRjkK2wq4LEvLxTA=s6G27J1hQOUM5Dgb61w@mail.gmail.com>
Subject: Re: [PATCH v1] virt: acrn: Don't free a VM the hypervisor refused to destroy
To: "Li, Fei1" <fei1.li@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuo Liu <shuo.a.liu@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 08:01:14AM +0000, Li, Fei1 wrote:
> Hi Yuho,
>
> Thanks for fixing this UAF issue!

Thank you for the review and suggestions.

> Besides your current change, I suggest:
>
> 1. In acrn_dev_release(), try calling hcall_pause_vm(vm->vmid) before
>    acrn_vm_destroy(vm) when vm->vmid is valid and not yet marked as
>    destroyed.

That makes sense. If the device model exits without pausing the
VM, the hypervisor refuses to destroy it and the VM ends up leaked.
Pausing it first in acrn_dev_release() would let it be cleaned up properly
in that case.

I'll make the pause best-effort and still attempt to destroy the VM if
it fails.
If the destroy also fails, the VM will be retained as in v1.

> 2. Call try_module_get(THIS_MODULE) in acrn_vm_create() (and roll it
>    back on failure), paired with module_put(THIS_MODULE) when
>    acrn_vm_destroy() succeeds. This keeps the module pinned when a VM
>    cannot be destroyed and remains in memory, preventing rmmod from
>    triggering a kernel crash via active ioeventfd kthreads or irqfd
>    callbacks under CONFIG_ACRN_HSM=m.

Good point. I had missed the module unload case.

Since acrn_vm_create() is called through an ioctl and acrn_fops.owner
is already set to THIS_MODULE, the caller holds a module reference.
Could we instead use __module_get(THIS_MODULE) at the end of
acrn_vm_create(), after successful initialization? That would avoid
having to roll back the module reference on the creation failure paths.

Unless you prefer try_module_get(), I'll go with __module_get() and
incorporate both changes in v2.
