Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684514;
	b=r3Hknro/+nni7Yawd1Q+QFshAsrFRaPLdKgiumPXZMqvENdmGq1GewzT82btohk4VPVd
	 JMvpDVfWeYVFidxEt/CiqOP0cj8wiRl+LQq4d+9eADlrpn2qGFHxwtb6NDaK4aaUf2FZJ
	 75+gP3YTQaeiBdnxT8LN31zSXFOGzINGhf4glul/4gcarePgGPbRDZ8w+Ikmn0qYEYyoh
	 wKmF0YLcNZt7VdOj8p26bXAJzZGm7kxf7C6n9BKetNTTXDCZRZnzO2G196BeKj8QnRqRj
	 dLytpum/h1cNFwi0g4ExYJkXLBPZkMyxEf0SBdAJdUM4+DfDWtHExBuHbK3qVqY7s3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nOvBGWrpieXjeYeaYeQ4iz+dQ3K5Ruh6yQGDubq0gG0=;
	b=R0fonztbPOk6jqOmVnJcR63ypzF5KURvnnGQn8MxmEb+8QDMFKIqMfSavoq0t55cBED5
	 1oIKqXyoIhQbSPn1KQCVsonGXCKmA3ExK2CG+DnjkIl0SRXht3Noeyygif5IsON6BQVj8
	 AJoTBR7XN+y0nPj/W9ToLCjMEbLsFYcTMc5HybPbuOTuhYW/SyulFmJaLhm5iQNObPsXm
	 dkWM5YwrP66iHNiUWgveMOnKg2lShjXplqgQoUyS6+oyEicnmkO6snlQp8uBbNzE3XPMb
	 Zd05nxH3FvobH++7JcaxGwYr0ADnkNOWiX1WDbuL6miEFiMBzCCiXVnRC/d7FXvN33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1eo+N4W;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0CE606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1eo+N4W
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4172873f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684512; x=1796289312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOvBGWrpieXjeYeaYeQ4iz+dQ3K5Ruh6yQGDubq0gG0=;
        b=c1eo+N4Wiv7EjKxwfcL3tfFeqHu8x6Krnvw93i6u/jfF+sGc2puye5EC9fpm2hHm1y
         fDnPfexBgEGfMjM7yd2zgZdeG0kXNj/pJAQKzYVw85wcUfnVroYZ4LnFf5d3XZ/Hv+et
         1W7P3Rigw2cYBsDwlqtzjOLuiE3LksmY9qibSpKVPbmGoMONoBR+FKIvmzf2IGbeBtlX
         LV/KklZVuZLt7eJDYLih0Yky1NMgailveCaxPt2g4YN8gNC8BObSJB3ml6e0M+688hle
         bflyxMYc4YeEGyPXz4l2LwullUHtEyF4tGS9y1EHOuIJzjQM31WoHbD79J5yLXPq36gm
         260Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684512; x=1796289312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOvBGWrpieXjeYeaYeQ4iz+dQ3K5Ruh6yQGDubq0gG0=;
        b=Ca1NAADqjoRzpAkiWoKT1ejXCImJSReUS7E1uJQDAu66bZPK26c3G3pLrqzP5RZI7Z
         URg/ikDgdvv+nhM43aixBSi63xVTQAczSJ1u1a20eHu61SzwrTyPgikZf3CSvRrV1nH6
         HuHwXopS4aMvBfLLI1i0OxbeL1rVdg8b7uXxz1F6AkVKL/Rb15r1BHmrvqi8CSTKxSxV
         HOSkgiMQUhSWOVNoPCs8Rz2XlJ6jzVPqBjJ8ZTlo6tBv3hkzijCymNWNsQ2CKwXfT825
         bHnTE5BErreNxa3/1jd6egnkgjrOUN8ZGNJSSWjPfJivuceFXkzhHHEbscMxnv+stlRd
         BKVg==
X-Forwarded-Encrypted: i=1; AL+hErFd63OXOum9p4OkU8L68BqGJ6T07nm6XEez6TS9m5pLOf6NPV5fCL/PznlF5SH7GRLRr8ktScgGHTgQU8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JaVGDN+hN6V9FP4WaITeAFGdYW9giGrf3mTQcAF4oBHCHuFHW
	XvlobYvvM+sPDvLYHFwjkDnuSVggP3i30qaP2pb9PxMhsseDoaW2edZY
X-Gm-Gg: AZFdTZdxRO1zqKOPwsEOAX7CKfGppAFcOYCeKyxOq5scSOAiDJdDZePj+cPYlz9N1kp
	Ej7gkmjS01fplSaIBOfLUUKkpTIe/jfInqUZf0AodJQX42cko0Ctv2EP5QNmVjL9z7bDVyfEG26
	stpZCPLa0+q4tx0zazkHlbDaZJ0HkzWxi3QbMd3NuesDGqed4V7GIY4lgG9KJkK6xpQgdknPPzC
	enc/3Uihlmko+KoH3UezsJBrToZSIYV1RJyGcGALqPaSKtT73EY3qvhVh2tN8EXzkK1TFebDZt+
	m6Ab7nNH5VXJdSSQE5k7iD8QAfhpukCY2uJKlMOA0xLUAczAiDcsT08zfvO6BtUyKl9jmQQ9/rB
	GysmuXZFSGS7DvMkzys76L7M21Qmp/ZoetCLVsw6F+ZPV3wdVreMhT81FSQzu6TOi5aEl5gFLzV
	QJeu8Ar+hi1sz3JGbZgRmQg7BixKlpJL5Ij9DofNtQkEpOADZSQNvzE164DB2SKY0CxN9e9qwtE
	u6sEuCcjxuBECdFgIMkHXbdcSz0KJI+vOjuJKo7KgJIHA8iMh1vWq9QUnP9/L6hmx2oK5mmiG4X
	h2C5zDJ/LzsyHTSWTz08I/+VELV/pIdQwcBNrKA74h9wYJBP3i6PeOlQleq8sTe6VQY=
