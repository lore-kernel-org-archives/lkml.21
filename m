Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955567;
	b=dVY733/T2ZultusBVW84H9F6grDhBXGUTTsUiqEfgLU+31z2qePpH/thLVRbzo8HCmWy
	 ET6DmDKcc890/H0WpEph5lIl3WjqrvUzrXMr1LIhBtMu2tkRiKVJzwu7iDgPKJvRqsDfc
	 pSqPcV6WLe8DZ48xY03t5XGSU4NL3x5rJhpKHVaRKUghegx80UGqU+D1BpeTwunnkpd/5
	 RE8C6TvwzvfblqCwzBtb++TjOrQY746V+gcJ/ToDhjb4MJLtvlC6JMkgoZNsmHzu4Lo73
	 NY/iWkRdIMf3Pk1xDdt/ZXcUCny5mFYtDqVmWhfBG05+7HZdkTqlPTdT+1BS+B+YVMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
	b=h5rz58i/OrPaLbn2I29wtyWbTmmA/I0HIIYMEI03Hmcicc/nl8ET3deQ1Fr5ZJoN2qzi
	 l6/xqvzZtaGHV1p4mDGQTTMpHYn00K4T0F0BDX8D2G0DH6orYM15pAs+S1SzVchSfDyjr
	 5Ww2NhgcTzVW1u4J472ipiEESyzNHpZN6okUqM8hBg3vikzZOXsKp+5AnxWwpBY4Ym8xP
	 /xaVvW5eXXxf4UlUU5nfGGoxkPIG8ws2sE+OVPJM3sSvtCEPc45qnnnMLToFAygZmoFH1
	 o4guT/EecoR7K2S+3CnpObQJmfuZTjqf9RqndWs4XFqEG7aAE1PYy693ihqhfzOCWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JyQ9V6sP;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9645D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9645D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JyQ9V6sP
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so145634b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1794955566; x=1795560366; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
        b=JyQ9V6sPlvT4t1D+XHiPAoUrfKzAGBQ84uffmMFRN/LcmxQKAydenrxSB+uNVpgF94
         NuRha+qy6WBihYuxIXEzpKjeVX9KVoVGGipoCW+x6D1iJnzHy+jZQmPfDpQp3FGZPhPs
         UTRY3j+FvhW4ZbjSes6t/9Bl4B74mxUGHv54btb1sLFUR0qDl3oo+F6cWIVpS2BW2+XZ
         lhbAKM5JouBmSpprPYDdwd+oaUFmcdd1BgS6j69PtgXaXWI9Ub3GI3u2ORz5kvaTgSBh
         t1ImcWDb+6Dh4DbhSWAjmRI3MAN7Z0LWbKtTypjm+GTyEdqvSDiH04MwZcCeZbJ7kqbi
         DQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955566; x=1795560366;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
        b=buZVNqKf7+CP2GVA+4sH88ci9cptm0O2X5dxFubo5s7YoZHvreq5JImgnElAOubtH4
         4g8o2LlnNGdZBEHJdcVrltngfxFOLRKLSo2AUJ1rAqsTKRZsp9j+MOGh5XUCNJzlL0Mk
         P2qg5SMU34klSWsKIJ1UNTdNMJ67suQTXaHPnsl7UsHBVOyJ4dQmLocj2X3iQA77AEGd
         Hh+6KqiQkTpYU803zwcRylxhBLD4ftiy9jbpeiwg8GZ8NqfYVTqCMVxxm6izbyG/26hu
         BXb6IKjKVroCeX43ylnm0E1OqNoODLtqXIQ4EGhxlUZJ8rcHCHPj5oQcnhgoRrxlCqHd
         tKSQ==
X-Gm-Message-State: APuU4Z/LfNhzZ8FDLQMQD5cDyC+xtHckvv5YGcJxFM/Sr7ih0PsFL4uc
	kptg65ab/SyLwuaZPCDpFiySOtD1D2QfH31zlrNWeB70LSDh5X9cJF7OMseLZvu7PJboL7kW9/V
	uUSouSPk=
X-Gm-Gg: AYBFou27loeCYOykk99u4Is9f5VlZIpKWr8ir1ydgCQ/pK4EWnJ1KXY/QdPr72uiY+R
	Lg7xVNHxH+DTcq0CeSe/oiXiohz4ALB7LYp2VA0wG2+nYZLcaNhYz6+7WpbDsUUwWcb1nHKE1jc
	AFHtm5lMys1jOc1ucR6rv1Kg9xEwFn/tgmNaLPcxvEwIoSXofSTT+YTTXPZxELsDQ6BcFsZZ6Nw
	nxG8a/4hkq7iy2RqIJFsRP0M5pHRvNthNVoiG4IfT4nyUF5yW68nONTe67Vamczb07ZmtqMbiqG
	y4FLN3AsKmVfV8iXrzhk27jaaXLxfdO6aUVMjD5tbnB9Dhcnjqn/WlLd2bg5E49nFT/1A4xmAil
	8/NLwd9locojRi5bLKbZg35vo2b3GaklBHxf0neocna+ALOuAozSlwSaJIZM3wgn7zsRa6TDPSm
	zddbJGN2CGPGDGP06Pp0bPQw5tPTZASZqzJivZtjSLzvac7Lr+YDqrpRRGTjJRlhLcnl1vFJaPe
	3lFUEAmhNl5KzcD3u0ha6mg6eO9DudpByx9HBLAkiEoWIcAH0oAYBlViKay+UimPF5h/iVGq/tk
	GQQkXPmEYy8JsnRqFrq17kqMnaFYFh0c5tDGtSgmbfErEq0Bllpjs6viIcON1vA=
