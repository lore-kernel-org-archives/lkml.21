Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182334;
	b=bbNqhfrkTEBy+1n+tLioM0aGKWfhHjnQGNTBPEsIH4oWuM/0jrmGCasiYn1S9a7bSdWD
	 afhryETpZIFUB2Ohgp7ES30M7rKfNDiQdzcDas8DCFRIHdmFm3rNtcY/a8eZLGFMm2+YE
	 InhRjtM2vAHbezre5v60pIgLFwwB5lYsSWA3wAboSPHvOZW9LBHVDHDRj6W71bvr7Nt6i
	 wvVLIO3AeOniFEcKn9d4qAPi6pNUjEMQj4/+V7ia1HE3MdyFASA9jhoe1ENBH4i3hfIwh
	 y404u76Qm8rqMQLNaG7VsKddO1Ljmdb0JC6nAneb9OF3tMfxa0hIl5O7PqNB8rdA4GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=seRZcfAAqkTD1W6q2JPJ+SdU9zOrZB5PtU+99DV2EQA=;
	b=DcMYkL1gOyOZC1mG4kaXKDu3LirCQWRYASU9Fa2HsHU4dR3JQspY+2qM2FswqK48/Vsk
	 LyIa+JQNoS8swb5HBVkvSAG9tdokAKIZXSqCwodmoi4L/weZSYvfvGe2KwEBRxIjXMBud
	 L8b7vQflRtHBfYGXXvHP/dPFpeo68mSFpx5ScHq/oak69vNjY+/BU5/0zfKtXE3UzP4nW
	 A5R0++CV3CxhKfNh8JsOrX9HH+81pDu18dAp81G37aItTIIwy3RJz8+vZH8YXWpSiCQMY
	 wbPpUoWiBcNQJwIVpJ9D1RXY2Cf6O/ipRCfcmg9IKdOY+qV5hRSPWsN9+7180QmfLag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oWMy3zlE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC21606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC21606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oWMy3zlE
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-54492d8a988so278221cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795182332; cv=none;
        d=google.com; s=arc-20260327;
        b=sVinWHqKHTXVx9vnYSOoUcmW9pqS7TJ5vva70hNlD2luOe0GqzQzjm1nIiFoKypjqf
         Nm97dyogGNDjPEw/GkL9uPDm0dxNwoWLu85KjmWCjYMHqXRblFLlg6oOrNz3fWQWuv9W
         x0Ve5Pmh5g8jb1jTL/G+St+jzDwC+nzRENQuG0PxFWHFgviAus6dtJGZ2i8nEfYVaiNp
         F8+gfy52dzuDPS/ZNrcS+uihQDHOlnH767UAJmgTvBRjwdxkUCEULVS8z6daN/5NEJwa
         3HODM38VGBLhJ7ePbrj5asaWQ3bIg9cAYcJbv5k+FVBY7Q3wZuV0VvvcucvM4Q3mT6X5
         alFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=seRZcfAAqkTD1W6q2JPJ+SdU9zOrZB5PtU+99DV2EQA=;
        fh=tQ/acgCkX5AUWucfW+BItLKLGv3FBZqSFQQ28Ij0dgw=;
        b=bNWj399uBwy9IROIOLo2s+JEroMS1Js8USXgC0FDQArV5OocBVU+6t8X59hMT7qoqK
         ijq7tzkvIf21qRDhmeQ9AflBlQmFJjN2hHZTIrJfjF+eJv0YF5mjMz7npFbAhI6u/gK1
         Aut1io+l3YaJMZfdBbJEmqluPeh2Uc0OibEqTGuKubjkKuHACPzb/FAuBXs+C65t3unA
         vCRFUZwOtbmhDEVGk5mvKnBDAyurGywFfQ9BLXVZpEoUgIfoqfAH1+Sf6diJb8dJt6Dj
         zBLpfpQK9eAu5dB1sut4u1wWgK9L+v+HWk/sZ5JcEOR/YKA9ACZh6QQ8c5HBAsLXiBvP
         Pstg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795182332; x=1795787132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=seRZcfAAqkTD1W6q2JPJ+SdU9zOrZB5PtU+99DV2EQA=;
        b=oWMy3zlEz/r8lL+NgJsVg55RcKCKj/PFVSPOfRnr4OdnO4rVhaC5w6TnzhsbEh2qzk
         HlKGlVlKi00Hl2AUDWjKoPx7VA/ix7YMvP1OjxQTwMpGZNqA71ZP4W0/Tx8u/ndLe1tu
         ZbQp+9U1QzqCg0SyX6OP2efB0X5TTU1yG2ldjJfNUiEGMLb1sPK4I8EsTe5uMHgORfjn
         yT5hSxjapiiFivdTqt3DVZyIbUd+RYCP/Mr0VO8Inm3Z7Pg+GU4UzXvEu5tXZd56naWn
         yydAe3zUcl5xTgxsS1dN8yhE4g9mpXOVl6sweYDO/Av6vLpqA5b8RgXOzFUOH03Nj+Y5
         zwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182332; x=1795787132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seRZcfAAqkTD1W6q2JPJ+SdU9zOrZB5PtU+99DV2EQA=;
        b=fVaQfGsQNSXfNMHESldrC1yHJ7aMbvRq5qJgQnjN0Q/+sW6xFDcY4eSHH5KJfKnaHu
         YMiHUbPZ058Oj3e3lDY0ez52EOZ0SapsTHtXfSiPTuKS4jiI5IH7/J3NH1PIDQUKILgv
         hcZKyQAeY7HRNR65nGgzDeBX8C+vZKKs2I2LAg+eS+d958WN4O4HE7pGB5oZUFx6Pcs3
         P+GgSoKJEC8IJiYTMwYa8J8GXZGg3zvRTg4QbQMIRMsL+ojnrlGD/QsCe0ufj5zxJglh
         HNARFha3yfX8bSW28l8nYBGgYOo7jpkgpCpvq4ZWlNKc05JPQRE12kABr0/qXzIWgjVr
         c47A==
