Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213286;
	b=5fpnqwfGpuPDuogbM0DdHTqXfwB4qnuvFB8uTi3+GncgUG6fBEdmASQYglmn9ts/tDZm
	 J17xWyj+zSLqmdeMeDVGVVYiYlCe87JzectEX3LMZK2618w1DIww3uAxWXx4KAnMOXWX1
	 P+ULtbtO70q1JtbW8afKIj6YhdI3bDQAnYRYj9v5E6HLBRB1NPxHk0rtKmuaB6wqkhlzV
	 L/Hzh94ExDOzAU8npxdCrly+GTYorBNUFvMPyEamc1OQNMER9n8XUsxqL+2Nt48ihZfsR
	 xM/MOSlyA0I7BWRUY5umCQSo6J4CJleX5MD8NMjvOPXVGKTm/3IKL8nnW5r+tWb80Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YWAHn2Sutfx4jyhpprq+KziM+rM4UEONRsPYaYW8qwc=;
	b=0ZTqKoYrVrEyLbZXeDd6b0ItZcWKPu9pLtjxcY2T4owEJrsKQHd72sVxaH8arnaYAXZk
	 SfMJe1nXFDHsCXXq4QlQwzVnHB3wsrSXm0jpCNCIjXXEEtbvrTgpaBboRX+tWp73Ms27P
	 QLGHJ9Rxd6URSTNxpRDnOyntQC/nmHAYdybIl5YW41LMGyiHI5RtqdSUIhq5xQWO29ua3
	 mmhnyBk51aZtAzzJWCNEo22wWn817Y6RaaP5zTp40pIhSrT1UfKHP/HtFEtH7nCMll1BF
	 X0VgiCxODodrnFuHI8dEDBhmpR0UVJ+iUXDjDwpBJ/e4x5hSHH/fYPZrXpuE2G9tADw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yf6DiZlS;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523F606A6BF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4523F606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yf6DiZlS
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efc4a84e75so7465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213281; x=1795818081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWAHn2Sutfx4jyhpprq+KziM+rM4UEONRsPYaYW8qwc=;
        b=Yf6DiZlSNFO5GLCuQDAESWda3efOZ+ibaIKUvebHR9Ots3v4MJUI7W1R383LBgPssP
         JemDiDFzGhF2EXC2dNnbjkXEdmG8tiZfnzUH/N688CKz+Ac3/Gwltykxrvaa3EDKhRTj
         816ODB0DgIVzcAVJ++EiaZMkbWjndkCiLJIOF/8dZhmVY2+MEWkZcj47mZvmt4B4lBE3
         +ekVzpMJxEKBn6+5mvwrfbPUmacS0toEphyggM9hC2bCrhjbb1inSozdq3vb5n6hJZZ0
         2wu23ClMuJ/AYhbR0sW4ZN7U9MYW22amTmpeLxvnoKXtHxg8unyhrkzmb3perxPOaQ6v
         tvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213281; x=1795818081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWAHn2Sutfx4jyhpprq+KziM+rM4UEONRsPYaYW8qwc=;
        b=EieAijDB6LkZYdM4ft9LxzQMpImbdH2FCieQKddH0VqmV11MMR0d83vIAjP772vH/0
         U99So2vaMNh6L8ga3wu4v7BqKB7C2IigCIlfcvec5I1aLYoNWHRHRNFVpE+c39drbGc/
         KxT3huOGbzWt82m8poWoY2fVTHoa8kk935yeTBIW3RVWLQ496GcgM+NZ/0DvHQeoHKLf
         My/H81NjsKxoHWIzednQusbCE11IOkMjoKsjHANDvJkY7DLJMiJYaEnnZDb41KBGNIuH
         mcjzZ5B/X0Zg/3JXCYmraHJMz3mZltbQwonb6cMNFrmUY3IYlszkrp/4fWT/qJ25aBtT
         DaqA==
