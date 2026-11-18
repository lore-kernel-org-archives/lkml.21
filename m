Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013549;
	b=mfBaVleyLbi2ERqS8VCm998BojUXj3Z9i7ADFEkQ4T3qdZp4eAq57Dy+tarsDs7pII8b
	 erLkB/Gc248Vi59tf8Ts9HijPQ/KiqHCVMoMMYzUcxOI9HU9jZMwaGmx7BHF/JcnRLTTp
	 uEjq8skTxaRhCzupcFLz+5Tsdag7cyT4VFEQ+9S0UmW+d+RWcsMy6JD6DGz4VDnC6J8Dg
	 iuI0ptVwOfIlnIO62vQpjbXVB4SkuYiFI4+q7Ei4UCtN3elGKyr2/NXKiDAUyWOAcnbDC
	 /Cs1c/ZIe3PXwlQcEuYNRbQzWU4dT6ajDujSOTHKeEflBIJ3tZTBzoMTtFpcZCrzWog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Infomaniak-Routing;
	bh=qj+dqdpekZnyQuI4Pr8AGPNdYOIxARrvsLndWUdUjIw=;
	b=M9h8APCEhQ3buIQNAj9+oyQBiq69iFeqI9m/RGCa9dZwWSy5zz8yTdWgXxFW26KX2j1z
	 8PAD7lmVjA2TY5lxUU7+kgRprkwRZq/peIoLp1PTDa4FznJ0sCyFahLIs1+I/eIJx4bhM
	 BJ2SwB0ujNMGRr0SNsbfRrH/V93kaXlWnjyvEJ9vnmJyaRHpQ3RY2BHDzkNgmf+l/nbux
	 shpIUIA8laqdb1mhdvKqfxmhheH++jc/YoUhphNN9ZRo+qd9wJKY0C05AnhjHJvs41RK/
	 +617NHakcO9kGHKGJ0ZYDc/HPnX+y7ftcfTHuSoyE08uO0vD2DBN5YXixLljXmAV8Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=o3FZ5dgA;
	arc=none smtp.remote-ip=185.125.25.9
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3EA3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=o3FZ5dgA
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jV4M84GJRzx2D;
	Wed, 18 Nov 2026 15:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1795013540;
	bh=qj+dqdpekZnyQuI4Pr8AGPNdYOIxARrvsLndWUdUjIw=;
	h=From:To:Cc:Subject:Date:From;
	b=o3FZ5dgAd0H7XXZ1+lBlMwKXG9PYEwiJaedRc3ht9dBwSDqJfCcvW1IZygZeOnKlo
	 ZydpuEQiW26SYvEf1Rc5mxFQki1Q/2siceNH8YdH7k+KyORSdJsiEZP8uSIvHi6gQg
	 2MPBO7XMZJTVSMcBMb2lV9Ed3JPOHAoFhO3wUgss=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jV4M674KMzX06;
	Wed, 18 Nov 2026 15:52:18 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v3 0/6] Fix Landlock mediation of commoncap's capability checks
Date: Wed, 18 Nov 2026 15:52:04 +0100
Message-ID: <20261118145217.2551053-1-mic@digikod.net>
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
X-Infomaniak-Routing: alpha

Hi,

This is series 1 of 3:

* 1. fix Landlock mediation of commoncap's capability checks;
  2. fix PR_SET_SECUREBITS mediation and add focused Landlock tests;
  3. fix Landlock mediation of capabilities guarding LSM policies.

LANDLOCK_PERMISSION_CAPABILITY_USE, merged for v7.4, denies capabilities
through the LSM capable hook, but commoncap's mmap_addr, capset and
vm_enough_memory hooks call cap_capable() directly.  A domain that
denies a capability can therefore still:

- map memory below vm.mmap_min_addr (CAP_SYS_RAWIO), which defeats a
  mitigation for kernel NULL pointer dereferences;
- add inheritable capabilities outside of its inheritable and permitted
  sets (CAP_SETPCAP), which lets a privileged sandbox without no_new_privs
  gain capabilities through execve(), although the domain still
  restricts their use;
- use the admin memory reserve with vm.overcommit_memory=2
  (CAP_SYS_ADMIN).

As SELinux does, patches 2 to 4 add Landlock's own check to these hooks,
with commoncap's conditions, so they only deny what commoncap granted
because of the capability.  Patch 1 factors out the shared check.  Patch
5 adds tests, including audit tests, that fail without the mmap_addr and
capset fixes; testing the admin reserve would require changing
system-wide overcommit settings.  Patch 6 fixes the documentation, which
overstated what the permission restricts and how its denials show.

Two other direct capability-set checks are fixed separately:

- PSI triggers (CAP_SYS_RESOURCE):
  https://patch.msgid.link/20261106120004.90041-1-dennylin0707@gmail.com
- user namespace uid 0 mapping (CAP_SETFCAP):
  https://patch.msgid.link/20261110144205.2404088-1-mic@digikod.net

Changes since v2:
https://patch.msgid.link/20261117101157.2520463-1-mic@digikod.net
- Use ASSERT_*() in the tests where later checks depend on the result,
  and rename a test helper parameter (suggested by Günther Noack).
- Describe the capset hook's condition from cap_capset()'s point of view
  (suggested by Günther Noack).
- Shorten the commit messages (suggested by Günther Noack).
- Reword the capability permission's UAPI description (suggested by
  Günther Noack).
- Add Günther Noack's Reviewed-by.

Changes since v1:
https://patch.msgid.link/20261110202436.2408244-1-mic@digikod.net
- Replace the admin reserve test, which changed system-wide overcommit
  settings and was racy, with a comment, and fix the mmap_addr tests on
  32-bit ARM (reported by Sashiko).
- Add Serge Hallyn's Acked-by.

Regards,

Mickaël Salaün (6):
  landlock: Factor out capability denial checks
  landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
  landlock: Mediate CAP_SETPCAP for inheritable capabilities
  landlock: Mediate CAP_SYS_ADMIN for the admin memory reserve
  selftests/landlock: Test capability checks outside the capable hook
  landlock: Fix capability restriction documentation

 Documentation/security/landlock.rst         |   8 +-
 Documentation/userspace-api/landlock.rst    |   8 +-
 include/uapi/linux/landlock.h               |   7 +-
 security/landlock/cap.c                     | 111 ++++++-
 tools/testing/selftests/landlock/cap_test.c | 328 ++++++++++++++++++++
 tools/testing/selftests/landlock/common.h   |   4 +-
 6 files changed, 444 insertions(+), 22 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0

