Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557643;
	b=n/EAJzcTasl5cfSmPadds3rFWA2Mh9NB1OW/a/3rk5YU91LYvatflSgYEy/jzgO/QSTX
	 rkjSychf6FvD5HqclN0rL8tr0MeT3tl3r9/GrDk3C7nD06llQmfO2orfXLXxohSs2RUtt
	 vFUxD+iqR0LPoXaYU1uROzxMp0UAjiASIKK2r1NtKUVmg4KL+dhQu41OQR4QR0dBLDGpa
	 HVxnsn2jJJzPOnM95iam011KCGbm1jz+iHJPlf0/5TUnKKAccKSuKGSbodEIblXPl+IhO
	 2bFTFCrLZQBD1nonZhwRMGVRDtY1q3aER1EAsKL+aA2sZ3M6k8BHktL0ioCMYRoZpOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EA7eHt/O0bYrcpIzHzTDx2hG19gCRJEI4TFAz5QRzRs=;
	b=nX+pHA5630xtj6/wWDk69ixlC8T43WF6KPlfmN7od7MBmfwl4CItr+mY8cr/wip1uUpv
	 x54byWX+WZXYmpA20D2MuumcI756+SqGdCs93SVSlhXIUzLzP9SHpwzu57NkJ4D4yu1A9
	 4yuJ/1J0wIlt4P4LnhBJMHNZjRWiLB61ip/KRH4HEGq5Y01pm3IR2vwMEbrBFRK0h9Ed6
	 mIxok7GAyQOVKvhvsj5XE6jML9o6xDYXWkfiW57pjJarc7/Fth8d4LG5IhWZ83JMes576
	 sqHaeG8jXoUcM2SKbpb5G3qwTye21GoM08dvcEU95lQsYrMi7nVz/NV5VTqNLIyk/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OtemWuk2;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F3A606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F3A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OtemWuk2
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efc4a84e75so217625ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795557643; x=1796162443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EA7eHt/O0bYrcpIzHzTDx2hG19gCRJEI4TFAz5QRzRs=;
        b=OtemWuk2qwmdl9pKjqHZFKP4zrRgzaC68Ex3C8UJyZIpYUdlX17MZA2L1Aisw4qbDQ
         tndRp06PsycNVdC43Gpz8aNZoxmAJRbmlGKr04X7HcDahov46BMwMiiDv8iYiY2YCDs+
         pcUfY5OM0cJThr4WWkbrXKE8gKBlsLAMdEQM9YM3mJdZBncoWdbHNtpokiFIcGKVdgGr
         w3PK/UGe5Ml+5Q5JVgfZFMXIkEzZSGBxOD+k8RlmlsSo5u0ywV1Pxo2RyRpDuSfixDWO
         248bUCnj6ChNZ/ZpEH5u/E2CPT3DNI9rypNIYJ4hkzu7J25P+LRAIEf4KZtQHu9kM8l6
         P8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557643; x=1796162443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA7eHt/O0bYrcpIzHzTDx2hG19gCRJEI4TFAz5QRzRs=;
        b=esESwRHshf/gCoEEAT5V2hDVrCNsoVb41whWP973U5LUhMS8eigULn4kIe3gpK4Faw
         BQzG6WYM9SPmltjb60Y5AcBfB7qPjHFXMd2txN/oBlnY9V2Sx/5UtA884Po4QUiXAlZS
         uwyWbV3eIrYYnSuhZezEIy6jxxrGbpzSIpRtbFrAFVUz3jyJ4TclJ1QwlTCjykSj8Lyy
         +mBQkjAeJ9lSrvTls88TKSpdA/lYZQKUZXBY+vmvGPVqdwz1Vt1R/Gv3ssv2fHFMTy4t
         AtZ5h67YhnsQ/N+76LP9k3a7ZSHiLeqiKYE+jpq1exYrTmuSBf+XsThb5kUQfRhNZCrD
         zijQ==
