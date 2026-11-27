Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797665;
	b=obE83DscDVurw6cHbBk16nFa72M2NZ4qLAgCxFhwTdR2qLxAjmjZtwmnKe0s26famXhs
	 rN7beKYstByN9DqcQJ2iud/xEb+zRiQwKtJpsepXZ9BWv2+v8R05eRGD08HeGElaclbMy
	 GChlkvc4E/feGOG8EU8uLX2ViioIhZ/f4yunMz5tsp2rzXiiSAli0BkYcx9zcjIYab2yf
	 eZcjEnhGCQoMCT8Ou3N8NiQEq0fyUhc5ac2QFRnAa+qos52HLHrPccWRHdw4S6t7rLVxj
	 Ra1PkVXN6LMPVPoU0lzMJvYt2M/VmA0MgZJ26/z6NeGtfc8B09uhayNgaRPEUq74Uzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=E+7zW6UhfI3gqV3DdfYb2mC8T84sI8f66dxP7719aj8=;
	b=DlqjOyalEotbsmwvMB09EVEzB87iMaYPEuP0nsgHNWgYsnjvIRNfPuGExSOzxZumL+4u
	 SpkpDZl4ptqq7D9QM7LrFXBYYbUieor6HxiDXD/8BY3LiXtTS0vLzKA6nEX4RXd22hoz5
	 HyxTabXpqpqvGt3+CpOXj/vAbdptNL3YC7kPpUTKxWUleH7z03YcYHzQggGPd7BEItmF/
	 rnRoBu3BxP6scYLUeNSVOWIYfN/wOnjqAErUu469QZWOuulWPEFygCJ6IRMrsBXlH8xQQ
	 m7o/iqwM4UtmaIbX8A0M9dTKYOQ34MakfTxT+FEUbih0u5L2IZ+BbPsJRKu/faF+miA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyqoVg0m;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2533606A6A0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2533606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyqoVg0m
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50e26763a4so411840366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797663; x=1796402463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+7zW6UhfI3gqV3DdfYb2mC8T84sI8f66dxP7719aj8=;
        b=wyqoVg0mb44j0zMIWvMwh/4zrhAI9LNAIrn8wwBtad2W00i9yBL/CQrHiWxjU/EmWC
         6hFKl2/FfbacLRLrOo+vb+cNQMqPePZqO54rRmvCRpKvO59m2WHLaft5e5ogbGSyqrwV
         oHZLGtqGEu1kCF41JCx54Gvpx4gksqR1oQmL57y8vzA66Dkmmst79HpM66E4xH+szXVS
         KiL2bHKq40B+U3UHyLEONkpSIXV5DSgR/DjemxPns1dmu1f9nMjhejzWsgL1RW/c/3po
         CvovmWVZTZ4JDwViZvXiCpUYZPf/SsQt0IslEw772ZIn/yi3czS2iOfgZGHfUDeIQ9aU
         NeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797663; x=1796402463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+7zW6UhfI3gqV3DdfYb2mC8T84sI8f66dxP7719aj8=;
        b=KCm88isvDO0Ohina1yoWzWk1te0QS0OWBQGGSjb1a86m5PW6oQIxXZfDia9uJf6MNc
         58YZhDPUa3YxFh4UhxDfUeBp3j1PuaLfy1MPlhbFnTQ7EHpL8n5TfGKL1a3tKKfGMHhh
         ctvtG241x4x8Ap8np4Yd1pHfllv3jIud4M30hPCkx1BWOqO10PRz2AG/CJGISiSuR4jR
         qcI6ZFV1gDQe8bMTDgQCKCkNgJhQXFWTN2LXjeZI7wpgaRvSNJTXOU/MykhoNFEWMTus
         oi8Y7lpq4wdUJIi3NvGkYNkp74sq4wCFe7YqFgROXKzxblCYESjxR1bAF/7jI2yQOkFi
         dLpw==
X-Gm-Message-State: APuU4Z8iz4nhslBNDTQywXiNZ5E4ECaYWvwoT2BF5V+Y66QL85niA6t0
	+RzBS/BTiFMagg5GojR6OdCIkLIkov9WWgGhAB+1DVlPu9MQoKmwNNwj
X-Gm-Gg: AZFdTZe/4hKofRa/9B+Bp5p0rqh0uASwJQCvLuJCB+5Ukswx7WvXkz/nwx9SZVbFVHK
	/B9Q+7IZmWJcT6e1X0SUvj6raO40mT137Rv1SUMIOm3JbeZu1GShym9+8BBX0daawlPZCV/OKpT
	8j5IPHQMPb0wjqwt97M/iGDEUFu9qHHMTMs3spCnNOh/U/mHDhA7u52vAqvRqHNFncd5mEzusAg
	29PMlliBuuaMiE3ChR7QNfKmDIgyPu6SJ+imM/UFIY1VA/5au5CvDbT7fHMiPZvLUqbOEF4xWLR
	UNq3hu+rU5jsCIGY4pL8bsQ1MhpoWiZjHa+0ydm0iV/8+QAqCE/zE2ESbNjgcAWVQuDMdX3l8IG
	/2Lh/f6gcejFqPS0hsAbbtuD5bHHVip9YCXg4Zi7aZwvXirsm9lrbN0N/6wLXAJIKOyMtgtF1nH
	xiVIdnDi9oxoTm35DlmNXHt/GmnGIqFBtREDHSOkMQ3ykvWDXEHexNqNNCIjjS3NpH3O8Tb7SPT
	3lcf0r9GyN1vCFITU61kXx2vqjkO51FseTQWQCnR9QaK423Uq7axKHFTQDpNvT8iFIv8x1JolwK
	z95h+WwYCnQexnKItcokFYPvPTtRtOkfIuIBe0Wx5jVEfR1UdKZbhfKB9AFSgw9hCSQIUhwu02p
	qDZi2auFSr5rbRpa5wEj0NzyT/QwuCyE=
X-Received: by 2002:a17:906:d263:b0:c2e:4fa2:f3f7 with SMTP id a640c23a62f3a-c513aacbdc7mr1986868866b.22.1795797662955;
        Fri, 27 Nov 2026 08:41:02 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/6] mfd: max8907: for Lee
Date: Fri, 27 Nov 2026 18:40:38 +0200
Message-ID: <20261127164044.285910-1-clamor95@gmail.com>
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

These are all MFD related patches collected from my MAX8907 related
patchsets.

Svyatoslav Ryhel (6):
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler
  mfd: max8907: Add ADC client support
  mfd: max8907: Add ADC cell

 drivers/mfd/max8907.c                 | 243 +++++++++++++++-----------
 drivers/regulator/max8907-regulator.c |   8 +-
 include/linux/mfd/max8907.h           |  57 +++++-
 3 files changed, 193 insertions(+), 115 deletions(-)

-- 
2.53.0

