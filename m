Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504474;
	b=L6fYPy0SDMMsltcIS2vDmRGk9svxeJRNtQpX3cn5dITDL1Xoc1DwLkg6HeGy5z0z94qW
	 Gzf0/DCoCagoccLMZ9Jop1Es20cBHKh7HOS1o2bCzD0EfYQ4Tr3YeSJ6I+EXsMGJDKXA1
	 wPvGwIcKoUwFdR0HWN7aLGN7YlbmkMbBH7H1PR7TeTGEWTPDWOmOF9K7H8yWl7Sho5C5g
	 zt+2BWZyHAlIhJnpGWfDv83Azs2j1MDZ/WyLZzZbC3WZd8ItL9dM+IgT74o+iGoOFKlNv
	 DbHZqfIZ7WOweY99o+fz8BO6Lm7+NgIFhkg4+TlVgK9QuCCUbD0uLZkAstVdEsqU4OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LAq2DbxeZILLxvhcSwaRL4Dj4tgtiHKeHZHk2yK0WuY=;
	b=3iFW61XPucF8gMmli/CPplg+4y5M+cq0HSS8ckddVK/GoonfGdxl9Tmxe1VpDl1zYJ5O
	 fefDUDzD2QPNXH+JDl1Blz4xfp0SlKUIeio6F+rh1F4krt5PVlrf+BpFeqVwYkUv2bLY3
	 /RzGcXEOnjrMUA+9/8Z1apBIf+SMOgD6QeeOmjvTdR5o3rWet6QWm0OJl+LeMZFmi0VAr
	 wXy7vnoBiYdT2XHX+Mufw5mVN7SX4Ou9DsS8d4PF7vHaPuFfAqj/qOHQ+9L7yOkr/OI9b
	 SDmxz36uY/R7DSIZyO4FJ7MIABunRI1gv/5ozLI7GkkxXRHkrjZCyy14y7wmXoPm01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cno1UpEe;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cno1UpEe
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1952817b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504473; x=1796109273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAq2DbxeZILLxvhcSwaRL4Dj4tgtiHKeHZHk2yK0WuY=;
        b=Cno1UpEeosAC6mD+3etNspr12WHfikJ8O5g72jn7q7WIx1rNlK0Ay/v/tN2cPWAxl1
         0aZPfNjZsXo20YmHdrfp7YTqHdvesiM/HQKqvdituSFEQuxeonbpnDzXOHw8SYnHM1qd
         YDhO5UkO1qDQMb/WQH+bsqTbF3bRx134MFGc/3zC/dfeU0c4xc0Z2aVcw6gqBw1U0HfH
         TXs+yRFw2IPmaHDArU28Xeo3+TK9C+T57FpB2Y3SEo7pzOm2SvSVmoS32DaBnHG/sW2K
         AAPrPfpKA9BPmOy3LwVoayeMvvjtznaHF5whoP9oE+mP/aTx18sglY9j66dMw/tyO1kw
         RSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504473; x=1796109273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAq2DbxeZILLxvhcSwaRL4Dj4tgtiHKeHZHk2yK0WuY=;
        b=HIK/v1yj9DhRj4Onfz07pByP1LvwXDsIv9nd0nMjxeIaeku3parRXjFi1NZsEZ2mRY
         58wyvhwmVW984ZWEXVotjcQQJ43SbGzSy4ALBSlSuaM7bqQVK7hU0GlhoURPRGlu+7BV
         OHLO4/kVpyATclrGcf0YBWr0LkWBDuw8cEw/43MvsJCqErjKidXcAcqSoDDZFOxmRFW3
         Ossv5lLRW/EWV9y825S3YWgbs6eWg257F6c/rAOF1KXjH1gnT9251it40/DE8u0+hpEX
         NEFL9GGtVHFSil5lGFFvq2Lc6ro64KUj5Y5g6YkFaKsaP6EyAqrKnz01H/GUs+Sxmnld
         fULw==
X-Forwarded-Encrypted: i=1; AL+hErEliNVOezJgbmNd6UMOCGj4X4DDrp2udCM3N+BRrJwAg9VVnLJXYmhDUl68Tg/QcFmOqqJ8VUGqrFFbYqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DhxBCCvqf+zZErUbpjr+6h1+tCna9B9jlMFgaKTAQfQOBmAh+
	aQA4Vphc6W/F2NwQZCR6vZn9oPLXg37SHIemmiJqKnnNa+C5YLJIpbh2rI/5TQ==