X-Forwarded-Encrypted: i=1; AL+hErG+oaOQ/xq4EcMdwSgYpkPN+LdQkxBvgYelgaPeHnm1otc2RrWSuI/RSpWr8KGJX/5u87Kk1NNr3VMKg6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yRszLI+uhtEEqTFmoJR2MkJjdvHKc4cJhkIwlnGPsjxAR7Pnp
	YU/AgPxR8r6GvLBSEIrCTPZH/TktrbIW17i68+3VGf9Z2OXZIomdxEVzQB4zoIZjFw==
X-Gm-Gg: AZFdTZeO+H5F/+LFyrlp05UiHrEJyYCvVIrDA7IMHXDSP64mIH8F0qg9uYjACQxTo2j
	HtBef0CTb+oqYkVFjIo6J/CaBLBEvaiHYf5dZOaxKHkD/3aWkarF2HDNpOdXsl+Zv3VJwxRAmry
	OP9RC/y/s7rg1bZzTgrOyJyGBv13cWfBrNdcBudy608UWJdLtRjjHFg/qc9FGnzwnw20BVrKq4W
	5/m7TOjB55HLLT4slASLaCmuqgIcB5iwtbaR7tNwZ5jMDKgOaTjjqB5eHum0HlySO/slDgUPCyo
	kh5YQKTQDoxcNu0Q8TKPCt7rh3/R8GN1mDznkggY7BfUJoIp9R5gRvsPD6ux65EQSoAl879YPtD
	+RCZmRfwvkr1xb1kdCzEk1LpstNj6+NpMAWNutkrdbcACpMrCLhGVX2ED3PcqMVIUyqFqGfrLSi
	0hEDlsbiFBjhD8HK9bf5yapDWXj3H8wvmLBeTyOvVPJ12MZm0jwxvnl9XMade5v4mIERoEEZRPv
	DecAIW5lm3KfgwaUSvy08pXFEuMLWjfc+xFZjNGtNGX+J1eKG+zF9DwWKxcyxU2+URh57lrOGe9
	GC9tqTjZi4SBQlAtvA991gqOeBc7ZAFfwB03FdX15Ucwrqx+prpoVDYrYUNDO9nc7106Y0fEq+y
	EgYFS2UpztSwueFQMuocQEA1jEAAnhRwJy/9rK0BzRHE=
X-Received: by 2002:a17:903:1444:b0:2d0:1aaf:daec with SMTP id d9443c01a7336-2f0665697d7mr10304545ad.9.1795557641889;
        Tue, 24 Nov 2026 14:00:41 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm24132763a91.4.2026.11.24.14.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:00:41 -0800 (PST)
Date: Tue, 24 Nov 2026 22:00:38 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Anthony Pighin <anthony.pighin@nokia.com>, 
	Dave Jiang <dave.jiang@intel.com>, Dan Williams <dan.j.williams@intel.com>, kvm@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: Only lock the upstream bridge if the reset may
 need it
Message-ID: <awYIlvOacAWrT99b@google.com>
References: <20261112235700.2029562-1-skhawaja@google.com>
 <20261118163706.7138d246@shazbot.org>
 <20261119143237.4bf54796@shazbot.org>
 <awC5Ldqmue6DiO44@google.com>
 <20261124084852.661dd7c1@shazbot.org>
 <awXedVCoT7M79Rk5@google.com>
 <20261124145743.6c253bd2@shazbot.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261124145743.6c253bd2@shazbot.org>

