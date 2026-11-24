Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554304;
	b=m8A2hc6icSsJpAoJgnFnqpQNN1b/bnWh9g0fQEla0NskeumquLbKFpXM3zrHS+Sa7GHL
	 d5QoOdt/aC6BtfdDjR3BZZWyNGndeUNeHC9nhHZEqnwBxdm3sNcR/HBMJd6FBLEFuYkDa
	 yoC93UruVQlZb8dUFNKlCQxPFcyXVYZa6I6iiZddfImfYiqrUJgtDJI/sYRk5xxbofddl
	 oLJOOCsb+OklRuKO5L9urJiR+iNF+LAoMVkjOoUqALxGpS8udZ54YMhXA7ckHHoiwXxgH
	 qTpx8rgyoZiETg0x+dIXXQoNAOf2RRxINdIugicoyMMxbNDc36Adv/UJlezikxp1ryA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8989DAIhEGp2+SqiqOgHbnDP3tqjvddGwcJYPtRttbc=;
	b=pzpNmYIYONlyAn1hl+dHerDTEWyPGT0lj25BBPo/j+AHRCAqUDS0xsX7QHPVS0e7I9/g
	 cVZzJjY6W5E6UQeK6blfrKUGuS+bb0J4yQX4cnZTgFgzu6ftugbTKKgTF0oDumuwUbysk
	 ljQFS+eZMvNzUSpRJ79XHOjQ0hW2/tP7VHe+sFNLtcwsyzz6L4eba7Dg+ubbqbaHzQR4N
	 ED8J5Ma1i9matDvZSer+9Rm+BvNFntDN0u6/CAdQXUTnTsE3PG/Id1s+elTvaxr7X2dN8
	 r7lY5wXrNNKCWTa5xxPfM1UTpXKefZX44dfw+gcoNiDww/kFzCMfols1GL8jgos/Ovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zk43yelt;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67298606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67298606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zk43yelt
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f048bc09d7so229955ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795554304; x=1796159104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8989DAIhEGp2+SqiqOgHbnDP3tqjvddGwcJYPtRttbc=;
        b=Zk43yelt/tm8w8qrnUw/rYu8FoZfnG9Xcmo++SabJlb6abZbjfVjnfXI9XBZw/hv16
         t9J8gTLH1sX5tjg/It/0QBr2WzKZaY4XroMeHNijrqAwKoXlcMeh8MCUjdw4+fKdt+md
         RJ362duEdbPSO3k5gsNh20PW+bipuMnBbFmth+eRATzNg7Dyn1iPORbToeVVtiu2b6AI
         hm4eeLQByAl4SS2/bYpWwJkDm00JSFY4WW83me9on7ZD4LR2C0L+7ip0ebIuUjbEEJKB
         R3YRFTxd2ka1it3eIloE22crT1tiIze58b8gMdGr/dFPC5uLraumWlzqrK3w/8ZePRfc
         zyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554304; x=1796159104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8989DAIhEGp2+SqiqOgHbnDP3tqjvddGwcJYPtRttbc=;
        b=yqD8GBI7H48IfOsLu/J9AC19bXTs1QNVf908/6LJYhgznKpZGe1s9Ph1LDY12/0Obb
         wmOfB4T+nwxFgVmQ/Yq65UPPrg5e5vizw8KUN8jWqXwwJTGcqsv3sVEqBe6DWUy3fsEJ
         w9RA+VJUmhY51OkEnfgzECIK8xMGWObF4O+Dc21l5ukJVqaRSDhXH7WCa05OPAU5W664
         GyHiDJtDz4ze1pRYBKGkMNg8Elmkbqm6/sS82yTelhmyfwrxBRPHWhbhBI/HAMUopSLt
         CzZHk2xvKMbApqSsZq0iywQOTq23zNTPnRKdRvQ74xwy/Abac7vkROsvYiKZrTLrn8OI
         gmOw==
X-Forwarded-Encrypted: i=1; AL+hErGQ6xERUe3XnWx/AOcLHtv81NyIMc40TgnrFpgXSaSpBWK63f+P+Eeh0XEoIj7ZZkDBGEe7NNtl5eUE8zA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92Mhw3UrtlEStf+9CRT1CP7cSKCYSTe3q9H3MueOwvAFnYBmKv
	qYetJGNFOTUDFq+3buZpVuViCwuyrH+MAS3Gwe6V992iA590Yf0VSBGVsxDc9Zzaqg==
