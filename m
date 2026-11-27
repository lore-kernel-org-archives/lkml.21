Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737626;
	b=RQ1eN04o5hgPgPbVPM6UqQvRutVJ6DPOT/aRDGshJ166OeSF58YOoaQJ+hXJykON3IHK
	 YpGgSIi/R/A5Eu6E9Tin7ZUbAMPS4eqKxm98bjrK+khgzLmj1GMqjK3LW1DLc2rqLUZ2A
	 r/PGwnvT4jfHSrlNdyLUFDFT6Fl5P8C9h7bxLOddt5rnHAXEcBmu9qhWuwh6x0YQcoubM
	 hgcj5TdOz712cN2Ma0efu0KDRMfp680RFY1NYugM16sq/Hjqs3FBRP4Ibz93EZcVSeb8j
	 x5KFgbpqV4zEYaN8zYoEom3nsfyauDrLxehKu0EzCuBlBZd+lRY0Uh/73EWhAAa1RVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbi2jPDujmhRc5z5gppxjoRcMRQjvajoDkRklULDng0=;
	b=qmV7g71RMh14rulXCnp9dert2PGNhX/3nNyFLd5k3X8C/UqZKUCGXKhmggXcuflBEJOD
	 GWHa4PUPjoLdtnAKe/jnVBuQYLO80CG8c0owhE43KoZqAkVBP1Arg5vXvc3+KH84asjl1
	 JUQvqPLeScWD2C4i5Oe5C1Stsgdj+OX6JOaUpVI2vetJuxD5YG0k3Z+d5khUuvpc0lX5T
	 qpxghF80BD92W3t3rO+C5wVwRq1KbaD3huLh2VJntTJo1Pujz5WwrVeN/mehatiw5YxlW
	 3GUiIzynheHQRwtIKGo0p2cnduTM+savvyuquBTKT3GBrLGvy6k5JTGjt8krOsNfbeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGCFJtq6;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DF0606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGCFJtq6
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so4935870f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737624; x=1796342424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbi2jPDujmhRc5z5gppxjoRcMRQjvajoDkRklULDng0=;
        b=GGCFJtq6+W6CPFGF/ZSFEz958RH/AeA5EoHxtT4RIDGKhxyLfiIkj8VwSJtyz36D8e
         H948/ejyUIZ5xRunN7CqL8amDGNfMN33ZSPKi0usW1tCJIIHqR8cNSbDGIlQKAkCKYlA
         YFxfe2OY5G4KMUkdWR5A0zKdj58fKdJVy12tXfgSn8I7h+zKQxruG9Cad7YIoB2ktyne
         Yf0ziticDpRYz5mRIQD5stRH+w42GwtpQcjukYUrgqJSPYqN95xiteGAmMjACtO46jJT
         sKDYfAZtGdOamjrtlTiOt7CcXPn4T+uMt7PPIeU3UCEuU7oPXvPXFDeSPoxWaLEUBaMG
         KrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737624; x=1796342424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbi2jPDujmhRc5z5gppxjoRcMRQjvajoDkRklULDng0=;
        b=NbNR+Rmwrd07Jk915Hv3YrHFA7FB3urOHDGATJ449ZQi2Gw0WxXESP9V3s+ievx2jj
         EELF/xQoIuUYbuP0loc4tnDMmpYzhtyvQWkoe6TGHMDVVJFZxBBPKPSSI7zjmMHJMTGk
         CW1Pn035EsRvvyPPqaMsXVw0ALOdh3XWbzxsre1Jzl+nbX2WvbQyHVHQGHvO3LuxIAsB
         NeXi3C0/6XnEWOd7HNMrlVzkXWaFleKw+4vBLlvyf75szbOCxhDjez9e4SoJXq6IQbbx
         4QlIk5I8Knj16nuKN/S7Q5Q8fJMNl6UkjK6XwnhB9CFRQGn1SHEeDSxYYAHfkOKdw8f+
         b7YQ==
X-Forwarded-Encrypted: i=1; AL+hErGd864pl9Jr7K0O2NNiiMwG1ewSZrgHRbiCBXhWmaeMFeujOyAzHATwyWvrA64MEOKUL6Cm+IQcbLNfJ/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EK/SlmSvmllOr4Z4eCyjYMXsJ5ayn69LU5jq1ikFtQvo8ZE8i
	6xfBmi5eogYdfzwihlWiyXXhD8+/g69GrUotitnr8AerRh25lAg28Eli