X-Forwarded-Encrypted: i=1; AL+hErEHkuwNh4z8ZZDywKFaW9ez8Azn7/guXp3KeG/FYLFKJmk3YZ8N7ScvwUWNUdsbE7gMMpz+bue729Eu4Ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z81aVfHUBzBA8AXs8s1T9qQoSxat3ovkXRNT9SBIe+xs2PcJltS
	l1YPi4EL8BLP7r2MQS5ZCmBWyW9GE4WeRxJuOm1DTRVh9cgjhOfKJbT2svhyjTv8/y5CpI7YX/n
	/+suKg3eUS7MUcXoyPxWXzXWMjDFFSFHoSAEYSKC9
X-Gm-Gg: AYBFou25+6GlNrvBXOB/ecZ5Yp3PCOetFGdOYq3zDkPf+vY6+OcKLugR1zvEX9y4Cwg
	vsLVGVzCfzCYfDAfjNpspO293W94pVb3Yxu4ATjvxafRpzMtdq7sDuWpmB2elWGQZlLwUghcwQS
	Gv9ye7xbPg1ZMUE3fDw6V9IrwILKy0FF/A53MOnQIVUEicy0JxeDXcz4E6H3My6MD7SjjjVHwMR
	mV0Em9nSs0m1TUEMiHZcB3C7wWLxjLET8P7/sDb8qLB0brnucdu2oiP0q8sHlOcEPJcC1HSfHwh
	0ZSjbbraOYNVWCNv6dYORVe8tc69+qIBazlIwbyHJC6/z6TaNOGLkeGLzaPZ4p1dIHQqO7bVex5
	Fw3xk0aFawuN0fDQ3LIwGOPn6mMKpyVhE7YGOAzcQA3UyHJbY9bOYzf4PJ1jr6GqdCjT9Zzwx
X-Received: by 2002:a05:622a:8c8:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55d7a37902amr16415831cf.12.1795182331264; Fri, 20 Nov 2026
 05:45:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117103028.4105609-1-arighi@nvidia.com>
