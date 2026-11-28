Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872750;
	b=gxdJwP7Jt+J1lnxYgSZI7btNCZfhAbbyw4E50T5bQn+czR0H1uHTyk/ARFGdJo/Tc/Hp
	 ixNLLFFkFMwlP5F4Ln0ZjN/0MIbazef0z3/T/IM3v//YoouKja8MtYmkiulgv8U0n/EfJ
	 TCilMWUr5vbuXi+osKoN2XtAdKPJqgmA0ZGF+EZC53aY6LKe8Hup2oDhDOwvJqTnae4U3
	 StspHTA7UNNXFpZoZL+yakOMozXuWw38CiTu3jz4UcXPsbd5zJ9xEkYM+q8v0FRoN2SOI
	 0gMAOydxj4IM5H5GTWTP4jhWUlbvLsR/k6M9wsG39muQ8IC0NZsN4Dfwi4QSjwPLG7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4V2a+V6fQG2NiQXAdRuUPTgWpRpo/WBcKKqghb1iDS8=;
	b=eBqlJK+oJ3EuA2YhT0hRSAok+X5LtoY0BIdoV2YG8pEWFEasbpF/5MSpPwPzpXHZpyJy
	 GM2I3N3/uJ3Nr3H/4n/XewbgSFTimjHmFm9Sk6LnpZS78t3aB9R886dox+DKASudLHOOC
	 phz8uHMXTIgyu0+bzF24GkKUriJdywltg7lkFnErOR1mRO7pwQYh2iCLUg0eJ7BSB4NbK
	 qAR4CgBOnbaGhtQATH6azHfLw7ljqvFx/GELVWRVLwYWypU1r1GzPJ10ayF9b47X7HbIu
	 /QLgMFf4TG+MsnzimxHVRBUDrdyQa8Z5KDDbo9p3RRPMcSVLxyKZpEQ1MbyDYWn7oSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMFbXXy3;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49475606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49475606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TMFbXXy3
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so61164225e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795872748; x=1796477548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4V2a+V6fQG2NiQXAdRuUPTgWpRpo/WBcKKqghb1iDS8=;
        b=TMFbXXy3VkgZTK+h4ARTANj0bd2OJWcSuDzdl4CAQt389Lpai+AVfRc4XA/gYyacly
         R879Dgv0XBK8CYbhAZ65Kc2El88wpAV7RM+wotXPg60QlWi7LV6TpyZIbr8Um0C23an6
         u8TQHz1N77s+FngyeyQ1L9xezzYMnq3z1q5gZyPlEmGptbiiGxR+FxenDTbXlJBq90e9
         mWsGq3acSFGPFShfLOaefOfjfSYazcTTWM+chxcEoBBQ9QljloO9eXgUQTZEX7eoBpeK
         bbiItkLRT3BRPAdlFbxhWj+dtp56eg+NcFz0UNzFKiLv8c1LTAHMzmFtQU8SlAwAy5pU
         W14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795872748; x=1796477548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4V2a+V6fQG2NiQXAdRuUPTgWpRpo/WBcKKqghb1iDS8=;
        b=UgAPDuQW49dyeVYQp+NxLp01BX4E+BdTGd5HJJbtb5p5ptYhEGLaR4mn6NMBwcCuFX
         /iI8NOq1NqBWyGJFNAZvTiRlJHU3jDibu3xu5ouTUP4ilhifnoZMS3u4Wdw0CkYDO35/
         U//1f78O4Z0oYugDd0L/8SnBgM5gwgdwcR8gQuWwQi68RJAapzDpiAS1SPxxH5z9Qw9c
         ElUA5GQ6OUTd8CN4AekUDzx/TEjZMSUCgNBBwQoriLtytstcDv4/YME2Zr29npZiYPol
         rWhxP/1kidKNeDAu8VclcxsqGEJg7Fm5XvebYpA2Fn7fX2fkaXIR3TTdiZ/J29Hfvpcd
         Uzww==
X-Forwarded-Encrypted: i=1; AL+hErF8ovTJf94lYkNgalmAW3F8ntgmooAfUHAisdnYdPEDCZqJfYAu/Y6ivMhhc1gATPKlkMIflRxIXP7naF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WzL1qdaNOZksl5/DCVs6sNE2ZYEcrkJ28+RttgEgd+nIApBSV
	A7VAQRHY1IxeB1QEfNxgtqZnkETnWksDsu8hhzxbgUpw/F9obVGQMd4A
X-Gm-Gg: AZFdTZcllvUJP+sYf2ozKN1bGoeKJkdQms1VBnkYl0iatntC9IAFEolCPnivwdRLzht
	2hZqeOXt3tn18dEfGo31wi66SaLV7ImqI6VCQwjqx6NTLqEAz2GN6RC0aj/MK4yKLmHE7JXIN2L
	CNvEuy5H673428m1VsE7OwHmFcnaTLjoTb8JLKiL5VeGnAVLtq1UtmjuzwoHkm1xI4BOMoTnuEa
	Zy9TZ1We1EBhor9506nR7JekuNJV8icY6CH7dbsgzW3c11uVxkGowiJZQl7e+ctpKmphkKFWS9Q
	DjnUMdE4jRofDQTISLr4g1U4+jymaGJ74WKLzIDSPJCyNBB9UyQcYgdecTdnUhPQVOo3IzqLMzp
	hd7Zfmh9EnsvXygEpiyte00clkeNtuTJ6JnBVqv0iggKTb5/PMTWQ5AGBJK3uhn7iWOI81giI9f
	XafR+qaffGGeBOdriGAtB5fZWRoPhPDFHk3OLY6SNNAYkPO9i0QfJA8Cl0b2TUG4T16Q7nTDLi2
	f9JBEWbajMCe8wEYDLeucqZ564Y0ONlTJAuOVD9IoNZlCqFqBSkPuMy6C6w6Nv4y8Gty5tERGie
	q8w+mzMu/Zp7REXHTM545uQRh7GfPBsSnh2RtiHfJ271Gg89ZOOMc0MZnCZbYodN65qI0z6UN4M
	fkwZC0YnCXMCGJ/iT2FnMeWczA/P8EptApBt3
