Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589102;
	b=yAxpPTyYJ+ezdbnYCwulGAtPGQl0YFBpTg8qM/vS7X90DJY7xzmGG9tGJCM6sEftSqD1
	 vZwveXS+V5SOUqgd57V6O97i5yCJyVztslRC+uN9J6BDMpWM866pKowFyahgKXmqwDJ0H
	 lFjxu9Elx1vyWajIHbp4MLK+3PCiXhGhGpp+t2LVumxKV38SlNb/lVMfWoDZEn0defOwW
	 HgNXS7Y0CamHptoSvyVnSzd1+eoDITp9coPkiz7MOSh5OaYCXvmXebf0rFY3SfP2K4gc1
	 2acm0AgTUWfYKkYl6T3O9jV7Nz61foot26TojmKTQBD0LiL4TQj9nLtT91WYpxeGPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=R3sbzhOnYUrS8wYvSIhWCG5ex9jxl9wVxRyhTnmBIp8=;
	b=mqFOP9GPCJmaoeW2SoMmppABNea7t+zVcZCQO7DTfREXn2b2fUIL3bLiqwXardmen81a
	 rAZpG2hTsdp9Xd3lQ19Ei7fDZqMYs5gwVIUiWNJKARq2DDvVUGUHK8m8U8XrMqZBF9Svf
	 kDoQHHniS+S5Ao6EQl2NtX8zprUg0B5ChJQBHlT3Irb/wy1E72VSdwLP8yQ4vHO6AclbH
	 VS6OlC+Z3mFgYPi75MOS+lqBFN1TwbTl/kGcMPiYQFzvjWbGoSvu+oaoZmEHy9vnf8Kr1
	 WK1Pug+4BsuRii0W3zZ+OJDfibnNWAMUslkbdbNx/FCehl0H8jwh0BrvFwYkgnfzoxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5dyiyT1;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC4B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5dyiyT1
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b439e37813so2630094a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795589101; x=1796193901; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R3sbzhOnYUrS8wYvSIhWCG5ex9jxl9wVxRyhTnmBIp8=;
        b=d5dyiyT19Km7tDmbpxJjL4rEnANFAC86v3EYHetyWOXfRhF8nqTd1zj3BIgDx3qhR3
         Otfrb/bMHdn/BzzA2hn4O8iQ8rCUMUo5W4QakiPooXQ5Q3ftn3MxeYEy1Hj4Clx9pPzq
         6zxqQkKGx18KdULbG8PpcWWJHDQORxn+D9AZtMYg5AkJvOaq27sApC9cOwzgmJcQ5+8e
         FzVqdhPMdbb/LCv1i9hsjVrKHje9UQq2gZYH8geza2XNhS4XLpqnaCrtDJnExFAhPVHJ
         PklcmdBQqSgLJ5VGJFFXC66xij/lzTqgjLa6bkNrx7Vv/zG5xGwGotjjb7FdXpnCVFN2
         /zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589101; x=1796193901;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3sbzhOnYUrS8wYvSIhWCG5ex9jxl9wVxRyhTnmBIp8=;
        b=Ne3VQ8E6sfNg1jjAZrUa8aIJDBRC7up4XAyriSPZDV81TlZ3rejzHX9n31XkOosYLF
         Jz4n5bTYgulIeNRx4PrHH+B0J+98uYpwOIFE0/B6qAkS4FHPLV1x8eqxbInqvDG1c6vB
         cvabDyS787yZeBByt6nylrGhwLnXTz6tSOnRqnTi3++rXZA+T2XSSzKPwcezoYd2Lowq
         aL5/08uqYd/R6UPv7KfhHi3lEAzT1fQgsQW74C6FXtjoBM2rbqBwq47Vls5tYUJD/85F
         6BHP7puu7PKfYgayBwT4r5cd1NF5YgiU0JXFoclYCvnwfjtwprlANUo9MlkQcV3mApfc
         laQg==
X-Forwarded-Encrypted: i=1; AL+hErHxMnPq6oiJjBePfQnYrc5Fl9J6JmSnVXSrfSIQzwODIgFq9HIS++r3DYaLEBkxrQ+j6gr6fkIuvhvIDyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RHw0eMCBzVKyQntFr42sSuLB9b1Dnnj2d7iA+SnvGJA+f5s+W
	TDcuFemf2d1f9Jpy9ijTswHRrvJ2P9DCigejhL8wHwIrFoR/7yBzRdXL
