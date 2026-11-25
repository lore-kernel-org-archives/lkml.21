Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610522;
	b=M48MoQzjkJCjuaMQZIwy+czsrxpgHoAQG3weWXeanFinGUWVg3y1Fp9fTj3tUJvT3PUG
	 F6R/wVJ54WEa61YmCLtHPSgmowcQ3ZKa/RtpIJ2VlQYRkkxiIrfrJUFrKb+KKRVi0a9iA
	 2043BdBEISsLQDpjGACepcpY0+POZYVz2g9RhjU321UBCpl4jXBiqpIzO+D0tn6d7LbKU
	 v4GhuP/fMW3N9QbUuFHu9XcID/tLFyhF4mAl24WUla0+w3bxWTVqPEETEG7Ql+zaQ4+kB
	 /3gmMYoX66pq9f8sWqJCFwlBSkS7lQj0+4IbYvYyVUC/0v2cytjOtnOFVS02u2sHdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
	b=Ik+cpEJim3h9XqkafLFIt4ImDt8GaOMUT2+TD4w2d+GXEwZHTiZlN6UqocgQwXZpR0uk
	 6uaeRkHygLZwKz8c5UWS5F8nxwJNP8rshy8E+wGMEKrqAZphi1U0x9Y0zQS0pILFy3oot
	 UrwLFQVlyHckhtjM+gSAJvqROnB+Wbt4jtWIA5w58ZXbOAakSM2JRzFQbo073/wTir2U8
	 ud5iZd5Vw/VTqpPZQp/MHefs2sbSaa+hAyZ8eDERUe+Ex9LqbLqh+hBxwpkdJzES+FgU8
	 3IPsD7JknxuOZs/Bw9iZE/kz3/1+ffXkuMhSN1VQI3vIJtNdSFmXTC9RKCXqCDtNphQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEnECypd;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109BB606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEnECypd
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so2981482241.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610521; x=1796215321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=sEnECypdk7KhUAuwHAJwkbWydJZy951eF+Uff6HU7RKtBSEmE5wi09kP7Homq3uwia
         VY3stvZYw56g/s6sYlngXrgud0CbnUtQ5jjreUqBqaM2f+MGBznZHDJ0VVa5c6XVFYUV
         9icUdpi36L1MSrexxgh0sPfjTJeH5vu0H/oR4GB9A3oZa4N1ZR7/ysgUgd+TTcPuPmt6
         lg2xyUck5Pe0ecOqdSnTN4LOD2LA8ak3RzCetCzhbQr+X3MsQW9dq5O+g8QuUUH/lfxt
         yQQB1+8Qhf3Ws9z8Q8/SDdBWMh+CiYW1g/qJGbXs+US9FjyZqHIq8pWgMbHobZkB3bpV
         uxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610521; x=1796215321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=aq4O0TS7l85itdI0vfKHGYjTEMJbH8jVEf9rQ1tfJIFJmmSIrYyWoIlRFOYElso/jx
         wYRUH7/dLDJxMe5Xeh0doHvWngAM5YoyL6Wg9ygh7B0pyk0J4q7nSHJEuNetaBwKsF+Y
         qoBo66WEvZmAGrtPWhWv1wMs85/rNKqixSoaM4GKJy6RfPXOzCTwd1opWEDVDlvI6oJE
         2f9TQqVUX+fL56hg3KXnrKRA6awAVVaQUcUdo+j5zS1nvDP1OqyxqeE08E+bofLgHgB7
         O+yNK8u4aciXwXIYBkge3EKIoHMwxqPp8L8v6bMtsW8rSRwlaI3ErsnM2lTnP/sRtdln
         y8AQ==
X-Forwarded-Encrypted: i=1; AL+hErEK99mSlPhhIZqz+ShuAnjBD2ax1xTI9fbP0fGEVCd+uR2L4SKP2oL1QYmVE/DeY/5ekx03CWpvpHP4Pmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y8t3DJHTax6sfLpR3Wqg5VZgDW9Wqpp+AukhWuO6OOj6SFDye
	7Jl/+VjRBxvNUK67N47QM7wEBbXAB5XsoEN3sraN9NXLrW5bDnXZuzlT
X-Gm-Gg: AZFdTZfzCcC3tGCQfD1hv5nOIIUmK0TIBgkTLkcGIGGdjI6uXJy/TzPVINU/grLToS8
	OYeez1ebVf8fBt6g2ggA5hXkUwW3dL98oPmNn+rHsax2p6spCXFVsEC3B6IkMk7uWc6EfcYLk0u
	z+bu1evapXmrJ5oyaXMLt3o0PQ8orCWlGNIsq+fQnzcrRpiJ1fNuokWMedJsHX8/AVnkAY236SS
	dBKXuXzppxiHfn7Nb7Xaqgrb7l04+JJFsbBl3F1ghBemxXk6qkIehmQnyZcs5FRZsz3sGTje62q
	9Kbu1yq5qp69MX3lR0SmuKzh5Wxf1kVJYgnzkeyGzoqBSyFdDCvW1Wbg6KKf8bN5/o8eQnCkzS0
	NPr7tcog+9TEA/mQf042BeNQaJzNlAQg5CuH60RWLO3EQ8aUy/Yl9I0rUabpyOCxY5vvJN6xNwn
	t5qXjt4ccQq+ZllnbI95Et7/sNBtyWZ5Gozq3nCz036vF0RCUYcazlwfCXxpNI4vYEJhTo27fPO
	N2xIIyX+0s9JCPJcGmMbhBf2VXgymekq23wCsl/PS41ThOK8UZitvV9VOY3mIdCZQdL12dQVlgH
	5HBZ7X3Nl12icmQkKsK6n47UYujQjXycj4OKjqdG3/2bB4xSfldPyz729w6ikpYTW10vN5GwpgE
	f/x8Vg26WGwewXVdtNhtY9fDwvKJmErQW5b7LC2ix0sgIEo3L
X-Received: by 2002:a05:6102:951:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d73939011emr10098810137.12.1795610520935;
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f600:3026:6717:b8b7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm18213181241.7.2026.11.25.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Wed, 25 Nov 2026 09:41:39 -0300
Message-ID: <20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre, Enzo,

On 11/24/26 15:42, Andre Przywara wrote:
> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies
> once.

That works for me. The A7Z DTS is ready on top of Enzo's v5, with the
review comments so far addressed. I tested it on my v1.11 board: all
eight CPUs boot, MMC0 readback matches the reference SHA-256, and
card-detect hotplug works with GPIO_PULL_UP. I also tested PMU counting
and overflow interrupts on both the A55 and A76 cores.

The A7Z binding entry is "radxa,cubie-a7z", "allwinner,sun60i-a733".
Krzysztof already acked that addition in my v1:
https://lore.kernel.org/r/20261113-tacky-unbeatable-pronghorn-74ed4e@quoll

The v1.10 board is still untested with GPIO_PULL_UP.

I'll post the updated A7Z DTS patch to the list as a follow-up to this
thread.

Thanks,
Vinicius
