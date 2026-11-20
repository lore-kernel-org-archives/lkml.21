Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136483;
	b=oU5oeKDl6799LSIIoHqegGSdvv4qT2ioJhJ4MAlhEyU3LTx5f3a0jROWGVITKRmZrLXK
	 osQBjs9+IrhNrz6BUCyf2a1uwN7cC5F2YAZcUFOdEOSRIMokzSiRBarvrCmXvT2XyZOgc
	 65AJKghURwLepvSoGOkPAe0PmmNjEQRsdp1tZwlDLb8xG+mJDxCO4nUmTzI1dG/FvFahK
	 bTnmZMKa9KkiURAVpvF8Q/A8BLrsB9OF8GlmmYiQl27oxoqass8S0BSQcMvtSjT/vbehT
	 RlFUKoWZG/Y9Wn7zfL7TQJURsd0qGJZKjFDObQlv/nhkAFr8LEjUnSYm496+9Bn/qdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=tQwX2YSXjHFZhdcGcul9Os/DsNb3L2Z/dlwRM94y3qk=;
	b=cSKeN7cx+qCIZjjCdp2Act2YD8/R0nJfHmC0PdgCdtrytdOGfRNxs8rBXqSiIlEX0WML
	 z+TVitVzgA6YBxKrDxlC5CQVx419fV8otTn0Rvb6TeyUisf+s8uXxtmsNotd05ZRng9Q2
	 9W/QMhDnNGy950LQEyrDbgfS7zyGQ2i6tKBNJFS5ypl5TxzSr76gf+ZzQOAzmNWMG8EhS
	 XAuOK8PK18NmNrojyhFu2UKqE/ul4SE5WE/rNDRfMcznryg5zvg2VDSvu+P0lyVok+nb2
	 1jPl8UUXcYQRC8co/YpFMklua1w4RWEDC8gwKDWkJWKAZleNqR7rjeVGgEOmULLct1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aB8MFpMM;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E9606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A9E9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aB8MFpMM
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2efd659464aso1054305ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136482; x=1795741282; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQwX2YSXjHFZhdcGcul9Os/DsNb3L2Z/dlwRM94y3qk=;
        b=aB8MFpMMrxKiPFy6+JAlCebkuTAfB8STJ/MwS9WIwLqCpnefzKeDmhq5EVEBXBTAtk
         iZsFiOjSaZIDuUxvIML1Q/Pli5/DbL6gnCoGLgbUYawH5QdgI21J9H40Mcs3J1SkkOvI
         uWizmt1tDmGonLNXZ5YXlF2PsmUADiZT4OHccB3JI6LVrjbu/MATocrXjp79XyuUs34p
         GeFTzL2WyAVHxcYDZfAvaAkSSL4rOyfBbi+O8FFV0R2xboCacObeig/kcXV1qJPWJG1I
         K7A5+1J8wG+SXMXJhKIY8LO6D59Ticfnt/qzBmbcW/9Y7XR175kyxD2+3VefSFEg2uUQ
         J/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136482; x=1795741282;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQwX2YSXjHFZhdcGcul9Os/DsNb3L2Z/dlwRM94y3qk=;
        b=TC/9rjm7mrqSHCeWR0VRdTLoeqL62bHC/KD4VAb6QK0rmC0j7I1Gn2OlrQAL0BLrRh
         08tneKkRKjYROF1+zqGmpj5CJ14cdBrJnKvvgGnnuvNuXIqvZQ/vdQaf54B17n8twfbx
         MCdA1oSaLPM2F5WbtAtVdfNUtET3cI0gWyqTWlFretbZttbTVpsdfmC4C3/i93SZ3zvz
         aSNIxsOpfHyw+tILFJHlcwCzGGlVvitWDSB0r7GEto1ptCY8/Hjs9WqmZQpBTiE7zKof
         L/aYYoGj2DsZj/cgJCPFpHhCwBjPx2ZznMv+XLUehaULxVDuc2nCjNVbJgrNlf/PXn9g
         9RkA==
X-Forwarded-Encrypted: i=1; AL+hErHCjRq1KzbvmLnhiLuQ7TyHK3lYp6NjYZWNXNr2LQMNNnBkVi4VIF1hb4nMYukklrdA5L7auSiT/Tv2kbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qZU5Q/thFItN/bWBKFgq0yoC2nJNNsjJ0ljP6fANk0uXQ7kDs
	XjMp/hfy/WJJXrPapr+VHdgiFfp41VSY2sbNwyEbG2+3kCaNCyiOSVrTvrpWshGu0g==