X-Gm-Gg: AZFdTZdS6LcwJIE332sN+/3objpB7PQNzUUJU2pCgo7pMi+DqwwbObSX+BlIo2bbZqi
	stjQlUdpZEFHC/qd0VCXl+s3y0OqYgZQdnOO6pNiwcWw9InzlIOH504kkQuhCP9wjabg2yRW3vT
	OUp/+W3obVhUXEJqico+iXUzk3quSfeqSybRu/iRPQyPgEUzLjrQ5AHfxZo3XGYiCyYWq8HyOEo
	vs1Dz/RIcZbL7EqcIP+HzIMZYR3AfWH1k0jKj6lXUS5ThqAQ5SawN6udi2OBen9oqp2NBLtVf9w
	0+lRfr/Gp3V6a6wdj8LEHtUSEQ4eLmVhiQqzAWTajy94GxrXazvyFZT5A8YHnTZ8LAZHJyDyTFg
	pNITt+/+DaSJX4MYtQ6QYCqdsPZ8yAIbCoG7qeItJ361xNPCssw8JQYyOfDYh0/CWWztXn0UKsD
	60d50gwddPMrBOBsoRRLVwmYdGPnSRDBBRTna6w7/adspirilPPtwGAyfFYFpfR744JzeoiB3Im
	x/yFer1kcvU2uFUWbDYZQc1DKjoHqiNKer1Rit8X7pMO+ygsbfDTQRK27gTRKsCylXVeJr/ny62
	nZxfJU3ZvmCfCLsOSyofhG6u9WDMWLiuYLoG6I60keyNyGhaeBKNWzAQTSJ4M+LdzjZd4HTbfnu
	4/GF665UaAHafJ93TxEZh7CSjfIvBFLUQ5Q==
X-Received: by 2002:a17:90b:1b09:b0:3b4:d6a6:e5b with SMTP id 98e67ed59e1d1-3b4d6a60f6dmr3827042a91.33.1795589101097;
        Tue, 24 Nov 2026 22:45:01 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm28789109a91.16.2026.11.24.22.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 22:45:00 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 06:45:00 +0000
Message-Id: <DN437OYZ5FGP.20VLV7ZEXQ5YY@gmail.com>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, <kkd@meta.com>,
 <kernel-team@meta.com>, "the arch/x86 maintainers" <x86@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andy Lutomirski" <luto@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com> <20261009024925.3169077-2-memxor@gmail.com> <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 08:22 PM Andy Lutomirski <luto@kernel.org> wrote:
> Didn't we hash this out a decade ago or so?

Twice. Feb 2019 for probe_kernel_read() and Jan 2021 for PROBE_MEM:
https://lore.kernel.org/all/300C4516-A093-43AE-8707-1C42486807A4@amacapital.net/
https://lore.kernel.org/bpf/CALCETrVZRiG+qQFrf_7NaCZ9o9f2-aUTgLNJgCzBfsswpG7kTA@mail.gmail.com/

The problem in 2021 was a CPU without SMAP. There the fault handler
can't tell a PROBE_MEM load of a user address from a valid uaccess.
That part stays. Without SMAP the JIT emits the range check.
With SMAP and AC clear a fault on a user address is never a valid uaccess.

In the 2019 thread Linus proposed the same for __probe_kernel_read():
no uaccess_begin(), SMAP refuses a user address, extable returns -EFAULT.
https://lore.kernel.org/all/CAHk-=whNf_n1WXWW+ugAVeL5ZK0GcEP3cTYocju1nS85VtMjjQ@mail.gmail.com/

> Can you at least explain how a non-range-checked pointer read of a non-verifiable pointer doesn't have a problem with, say, MMIO?

The range check doesn't know about MMIO. It refuses user addresses, the
guard page, and VSYSCALL_ADDR and above.
ioremap() space is in the vmalloc range, so it passes the check today.
It passes copy_from_kernel_nofault_allowed() too.
"compare" and "CPU" refuse the address, "load" reads it:

                              user address,  kernel address
                              RAM or a BAR   RAM     ioremap()
  --------------------------  -------------  ------  ---------
  copy_from_kernel_nofault()  compare        load    load
  PROBE_MEM today             compare        load    load
  PROBE_MEM, patch 2, SMAP    CPU            load    load

A BAR that is mapped into user space is a user address.
The device sees no read in all three rows.

> Does anyone have a compelling argument as to why the vsyscall page is any different from a PCIe (virtual or otherwise) BAR other than the fact that the x86 arch code will OOPS you when you accidentally read the vsyscall page but you will just possibly deadlock or otherwise screw up more subtlely when hitting a different inappropriate page?

It's not different. The oops is the only reason for that check.
syzbot hit the oops through bpf_probe_read_kernel(). Then 32019c659ecf
added the vsyscall page to copy_from_kernel_nofault_allowed() and
b599d7d26d6a added it to the JIT.

> If not, then I think this series primarily serves to make x86 complicit in papering over a problem with eBPF: right now eBPF has a heuristic that is wrong, but with the patch set applied, eBPF can make the heuristic even more wrong and x86 will paper over the cases that it happens to be able to detect.

The range check is not a heuristic for "safe to read". It's the user
address part of get_kernel_nofault(), inlined. You asked for that in 2021.
Its job is to keep user addresses away from the load. SMAP does the same
job. With patch 2 PROBE_MEM reads the same addresses as
copy_from_kernel_nofault().

In both threads you wanted probe_kernel_read() / get_kernel_nofault() to
tell MMIO from RAM. arch/x86/mm/maccess.c has no such check.
bpf_probe_read_kernel(), kprobe event args and kdb pass any address to it.
So MMIO is a problem of every nofault reader, not of bpf and not of this
series.
