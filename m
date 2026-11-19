Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111388;
	b=W63eNItn7cSwmay/oTK1gFWBWwwDU/1l40MJcHvZdKQal/q+codDZI+qviB4ZOq1OElm
	 RMJBy84B2X5Uhd0y6j1SuE17dc9sUrnoFqCftrv0iGBvWYG3mu7ks1neNdQ9chG7Ddj3Y
	 pyeGwt8+M8yvh0WA5LkEDVUgG4jK57TWplWoa1S8NQhmPML5kS+c7STHXdbZ1XN6CJ+hQ
	 gVIExnLvAR6a7Q3Bgy43BLmU1WgZrUh1p46JOcbL6RRWmFUVk2X9V+2Fc8cyUcb59B/8c
	 ImSCQ8WAeILtN3td68V1sOH7EVCtMK3CDusYhnL/Et8cShQ994sV7FGgpUDEkKZtVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
	b=MAPpYGC0SOVJeaxHbEZ3aNYanKpbF5KMKk0j21XhtbP33TkclZPOq6h6YzIkf7tekPNZ
	 kJSeejDu6qjWW4KiNnkoLYmnxlztTYqbFKfhmhsy7OchRjPIe7lnJUuTfGc91DWUeDXaD
	 Sn2ITSs1zTXioL8qPpd2/JvJXQMAbhbYQLRuXN65D1e91GebM+c9ImU7Ld1EUwpzK2t1S
	 kG0yTuwZX+plwW20Ot4pr00O66Soej0zVOZPzh0ZkdyWl8izhBcOezRW2I79hhfunFela
	 Xl+OSHuVhPrrJXvYJkgpy7RtbSpLq8w6haYvHDGf2F4/Zzsb6c3+qTR932RvpqUNzig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OT4sxAJ8;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4AA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OT4sxAJ8
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70059e4dab6so2544eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111386; x=1795716186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=OT4sxAJ8cCpw6tBjaH2XOh6hNOq8oq7Ex4XM/Wpwi4I8aOx67yJbb4tZSaaGbsA3ck
         90HTDt6AxMEdVd2A2W98q37oK2a68Rpa7R5Wl/LVmJaNL6Gz8JM13ZcC8tWwnA1JhGyN
         dIqLQICPft4oxfXfp0KenraWCFMSlTG4EyG7HIDcvd9dgrTlsNUS5O44lsyyOIdVGnEC
         U+naqMSFCm4IlITZQL2snE+3s+YGAp7aVAsYLpxhnH0ceX1jvrmi+JE3zD3OuzavJ2nJ
         aGqzJgdsYeoi3fVH09hw5fozUUJ+EmOsvylygJS5gCHsug+B88UP7iYDmNsEiX1AjnCk
         7oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111386; x=1795716186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=necPWTFdoaYbRiqVprsjFJVXbqXD+iw0H5wFj3v2IP/nYoNwIlPSiBVgbKuE/4Mf0b
         WxyVSoLrkpB3uisg6GqBxgmXO9IMHjR1xbJpNu/p2FaA8P7P33So320O8SgP/l/xoBzH
         KuIYSueVyISaMYswLRV8U1Yow8X+acMNKEq1/DKqlnlUalZAfwM3qRuSM9s+hBqQ2vdy
         yAYsf+X1mhAL1LBmDhlhBhfhOw/Vi5fOSr+/tKwZQmvYGLd4wm+uft2+nv0Kfh0EoPVf
         iILYfXmhNf87zc7/XfaS49+XGQ1grLCji/sgL1KIokM9CRjNQn5ifqL7E1fxQgv1eOiD
         9ehw==
X-Forwarded-Encrypted: i=1; AL+hErHYL0Z4nR5P13555afJgauMt/9jMS3LnnKr/m6QuKoh4cqoscgBwYwoh0rLo6s0gzhLF3GZ6BTunP3xxJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uw/cur+I9pEo9zTqdjsN9T9xAJS0cZQflwGxxS0++8qRtrkhS
	llnzNh38w51+UFpRxmS4IsOlStJ08ncBuIuFDd6lPLb2SkmIJk866W6u