X-Gm-Gg: AZFdTZcI6WCum6DEU0oGHifuNcDwiqcvEmjA7JcKIB4WlSzsYoLiVo0KnyhesWJOAnO
	R2oMd+duCk/quavLHcQr293zFQ+s4BfV6yshVWTo6twgUfa+VSp+PQdkemYsGkQqVg6lsvqi6tV
	14j2JONvGEWEfgB5YhdgepZfXf9bsohHHt7ff1XP7XtIbVEETcR6CqCH3r31I92HSGSH75X5oLA
	B11huZQNoMz1RvqmCXvf9bCOwSwml8mnVyIvx73+AIjDHSQ4Ab2vfAFqxN0qqjWWIkqn92Awxq7
	d0uy5osytlPKuRgeJl0PqffYmsb4MPyXtjaBGwQq4CEFFp/r+5cSgM2c8eLw90MXPAfOqA65/rW
	zB6Q0bxNXYgsn0obaxw4OFHayIqfXLcXTrVFZSOGuu3WYqt41l1cHWfZQ0V1p7fx6egV0Y5H2XH
	sNgCGeMyObcVwwvhzSm/czhgTIdDw6Ndh+m3CLrK+xOE968YwPni+Mp6Pjyc+xdG6G5iSfw+1c1
	f3QK6fXosmNrtxrKT54zA5QeASD+aUrpVyOWQ4+x1pfg/3N2NoYOJzO25coyhna1x80Ud/fotYA
	7qjd9VQ90iv6S1yCbmOuwPYOkN2wDcT/jJ3D9pxtOMrK0uic305EANuRnQ8lAMNU
X-Received: by 2002:a17:90b:4b87:b0:3b4:a63:d55c with SMTP id 98e67ed59e1d1-3b41c93b17cmr965473a91.30.1795136481385;
        Thu, 19 Nov 2026 17:01:21 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm4865271a91.10.2026.11.19.17.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:01:20 -0800 (PST)
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
Date: Thu, 19 Nov 2026 17:01:19 -0800
Message-Id: <DMZMRTXS7OSC.M79XF39ZVEWE@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files
 after Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-12-vipinsh@google.com>

On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> Enable userspace to retrieve preserved VFIO device files after a Live
> Update by implementing the retrieve() and finish() file handler
> callbacks.
>
> During retrieve():
>  * Validate the handed-over struct vfio_pci_core_device_ser header,
>    sizes, and flags.
> [...]

Please make the commit messages in this series easier to read. They are
mostly long bulleted lists of everything the code does, which is hard to
follow and largely repeats the diff. A commit message should explain, in
prose, what problem the patch solves and why it solves it this way, and
only call out details that a reviewer can't easily get from the code.
This applies to most of the patches in the series (e.g. PATCH 07 and
PATCH 13 too).

> Do not implement can_finish(): closing a retrieved LUO session invokes
> finish, and refusing can_finish() would leak the session and leave
> unclaimed devices running. Instead, finish() always completes:
>  * If the retrieved device was claimed by opening it via
>    VFIO_DEVICE_BIND_IOMMUFD (which consumes vdev->liveupdate_incoming;
>    subsequent patches replace the open-time reset with non-reset
>    take-over, reject opening incoming devices other than via retrieve(),
>    and protect incoming kept-running devices across runtime PM, dev_set
>    resets, and non-noiommu boots), finish() simply completes its PCI
>    Live Update participation.
>  * If the device was not claimed (never retrieved, retrieve() failed, or
>    retrieved but never bound via VFIO_DEVICE_BIND_IOMMUFD),
>    vfio_pci_core_liveupdate_reset() logs one pci_warn() naming the
>    device, clears PCI_COMMAND_MASTER, resets the function, and restores
>    the inherited pci_saved_state just as closing the device would. If
>    the device has a function reset but is not reset, e.g. because
>    pci_dev_trylock() contends with a concurrent driver unbind, latch
>    vdev->liveupdate_reset_pending so vfio_pci_core_unregister_device()
>    completes the function reset and state restoration via
>    vfio_pci_core_liveupdate_reset_locked() under the device lock held by
>    device_release_driver(). Opening the device after finish() resets it
>    like any open, so it drops the latch.
>  * If the device was not retrieved, look it up under pci_dev_lock(),
>    which waits for a vfio-pci probe in progress. If it is bound to
>    vfio-pci, finish it as above. If it has no driver, clear bus
>    mastering and reset it. Otherwise leave it to the bound driver.
>  * Call pci_liveupdate_finish() and kho_restore_free() on every path.

This is a lot of complexity for one commit, and it's hard to review. I'd
like to start with the simplest approach and build from there: implement
can_finish() and have it return false until the device is fully
retrieved, i.e. retrieved and taken over by VFIO_DEVICE_BIND_IOMMUFD.
Then finish() only needs to free the incoming state and call
pci_liveupdate_finish().

