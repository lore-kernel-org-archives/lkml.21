Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133203;
	b=B2aEpCOLJ31j7jtw+dIoMAu2REG+kQbUwH4Bly3GvdL3C84RkS8xwfdxGuDmjGeJJ4U+
	 B8McHtNUflriSVtSdH8jYdrnhDgeJtaxuiwL8otQi4sj1Qa7bnF8oTazWpxsNAuIUgOGR
	 lPakVIiaV2bcztcgq25fluxtvgbb+kt39niZ5r5u5lawVp041i7HlhtJNFhKaGkl68ZCt
	 JxVbRwybOen9c61/je+KEDvlTdNaCB4Yt1HzUpsHNmSYBERdXt2F2abCyIguV/lm3yyE7
	 r+pxlnG0S8HlGInUqKILakLo/IkGPxZketZO0Z28cXXsKIAvgAiP7FtUSs4q4l6kYog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=8PsDwtqZ7ZOXHEr9V4C4myUyqMWkC/3w4Fd9za5pDc8=;
	b=qt5woyMl/06ryK7cAxuGKeNd/jhBo+2PI4t3Mee1IHL2Kk7bz3WXHmhwWbXbrfp3iAVF
	 fMbEhAQXswAOUcDop1oBTh5M4tb86CqK8JK99rFzKbgBCR6ESzex7Nuf6Z+mZzEEZk8K9
	 g9e16UhbN/2pe6bEJ+73DmHY3oi4hPyjSprNT6cPX8OOeyULTD5rpMaMvzLOQdAY3VVdT
	 OVs1WAML5PlRtRZOZvwts4lRDQ3F+w4nKGYbdLnKOmVnX/8UvtIvVjUNlCeG27QtI3xna
	 Kau6JWn8XeFBeO8iCngD/5l3Y4T43zFmfx7oBfruz+jgPX2rcql8o852iH+ETicU/lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="air2/dns";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1160A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA1160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=air2/dns
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so223122a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795133202; x=1795738002; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8PsDwtqZ7ZOXHEr9V4C4myUyqMWkC/3w4Fd9za5pDc8=;
        b=air2/dns5VZwLYk/f1lay/0cC8R/IakufjWjyjlVS/NkwIM6QfW17TQOWTR1hao4Ul
         +5QvgbPksfItTlbIwBAB1do88ljLq3LFNqPJVuAVVQFv3aEB+KPQ8jSq9GBqzZ5g2JDR
         EFBr3yhdik4sQcww1/fIZ3fpCAjfe9zkTGWlOp5IUe6ipu8m33Jtrbu7EmiZbLJugeoL
         wVtgKZxEkfjkaEmkOERrHCTZHodW25y0KaAF+y2rfv5XxI04uL3lmRYwSfyjbHRFoVbA
         rIr7fkQDwkDSG7cYJDYndfUBNdVoHG7JNeSwMQR4yQGxrzMjZgyPy7VEoOETd4Ylvcq1
         Rr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133202; x=1795738002;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PsDwtqZ7ZOXHEr9V4C4myUyqMWkC/3w4Fd9za5pDc8=;
        b=slJEBgItAymqsXvLelLhOYIbyfBecGel/CgIBl2h4MFAc71hXgm8WffirJJyTbxJRe
         X6DGbzba/GpoB5WgTT6v2ZTfbsI4vO/EplkrER7yOi6b5NW81ULuo/7q2NIMWHlSC7Zu
         +JUSNtH7Ux5y+Q4kmIGx8FPC72EIV7VOwdNTGouLrTgw2j6QJ+R4g2QahcnKCO7512Ft
         0nM5wx5yAJbeUnFHeW8OLbzfsa7tIYQLrtcOlOZ6ei198o+DGnO4drps3iCLyVdLpoAD
         amjQqdBtV0NdXUJbGenOI8hY65RABzevQrxcXmE8ICPWa+VGnlBAVtBsclgmU1UBiRG8
         EwpQ==