X-Received: by 2002:a05:6a20:3d19:b0:3fb:5183:5e27 with SMTP id adf61e73a8af0-3fe86bdb958mr889308637.9.1794955566341;
        Tue, 17 Nov 2026 14:46:06 -0800 (PST)
Received: from localhost ([2601:647:4084:777d:a912:5690:58ab:9eb1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c7b3105sm119772a12.30.2026.11.17.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:46:05 -0800 (PST)
Date: Tue, 17 Nov 2026 14:46:04 -0800
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [ANNOUNCE] mklinux v7.0-mk5: multikernel Linux, now on arm64
Message-ID: <avzZLLKSZIlqAjag@pop-os.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

mklinux v7.0-mk5 is out. mklinux is an out-of-tree branch of Linux that
lets one machine run several Linux kernels side by side without a
hypervisor. A host kernel sets aside a pool of CPUs, memory and PCI
devices, loads another kernel into it with kexec_file_load() and starts
it on those CPUs. Each kernel then runs natively on its own share of the
machine. The kernels talk over shared-memory rings and IPIs, which carry
a console, AF_VSOCK and PCI config space access, and a kernel can take
the whole machine over from its host, which is what kernel upgrade and
crash recovery are built on.

This release is 114 patches on top of v7.0-mk4, and the tree is 330
patches on top of v7.0.

What is new
===========

arm64
  Multikernel now runs on arm64 as well as x86_64. CPUs are started,
  confirmed off and released through PSCI. An Image is loaded with
  kexec_file_load() and boots from a device tree the host builds for
  it. A spawned kernel is a tenant of the GICv3: it leaves the
  distributor and LPI setup to the host and initialises only the
  redistributors and CPU interfaces of its own CPUs. It gets PCI
  devices only, with MSIs routed through whichever host ITS serves the
  device. A kernel is forced down through SDEI event 0 where firmware
  has it, which reaches a CPU that has every exception masked, and
  with the stop IPI otherwise. arm64 memory hot-remove learned to
  split or refuse a partial removal of a linear map leaf and to free
  the page tables and vmemmap it empties.

Device leases and DMA confinement
  A PCI function lent to another kernel is held on the host by a stub
  driver, as vfio-pci and xen-pciback do, and everything the host sets
  up for it hangs off one lease. Its DMA is confined through the IOMMU
  to the memory of the kernel that drives it, on arm64 (SMMUv3) and on
  x86 (VT-d), and follows that kernel's memory as it grows and
  shrinks. The function is reset while still confined when the lease
  ends.

VT-d
  The host leaves alone the units another kernel drives, lends each
  spawned kernel a block of interrupt remapping entries and checks
  every entry written into it. A kernel that took the machine over can
  claim the units of its fenced host without turning translation off.

Chained takeover
  A kernel that took over from its host becomes instance 0, can online
  the memory it adopts as kernel memory, and can arm and hand over to
  a successor of its own, any number of times. On x86 parked CPUs no
  longer wait on slots owned by one kernel: there is one park table
  for the machine with a cell per CPU, so any kernel can find and wake
  a parked CPU, as PSCI allows on arm64.

Messaging
  Each parent/child pair has its own rings, so a kernel that dies in
  the middle of a send can only wedge its own link.

Console
  A spawned kernel can be handed the host's screen as a
  simple-framebuffer, for machines reached only through a BMC's remote
  KVM.

ABI change
==========

The multikernel flag and the instance id moved to the upper half of the
kexec_file_load() flags, as KEXEC_FILE_MULTIKERNEL (0x80000000) and
KEXEC_FILE_MK_ID_MASK (0x7fff0000). The old values collided with
KEXEC_FILE_NO_CMA and KEXEC_FILE_FORCE_DTB. A loader built against
v7.0-mk4 or earlier has to be rebuilt; kerf 0.5.0, the user-space tool,
uses the new layout.

Getting it
==========

  git:      https://github.com/multikernel/linux.git, tag v7.0-mk5
  release:  https://github.com/multikernel/linux/releases/tag/v7.0-mk5
  kerf:     https://github.com/multikernel/kerf/releases/tag/v0.5.0
  docs:     Documentation/multikernel/ in the tree

The release page has the full change list and deb and rpm packages for
x86_64 and arm64, built with the Ubuntu 26.04 generic config plus
CONFIG_MULTIKERNEL=y.

Known limitations
=================

- An arm64 instance gets PCI devices only, no platform devices, since
  every SPI goes through the one GIC distributor, which stays with the
  host.
- An arm64 spawn has to boot with pseudo-NMIs
  (irqchip.gicv3_pseudo_nmi=1) so that the host can stop it when SDEI
  is not available.
- The prebuilt packages have no debug info, hence no BTF, and are not
  Secure Boot signed.

Testing, bug reports and review are all welcome, on the list or in the
issue tracker at https://github.com/multikernel/linux/issues.

Thanks,
Cong