In-Reply-To: <20261117103028.4105609-1-arighi@nvidia.com>
From: Vineeth Pillai <vineethrp@google.com>
Date: Fri, 20 Nov 2026 08:45:19 -0500
X-Gm-Features: Aa3M54o-Xl-ufX2u6AxfLWTThRvPOrY3hGBTM6OrSKPVciSpyC7xweEMoobIj3g
Message-ID: <CA+HDTgQ0mx0PgXDps2h2kd8TbJsFWOmJGJmDRGEHZgBZ_qSVwQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 0/3] bpf: Import external pages into an arena
To: Andrea Righi <arighi@nvidia.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, Josh Don <joshdon@google.com>, 
	Peilin Ye <yepeilin@google.com>, Zhi Wang <zhiw@nvidia.com>, Lee Trager <ltrager@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, 
	Himadri Chhaya-Shailesh <himadrics@protonmail.com>, NchangRoy <royfru44@gmail.com>, bpf@vger.kernel.org, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

Thanks for the v2 and for sharing the scx_pvhost/scx_pvguest demo
branch. Thought of discussing the possibility of using the pvsched
transport with the bpf arena framework implemented in this series.

On Tue, Nov 17, 2026 at 5:30=E2=80=AFAM Andrea Righi <arighi@nvidia.com> wr=
ote:
>
> As discussed in the BPF track and the sched_ext microconference at Linux
> Plumbers 2026 [1][2], shared BPF arenas can provide a generic channel for
> bidirectional zero-copy communication between BPF programs running on a h=
ost
> and its guests, for example to exchange scheduling hints between host and
> guest sched_ext schedulers.
>
> v1 [3] exposed a pinned arena as a sized bpffs file and gave the guest it=
s
> share of it as a NUMA node. Following the review, this version drops that
> approach and teaches the arena to map pages that it didn't allocate, base=
d on
> Alexei's prototype [4].
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> An arena can only map pages it allocated itself, so its memory can be sha=
red
> only with the BPF programs and the user space that map the arena.
>
> Sharing it with a guest through a NUMA node, as in v1, has two fundamenta=
l
> problems: the node is ordinary guest RAM, so the guest arena's pages go b=
ack to
> the guest's buddy allocator when the guest scheduler exits, while the hos=
t can
> still write to them; and memory block granularity makes it wasteful (16M =
of
> guest memory for one shared page) and limits it to a few hundred guests p=
er
> host scheduler.
>
> Design
> =3D=3D=3D=3D=3D=3D
>
> The arena gains a single primitive, arena_map_ext_pages(), which maps pag=
es
> supplied from outside at a free arena address. Each call creates one impo=
rt,
> kept in an interval tree with its pages, which belong to their supplier, =
not to
> the arena:
>
>  - bpf_arena_free_pages() over any of them releases the whole import: the
>    pages are unmapped and unpinned, and the range goes back to the arena,=
 so
>    the arena doesn't grow as guests come and go,
>  - they are released when the arena is destroyed,
>  - they are not counted in the arena memory usage,
>  - the arena mapping raises SIGBUS on them (SIGSEGV with
>    BPF_F_SEGV_ON_FAULT): user space accesses them through their supplier.
>
> Two sleepable kfuncs for syscall programs supply the pages, one for each =
side
> of a host/guest shared arena:
>
>   int bpf_arena_import_memfd(void *map, void __arena *addr,
>                              u32 page_cnt, int fd, u64 off);
>
> Host side: pins the pages of a memfd, or of any file on tmpfs or hugetlbf=
s,
> with memfd_pin_folios() like udmabuf does. The host hands the same file t=
o the
> VMM as a memory backend, with no change to the VMM.
>
>   int bpf_arena_import_dax(void *map, void __arena *addr,
>                            u32 page_cnt, u64 src);
>
> Guest side: the VMM exposes the file as a virtio-pmem or NVDIMM device, w=
hich
> the guest turns into a device-dax device (/dev/daxX.Y). The kfunc pins th=
e
> device-dax pages mapped at an address of the calling task, and holds a
> reference on their dev_pagemap until it releases them.
>
> Both sides then see the same pages as arena memory, at an offset known to=
 both
