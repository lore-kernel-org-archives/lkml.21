Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359556;
	b=wMX8sT8lcBPPzinPinohV8cRv/clzeMrsB09k0KCp4ekgioGtSNBV5txC2FB/yrvG2c8
	 M/KfnO1U+rIji6z0wnHzByLAXf3xPIqL37VDigNmoiSVwWLWF8qe/4NkcCC2iEnzpLVuv
	 UvJ+QJ2gRzJkqIORl1JxuCawHP7HCj9q9KMIcTENq1NrPCr+uNLunK5oSeCL4SxDlzz+H
	 gGieF7F0AGmGfZTp0EC2zlwOlMiQBXMTmoSLTEla1RvkdqGIEK1jvYw9YGSEwHs64sQrt
	 3FBQWnNoAj5tcDDlCCAht2YiC4FezGdXDvUPCq7hxM6OePV59w0edcBMMA2jqhHP6MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X1Jfjyzxz6MsAqZk2y0Hvxg0xcZ7y0VOiPnh638TQCE=;
	b=akh+ODPJOi2TEBR2/wiSy24Bbemjukw6A4WDL7jBu2rDhPU8z2wWRPYNBBxg8tlpVct3
	 8kbhJ5a7xHUg8WtX0OI28v7rJAwIoyHJkEd7LTdvLrnz89sLAQ/+V7LlmsGExrqQKwI4Q
	 m5U5SlngBi4lb/Lj9bwVT/2ZJ8RbCO1ZClgKP5I+AsTolpWffwJLfaFqHenPZX+k9u+JL
	 yyYKZZcRLOmdvSNx+PvqT+853vSk7EFWdMgPCXFbp87W+u6AjrKb0G9dZ7i4Bz0qu9dOG
	 cTe0N+DqDB5+Dkiol1Zn4GyG6FR1a7V3beBeSiLk4qKwW84LzxF9YTJczt+DPmZyL7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtHK1Dj4;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC152606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC152606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtHK1Dj4
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1207122a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359555; x=1795964355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1Jfjyzxz6MsAqZk2y0Hvxg0xcZ7y0VOiPnh638TQCE=;
        b=vtHK1Dj4u26EbXeP/gk7By7/NSSpHnHTK7su+dp0IYLhw4VvurCe4Rui6O2tus5WYK
         EpxjX+JbZTSzq8vI/2ELqcfL8nDEdXtQMSelG/+eRQoeztmCze0vY4WHHkczFgRc8wfp
         7SV593SPLQzH/q8dpU5JUSei2kRLs1Qm9ViGWm4cXCjLq32kfnT94GX6rM9QM9bhh1Ib
         s9J7/NRsJ5GmBesfoUTA04et/nrMAmaA4Y+WMjERMq3kdkSwL7OBJn5AJ+ag31r51Q/l
         mcnuUsQZQj0U18KpudZFPtjKoix/qnJaTWqD68dc35qvpPWHmCe6XVeGaZN7Nx05/nOC
         lCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359555; x=1795964355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1Jfjyzxz6MsAqZk2y0Hvxg0xcZ7y0VOiPnh638TQCE=;
        b=wETLjW0x+4jYoTEJff/lPedqNI4cHMJpkuxhHoF0dBwdnc9lUfTrtx4Uin8lEAV/pC
         QGO4n492/EjoWWeCN5K10popR+ulh0wW6/2QT3vM+VfCvrw+B9SUpUJ6vIrjh4ypBIT5
         hnmFbotb8Qg8hKpbcin3igh+Nf5aVgiudVppetjIe1sqGd2TbXLj3/kVQzk+IXlkiZg8
         ea7z/JB5mlXklOO2YAAxqLGrQN7odTcq20E3TK5Hx+jx4tpRdUwx5FirdHeL9DrE0hXs
         ZXXBFQuDya9Qbwvnm5SUW3z3fbSfOLib9V1dfQyTz+6rTIzN9KlTi8z9CRksQdXREg/y
         rVPw==