X-Gm-Gg: AZFdTZeHoKvHBTqawf1JXlai9B6Pr/hK6Z/xifOpMJZmk7NfLr8YagjULs7OGDLVWoX
	wRpgi3NSLwDjcJUyMC4tYGI1248tIKl1XxnhVKtwpefjx6hAk5chSYaEhhSqFKXklcxO+DtWNA9
	zBd0BykFYnc+kln2mets8ePnEUYQ/D0NL+8NZ0C7y1XCEZFgnfcMdPnTceJrzhzoox0BeEnRis3
	k+71cMelSrK06i5iBTAQcF9dTAUj4v6lDRBDZiEvwSCREieWTSUJuHz72bls/0Lr1ihf9NINcGz
	JUBf0Y9aOo3Awt7EvL99qLjrG6niUTjzNkoUsv+3tjShC+bH3MEbcS9r9YI7E+S2YVlaa1uDoGy
	ctLy4bMACCykSiDINvDfljT3NQ4MaBL6aFFflTwTb1ASM4iOF+1dOLIDwazmU2lP7CYUlre9AaY
	UjVV2hdISSSd5OSzfcW7mV/2IkGXXiT2LeL2j9pZIzo3Xjel9bC66o675SuYH8J2pc6RCeE46Nl
	FwuhWaG+OndarLgVX60y4suTDvC9ZEC4Ew4uQww6D5WLJMdRW3gugD6M3k8/KUFGFQoHVsGsLkK
	l7wad03ilRSSOhwNZT17T9i2tEpe0X73afoMFZaspN9bu5LhRZ2WRwY+lqkLIb4TKccrgCxkg7H
	KNiHaOX/euHVztSZHqqhFNA==
X-Received: by 2002:a17:903:3887:b0:2e2:d665:6ad8 with SMTP id d9443c01a7336-2f062b6ecb2mr14518045ad.4.1795554303196;
        Tue, 24 Nov 2026 13:05:03 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm25196583a91.1.2026.11.24.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:05:00 -0800 (PST)
Date: Tue, 24 Nov 2026 21:04:57 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Anthony Pighin <anthony.pighin@nokia.com>, 
	Dave Jiang <dave.jiang@intel.com>, Dan Williams <dan.j.williams@intel.com>, kvm@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: Only lock the upstream bridge if the reset may
 need it
Message-ID: <awXedVCoT7M79Rk5@google.com>
References: <20261112235700.2029562-1-skhawaja@google.com>
 <20261118163706.7138d246@shazbot.org>
 <20261119143237.4bf54796@shazbot.org>
 <awC5Ldqmue6DiO44@google.com>
 <20261124084852.661dd7c1@shazbot.org>
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
In-Reply-To: <20261124084852.661dd7c1@shazbot.org>