X-Forwarded-Encrypted: i=1; AL+hErEx1F4LAHEdZXC4RDjLF2WwwADaNztYOhhgwdp4FlDsXZXbdwyWgZ3HBQQXXc33DXfLzjegg68Yk3rtALY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jXzz9JzOxo/9pQPoIbE03xYI4DDQQYt/pvd8Ax9Ab3T4BvhXA
	Rebv4mokbCQs81s8ysNfoepCRrQU/C1VfRYVj4IcY20AXd9yYCiAZoFNQRVVy0gsaA==
X-Gm-Gg: AZFdTZdIIUQRmnv8yVWYfD6/59o3e4fpjsfJdYprJ9PQqQngOIE+KjMgAYGn+qoLqRD
	Qc8Z3OmruO5Cjsl9MHa2pMKEAmLlBcU79TTysZASeshMWKCk1XxqQGHVr3SeoMMs3M5L+NClrq+
	HOXF3ZBz04FXo1WHDounZpLd+kLgw/vZzDZr6GFTyahJUCWiMpl+C14b7SMBfTHaDSD/OsB5hRq
	OWEVrC0kII8L8VFSApN9JbAtxu0wRvAudnjmPWaSd3MtcRWK6M8V47jCO2sZf0dAiPFK4SjqV7b
	+GIK/EYYz8lecQVLJUBp8G4aUWad1MiPFOIaD4CTb4Km3E6sSOWUrNNrodFRjQaX+hW4qCkBFEj
	kwDl5fJJQji6+PR6geJLhMH53gz/G79vSIK5z1E83uVceMYzyK7G/DI9xQoYHDj1G+/5855MxS3
	F/9c1XZkInsB0phgJmaovqfiGLpgCBEaO0ekS824LyHzbi55lx1ErWw8uLAsoVYhP7WW2TqE1Lr
	7QlD1+d5cg9SD9rYexsjZa8zAIggxsZlgSshs/tQlqW+3pHHkZU2VCEOZJq3+QCyli2O12j+peb
	2qHDzdod/FaGyUoovOjmzIne7SVfnXIxTs68FFOvsagd6ukXqHkpAL7SevZT1azl
X-Received: by 2002:a17:90b:442c:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b41c554624mr967136a91.0.1795133201767;
        Thu, 19 Nov 2026 16:06:41 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ff5d3easm328044a91.1.2026.11.19.16.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:06:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 16:06:38 -0800
Message-Id: <DMZLLYOVIGOU.1RXWYJN6UQTM@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files
 across Live Update
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com> <auzftbPFO_6XBYVw@google.com>
 <20261117220059.GA2250529.vipinsh@google.com>
In-Reply-To: <20261117220059.GA2250529.vipinsh@google.com>

On Tue Nov 17, 2026 at 10:44 PM PST, Vipin Sharma wrote:
>> pci_config_map doesn't need to be preserved. PATCH 14 already rebuilds
>> it with vfio_config_init() in the next kernel and only uses the
>> preserved copy to check that the two are identical.
>>=20
>> I assume the intent is to detect changes to vfio-pci's config emulation
>> between the two kernels, but the map isn't a good proxy for that. It
>> changes for differences that don't matter (e.g. hiding a capability or
>> learning the length of a new extended capability), which would fail
>> take-over and lose the Live Update on exactly the kernel upgrades Live
>> Update is meant for. And it doesn't change for differences that do
>> matter, like which bits are virtualized or writable within a capability.
>
> I think it does matter because reads and writes of unitialized
> capabilities in VFIO PCI config space goes to hardware directly. So, in
> the new kernel if pci_config_map changes it from PCI_CAP_ID_INVALID to
> others then those reads/writes can go to vconfig which will contain
> stale unitialized data from the old kernel's heap.
>
> This also changes behavior under a running user. Writes that reached
> hardware before Live Update can be silently dropped or redirected to
> vconfig. See the comment above struct perm_bits unassigned_perms{}
> in vfio_pci_config.c