X-Received: by 2002:adf:e009:0:10b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4abb4c7ab68mr28124075f8f.26.1795684512114;
        Thu, 26 Nov 2026 01:15:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm37029320f8f.34.2026.11.26.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:15:11 -0800 (PST)
Date: Thu, 26 Nov 2026 09:15:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko
 <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Min Li
 <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek
 Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, Grzegorz Nitka
 <grzegorz.nitka@intel.com>, Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Petr
 Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <20261126091510.7ac67b35@pumpkin>
In-Reply-To: <20261111164021.273409-1-ivecera@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 17:40:11 +0100
Ivan Vecera <ivecera@redhat.com> wrote:

> dpll_lock protects topology and object lifetime, but it also serializes
> all driver callbacks in the system, so one slow device stalls every other
> DPLL device, whichever driver it belongs to. mlx5 callbacks issue firmware
> commands with a 60 s default timeout, and zl3073x callbacks can wait
> seconds on a driver lock held across ToD writes and phase steps.
> 
> Make dpll_lock an rwsem for topology and lifetime and add a mutex per
> domain for callbacks. A domain is all objects created with one (module,
> clock_id), in practice one chip or card, so channels of one chip stay
> serialized as drivers expect, and they still block each other. Device
> callbacks run under the domain of the device, pin callbacks under the
> domain of the pin, whichever driver registered them. Only one domain lock
> is ever held, so domains have no lock order. A lock per device would not
> work, because pins are N:M with devices and callbacks notify sibling
> channels.
> 
> The driver API does not change, but a callback can now notify only
> objects of its own domain. Patch 1 changes the one in-tree callback that
> does not follow this.
> 
> Registrations across domains exist in the tree only on E825, where ice
> registers fwnode pins of an external DPLL with its TXC and TSPLL DPLLs.
> These callbacks are no longer serialized with TXC and TSPLL, they rely on
> pf->dplls.lock, and requests about these pins wait while the external
> DPLL is busy. Intel folks, please check that this is fine.

Isn't the big problem with callbacks handling deregistration?
With a global lock there isn't a problem.
But as soon as you do anything else you have to have very explicit
rules to safely deregister a callback without either a UAF or an ABBA
locking issue.

I don't see this being mentioned.

David
 
> 
> Each complex of a dual complex E825 has its own DSN and so its own
> domain, but both use the CGU of complex 0. The lock for the registers
> they share is in a fix sent to net [1], which this series needs. Without
> it a test lost updates of them.
> 
> Patch 4 is the only patch that lets callbacks run concurrently. Patch 5
> adds KUnit tests. I also tested each commit with a mock driver and YNL in
> QEMU, with lockdep and KASAN, and the tip with lockdep on two systems:
> 
> - A board with ZL30732A: every notification the driver sends from a
>   callback, concurrent traffic with PTP, driver reload and rebind.
> - GNR-D with dual complex E825 and zl3073x: callbacks of the pins shared
>   by both drivers, TX clock switches, RCLK pins of both complexes, a port
>   going down and up, and both drivers unloaded and loaded in either order
>   under load.
> 
> mlx5 is build tested only.
> 
> On GNR-D, with ToD writes running on the zl3073x and requests waiting for
> them, requests to an ice DPLL took 1448 ms in median and 3.9 s at most
> before this series, 0.2 ms and 0.3 ms with it, the same as when idle.
> Requests about the pins shared by both drivers still wait for the zl3073x.
> 
> Changes in v2:
> - Dropped "ice: dpll: serialize changes of the SyncE CGU registers", sent
>   to net with a fix of the SyncE divider [1]
> - Addressed the Sashiko review, see the patches for details
> - Added Reviewed-by tags from Petr
> 
> v1: https://lore.kernel.org/netdev/20261106121005.1327603-1-ivecera@redhat.com/
> 
> [1] https://lore.kernel.org/netdev/20261110094350.184185-1-ivecera@redhat.com/
> 
> Ivan Vecera (9):
>   ice: dpll: notify TSPLL lock status from the periodic work only
>   dpll: add domain object
>   dpll: take domain locks around driver callbacks
>   dpll: convert dpll_lock to rwsem
>   dpll: add KUnit tests for core locking
>   dpll: reject measured_freq_get for foreign and on-pin registrations
>   dpll: zl3073x: update locking comments
>   ice: dpll: update locking comments
>   dpll: document locking rules
> 
>  Documentation/driver-api/dpll.rst         |   48 +
>  drivers/dpll/.kunitconfig                 |    5 +
>  drivers/dpll/Kconfig                      |   13 +
>  drivers/dpll/Makefile                     |    1 +
>  drivers/dpll/dpll_core.c                  |  204 ++-
>  drivers/dpll/dpll_core.h                  |   34 +-
>  drivers/dpll/dpll_core_kunit.c            | 1580 +++++++++++++++++++++
>  drivers/dpll/dpll_netlink.c               |  117 +-
>  drivers/dpll/zl3073x/dpll.c               |    9 +-
>  drivers/net/ethernet/intel/ice/ice_dpll.c |   24 +-
>  drivers/net/ethernet/intel/ice/ice_dpll.h |    5 +
>  11 files changed, 1919 insertions(+), 121 deletions(-)
>  create mode 100644 drivers/dpll/.kunitconfig
>  create mode 100644 drivers/dpll/dpll_core_kunit.c
> 
> 
> base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219