X-Forwarded-Encrypted: i=1; AL+hErG+cRJXdrzNqBidyaZq3vOF3Iaf0Z3USmCa7DPoOnVvwLJgeba7tWiHn19VwoKS1MeWKDZBjJ6LEjqe/AI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zwCraolKquuAvSKzwmdajkGMFE0IqrOjmpR40E7iCG9CHmWVa
	n4c8xwrQlPXH/u0BTt4kwujmrh+9weluNcl2rNWS7q/OT9wf1lhEe9aw9Hrb19Q6vg==
X-Gm-Gg: AZFdTZe9frbUPRx30DdxbXkrrDMIRUu0HvYfAnhNDSp9seZA6GvJtnlCbYcexjf5V+T
	tG34GwZ7IDHcTt7kihJrNR0tLo3XqQdlzLQu6xX56P56L505af7rEDqlYCYOYnFKzHCZOdnEtkm
	ycRd7Fuuj26PbIjRq93w6W27umwhHfvCOgbPuFlg4MOfZC7+t/Jhh+Jus5DcWtEfRRd6D/LYqAK
	M5bQni4n59ES9pSQQVe9VUtZYCeOkFqVI2KGlwRlJFKQ+p8y8votSPYnVO2X02otGdVk9n9sbRU
	MH5a2R6aDiY996lTd+kbenm4Vc/zRAHgRIVAXKbR4iz8uugtxGnx8hAjJJdUIIvJTXCuzo6IecI
	uH/LLGmkGnsGcer7WHTklj0diwnjpVwQ6UHsuvzcFe3a7uBIHaTYDSVTVXS9Ddri+r8FiBd/UK1
	IUp/ESvgz+vIEVXEzrpUxhD+Z1pnF4LQnaAnks3A6qUqkYlIhiDyA+DfPHbPAGHuVaSXjvb+ah/
	9+vZYd43DhcBRLeFo33Xw4TA1noromsaW0xuYYUbfhz2goF3SnX44P0R0kOZLLSQt7Kff8ZIpz/
	DO2EywZ/tN0FM4LMv5Q4v2FqOaTwzfBamN0xEy3YtLgo9NG25UJ6xBTxJPtPRFnQ7cRmb/ND4xG
	F3O7ywbGtm+rrGR7FQeWcvA==
X-Received: by 2002:a17:902:f709:b0:2e6:1735:f645 with SMTP id d9443c01a7336-2f062b91bfdmr1318055ad.4.1795213280161;
        Fri, 20 Nov 2026 14:21:20 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm5793510a91.6.2026.11.20.14.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:21:18 -0800 (PST)
Date: Fri, 20 Nov 2026 22:21:16 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Anthony Pighin <anthony.pighin@nokia.com>, 
	Dave Jiang <dave.jiang@intel.com>, Dan Williams <dan.j.williams@intel.com>, kvm@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: Only lock the upstream bridge if the reset may
 need it
Message-ID: <awC5Ldqmue6DiO44@google.com>
References: <20261112235700.2029562-1-skhawaja@google.com>
 <20261118163706.7138d246@shazbot.org>
 <20261119143237.4bf54796@shazbot.org>
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
In-Reply-To: <20261119143237.4bf54796@shazbot.org>

