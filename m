Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481678;
	b=xUrBQCUuNDVSi+R32YOYl5PjqyrQ69ucH5FUa5CwBLvd28ds5fQtarQ2YQmvHZ22sLFI
	 Zmdj/ak8Tn4f2T63VqhldqqWZIk4qXy2Q1fvvuIJWmj2F/K8QN+ecxGAwPR+yyF3oupT1
	 8oNkFbKhaehdqe5DIH7iGhASYTZBLLjwKPNc2BfPYg2vBOZEGqpltK/V716+lrfbskaPY
	 4dr13mxI2bZt5ivk8z2tZhjmkBDmsZnlO4eetxh4DE6QMaVNayXLEjUXf5kRVOqJNQ/Mn
	 FSn2I93p7agNVNZSPj3B/8CS6uoPgFu5Sdp26x82m7KMMtdgQjQaTvhF7Ju9Sa65+LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=wxrFEQwvZofo98YP2I+hr7iiAcbc0NkcdEgkCb5+KYc=;
	b=ySisks9IDgp1y5e9TouveVIBTsQ93dt6gBPTEXkSck1uFR6kATbB/3aV/QLagsnXD+jV
	 8ZWX1/0Syv/QVZhbsHNkvdG0eKnzyQAaqefDFNi705R2JPuSH1vMy2PSk7WJK733kRCsk
	 mzmeVPEeKwv6vNI5pzclk+C2oSMe9ay1LQuDHO+7PHQLfCh81I4ouzlnX3h24KoZAtZWo
	 tBTaKJSqT3n76BXWoaekOt4pxJ+bMAclEwi+DiM+a9LfxMwvxSNXcsPEYgWMJrkKW3G5Z
	 O2h15lHsd83YSXSYJ5AT6psbs3PzNM2OQtTBquItWxjftZKWUDUTLSzM/xAXRspDmJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qAcOTgh2;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E42A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qAcOTgh2
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04ad2c46dso21568155ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795481677; x=1796086477; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wxrFEQwvZofo98YP2I+hr7iiAcbc0NkcdEgkCb5+KYc=;
        b=qAcOTgh2VKFtxARfCG/NRj9gEnV/2YBjyx3if8vZj9CWMZcf7B1w76NAPf996jOFz1
         WLKsLHm/CZV2RcJ2qbELKcm3x6eD5BrvPRphgxZyfnNox16h7XHP6lA/roVNbkL93v7t
         kezG2HXPtXbMRLPS3Ix/DS79BlBb7rYrUkjaIhRkN+9jTzAn4Y2yNriQNBrCzH/36lH7
         BRY/zWsGEm6bb6BnDptS40PBFQT3UZYhtBdxp6kKmaYEzQj2wZnC7+0xdz4iCrEsdht5
         2TPV7G2QSaLuko6z7lsSxxAd9qDRt8dZla88vlsvt9Uwpb5adJUauP5ZG2EdMKFW2a5P
         jukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481677; x=1796086477;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxrFEQwvZofo98YP2I+hr7iiAcbc0NkcdEgkCb5+KYc=;
        b=iH3JUlgr02rh0rtdGutdNjYvQYQMvIAw1bOgKiDZ0dmIZTaCvaBJh4KrtdvNJjrtR5
         jdguRjJTInZ4lK68crLqSb/iVL4cGCWjV89HubHDsqalnDWAvEuGV4bUfZHNYoJDMmfK
         7MBnJF/ZyiwZhX6ZdW0W2EGfctvkuxbDKq9BkyFHx/7J236b17XViqRF5DxuLNJMFu+s
         R6+9kd6KDX4hHF5eUaVUTe+xpbu0gPjSHQb/d0yQtDtZsNNttHLfud/+aH0MJTqB5MFI
         O5HTSa8qzTYdfP6yLawqZaQXjf+cSYbGqHDX52SAl9+IYLzbPsFz51xwD0xRTGPbImcy
         DLrw==
X-Forwarded-Encrypted: i=1; AL+hErH3s8CH6OViJLNjrUFzD9h+Wiv2fX3Um6ocOrFPkZxDLu6dr+UcJ7Twhw4jONIGA4vcU2ZKDVqC72sgLSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z81z/oTrwF79TFrME9WFOEYAYkkjMkfSO9kGbuE70m0CipFeiY3
	5RWFPKiN6gBW7ZSMtCF0eKdkHwCSzl3++ZTQLSuxJv7THZ0R1l866qLUrAwDkyGDvw==