That's true. Unassigned bytes passed through and vconfig is never
initialized for them, so hiding or exposing a capability does matter.
For example, 6467d0740a2b ("vfio/pci: Add DVSEC PCI Extended Config
Capability to user visible list") changed DVSEC from hidden (all bytes
raw) to exposed with a virtualized header. Across that boundary, v6
would have served DVSEC from uninitialized bytes in vconfig.

> How would a userspace opt-in? New kernel can change a capability visiblit=
y
> or virt and write permission of the bits inside a capability. Kernel
> cannot know if userspace used the capability or not. Creating a VFIO
> device in the new kernel by default results in a opt-in and currently
> there is no way for userspace to opt-out unless we add a new
> functionality where userspace can disable/enable features something
> similar to KVM capabilities.
>
> For now, I think we don't need to worry about it. As this version will
> be a base and if any serialized data with flags set received in this
> kernel will lead to erroring out restore.

We don't need an opt-in mechanism in this series. Detecting mismatches
is enough to make Live Update safe in both directions: if the next
kernel would emulate the device in an incompatible way, retrieve should
fail.

But an opt-in is needed to make rollback possible once vfio-pci starts
changing its emulation. I imagine something like a VFIO_DEVICE_FEATURE
that userspace can use to enable new emulation behavior right after
opening the device, with the enabled bits recorded in a field appended
to struct vfio_pci_core_device_ser behind a required flag. Devices that
don't opt in keep the baseline emulation and stay compatible with older
kernels. But that can come in a follow-on series.

> In the next version, I will not preserve pci_config_map. Hopefully,
> anyone changing VFIO code doesn't forget to update flags if they change
> capability or permission bits (I will write comments at appropriate
> places.)
>
> If we want to be very careful, we can do two things in this series:
>
> 1. Create a per bit valid mask for the vconfig and compare this between
>    new and old kernel during restore. In the new kernel, VFIO then takes
>    each bit from the preserved copy only where the mask says it was
>    valid, and keeps its own freshly initialized value elsewhere.
> 2. Create a hash or store virt and writable bits in config space.
>    Compare it with the new kernel.
>
> Both of the above combined will safeguard against forgotten flag update
> in the code.
>
> We don't have to do it but it safeguards against mistakes. Let me know
> what you prefer.

I think we should do both in this series, as two per-bit masks over
config space, preserved in place of pci_config_map:

 - virt[]: the bits whose value vfio-pci keeps in vconfig and returns
   instead of the device's value. This says which bits of the preserved
   vconfig are valid.

 - write[]: the bits whose writes take effect. For bits in virt they
   update vconfig, and for other bits they are forwarded to the device
   (possibly after validation). Writes to other bits are ignored.

The masks should describe what vfio-pci actually does rather than copy
perm->virt and perm->write.

vfio-pci can keep changing its implementation in ways that don't break
Live Update, e.g. start intercepting writes to a register to sanity
check them before forwarding them to the device.

Something like:

  struct vfio_pci_core_device_ser {
          ...
          u8 virt[PCI_CFG_SPACE_EXP_SIZE];
          u8 write[PCI_CFG_SPACE_EXP_SIZE];
          u8 vconfig[PCI_CFG_SPACE_EXP_SIZE];
  } __packed;


[ Note: I'd probably store virt[], write[], and vconfig[] on their
  own folios to avoid multi-order folio allocations, but I am embedding
  them here for simplicity. ]

The outgoing kernel computes virt[] and write[] through a helper in
vfio_pci_config.c and saves vconfig[] during freeze().

The incoming kernel computes its own virt[] and write[] masks and
requires both to match exactly with what's in vfio_pci_core_device_ser,
otherwise it fails the retrieve. On take-over it uses the preserved
value for bits in virt and its own freshly initialized value for the
rest, like your option 1.

I'd store the full masks rather than a hash, so that a mismatch can be
pinpointed.