That gets rid of vfio_pci_core_liveupdate_reset(),
vfio_pci_core_liveupdate_reset_locked(),
vfio_pci_liveupdate_finish_lookup() and its bridge and device locking,
liveupdate_reset_pending, and most of the finish documentation. If you
want to handle the other scenarios (devices that are never retrieved or
never bound, devices bound to other drivers, unbind racing with finish),
please add them in separate commits on top, each with its own
justification.

As for closing the session leaking it and leaving unclaimed devices
running: that only happens if userspace closes the session without
taking over all of its devices, and leaving the device running with its
memory still preserved is safe. Resetting the device in that case is
something that can be added later.

It also has a nice side effect: LUO calls can_finish() on every file in
a session before finishing any of them, so a memfd in the same session
that the device DMAs into can't be finished before the device has been
taken over.

> +static int
> +vfio_pci_liveupdate_attach_incoming(struct vfio_pci_core_device *vdev,
> +				    struct vfio_pci_liveupdate_incoming *in)
> +{
> +	guard(mutex)(&vdev->vdev.dev_set->lock);
> +
> +	if (vdev->liveupdate_incoming || vdev->liveupdate_claimed ||
> +	    !pci_liveupdate_is_incoming(vdev->pdev))
> +		return -EBUSY;
> +
> +	vdev->liveupdate_incoming =3D in;
> +	return 0;
> +}

The pci_liveupdate_is_incoming() check here is redundant with the one in
vfio_pci_liveupdate_retrieve(). Nothing can clear it in between, since
only finish() should do that (see below) and LUO holds the session mutex
across both retrieve and finish.

The liveupdate_claimed check is redundant too: LUO only lets a token be
retrieved successfully once, PATCH 12 prevents opening an incoming
device any other way, and the liveupdate_incoming check already prevents
attaching twice.

> +	if (!pci_liveupdate_is_incoming(pdev) ||
> +	    ser->cfg_size !=3D pdev->cfg_size) {
> +		ret =3D -EINVAL;
> +		goto out_put_dev;
> +	}

If the device isn't incoming here, that's a kernel bug. The previous
kernel only preserves the file after pci_liveupdate_preserve()
succeeds, the PCI core marks the device incoming when it's enumerated,
and only VFIO's finish() should clear it. So this should be a
WARN_ON_ONCE().

> +	if (pci_liveupdate_is_incoming(pdev))
> +		pci_liveupdate_finish(pdev);
> +}

Likewise, the device must still be incoming here, so
pci_liveupdate_finish() can be called unconditionally.

> +static inline void
> +vfio_pci_liveupdate_unregister_dev(struct vfio_pci_core_device *vdev)
> +{
> +	struct pci_dev *pdev =3D vdev->pdev;
> +
> +	scoped_guard(mutex, &vdev->vdev.dev_set->lock) {
> +		/*
> +		 * Complete a reset that finish() could not do, see
> +		 * vfio_pci_liveupdate_finish_vdev().
> +		 */
> +		if (vdev->liveupdate_reset_pending) {
> +			vfio_pci_core_liveupdate_reset_locked(vdev);
> +			vdev->liveupdate_reset_pending =3D false;
> +		}
> +		vfio_pci_liveupdate_free_incoming(vdev);
> +	}
> +
> +	if (pci_liveupdate_is_incoming(pdev))
> +		pci_liveupdate_finish(pdev);
> +}

VFIO should only call pci_liveupdate_finish() from its finish()
callback (see the kernel-doc of pci_liveupdate_finish()).

If vfio-pci is unbound from an incoming device before finish(), it
should just leave the device and its Live Update state alone. That's
fine: if vfio-pci is bound to the device again, the device is still
incoming and can still be retrieved. And once the device has been
retrieved, LUO holds a reference to the device file until finish(), so
vfio_unregister_group_dev() already blocks unbinding it like it does for
any other open device file.

If userspace binds a different driver to the device instead, that's
userspace's problem. The PCI core documentation already says it is the
user's responsibility to ensure that incoming preserved devices are
bound to the correct driver.

So I don't think the unbind path needs any Live Update handling at all.

>  #ifdef CONFIG_VFIO_PCI_LIVEUPDATE
>  	bool			liveupdate_frozen;
>  	bool			liveupdate_intx_disabled;
> +	bool			liveupdate_claimed;
> +	bool			liveupdate_reset_pending;
> +	struct vfio_pci_liveupdate_incoming *liveupdate_incoming;
>  #endif

With the simpler finish(), I don't think liveupdate_claimed or
liveupdate_reset_pending are needed.

PATCH 13 later inverts liveupdate_claimed into liveupdate_kept_running
and uses it to block dev_set resets while a preserved device is still
running. That can use pci_liveupdate_is_incoming() instead. It blocks
resets until finish() rather than until take-over, but since finish()
now requires take-over, userspace controls that window. If some flag is
still needed later, please introduce it once with its final name and
meaning instead of adding it here and inverting it in PATCH 13.
