Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427296;
	b=MS1lxEdNWFL0xPBNNYMmwaEyO2G7aIE2bC11YorT7EWmmvtMijxg84XZPxEAJJlSOsUE
	 AgideHmStTSpnzT1h1Y0Gipk8ek1r+AGsg0RGVFE5ZZqeq4hoFRLx5+eh/ge7LJJ8UAqO
	 5Dyd7/BcXvG89GPYJ3jEM0bcnlTWfyYo+KeeXmRaqLMRwzceQ3FKcGSIYfgWoiPuuWpaX
	 4jzygsFcZcmsqy5nFSBsR+dRcI07PD6/9J1SPPzGIbZICjzKLhqhgLAJv1CAjWad+cTlk
	 YsP38vGCaXBFx68hKM2MzB8TDlONF0xz3XPO1Mi82pXBSNyM6LMYwkIbxGoE9hxxYRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427296;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cWZpBhDqNHZ7OOEEIRJTwjTd8bE65OY0/Xt9j7AHp2c=;
	b=X6OD2ExwdnpMyBsZNeZM/KkckCCkxWwj3omO1/OvURDEPoFPunI3zj3lODO2xGz1V3VK
	 zET50xonqUDiADuHkHq77zxJDdcvJ50i/bqtiFozExU9JBm43gckBPU6o6LNRfNr35yKQ
	 ceQ7alspEskuBTXbBDU0lgo35foCwXVDYIfzCP4Ig2+OGnRBhSBQ1nca9vAmIzZGBtWx5
	 c3yzp314Rp+tGbTbPeW92qGZnb1Ky0gMqtnuveNbnV75y9v9jWzbZ116bIB9W6fhvwYeq
	 0kwmEFKAcm7acoDvOpA76+ecLq1bxkew0MilTTFeQcrBRm1GfGN2LUkR0l3pygorrtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20FC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20FC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eae1276409so1069608e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427295; x=1796032095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cWZpBhDqNHZ7OOEEIRJTwjTd8bE65OY0/Xt9j7AHp2c=;
        b=YB2MCspL2uc1aNfp5eDh5fVfiNbsLZkkSGR6PNkz18+9PrAWmuxHaiJ9HwvXjwwqWb
         NZA3WY5yzZnyRy/J0CmvDxN+iLCYwxSMztX4CYoGlTG2e789pIyB4P3yDH5/KFGJ8H9m
         f8oLCiUUjdqJzgq2+IbFoX6bobbvRdwnrj6eGvSyLf6oevAFOYpj2zbQMgmbviyrtGZv
         VTFMLctJ+kgkeL/m8tt6nrIIWmBscJ4yu3+a36kbDEqRyhU4Gm/154bVWRoAQkVGTGwP
         18pxIwxMmGX0PSy5FDk2sDVXxvCbLQ/ElhCda0KlPF3G//j1t4u8ATMi9MAOPTiLlOIc
         i7tg==
X-Forwarded-Encrypted: i=1; AL+hErG60ZcVRohFllUIHG0uIKOMBm2xTcTURZF3xF0I+8QaxVoitXezVLtDye6RByRvna57mlzggI+4nT3Xmzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bOj7wDBkQQMs/bQm4PNOZuYta9BtuOe+VQfEGViQ8EGCZJWiF
	unQAdw9S2+sRFjR8la9PE67WR5T9rf08RRlFpgPInXEl5QqFSXaxzgQIS4p3SCub
X-Gm-Gg: AZFdTZeYRGcjXSMI1E4/42q8Zyr5RUXNT3WsnmmD4j5652HbDCQIW7zD4C3sFNZvaFS
	cM3TxZqPi0VaZywPLpn0iSFdjynKn8tuyAKbJCLXRJYpYooJNfqtZPwBCxthO6ttJmoMajzmQcn
	/4un8Plx9SR97khDqYUosOQGS22cUKaeWc/AVHg8RNBl/NL60i9/gOimNxAaMMU4ysY7Obe2c3f
	Z6z4ig9UuiDwGfrHSSFPvB5w8P5IPGq7thZvO/MOCkde2THvX3vWFlZvrrIelHOC6WGNXheteZf
	b4k69yUVJiMx31OVTX/aFXwymVeX2OL7oEQlNs8jw8wR8INWgiiwtpz5qqNMyZoEDehBPhb1JBr
	ZVL0rnMX59peiifqRYf7AY9WrMJLnh3yYExkUzgDrs8yLdZxOqTAVklfdmmVLBy5p3dxGRMoW4o
	JmdNuARPKi7NvJJBSA7UvkjF1MxpD8ytgackcUhP1wl9yN7SxIRXxl4eRkcSCKRiQEIcWY0pVnp
	VXGFERBu1I+l8pJsE4KApJnFHi7Bdarvwp/lTwogAgbieIwxgwnrIdD8jZSQQHbBwPfjjqkUTyN
	a1vpJTXveCRTor0gC8f2kR40GGsWg/oqBGK9iA5PdKdRhaEWOnra4UgOM0yYoR2CcJU=
X-Received: by 2002:a05:6122:1784:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ee8adf34f8mr4784590e0c.2.1795427294824;
        Mon, 23 Nov 2026 01:48:14 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5bb61asm10224315e0c.10.2026.11.23.01.48.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:48:14 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso698173241.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEt7jZJyIwHbB6m+CX0PS6GOYdKrCKDDCiHHfE9OvkDjrp/tf9ejCTUq7LkjOvH7tIh6/WTP7QfqgYf7Kk=@vger.kernel.org
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7d72b3688c2mr4372703137.4.1795427293752; Mon, 23 Nov 2026
 01:48:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121034304.2dPxVKzk-lkp@intel.com> <0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org>
In-Reply-To: <0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Nov 2026 10:48:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
X-Gm-Features: Aa3M54rqU2bNqHYEoVpo9DgHQN7kUDp7nLSe10xRxRC_Yz7fZEF6xyok7yTvw-g
Message-ID: <CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
Subject: Re: include/linux/compiler_types.h:631:45: error: call to
 '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
To: Finn Thain <fthain@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

CC scsi

On Sat, 21 Nov 2026 at 05:10, Finn Thain <fthain@linux-m68k.org> wrote:
> On Sat, 21 Nov 2026, kernel test robot wrote:
> > FYI, the error/warning still remains.
>
> That's because the qla2xxx maintainers at Marvell did not respond to any
> of the three fixes I sent. I'm not a paying customer so all bets are off.

That's "[PATCH] scsi: qla2xxx: Rework BUILD_BUG_ON() assertion",
first submittted in March, right?
https://lore.kernel.org/all/4808a5dc1a71528ffa3360868561009744277450.1791502886.git.fthain@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