> of them, so they can agree on a layout in-band, with plain BPF loads and
> stores, and keep pointers to it in the rest of their arena state.
>
> Use case: paravirt scheduling
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> The git tree below has an additional [DEMO] commit, not meant for upstrea=
m,
> that provides a real, tested use case of this functionality: a pair of
> sched_ext schedulers, scx_pvhost on the host and scx_pvguest in every gue=
st,
> which share a few pages per VM through their arenas. The host publishes w=
hich
> vCPUs it has preempted, its idle CPUs and every VM's fair share of the ho=
st
> CPUs; the guests publish their demand and the state of their vCPUs. With =
that,
> the guests stop queueing work behind preempted vCPUs and fold onto their =
share
> of the host CPUs only while that pays off.
>

As Josh mentioned on v1, we have been developing pvsched [5] -- a
lightweight guest/VMM/host paravirt transport (with QEMU and Cloud
Hypervisor support) based on the "guest allocates ordinary RAM, passes
GPAs via a small PCI BAR + synchronous doorbell, host pins via
/dev/pvsched" model. We recently added external-policy support so the
shared pages after a small negotiation header are completely opaque to
the kernel framework.

Looking at Patch 1, arena_map_ext_pages() (along with import_memfd for
host/userspace sharing) already takes an arbitrary struct page ** array
and maps it contiguously into arena VA space. That means for VMs we can
layer your shared-arena model directly on top of the pvsched transport
(on both host and guest) and get the best of both approaches:

1. No extra memory backend or devdax/nvdimm stack:
   Instead of a separate 16 MiB pmem file per VM (plus guest ZONE_DEVICE
   memmap overhead, libnvdimm/dax_pmem config, and sysfs rebinding) for
   sharing a few pages at a hardcoded 2 MiB offset, the guest allocates
   ordinary 4 KiB RAM pages (including from the right guest NUMA nodes)
   and registers their GPAs in BAR1. Both sides still map that page
   list as a flat, contiguous virtual slice in their BPF arenas via
   arena_map_ext_pages(), and Patch 2 (import_dax, along with its
   dev_pagemap unbind blocking and mem_hotplug_lock ordering) wouldn't
   be needed for VMs.

2. Clean lifetime and synchronous revocation:
   In the guest, pvsched_guest owns the allocated RAM pages across
   guest scheduler reloads, so scx_pvguest exiting never returns shared
   pages to the guest buddy allocator while attached; on driver unbind
   or kexec, a synchronous DOORBELL=3D0 detaches on the host first. On
   the host, /dev/pvsched detach callbacks know the exact instant a VM
   detaches or exits and can synchronously unmap the imported arena
   PTEs (relying on ex_handler_bpf zeroing loads/dropping stores),
   avoiding stale writes or blocked device unbinds.