On Tue, Nov 24, 2026 at 02:57:43PM -0700, Alex Williamson wrote:
>On Tue, 24 Nov 2026 21:04:57 +0000
>Samiullah Khawaja <skhawaja@google.com> wrote:
>
>> On Tue, Nov 24, 2026 at 08:48:52AM -0700, Alex Williamson wrote:
>> >On Fri, 20 Nov 2026 22:21:16 +0000
>> >Samiullah Khawaja <skhawaja@google.com> wrote:
>> >
>> >> On Thu, Nov 19, 2026 at 02:32:37PM -0800, Alex Williamson wrote:
>> >> >On Wed, 18 Nov 2026 16:37:06 -0800
>> >> >Alex Williamson <alex@shazbot.org> wrote:
>> >> >
>> >> >> On Thu, 12 Nov 2026 23:57:00 +0000
>> >> >> Samiullah Khawaja <skhawaja@google.com> wrote:
>> >> >>
>> >> >> > Commit 962ae6892d8b ("vfio/pci: Lock upstream bridge for
>> >> >> > vfio_pci_core_disable()") makes vfio_pci_core_disable() trylock the
>> >> >> > upstream bridge before resetting the device, and skips the reset if the
>> >> >> > trylock fails.
>> >> >> >
>> >> >> > All VFs of a PF have the same upstream bridge. Take a device with two
>> >> >> > VFs, both used by one process. When the process is killed, both VFs can
>> >> >> > be released at the same time. The first one takes the bridge lock and
>> >> >> > does its FLR, the second one fails the trylock and is never reset.
>> >> >> >
>> >> >> > The bridge lock is only needed for a bus reset, which is done through
>> >> >> > the bridge. A VF is reset with FLR, and pci_parent_bus_reset() never
>> >> >> > resets the bus for it because the PF and the other VFs are on the same
>> >> >> > bus.
>> >> >> >
>> >> >> > Add pci_reset_needs_bridge_lock(), which returns true if any reset
>> >> >> > method enabled for the device is a bus reset, and only lock the bridge
>> >> >> > in vfio_pci_core_disable() when it does.
>> >> >> >
>> >> >> > Fixes: 962ae6892d8b ("vfio/pci: Lock upstream bridge for vfio_pci_core_disable()")
>> >> >> > Cc: stable@vger.kernel.org
>> >> >> > Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>> >> >> > ---
>> >> >> > Tested in QEMU with an igb PF behind a PCIe root port, bound to vfio-pci
>> >> >> > with two VFs. Both VFs are opened through VFIO and then closed from two
>> >> >> > threads at the same time, counting FLRs with a kprobe on pcie_flr().
>> >> >> > Without this patch one VF missed its FLR in 50 of 50 rounds, with it
>> >> >> > both VFs were reset in every round. I will send a VFIO selftest for this
>> >> >> > separately.
>> >> >> > ---
>> >> >> >  drivers/pci/pci.c                | 28 ++++++++++++++++++++++++++++
>> >> >> >  drivers/vfio/pci/vfio_pci_core.c |  3 ++-
>> >> >> >  include/linux/pci.h              |  1 +
>> >> >> >  3 files changed, 31 insertions(+), 1 deletion(-)
>> >> >> >
>> >>

[snip]

>> >I think the test I'm proposing precludes a bus reset, ie. there is no
>> >upstream bridge, the device flags prevent it, or we're provided with a
>> >VF.  It's only those cases where we can't do a bus reset anyway, that
>> >we can skip the bridge device lock.  I think that means it's useful in
>> >PCI-core as well as vfio-pci.  Did I miss something?
>>
>> Yes, the slot reset probe doesn't account for the VFs and will allow
>> reset of the slot when hotplug is enabled.
>>
>> I think that is probably a fix that needs to be done orthogonal to this.
>> I will send a v2 of this by doing the needs_bridge_lock() as you
>> mentioned above.
>
>Yes, there might be a latent bug in the slot reset path.  I know s390
>has some weird per-VF slot reset, but they set the per_func_slot flag.
>The test in pci_dev_reset_slot_function() probably needs to account for
>both VFs and multifunction devices as:
>
>	((dev->multifunction || dev->is_virtfn) &&
>	 !dev->slot->per_func_slot)

Yes, that is exactly the fix I am thinking about. Let me send this one
also separately.
>
>As you suggest though, that's a separate fix.  Thanks,
>
>Alex