X-Gm-Gg: AZFdTZfBrSnw3l0ednKrUGQYI/yn5QtmNByp87VLwXbks1/cgSjTZebdGKRkEq1Meat
	YlZkCoB8R2Wo0aSeMu+ztQ8hlgFlYSNncBZxrief7c9sedRft8FDowEqQJPDr8HW72wdWj/Fs9S
	WV/GMHxBMa8Oty86gGvYRqbHU9BmOp1mBUKOeTAsp0NDHM0sTqNSMxYCgYplF+g9EEdnzCyJFy1
	4IvpdfS0bMe5aKpnzs4/xFyZkii/ou9wVTTyetUPPO99+jBZZfb1b108YL9GW14crjTDCVeOZA/
	mo/HJZ444H08Mhzjt9rm+bXAU+1fIslOypTWhQQ38HYbz0hTnOuaSEFqTyY/7masj52VqYuRUjA
	0XO6HyAXcHzdMDZkgKDXlTto2jznrfTNoetqN+K6l6NxvxaiZeSqppYFYepKi8f+4GwmXPuWsN+
	Fx0c6FUUmplHsD3oZZJF10As47YO+cwo+Qs/CIpaVSD52befsm7K9cucUGpNa2B733bddBvLw6D
	Meb+YYhuYyZvsLL3oGrlczs1NobpalaXMnccnuYKCasM5avC5nFuLrih0KRHib2W8g1FrgDxy7n
	zqmoyL/cIrRW/mtqAUwKOAnOEM95AT31PbMnfxz/wqOcH13GRzmRUGd69rgRR6wRN3XVxe0EGMG
	w8KVKF5gswo8IpxiSDA==
X-Received: by 2002:a05:6000:4024:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4abb4f59b72mr44345292f8f.29.1795737623844;
        Thu, 26 Nov 2026 16:00:23 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:23 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: samitolvanen@google.com,
	torvalds@linux-foundation.org,
	ljs@kernel.org,
	david.laight.linux@gmail.com,
	sashal@kernel.org,
	lzsx618@gmail.com,
	zuoan.penguin@gmail.com,
	petr.pavlu@suse.com,
	jani.nikula@intel.com,
	xur@google.com,
	sidnayyar@google.com,
	robertusdchris@gmail.com,
	acourbot@nvidia.com,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 0/5] kconfig: fix slow 'make oldconfig' by reverting host header simplifications
Date: Fri, 27 Nov 2026 00:00:10 +0000
Message-ID: <20261127000015.3662267-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
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

As Linus noted when reporting the 'make oldconfig' performance issue [1],
when the kernel's internal hash table implementation was copied over for
Kconfig to use, it also improperly simplified these headers.

By passing '(key) % HASH_SIZE(table)' to hash_head(), this caused a poor
hash table distribution due to using the clear lower bits with power-2
hash table size, leading to a slowdown in Kconfig's expr_lookup() which
makes heavy use of this.

To resolve the performance issue, let's revert the simplifications such
that the signatures of the host functions match the original and takes
the number of bits. Also, replace XOR in Kconfig's expr_lookup() as
suggested by Linus.

Patches 1-3 are pure refactors, restoring code from the original
hash.h and hashtable.h; 4 and 5 resolve the performance issue directly: 

Patch 1/5 reverts the removal of the bit count parameter from hash_32()
and hash_ptr() in scripts/include/hash.h (needed by hashtable.h in 3/5).

Patch 2/5 reverts the removal of the 64-bit path from hash_ptr(), so that
potential future callers can safely pass higher bit counts.

Patch 3/5 restores the original names of DEFINE_HASHTABLE() and
DECLARE_HASHTABLE() from the in-kernel implementation.

Patch 4/5 reverts the removal of the bit count parameter from
DECLARE_HASHTABLE and DEFINE_HASHTABLE in scripts/include/hashtable.h.

Patch 5/5 replaces XOR with addition in expr_lookup().

Link: https://lore.kernel.org/all/CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com/ [1]
---
Julian Braha (5):
  scripts: add bit count parameter back to host hash functions
  scripts: restore full 64-bit support in the host hash functions
  scripts: restore host hash table macro names
  scripts: add bit count parameter back to the host hash table functions
  kconfig: replace XOR with addition for expr_lookup() key generation

 scripts/gendwarfksyms/cache.c         |  4 ++--
 scripts/gendwarfksyms/die.c           |  4 ++--
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++--
 scripts/gendwarfksyms/kabi.c          |  4 ++--
 scripts/gendwarfksyms/symbols.c       |  6 +++---
 scripts/gendwarfksyms/types.c         |  2 +-
 scripts/genksyms/genksyms.c           |  4 ++--
 scripts/include/hash.h                | 20 ++++++++++++++++----
 scripts/include/hashtable.h           | 24 ++++++++++++++++++------
 scripts/kconfig/expr.c                |  4 ++--
 scripts/kconfig/internal.h            |  8 ++++----
 scripts/kconfig/symbol.c              |  2 +-
 scripts/kconfig/util.c                |  2 +-
 scripts/mod/modpost.c                 |  2 +-
 14 files changed, 57 insertions(+), 33 deletions(-)

-- 
2.56.0