X-Gm-Gg: AZFdTZe8c5B1Khgmcla2MtYxjKcIj3Prdc6JcxMzE7kt4d4erVZ9+LEftl4UgQf2H9A
	zV1uCvzw+qi+YoG46qnAssZScyL49GhP/+Nyz3kxKkJgnirgaC7CIyUH+QZybs1Gqu/QLXD688M
	ZqNYr7HqfmyfJFqN1FfBwogM5J63R11EZZ0V+2sIbYLFnA2xmY+MLZqtUC/eLbWATSfxdNwHjxo
	Xi8pbnztL6N3zIscjCnTs6OzxkbcB4hnN9loOUo3leMy9VBS6gxqlpd2MG2FOiueemiJl1qKXJa
	8opo3FumhTVfNe8p+0hmhd+KlvMJp3TDj2NJ9RiNbHIPQG+11XUE80BSr8z2EHkksRTx/hBkJWU
	/W3I9ouXdAhilGPjQSOIlCjgt4IV6OWl9tzux4dfpagP3BsH6iEysmopTyoSliYyJrHgGsxOeDO
	1+V5k40u4G5QZCe5+um/1PCvpTw/xWGLOO6f6tIqYsAJ5eAVktvQ0MqXSO7EYYf6d+gT1395IFJ
	JzhFtDHTedIwzPWovt3pjYUAMgDvL8lO8+XcvkByNjtL+gddhr5cRIHR3cQtXABErUejEXooe79
	ctYShpJWUg8XzFZRgCD5CfB9xPUjkq9mtqt0DAOwO97D42OyCqdZJruqMzhEgECl
X-Received: by 2002:a17:903:2a88:b0:2f0:4fa1:9661 with SMTP id d9443c01a7336-2f04fa19715mr99857965ad.18.1795481676747;
        Mon, 23 Nov 2026 16:54:36 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0817ab27fsm30599975ad.35.2026.11.23.16.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:54:35 -0800 (PST)
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
Date: Mon, 23 Nov 2026 16:54:35 -0800
Message-Id: <DN314UP7ZLCR.39N4XNGLWKR05@google.com>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH v2 07/16] PCI: Serialize bridge window sizing and
 resource assignment
From: "David Matlack" <dmatlack@google.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 <linux-pci@vger.kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>, "Rob Herring"
 <robh@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Williamson" <alex@shazbot.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261120134716.3027-1-ilpo.jarvinen@linux.intel.com>
 <20261120134716.3027-8-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20261120134716.3027-8-ilpo.jarvinen@linux.intel.com>

On Fri Nov 20, 2026 at 5:47 AM PST, Ilpo J=C3=A4rvinen wrote:
> +/*
> + * Serializes bridge window sizing, resource fitting, and assignment.
> + * pci_rescan_remove_lock cannot be used for this because BAR resize and
> + * some drivers run these operations under device_lock() during probe.
> + *
> + * Context:
> + *  - Nests inside pci_rescan_remove_lock and device_lock().
> + *  - Nests outside pci_bus_sem.
> + */
> +static DEFINE_MUTEX(pci_res_setup_lock);

Hi Ilpo,

Could this lock live in struct pci_host_bridge instead of being global?

As far as I can tell, a sizing and assignment pass never goes above a
root bus, and root bus windows are only allocated from, never modified.
So passes on different host bridges never touch the same resources.
Every entrypoint has a pci_bus or pci_dev to look up the host bridge
with, and pci_assign_unassigned_resources() already goes one root bus at
a time.

To be clear, the lock wouldn't protect any fields of struct
pci_host_bridge itself. It would protect the resource[] entries of the
devices below the host bridge, and the BAR, bridge window and Resizable
BAR registers they mirror. The host bridge is just the smallest object
that contains a whole pass.

My motivation isn't performance. It's that global locks make it hard to
tell what data they protect. pci_rescan_remove_lock is a good example:
it's held around runtime rescans, but not around enumeration of ACPI
host bridges at boot, and that was confusing when I was working on PCI
Live Update. This is a different lock, of course, but it would be nice
to avoid adding another global lock.

I tried it on top of this series to see how much it changes. Only this
patch is affected. It adds a mutex to struct pci_host_bridge,
initializes it in pci_init_host_bridge(), and uses a small helper in
setup-bus.c:

  static struct mutex *pci_res_setup_lock(struct pci_bus *bus)
  {
  	return &pci_find_host_bridge(bus)->res_setup_lock;
  }

All of the guard() sites and most of the lockdep asserts already have a
bus or dev to pass in. __assign_resources_sorted() only gets a list, so
it would have to assert using the first entry.

Putting the lock in the host bridge would also make it reachable from
remove.c. pci_destroy_dev() drops pci_bus_sem after list_del() and then
calls pci_free_resources() without pci_res_setup_lock. I couldn't find a
path where this can cause bugs, but that seems like just a lucky
side-effect of the current code. It would be nice to have the new lock
explicitly cover that case too.

This is not a blocker by any means, just wanted to get your thoughts.

Thanks,
David.
