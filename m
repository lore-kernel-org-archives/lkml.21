Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068003;
	b=tSfHlF7bnDLWLI8Q3C7KBSx11MTHAPtVfg10wAWJKiGwcIhrZmQWitP3lgL4VQ9L2Pe4
	 G/Y6HEsOCco9vMZgjXK6zW65cP4yT6ylUVJHmiTVKQBVezdoUab3knqbh9KdVjzvH+5pD
	 I2Vu5pfO5lDT32tmKJQLEFJPpVRr+LEpiGyvT77yFKXlGC4hAKkeM1TDNsX7AgAJsFYht
	 TJ2JqhwYRnHQyfKFIqQbGQpd0CqMGhejzXfVfBJBcInn//tLNB2Gs9pd8RYQxEP5PwUDs
	 zMXkE/ehJ8vFz69spKmvZxnp+gt0avIZL5aaliQWTvsxU8Nf4pBj1K6xTpbnW5QYrTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068003;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wgP7/UL6Bd9Sg/Oh5ftSdA1lXlTal01x5XIHbl6l9Lg=;
	b=yszZ7V4P5bIWS8XtaXVeoL3iDoK4k1NLO/4iK+WkQL75Q5i63km2RRdr/qF9GXgYlIgj
	 FVBgQFOiLtpyYHELtoHCEsa0VLvyt5KPD1FBA2V4NBsgDcWuKrxkHc75mjCARTL4lFuzr
	 6lbWQ18eYPijeBxhYKwkAgGW1Ag1o4bHe7MA7RziUQzXcHEP+8ngOxncOe2gC0LXgw7QD
	 YCMdup9zFjbIlCaXBgBJfMmIJNebcUy1r8gH4ZB4dJutqzcpEQRiUVAzxWzmcI1YhDxDL
	 skzutkM4P6MaSUvmpGqL0MURsdr9bcmgJfT8Esnf+putP1nLR/bp2H323+Y3jwAWrmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Af8BNbt6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94881606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Af8BNbt6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC071F000C4;
	Thu, 19 Nov 2026 06:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068003;
	bh=wgP7/UL6Bd9Sg/Oh5ftSdA1lXlTal01x5XIHbl6l9Lg=;
	h=From:To:Cc:Subject:Date;
	b=Af8BNbt6+UKEsFJ3TNjaaKjs4g4Fdt/0/oQjsUYOR35IgW5qklZYNp2SwxM9vM5mv
	 zxVU5wCwfV0nOs6tfzkbVYzfxUX+K1aYwj1XRrYx8sjFMfLorjFuvX5J1aw9OfPBDx
	 sZ5MLLC0VGNijp54p4XWlBH0cyDSAsBrM+pbONC0k65fRWZneY4LFTeYIP9ZOiaFbB
	 zNtwfhyOM+6B6tCRox+LmH763LrxQGs+0pF4JtIHhHPZ3HFE8sLocr5Nxceqii0Pn3
	 HM5OFzuD3PnJ+9ZceWOjGL54BOdM0w9kJgj8Ui0sIoZnq1ZaZdTs6nlFp+DlLHyJmd
	 uHpIg2AmQ1O8w==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/4] Remove libgcc dependency for ARC
Date: Wed, 18 Nov 2026 21:59:54 -0800
Message-ID: <20261119055958.1621709-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Arnd pestered me to do this.

Most of the generic emulation routines were present in lib/ flready.
Thanks to Dinh Nguyen and Simon Schuster for filling in the rest.

Thx,
-Vineet

Vineet Gupta (4):
  ARC: math emul: elide 64/64 divide and floating point routines
  ARC: math emul: use existing lib versions of libgcc routines
  Revert "ARC: Strip libgcc debug information when generating BTF"
  ARC: stop linking libgcc

 arch/arc/Kconfig           | 10 ++++++++++
 arch/arc/Makefile          |  9 ---------
 arch/arc/kernel/arcksyms.c | 37 -------------------------------------
 arch/arc/lib/Makefile      |  8 --------
 4 files changed, 10 insertions(+), 54 deletions(-)

-- 
2.53.0

