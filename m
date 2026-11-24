Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=ErdYnGFeXxnPPwztAGYRedX9W+aJPyJHz1ScE7affQpu787cbPOQJ3h2ndWR2CeK3vwY
	 CU4Q7iDGpLZBBaDq002KAazqC30AsoUeYrkN+m4VV5oy/4KBsUOG6CWo2tKZf0S4BAPb3
	 E5FJ0rotmgt6TcOFX4Q+uwReEiirptYtdWsY/CwGE8eR2vbmbQPPlrPQL0vJImKjznh/F
	 01GIiCB06+DBorIPT1f7Yjo2MZ+Syk6baOAoY9yzen4BAA4nll+HjLRGeeL0u3Uuhd+Zy
	 9xMxYr+tRzt8ILWE00nUEI0p8hXTNQRD4UoVHNcS9fzy6fswi9SPmE7zfBDv/WjNOTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=x7LWxwViIoFhrfALKAvW1/BgdauEsZTaPzs51izyiK63sM5Kgz+oDN7iyZeeBrDlQLHA
	 kpvxIZHp1DUQYXVrDwAWya2JJBjCTi0FF3ufas6SnKywv0XMvvjomxEuBEfNaU9YRYkdr
	 t7+uRUwyiF72copLt5L++czmIiIJvDJzrXRkcjYwKys4fmOqFqCq+1n1LK1r/qhyNYJeW
	 AOuQgulwxrA9y/TXDaj53rN6AukYUlCgdUZnkcRuNRSrmjdXn/SRYaQ9r+mprwQu3yGWB
	 114RkAQjr5MomYe2CPU3m75E80hk+49DmBRXa4z+nqTdm+iSTyCQWl1l1/0TkCBgROw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28365606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28365606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KjiX7YWe
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492690dd5daso3291514f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=KjiX7YWeSkA9Dw0WA5xjWaOqnyEHCedD00sUzMhE3sKEAvQ2TPIHmIyS+enWPn9hqU
         UHnNtz+vsI9HdnLLJLRNEHpW3n0qDPjDGGb+MMmUEkY4+DtknEToZAEEAwd6ErlDRM4U
         sl6ks9V8P+KgBQBXge6XtIwqjU1IX32GeqDZpfsQ5053CJLA98ICyRMFUcjrF7GwSx6y
         mLBhDMnek6X1+TiwUBOkVQB80sS1Z2oue9zDTiR4H+wlMmpVb+6EJ+EZoBBfGsOtxa1G
         85CHt1w3B0RFKCYDolOV20zywTKINPHyMkeAAvRZwyufXjasNY7vVq1oJTMaEgpAJPJ9
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=z1h0F7BMk1jTotQgaX7klJ0HUc5yWTyw7I4aZfXXsNWvXfKuZRqg7FRudsuSLFS6UL
         guRcZxioJ5iK9Gjj8m31g9tpNW98FKYKZZsCnBYzM5K8ew+n7KP+ZkFLyNkE7PxlWe7r
         OvcKG5NrSd/JlMLSR67diIAI/6+j+dx1KQ7DhLBazrGdpcoMKIuaKG4b/Oh1V0kn79ta
         WL6L/wPb7kG0j0WBCgUkNW2JSYdMxQ37bf0uCk2tuUYTd0G+dL1uvTUdbqiHro8mQCTv
         /aL0BaBPARuwzY8KoEXGeAquw7hv56TxXxZ0LPcrheh080726D+ACqf2qA6101uGsix6
         2P2Q==
X-Gm-Message-State: APuU4Z+kTY+gG5/U8FC6GJ3vZwNwLusJtV9WK1870fetBxPZ6uHLjCx3
	eaCgylDRgnmk1Z9+FWZfSyn19DiCtXWR1mcwkDxQnclT0LDuNBJPSlfWifSXcAEBBr0=
X-Gm-Gg: AZFdTZeWoilO2KMw53/zdZSolEo+lbAwOljW5H/g0pNn1GKo6vGiI5wRk29/TA4NlH/
	0jft+DV5aUtgmIO8x+pIs+PG7yMBd1/P2yj6rRySF03Z6DoEcf/hbJ6DQtM1xoyo8xYNhFqG6AH
	iqBopOL8jR6JkAC9/iDaC8FMkbluO9VDkf3NN0/tWAgN9eshQ+w1yEBsd4xjHHRLIm7zkzOpVPf
	MyOml1GK84TG/jH0SJ8qvZk0sjTID34KmTogXCSBl3qJKlMFeDNcguejIECgJ0VLAOfeABf/W8d
	VhBXKnxeTqiTO3+hupNSN+QlnSWa9OiYMVltiTQGUYxivYCENEl3yOuEsv+Xd0FMJrGw6ycWKcT
	mB//0bjhTkHbG9yLOq9xSASeCu0LFmwOR6Y7p7gtLFswZBoiB5w47lHUFrmlPuxU623gCTvr8p+
	z6dzrZBoP+Pd+nsHUl5iaBVf9dI0fvvNzseo/0X4hMnO3c6XKbh9xmvK1p1m5lGOOMckP8sQfn1
	Mu6Ibg+cjhYiNa+wV/QB9fXmnMXqXCZtuTeriI8/dv8Nbp75fmxZU+R9aFeSqVB03v3J+tmXeID
	A+Z3x8WH5kNHv6FIA9JGk4GXAK1EJ1XmU6z+zP8cQ/7mLciVgB+3ebdzhVr3XPOef64w
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