X-Forwarded-Encrypted: i=1; AL+hErE5Wkg2hRoHWhKszADhMyJYhjU5ZnVUtaxAf7csPoXnH/Gng6CIPIkj/SqPWZd+c3EICB5dloip3C4LPr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gtcDJeaA65FgHXpTyrzN7BR9uJX74Fn0f9o8TBMof6p4Wmh0y
	bUdqLgeDwkFN4fRfGrrwoL3M5ID9+v34TZqpgiouJgvB7CCR58FO2kyI
X-Gm-Gg: AZFdTZc4Sze6TMgYu8KonITRRKQ7JvIqjz4Z0NKQ054OKRUeMvJPJRr3sj5HxRXLs8T
	N9IDTsvlh0AjIg2z2GgLPkGqXj6bkOQdRQw4ltYNsFHVwPuJPQdz/X60ZnDWON3XSHEk/z6CRBk
	dHmpTCbW4vVvl0rfjQd73w0VuwIPni/ncM6BF4i7hGsgYqvSsgHN5lclit6Hfsa2Q3VURFTdc9W
	wHRHW9qEMoXwO9fzsW9tWx0PiDAmyr7tmBJIwkXG0sttQ4Ui8s0fVQ2eDuJ6DCmEevyKU4JZxq+
	hPy29kptVjefSNbio7GdPx4LxDX5GvCamek+qCl9lM+BMEZl/d6d2iGLGU4RriEBNOMQfKTVORv
	gBblur1C2TQT/9/rlXTPM/enlRutPTUYfDTN69RnwiNzIkKS5hajiT+nXbA7mleGo2iEigZfG4x
	JiErBZPijweMY56c7JG0Y5XhlTuydEkHdZWf1CRnSL1veyEqcrfgJvRDNu2qrwpd31PdE4GzkRE
	4i0VSk/pyHpoLlINeBQwIj3e6QW9Dxq7UugoPv/GPl2DTz/TlPbWUfMgKchgTEs7T+Ly2pVXdAw
	gM4+6gEsQqPPSzeBWOOswS5xM9eYYCkZ+Tk/6/wqXmQjZS1nKHA2gS08GGD7UmwTcVs=
X-Received: by 2002:a17:90b:442c:b0:3b3:ab74:cc9b with SMTP id 98e67ed59e1d1-3b41c554624mr7751230a91.0.1795359555081;
        Sun, 22 Nov 2026 06:59:15 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm16387442a91.10.2026.11.22.06.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:14 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] bonding: keep non-Ethernet slaves out of 802.3ad bonds
Date: Sun, 22 Nov 2026 23:59:08 +0900
Message-ID: <179535729502.2645501.5219010464870440@gmail.com>
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

bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
802.3ad bond, so a slave whose addr_len is 16, such as an ip6tnl device,
makes dev_mc_add() read past it. Patch 1 rejects such a slave at enslave
time in every case; patch 2 stops an enslaved bond from changing its
type afterwards.

The issue was found by an LLM-guided test generator that we are
developing as a research prototype.

v3:
- Add patch 2: as the Sashiko review of v1 pointed out, a bond enslaved
  to an 802.3ad bond could still change its type.
- Patch 1 is unchanged; its tags are kept.
- Hangbin asked on v2 whether the bond type should be reset when the
  mode is set to 802.3ad; as answered there, the first Ethernet slave
  resets it, so this series leaves it alone.
v2: https://lore.kernel.org/netdev/179505868590.3571070.12381528230330714812@gmail.com/
- Move the check above the type handling, as Jay suggested.
v1: https://lore.kernel.org/netdev/179500849159.1877154.14715369660816392826@gmail.com/

The patches were written with LLM assistance; we reviewed and tested
them. With them, neither the direct nor the nested reproducer triggers
the report. Enslaving Ethernet devices into an 802.3ad bond, a
non-Ethernet device into an active-backup bond, and the type change of
a bond enslaved to a balance-rr bond, as in bond-eth-type-change.sh,
work as before.

Kyuwon Cho (2):
  bonding: reject a non-Ethernet 802.3ad slave even when the type
    matches
  bonding: don't let an 802.3ad slave change its type

 drivers/net/bonding/bond_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.43.0