On Tue, Nov 24, 2026 at 08:48:52AM -0700, Alex Williamson wrote:
>On Fri, 20 Nov 2026 22:21:16 +0000
>Samiullah Khawaja <skhawaja@google.com> wrote:
>
>> On Thu, Nov 19, 2026 at 02:32:37PM -0800, Alex Williamson wrote:
>> >On Wed, 18 Nov 2026 16:37:06 -0800
>> >Alex Williamson <alex@shazbot.org> wrote:
>> >
>> >> On Thu, 12 Nov 2026 23:57:00 +0000
>> >> Samiullah Khawaja <skhawaja@google.com> wrote:
>> >>
>> >> > Commit 962ae6892d8b ("vfio/pci: Lock upstream bridge for
>> >> > vfio_pci_core_disable()") makes vfio_pci_core_disable() trylock the
>> >> > upstream bridge before resetting the device, and skips the reset if the
>> >> > trylock fails.
>> >> >
>> >> > All VFs of a PF have the same upstream bridge. Take a device with two
>> >> > VFs, both used by one process. When the process is killed, both VFs can
>> >> > be released at the same time. The first one takes the bridge lock and
>> >> > does its FLR, the second one fails the trylock and is never reset.
>> >> >
>> >> > The bridge lock is only needed for a bus reset, which is done through
>> >> > the bridge. A VF is reset with FLR, and pci_parent_bus_reset() never
>> >> > resets the bus for it because the PF and the other VFs are on the same
>> >> > bus.
>> >> >
>> >> > Add pci_reset_needs_bridge_lock(), which returns true if any reset
>> >> > method enabled for the device is a bus reset, and only lock the bridge
>> >> > in vfio_pci_core_disable() when it does.
>> >> >
>> >> > Fixes: 962ae6892d8b ("vfio/pci: Lock upstream bridge for vfio_pci_core_disable()")
>> >> > Cc: stable@vger.kernel.org
>> >> > Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>> >> > ---
>> >> > Tested in QEMU with an igb PF behind a PCIe root port, bound to vfio-pci
>> >> > with two VFs. Both VFs are opened through VFIO and then closed from two
>> >> > threads at the same time, counting FLRs with a kprobe on pcie_flr().
>> >> > Without this patch one VF missed its FLR in 50 of 50 rounds, with it
>> >> > both VFs were reset in every round. I will send a VFIO selftest for this
>> >> > separately.
>> >> > ---
>> >> >  drivers/pci/pci.c                | 28 ++++++++++++++++++++++++++++
>> >> >  drivers/vfio/pci/vfio_pci_core.c |  3 ++-
>> >> >  include/linux/pci.h              |  1 +
>> >> >  3 files changed, 31 insertions(+), 1 deletion(-)
>> >> >
>>
>> [snip]
>>
>> >> > +
>> >> > +		if (pci_reset_fn_methods[m].reset_fn == pci_reset_bus_function ||
>> >> > +		    pci_reset_fn_methods[m].reset_fn == cxl_reset_bus_function)
>> >>
>> >> This looks like a maintenance nightmare.  What if instead we did
>> >> something like:
>> >>
>> >> bool pci_parent_bus_reset_possible(struct pci_dev *dev)
>> >> {
>> >> 	struct pci_dev *pdev;
>> >>
>> >> 	if (pci_is_root_bus(dev->bus) || dev->subordinate ||
>> >> 	    !dev->bus->self || dev->dev_flags & PCI_DEV_FLAGS_NO_BUS_RESET)
>> >> 		return false;
>> >>
>> >> 	list_for_each_entry(pdev, &dev->bus->devices, bus_list)
>> >> 		if (pdev != dev)
>> >> 			return false;
>> >>
>> >> 	return true;
>> >> }
>> >> EXPORT_SYMBOL_GPL(pci_parent_bus_reset_possible);
>> >>
>> >> static int pci_parent_bus_reset(struct pci_dev *dev, bool probe)
>> >> {
>> >> 	if (!pci_parent_bus_reset_possible(dev))
>> >> 		return -ENOTTY;
>> >>
>> >> 	if (probe)
>> >> 		return 0;
>> >>
>> >> 	return pci_bridge_secondary_bus_reset(dev->bus->self);
>> >> }
>> >>
>> >> Where we'd then condition acquiring the bridge lock on whether it's
>> >> even possible for a function scoped reset to perform a bus reset.
>> >>
>> >> It's a bit broader of a test than whether we actually have the necessary
>> >> methods in our reset_fn list, but since we're not locking the reset_fn
>> >> list between test and function-reset, it's also safer.  Thanks,
>> >
>> >After exploring Ionut's patch[1], what I propose above is probably
>> >wrong.  We don't have any guarantees that the sibling topology is
>> >static and this bus-reset-possible function presents it as immutable.
>> >The existing bus-reset function has the same race, but the gap is
>> >smaller, let's not make it bigger.
>> >
>> >There are however immutable properties we can test that cover a fair
>> >number of cases.  For example:
>> >
>> >bool pci_reset_function_needs_bridge_lock(struct pci_dev *dev)
>> >{
>> >	return pci_upstream_bridge(dev) &&
>> >		!(dev->dev_flags & PCI_DEV_FLAGS_NO_BUS_RESET) && !dev->is_virtfn;
>> >}
>> >EXPORT_SYMBOL_GPL(pci_reset_function_needs_bridge_lock);
>> >
>> >We should be able to use this as a condition on whether we acquire the
>> >bridge device lock, in pci_reset_function() and in vfio-pci code.
>> >Thanks,
>>
>> This sounds good and it will also fix the bug that I am seeing.
>>
>> The only caveat is that pci_dev_wait() might fail during VF reset and
>> then it might try to do a bus reset if the VF is behind a pciehp or CXL
>> port. I would prefer to do it only for vfio-pci code as that is where
>> the reset skip issue is. pci_reset_function() takes the lock and
>> serializes the VF reset. Are you ok with doing it just for vfio-pci?
>
>I think the test I'm proposing precludes a bus reset, ie. there is no
>upstream bridge, the device flags prevent it, or we're provided with a
>VF.  It's only those cases where we can't do a bus reset anyway, that
>we can skip the bridge device lock.  I think that means it's useful in
>PCI-core as well as vfio-pci.  Did I miss something?

Yes, the slot reset probe doesn't account for the VFs and will allow
reset of the slot when hotplug is enabled.

I think that is probably a fix that needs to be done orthogonal to this.
I will send a v2 of this by doing the needs_bridge_lock() as you
mentioned above.

>
>I do see that cxl_reset_bus_function() only does a cursory test for
>probe, but then calls pci_reset_bus_function() when it executes, which
>is an inconsistency issue of its own.  Thanks,
>
>Alex

Thanks,
Sami