X-Gm-Gg: AZFdTZfvVtM/WxqawB408Qltwzbb0CfjvWGK16K5lNMlgIPC+zoJ0O/mxWqhUsqv98A
	hq/svw7elWbk0aLS8ztxAsis7eIHwFfNp5oqnvDjaeo6DZnYp3rL+ovAgaEtzmkAndCEOZK2cK3
	PeAjj+1Lzwdi11LdMaE5r8mUQ26MeDbYQhBsw5cILGAvKVEES9JbL1Q4UGE65EG44Y9W71Yp/ss
	rKh00NdQRbDFxghcX7ZnbecaeOZcgDabe8ByVY/Y7Mb5U/o48ntvvWWp901iuVN0/JjEOPIcto4
	aXBMwpZ1Wjag4XvP6KNQ/8YFO745j6WNY4y8BWsNLbly8Hke76GkvQltp8kzu2EY+QHMiG9BEx9
	ewwWt8Vto5FvTaSXieFuz7x3RETivt3+P9ObIXW3buHG8Q+ycRriv/tJn6hzY+oOZ9KfdZItVzl
	voqOc5EI0/IsNIrAYzkImr8Sf6jmPXSbSUTAARIgwOELrxuyA6o+b6w/3w2YAmi0tFXbqlMPx8u
	3tDOcywhFLm2K/+K9E4k31d7Tonx4f99sfVGxGKueCX2t1COeYo3phFxnZH6JrMfxK4rI4kLs1p
	HaOdocSvt+8qrd/X4JNqQvIlAlzxdcOpuRztVx1lxK6rwhLa
X-Received: by 2002:a05:6a21:4cc1:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-4014e6565eemr12593150637.91.1795504472734;
        Mon, 23 Nov 2026 23:14:32 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:32 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 0/4] remoteproc: core: Fix the error unwind paths
Date: Tue, 24 Nov 2026 15:14:05 +0800
Message-Id: <20261124071409.972-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes four problems in the error unwind paths of the
remoteproc core.

The most visible change in v2 is 3/4.  It no longer reworks the attach
unwind to prefer detach() over stop(): without the STM32 review that
behaviour change required, it could not be justified.  The patch now
only guards the unconditional ops->stop() call against an
implementation that does not provide it, exactly as 2/4 does in
rproc_start().  Implementations that provide stop() keep the existing
unwind, so the STM32 detach() path is not affected.  The detach()-first
semantics can be revisited separately with the platform maintainers.

The patches:

 - 1/4 resets a freed vring entry to FW_RSC_ADDR_ANY instead of 0.
   0 is a valid device address, so a remote processor that reads the
   entry while it is still running could mistake it for a real vring.
   The sentence in the comment above the reset that is no longer true
   is dropped at the same time.

 - 2/4 skips the stop() rollback in rproc_start() when the
   implementation does not provide it, instead of dereferencing NULL.

 - 3/4 adds the same guard to the attach unwind in __rproc_attach().

 - 4/4 releases the resources of a boot that a failed recovery was
   trying to restore, following the cleanup sequence of
   rproc_shutdown(), and voids the power references when the failure
   leaves the processor offline or detached.

Testing: on an Allwinner T153 (sun8iw22) with an E907 remote core,
driven by an out-of-tree platform driver.  The vring reset of 1/4 and
the recovery failure of 4/4 were exercised on this hardware.  The
guards in 2/4 and 3/4 cover configurations that the in-tree drivers do
not exercise today.

---
Changes in v2:
- 1/4: Keep the existing comment and drop only the sentence that
  became obsolete; trim the changelog (Mathieu).
- 2/4: Select between stop_rproc and unprepare_subdevices at the
  rproc_start_subdevices() error path instead of branching in the
  shared unwind path (Mathieu).
- 3/4: Replace the detach()-first rework with a guard against a
  missing stop(), so no existing driver changes behaviour.  The
  STM32 detach() path is not affected anymore.
- 4/4: Describe the code as applied, follow the __rproc_shutdown()
  cleanup sequence, and check for RPROC_OFFLINE/RPROC_DETACHED
  explicitly; trim the changelog (Mathieu).

v1: https://lore.kernel.org/all/20260929075453.2324597-1-hyz3367@gmail.com

Yonghao Zhang (4):
  remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
  remoteproc: core: Guard against a missing stop() in rproc_start()
  remoteproc: core: Guard against a missing stop() in the attach unwind
  remoteproc: core: Clean up after a failed recovery

 drivers/remoteproc/remoteproc_core.c | 47 +++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)


base-commit: f39ba58941efa63e6c7d10d53d183d6077524bdb
-- 
2.34.1