X-Received: by 2002:a05:600c:1d2a:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb88814031mr666559775e9.28.1795872748317;
        Sat, 28 Nov 2026 05:32:28 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm790112755e9.5.2026.11.28.05.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:32:26 -0800 (PST)
Date: Sat, 28 Nov 2026 15:32:23 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, Joe Damato <joe@dama.to>, 
	Sven Auhagen <sven.auhagen@voleatech.de>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Subject: Re: [PATCH net v5 0/6] igb: fix runtime PM resume issues
Message-ID: <5k4igk5etdbmaweimm5ams44kwe3vzcqjmnck6a2w2iyhsfsvd@ianca2g23kva>
References: <20261124235723.1135808-1-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261124235723.1135808-1-antonio@mandelbit.com>

On 25 Nov 00:57, Antonio Quartulli wrote:
>igb can be runtime suspended when the link goes down (with
>power/control set to auto). Resuming it calls functions that need RTNL
>without holding it (patches 2 and 4), XDP and XSK changes race with a
>resume (patch 5), and devices that can't signal a wake-up are suspended
>anyway, so their port stays down when the link comes back (patch 6).
>
>Patch 1 fixes the XSK pool disable path when the device has fewer rings
>than the stack has queues: a NULL dereference with VFs (a single Tx
>queue on 82576), or after a fallback from MSI-X to MSI on resume. Patch
>3 keeps such queues while they still have an XSK pool, so that the pool
>can still be disabled.
>
>Tested with the 82576 emulated by QEMU, including, with test-only hooks,
>a runtime resume and a simulated system sleep (the suspend/resume
>callbacks called directly, as the test kernel has no CONFIG_SUSPEND)
>with the device forced to come back with MSI and a single queue.
>Patches 1 and 3 were tested with a zero-copy AF_XDP socket: closing it
>after enabling a VF oopses (queue 1, stock igb and v3) or warns and
>leaks (queue 2, v4), and warns after a resume forced to use MSI (v4);
>patch 5 by closing a socket and attaching an XDP program while runtime
>suspended. Not tested: real hardware and PME wake-up, a real system
>sleep, the MSI-X allocation failure itself, the window before the work
>item runs, SR-IOV with runtime PM, and a device that can wake up. Not
>run under KASAN.
>
>Sashiko also found two pre-existing issues in the XSK queue disable/
>enable paths (the Tx NAPI isn't stopped when Rx and Tx don't share a
>vector; a failed buffer reallocation leaves the queue half torn down);
>they will be fixed separately.
>
>igc has the same issues (see the notes); Joe Damato offered to test on
>igc, so its fix will be sent separately.
>
>Changes in v5:
>- new patch 3: keep the stack's Rx queues that still have an XSK pool
>  (Janis)
>- patch 4: cancel the work item before a suspend (Sashiko)
>- new patch 5: resume the device before changing XDP or XSK settings
>  (Sashiko)
>- patch 6: check pci_dev_run_wake() when scheduling the suspend
>  (Sashiko)
>
>Changes in v4:
>- patch 1: also handle queues with an Rx but no Tx ring, as with VFs:
>  tear down the Rx ring and skip only the Tx part (Sashiko); subject
>  changed from "don't disable rings ..." to "don't touch rings ..."
>
>Changes in v3:
>- new patch 1
>- patch 2: set the real queue counts on system sleep resume and from a
>  work item on runtime resume, and drop packets for queues the device
>  doesn't have until then (Janis, Sashiko)
>- patch 3 (now 4): link the NAPIs from the same work item
>
>Changes in v2:
>- patch 2 (v2 patch 1): keep setting the queue counts in __igb_open(),
>  only skipping them on resume (Sashiko)
>- mention the tested hardware in the commit messages
>
>v4: https://lore.kernel.org/netdev/20261120210134.133238-1-antonio@mandelbit.com/
>v3: https://lore.kernel.org/netdev/20261119140412.163202-1-antonio@mandelbit.com/
>v2: https://lore.kernel.org/netdev/20261116153041.3002666-1-antonio@mandelbit.com/
>v1: https://lore.kernel.org/netdev/20261113105835.3821433-1-antonio@mandelbit.com/
>
>Antonio Quartulli (6):
>  igb: don't touch rings that don't exist when disabling an XSK pool
>  igb: fix RTNL assertion when resuming from runtime suspend
>  igb: keep the stack's Rx queues that still have an XSK pool
>  igb: link queues to NAPIs under RTNL after runtime resume
>  igb: resume the device before changing XDP or XSK settings
>  igb: only allow runtime PM if the device can wake up
>
> drivers/net/ethernet/intel/igb/igb.h      |   1 +
> drivers/net/ethernet/intel/igb/igb_main.c | 144 +++++++++++++++++-----
> drivers/net/ethernet/intel/igb/igb_xsk.c  |  37 ++++--
> 3 files changed, 143 insertions(+), 39 deletions(-)
>
>-- 
>2.56.1
>
Reviewed-by: Janis Edvarts Lacis <janislacis06@gmail.com>