3. Up-front negotiation, authoritative vCPU identity, and doorbell:
   BAR0 + the page header give an explicit handshake for policy name,
   version, and layout before anything goes live, and /dev/pvsched
   binds pages directly to VMM runner TIDs and KVM vcpu_ids (avoiding
   inotify + /proc/*/maps + thread comm scraping across QEMU, CHV,
   Firecracker, crosvm, etc.). BAR0 also provides a kick doorbell and
   optional KVM boundary hooks when a policy wants event-driven wakeups
   in addition to polling.

4. Consumer-agnostic on both ends:
   Decoupling the transport from the consumer lets scx_pvhost <->
   scx_pvguest use shared BPF arenas as in your demo, while also
   allowing mixed setups -- e.g., keeping stock EEVDF in the guest
   (publishing via thin in-kernel hooks without replacing guest task
   scheduling, which you noted in scx-pvsched.md's TODO) consumed by a
   host sched_ext scheduler or kernel module.

5. Live migration and Confidential VMs:
   With memfd + arena->kern_vm, host BPF writes go through init_mm and
   aren't tracked by user PTE / KVM dirty logging during pre-copy
   migration, and x-ignore-shared conflicts with VMs whose main RAM
   uses shared memfd (e.g. for vhost-user). With guest-RAM pages +
   pvsched, pages migrate as normal guest RAM: source VMM detaches at
   stop-and-copy (unmapping the arena import and marking pages dirty
   before the final sync), and destination VMM replays BAR1 into
   destination /dev/pvsched before vCPU resume (immediately disabling
   via header status if the destination runs no host scheduler, with
   zero blackout). Guest-allocated pages also map naturally to CoCo VMs
   via set_memory_decrypted() before GPA registration.

On the pvsched side, supporting scx_pvhost/scx_pvguest cleanly would
just mean:
 - making the pvsched PCI transport + /dev/pvsched arch-independent so
   arm64 works alongside x86_64,
 - allowing an ordered multi-page VM slice in BAR1 (not just 1 page per
   vCPU), and
 - exposing a thin kernel helper around arena_map_ext_pages() /
   arena_unmap_import() in kernel/bpf/arena.c so host and guest kfuncs
   can import and synchronously revoke those pages.

I am working on a PoC using the paravirt transport from pvsched for the
bpf arena framework in this series. Will share it soon.

We are also thinking of extracting the transport side of pvsched into a
standalone pvshm framework, with pvsched as a consumer of pvshm. I am
envisioning pvshm as the transport framework for guest/host BPF arena
imports as well, while pvsched remains a standalone scheduling
framework supporting kernel-module or BPF-based policies.

Please let me know your thoughts about this.

Thanks,
Vineeth

[5] https://github.com/pvsched/linux

> On an NVIDIA Vera host (arm64), with 8-vCPU VMs on QEMU or Firecracker, a=
t 2x
> and 6x overcommit, compared to stock VMs, the paravirt pair is 2.2-3x as =
fast on
> hackbench, 1.3-1.9x on a kernel build and serves 1.6-2x the requests of s=
chbench
> and nginx; tools/sched_ext/scx-pvsched.md in the [DEMO] commit describes =
the
> design, the results and how to run it.
>
> Known limitations
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  - Imports are released whole: freeing part of an import releases all of =
it.
>  - Imported device-dax pages keep the device in use: unbinding it blocks =
until
>    the arena releases them. Revoking them would need a notification from =
the
>    dax core and a way to tell the BPF programs that the memory is gone.
>  - BPF programs have no machine check recovery: on a real NVDIMM, the sup=
plier
>    has to keep bad pages out of the arena.
>  - There is no doorbell: the sched_ext use case polls the shared pages at
>    scheduling events.
>  - Confidential VMs would need the guest to keep the shared pages shared =
with
>    the host, which the device-dax import doesn't handle yet.
>
> References
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> [1] https://lpc.events/event/20/contributions/2429/
> [2] https://lpc.events/event/20/contributions/2482/
> [3] https://lore.kernel.org/r/20261010224902.1232178-1-arighi@nvidia.com/
> [4] https://lore.kernel.org/r/DM6HVNSP3USV.AJSWS289Z3I9@gmail.com/
>
> Git tree: git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git =
scx-pvsched
>
> Changes in v2:
>  - Drop BPF_F_ARENA_NO_FREE, BPF_F_ARENA_EXPORT and the sized bpffs file,=
 and
>    map pages that the arena didn't allocate instead (Alexei Starovoitov)
>  - Import the host's pages from a memfd with memfd_pin_folios(), the VMM =
uses
>    the same file as a memory backend (Alexei Starovoitov)
>  - Replace the guest NUMA node with a device-dax import, so the guest's p=
ages
>    never go back to its buddy allocator (Alexei Starovoitov, Josh Don)
>  - Release an import with bpf_arena_free_pages(), instead of keeping the =
arena
>    at its high watermark (Alexei Starovoitov, Josh Don)
>  - Map the shared pages at an offset known to both sides, instead of
>    discovering it out of band (Josh Don)
>  - Track imports in an interval tree instead of a second range tree and a
>    list, so that a release finds its import without allocating
>  - Link to v1: https://lore.kernel.org/r/20261010224902.1232178-1-arighi@=
nvidia.com/
>
> Andrea Righi (3):
>       bpf: Allow importing memfd pages into an arena
>       bpf: Allow importing device-dax pages into an arena
>       selftests/bpf: Test importing pages into an arena
>
>  kernel/bpf/arena.c                                 | 461 +++++++++++++++=
+++++-
>  .../selftests/bpf/prog_tests/arena_import.c        | 451 +++++++++++++++=
+++++
>  tools/testing/selftests/bpf/progs/arena_import.c   |  93 +++++
>  3 files changed, 994 insertions(+), 11 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/arena_import.c
>  create mode 100644 tools/testing/selftests/bpf/progs/arena_import.c
