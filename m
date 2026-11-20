Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182569;
	b=zIFgOU2u8BgCtAPsoPJp7Eguwofh0xvw3O3Jm0a6qhSqeOaF1+gm3ItYqcQdnwWjA1OL
	 y/54AquMpM9cYbbSbm7D3R78iNg5OQfgg7lqudkOrbIPYN25DHXlE9swIl+wkz93cMDHf
	 Llt+UGBzQsfTJMAZ0G18NgR+JIu5KD4C7J5LHyiSMSnrC3GOw/VoNHBb2k0PiDaVSHHRB
	 5iGJeA0NWsL5ZyR+4zrWtL+I0ZYRawUwqDQJ5cwYqQTD/y/8zW4dyFeH+/p4DhynI+DIU
	 cv0kdA0+jUfWKkHkpuCliQmRwKljvTk+MPoo+yxQwrFVzG+CpadbWUrByHlr8mIZN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=jRe7KGrlJ8zVa9o/G3HkzBE6A8me3c0geOX4rbgHkF4=;
	b=loKWoGYcQnFFBY9Ml5rCeyJkVMnjzxeA/jQCKOPXuu7O98NXifWJbS/2iHhkTPUqu3Pj
	 Ifub5J6czc/BdMEWcqJrx3oehZ5m2TKT1K2TaRwCV1Rd4GZ9NljvNVDFnpPLH9cpkxG6Q
	 0QBLq/veo+wlmO6a6vuesU6snzFXWZKU4M/HZDmxKnbyTaDDLIPyc4D14nqf6IFIkQxJ9
	 sq8ai5TFfbky1eb3hPV9VUcJ3m4u0OqjF/WJVDjVkr5oXLw7RjK/ygxCjteug03X7qQ4Z
	 q17v7/g8q9Ms+FJBMqYgtw1GkK2tbVQEILsaK/gW69UX5yow5NSFvtxA7LEfjSQcSpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrLNMmM9;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F7060A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F7060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrLNMmM9
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso362799a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182568; x=1795787368; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRe7KGrlJ8zVa9o/G3HkzBE6A8me3c0geOX4rbgHkF4=;
        b=jrLNMmM9lHGUqE6QnynJ8O2ATi9YDewwhXcStt776MFumhI4uUiEqMm9VR0Yt1cga1
         rls+rMWKqX8h3UpyJOuvi57ydjE7ehpnRKZpnyAbyIrfEuUgeZDIzr4L0+Xr1UQDkfeR
         Y2QgaaFDCLcpDI9kj43G0huL2Ymccn9znNA+8qlukTWd7CocerqfKJuv39ttE1woWSa9
         LIa8UdZmjQ7ai6YdSege2XTpUmS5IVmVGEbGsYDlGcvT7PpBCHX+M/7DUzXJC8YjgB2J
         7XFeRE+HT4TQ3750cvb5cvKOxUEPBrSEZDKHGNfhlrJ2Wj5aveLxig7w9GG1Ys+ZM17U
         rCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182568; x=1795787368;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jRe7KGrlJ8zVa9o/G3HkzBE6A8me3c0geOX4rbgHkF4=;
        b=hjs3cAHtF+eQgTW+YGRXwWQpR1V8nqWr3sKnXOvBIoERXV0RTf1VYGjhgeFR5yu0m6
         vWVfstj5YjGhRkQjAd/Xl+qGPaBGElKN/MmU/o5d13klsBJLC7ZPJ7wg1tF77qMdcbCi
         ewlQRe+ff7I5gWHErri8H/eh3TGkkOPj6qqIqzbEi/2t9+JB/5gSkHa0Rp77dtGy0uG5
         qWRxeSN3n59orAllN8SUHjNxYb/wP4oVp2ATMzmvGbvXdL844Ck9jsaxWVtw4qRJlV4z
         VUKh2hKzEbOnvT8pJIa/HIPtKyq+xB0Qp1f7B3/WIBzjc8ZCXph5dbm6x2uA5lbgx3tp
         nnKw==
X-Forwarded-Encrypted: i=1; AL+hErHPMDECdK2bMHcpZz26dPySupsYb8jb8CtTXlq6/iV1gp2pGTORiJ4ACzj53U8XTXDqoqIOS5eRm7kG2Qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qef3wDFMTK7Mc6m0Qqpkc7QUkojmYxQdql7W9CX1rF6+nsY29
	oPSzZ3Sh4tlcMoHVkVb8hIkrIHgyVaL5sHwm8CBo7wRlyvYuhagBBEVx
X-Gm-Gg: AZFdTZfyAIPza9oIYzOYiV78TYMkumNpnI8G+OprGLVJ0ac8teNXBwDsUB5e3OZDplb
	EQOdNVX/fflQZqINncF5RnkZs91OVdnT42kYck6X9OP6cmsuKg6Oler1t55CgnBf4d7qpOAJqGZ
	bWr5GKN3gc542eDeVETd0S0LFBEOkgiqqpd2D2g+zq7F10zoXdqmNsAliE/OsGBckByletKunvs
	8zL2Y1WUPu4MLw2W1WlW3ePAyhCgM/J0Juw5csKz2ZfviyCL14mrE6Mkfqx043mIjT4nXabhNYs
	k69XsDBp/Nvx7CxAG7NB6r15n68loUuXm6d4GF7MQpx0nEI0NUh+JaeE5tVAweDROzJA1UkIKNa
	ziJH86r0YdGET9rLXv2dnLgp9a0FrqYzwdIuF2tW5To1jEWkzO+mb9T0cgbaU32Pl/mD1tvEdlG
	KKR1p6ds/DvhRwO8LUokxqOoTsv2pxu8je7Q78I+mi+vJ0wxo60aP98sWpuqvXfCoFXtVnC9d+x
	P44QGUFXqmuAZ8hzOOfXXL6eAAnOgNFzTu7VsGlw67kqCyLCzGYYW0Fk+ISwhkC9YdSzA2eijcP
	a1oPC+okekYS8V45GgolV5G4MWutnkJBLybxRJ+WJE4kE89a
X-Received: by 2002:a17:90b:4d0a:b0:3ac:ea3b:f28b with SMTP id 98e67ed59e1d1-3b41c9cd21fmr2674313a91.24.1795182568459;
        Fri, 20 Nov 2026 05:49:28 -0800 (PST)
Received: from [169.254.42.106] ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm4530596a91.14.2026.11.20.05.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:49:28 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] HID: sensor-hub: Avoid holding spinlock across child iteration
In-Reply-To: <04f2db47461eca6911038bbdb3d8e036dd92776f.camel@linux.intel.com>
References: <1795161418.hid-sensor-hub@viennaoffh.gmail.com>
 <04f2db47461eca6911038bbdb3d8e036dd92776f.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 20 Nov 2026 21:49:20 +0800
Message-ID: <1795182560.hid-reply@viennaoffh.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> Ayaan Mirza Baig posted a similar patch yesterday.

Sorry, I missed Ayaan's earlier patch. I've refined the fix to pass the
callback data and skip children without Sensor Hub platform_data, and am
sending v2 separately. The #syz test request was rejected because syzbot's
automated patch testing is temporarily unavailable.

Thanks,
Zheng