On Thu, Nov 19, 2026 at 02:32:37PM -0800, Alex Williamson wrote:
>On Wed, 18 Nov 2026 16:37:06 -0800
>Alex Williamson <alex@shazbot.org> wrote:
>
>> On Thu, 12 Nov 2026 23:57:00 +0000
>> Samiullah Khawaja <skhawaja@google.com> wrote:
>>
>> > Commit 962ae6892d8b ("vfio/pci: Lock upstream bridge for
>> > vfio_pci_core_disable()") makes vfio_pci_core_disable() trylock the
>> > upstream bridge before resetting the device, and skips the reset if the
>> > trylock fails.
>> >
>> > All VFs of a PF have the same upstream bridge. Take a device with two
>> > VFs, both used by one process. When the process is killed, both VFs can
>> > be released at the same time. The first one takes the bridge lock and
>> > does its FLR, the second one fails the trylock and is never reset.
>> >
>> > The bridge lock is only needed for a bus reset, which is done through
>> > the bridge. A VF is reset with FLR, and pci_parent_bus_reset() never
>> > resets the bus for it because the PF and the other VFs are on the same
>> > bus.
>> >
>> > Add pci_reset_needs_bridge_lock(), which returns true if any reset
>> > method enabled for the device is a bus reset, and only lock the bridge
>> > in vfio_pci_core_disable() when it does.
>> >
>> > Fixes: 962ae6892d8b ("vfio/pci: Lock upstream bridge for vfio_pci_core_disable()")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>> > ---
>> > Tested in QEMU with an igb PF behind a PCIe root port, bound to vfio-pci
>> > with two VFs. Both VFs are opened through VFIO and then closed from two
>> > threads at the same time, counting FLRs with a kprobe on pcie_flr().
>> > Without this patch one VF missed its FLR in 50 of 50 rounds, with it
>> > both VFs were reset in every round. I will send a VFIO selftest for this
>> > separately.
>> > ---
>> >  drivers/pci/pci.c                | 28 ++++++++++++++++++++++++++++
>> >  drivers/vfio/pci/vfio_pci_core.c |  3 ++-
>> >  include/linux/pci.h              |  1 +
>> >  3 files changed, 31 insertions(+), 1 deletion(-)
>> >

[snip]

>> > +
>> > +		if (pci_reset_fn_methods[m].reset_fn == pci_reset_bus_function ||
>> > +		    pci_reset_fn_methods[m].reset_fn == cxl_reset_bus_function)
>>
>> This looks like a maintenance nightmare.  What if instead we did
>> something like:
>>
>> bool pci_parent_bus_reset_possible(struct pci_dev *dev)
>> {
>> 	struct pci_dev *pdev;
>>
>> 	if (pci_is_root_bus(dev->bus) || dev->subordinate ||
>> 	    !dev->bus->self || dev->dev_flags & PCI_DEV_FLAGS_NO_BUS_RESET)
>> 		return false;
>>
>> 	list_for_each_entry(pdev, &dev->bus->devices, bus_list)
>> 		if (pdev != dev)
>> 			return false;
>>
>> 	return true;
>> }
>> EXPORT_SYMBOL_GPL(pci_parent_bus_reset_possible);
>>
>> static int pci_parent_bus_reset(struct pci_dev *dev, bool probe)
>> {
>> 	if (!pci_parent_bus_reset_possible(dev))
>> 		return -ENOTTY;
>>
>> 	if (probe)
>> 		return 0;
>>
>> 	return pci_bridge_secondary_bus_reset(dev->bus->self);
>> }
>>
>> Where we'd then condition acquiring the bridge lock on whether it's
>> even possible for a function scoped reset to perform a bus reset.
>>
>> It's a bit broader of a test than whether we actually have the necessary
>> methods in our reset_fn list, but since we're not locking the reset_fn
>> list between test and function-reset, it's also safer.  Thanks,
>
>After exploring Ionut's patch[1], what I propose above is probably
>wrong.  We don't have any guarantees that the sibling topology is
>static and this bus-reset-possible function presents it as immutable.
>The existing bus-reset function has the same race, but the gap is
>smaller, let's not make it bigger.
>
>There are however immutable properties we can test that cover a fair
>number of cases.  For example:
>
>bool pci_reset_function_needs_bridge_lock(struct pci_dev *dev)
>{
>	return pci_upstream_bridge(dev) &&
>		!(dev->dev_flags & PCI_DEV_FLAGS_NO_BUS_RESET) && !dev->is_virtfn;
>}
>EXPORT_SYMBOL_GPL(pci_reset_function_needs_bridge_lock);
>
>We should be able to use this as a condition on whether we acquire the
>bridge device lock, in pci_reset_function() and in vfio-pci code.
>Thanks,

This sounds good and it will also fix the bug that I am seeing.

The only caveat is that pci_dev_wait() might fail during VF reset and
then it might try to do a bus reset if the VF is behind a pciehp or CXL
port. I would prefer to do it only for vfio-pci code as that is where
the reset skip issue is. pci_reset_function() takes the lock and
serializes the VF reset. Are you ok with doing it just for vfio-pci?

Thanks,
Sami
