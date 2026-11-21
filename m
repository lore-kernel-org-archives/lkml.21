Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250395;
	b=HHJouJkiBup5s8pbP27M7EDivVogZC2jFYH33i+0vqT/Vjy8JlCvpxdynLS9g0M5e+R9
	 QK/tPhXe7j4ZBSByOqFo7aWc6C+94VLY59OtFSrZeg2pj+u+XO0eCAQloY61BNJ/tKFfi
	 XLMMt7/xNychXVL0SAXaFgrgR/Z1srd88HozHU/e2a/Q6ulqnOPMiINYxNUcxjHoBhdUv
	 akslz4IwFUs/3OAsTWeA0pi8i7974pCBPY0IRp51ZUnU+I2NTi864CK6JdNTLJFOkR29I
	 jucJFNU9LUJ0DrXmbZYy3J64Z4/OghRuKvEzHlfh15sP3jhhIabJc7TYRJ7EkLxEfCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
	b=y5rpgVGFU6gmweEnXfGiGjg1pYnMyWktA2kiOEIrlASlGOPSZTEpDICcgk2dHWbK5IGV
	 kpjxIqH9fGAzFCwi4E6nlimVJ/a08qJtKz9cNvc3gHtZ7BMEtiNMJuu5jQnXyEueNjcTx
	 /ihKpYuK8t/Rr9dAysPoYrvWJv7bXlXoDKgSL6GXJeZk7x4pWXVjBs6KNls0WRAFECm8c
	 StzI8OhZXaVZ2X3HLM1V3iRdsPDAzlVB0hnRB/0lb/K3qSTWpVSIaYgVVN9xOSpGqgNEv
	 RrOzBANHcmR3uiojiiqiDKq+sJ7bCywcXqZJAkqZD7qVIp3H4tsLP+RAor67YrC4SAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kniaV7DV;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A8E606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A8E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kniaV7DV
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso257793eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250394; x=1795855194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
        b=kniaV7DVBnnPzOID5eDXiZeFp6Ebsh9Zmw30igykxMbZXXtJyjUIRMNWc2Peab73Yz
         +rX9Bj1pYvJXWojcbGba+dQ9LCzGg01E2EAqpEsC1k7IpnqHO54c6+o26VcRmTw0CqAl
         g6QNIO1b+ZWrg8akS94c85q3kHfOItEEiuKKsNNmmfx58FYKYUjfMYOXx8iQ+orRkNtN
         uzf4WQu1Z5H/C88aU26XjQdJX7Ul9rUV9zOoP3Kr4LvuGK/b8bkcCTQlhk2hQ3wASd5K
         Rn51iUCLvyzvQmd/HRcV2n6TpX8xKpJR54zsPqe+OHUwCH8WG2I4A+W8R3D3RkWF4oNF
         dMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250394; x=1795855194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
        b=PhWf+ZQfb8HAQoovVrweHtIWXqU/CO/ZsDNI2/7YPSZ3nyBDPGHUNChyq91gkRO0sN
         2tHfFULsnIqSIF3ADQ7L+shrWUNQ++kro1sCGsRgpmje/XUVCAvdFo1DBFOZL4yQXkIh
         wCIA+A5Qj0/CHbHGZRUv0m3+BXMHDvF1qjjKKLTGxQygm/Ne9pGO2mKWKhsF3GzYkuvZ
         aUdM2Zp2++9v/Y5vPD8kfTYyB/SQk/XZTL8tzZq75lX8gEpLH98w7ecSfpnPLez9D+B/
         eHa/ZT/TOPGxY69rvMXnJPzDJxIdjnt5zyj/K/lP5cC6wQJuDGA/goYn+bxOam1Z7A3f
         eZgw==
X-Forwarded-Encrypted: i=1; AL+hErGzzmUJP9XzD6DmYBq06cmB9Yw9evdPoWyZ3f6/yLsXCdOCqN3UYlvMY/Fo7XWYJUVK7F7cOcUB5Yzbp6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zwAVY9wMVN9XxJvR1ouZ8Zb4kT/HuyLSP5XVZpWNPIAGH3Mlz
	Pl3j3ke+EaBRLTpr4unSJ+NZoJ6PSg+JvNYkJXxxIP2sEvKrjjj7CAv2
X-Gm-Gg: AZFdTZfTOv9kHjaDICF2uO+IvBGUzb32sV+2F1I+EZt/OXF8Lm02s+TM7FB3EDQgi7M
	i53oepry6UTO4nG5NxXLYCFrbz59w+YUNlRV2FTIs0WvlAXab3ku1r57W0tXoUnSBh89WsxmMt4
	WZ8ohTNy+Hho7nMwQleNgx2O7sLGlN1PNPPogABJiLJUaOuSgmT1htY8iKhcE74Gt5OSSQ19gcV
	wNBgJKNoHYb4D4EqtBnavcx8llXRxTYeIjAXq0iUofTm/cJLlvIgVjs19sJ1nzccGPF6PVFyEsu
	FaiTW0am+U2U4FVpinLO950eM/tjZvTRKH/IDLkeTKh3+E6k/LvtSldPeiczL/tBwaz51lBhBgW
	v6f1j8h1BHZfkrJLbr1zYLOVS1dlmAnhIGd5Hu+9mcaP+8LNBhFqtPvx91agJMhJ52a0imvhcs/
	mFvPSwAn6yM3jWpt7cWx5aS4FyTEM9xdBTnhTa1bZIVjkGS8m2stZTDfqWMRAVYnpRbjhW7dR+u
	/id3mvmT9RVmoeitWCfGtdbeV8Y/39eRWy18AgafoBOFv9kwYLttrCI3u5CMT4AlzygSmC3Rviy
	GLLknaKrGZt6/pf78dgH
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id 5a478bee46e88-3869ff18213mr549553eec.4.1795250394091;
        Sat, 21 Nov 2026 00:39:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:53 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 0/2] arm64: errata: Fix two Kconfig column entries
Date: Sat, 21 Nov 2026 08:39:48 +0000
Message-ID: <20261121083950.1957044-1-takano32@gmail.com>
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

Documentation/arch/arm64/silicon-errata.rst names two Kconfig symbols that
no Kconfig file defines.  I checked every Kconfig name in the table: these
are the only two.

The GIC-700 #2941627 entry names ARM64_ERRATUM_2941627; that workaround is
a GIC driver quirk, matched at runtime against the GIC's IIDR and enabled
through a static branch, so there is no symbol to name.  The Falkor E1041
entry names QCOM_FALKOR_ERRATUM_1041; the symbol defined in the tree is
QCOM_FALKOR_ERRATUM_E1041.

The two rows come from different commits, so they are kept separate and
each carries its own Fixes: tag.  Both are documentation-only changes: the
table keeps its column widths and no build was run.  I did not add a Cc:
stable tag, as nothing outside Documentation changes.

v2: the change is the same as in v1; only the index and hunk line numbers
moved with the rebase.  One changelog sentence is replaced in each patch:
in 1/2 v1 called the table row the tree's only record of the erratum, but
irq-gic-v3.c records it in gic_quirks[]; in 2/2 the sentence about the
symbol is reworded to name arch/arm64/Kconfig.  Both changelogs now say
that no build was run.

v1 was posted on 6 November 2026:
https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects on
1/2 and 2/2 (20261106235616.1533003); please ignore it.

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and the reasoning, and I am
responsible for the submission.

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