X-Gm-Gg: AYBFou1A0/HpTHFu2K9rDvoVBFCQFZSrY8IaVlAcczTtdkIONWyRuoHXUv0uyaztj/3
	7P5FH/PjMJwuVtVX+zYReMnH/dhcw2Racn7ENVefjQnqV01uwdL1gGRFRhmnycjOr0GWhbdGA30
	CaTRtR5LqgNVLJz6VBunm65StOe/nGGdHc1b2JTYKptfvb6xBy7yNwSf35cVVyw0dTa4N3D2LFS
	e8NgOxJWrNHk6xXOizv6QyMiIhth9Hm447xcj8qjALy4tK1IHuGvZ22MyUIgLzptLNFr/zkqpA0
	BHC7MRfXHGVGwpyFb22v2/FUUaURf3aUndQ4hkEziHq7l9Uvhhsr9cLbk0byhbmBW4lYuU3lJW6
	2ZB21wk9P1yw+Kms2rsCNrfwivqqtm45NtH9uNFQzte1u+lF9UVLux1zh/ZMlQJ82r2axxWgatd
	1vXtgCc6mjQjaaEzNo+UywEFc6ZOOYD1CXG5LZgEsyagbZuTm5XvHLBZtrs0IdaB0KC/OyA5y07
	BqBkfMKrg9Cb32X+W1l+gMa5hsnWMOa6+89LTk27IEm33GkyXIyIuXjxl0FAuznbyvFjFOnkAm6
	223boftLEsLqGWO24zuctkouO3LnMtN2O+wzzavZRwN55rmLGqWd+aJD/s42DiHc19VTLFtxipl
	iA7DVmktR/WWk41ZV0/xi+6SkIfMwOTLT2+G75D+jTn+GaWMC54COflieMuoXKai0b2atx1zRFI
	VwbvFd+n9hE8e2l2ruUBaSks5DUgyBN0Zhp1BBxwlYe4H8Mut358+n2WVkI/vdDXUYtOMj40Ml9
	Q==
X-Received: by 2002:a05:6820:f006:b0:70d:a53e:845 with SMTP id 006d021491bc7-71b394d5f20mr371062eaf.17.1795111386435;
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Thu, 19 Nov 2026 11:02:20 -0700
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr2K6dkxboKAr72FctKWFUQqGYqMh3
 N0WNyw1meTnJz/vzUy8GdF4ctrNZDQBPQ59LNl+R3Qr+8YA1rETTrlgjGbgn8rhFKPPEWonQcu
 uU1LfoUNrJnQGAgMl2JFTQVUpLImsx2gsvlbP5frtEXQzekrwtGjRT8P4Xh8JLO3+dcZjkOtCU
 lFkjOb23DiJ3UEPjiRn4BsqK36lcqBgVVnzoiopt9WWuizLB8ex879CAQAA
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Retain descriptors through callback synchronization using a shared virt-dma
termination helper, then use it to fix sun4i cyclic callback lifetime
and IRQ serialization. The helper keeps termination usable in atomic
context while callbacks finish in process-context synchronization.

Also serialize pending IRQ handling with physical-channel reuse so an
old transfer's interrupt state cannot complete its replacement or disable
the replacement's interrupts.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v3:
- Leave prepared descriptors with the client during termination so they
  can still be submitted after synchronization, following Frank's review:
  https://lore.kernel.org/r/av8mu_ZFxNKSgFTK@SMW015318/
- Link to v2: https://patch.msgid.link/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com

Changes in v2:
- Add a shared virt-dma descriptor-retirement helper before the sun4i
  fix, following Frank's review.
- Retain all collected descriptors until synchronization, avoiding
  provider-specific cyclic checks and preserving repeated termination.
- Retire pending IRQ state before physical-channel reuse and acknowledge
  events under the owning virtual channel's lock in a separate fix.
- Link to v1: https://patch.msgid.link/20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com

---
James Hilliard (3):
      dmaengine: virt-dma: share deferred descriptor retirement
      dmaengine: sun4i: retain cyclic descriptors until callbacks drain
      dmaengine: sun4i: retire interrupt state before channel reuse

 drivers/dma/sun4i-dma.c | 68 +++++++++++++++++++++++++++++--------------------
 drivers/dma/virt-dma.h  | 21 ++++++++++++++-
 2 files changed, 60 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

