Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345830;
	b=nNZk40OfQFmryyQWYDh9LQtESnj0eEtFZ6DX2DcAB6r3u0aTJnxtBshOagZP9ZT/J1iO
	 pMHzIdrwdeSUEG5Ewn8lsl7qmYnnNbbcFEXHbq+oT13Oj6kkRjzcZW50RcwbOKXPJS+wq
	 X7CspnE3UE+GLE0LW+J+kxT4FS5vepGOCa1E9NOjD5p0klWyeONl655ywwZat4qzEMcXc
	 eRvfhr5E0x81mrM1j7tptTVMVx+zC+RJpOwGYXQZvFZAjlddZqN3nu7ffV6zdDA1zi9zN
	 MTellYw/oIx2EwtlCOgF0oyplR4baUyxkz8jEhCjfsmICMIt3cLEccPmQQmBhT2270g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345830;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=vUgERwTTP/XfoDhdfAsoYffuI3Fvxe6jO15E0So2V70=;
	b=LpEAvB1qOG2heUheX5QXVHvQqj7T2RS2ydp8q0Tf9MF3DLyZuPwVVrkzYMYL/wl5QS+M
	 AAw6DSYr0uzvTYsruEGGBgGm7BaSw08zw8TKTKCDHzV6kSEKARnXjE0sCGMB3SBt9CBLh
	 w+QRzqwiNrD9E0nspAJGASjljyi8FzGE/w4ypZp3XdoxnreKiiwThVpTHxm8nocCqmEh2
	 WaqJX5MBPTDKZp7fql5PlFOqVbmeARSHOV3i23SIyStyjZLJ5LTBfY/om71vtdhZKjvjQ
	 Kuw39ZIc6L6KWHIe9d87UgdG3L4YIAns/sZ609Du/q3vV9IJ5kuk5pQYS1hXD8PzN6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7iGQx2s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A0606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7iGQx2s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216E01F000C4;
	Sun, 22 Nov 2026 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345830;
	bh=vUgERwTTP/XfoDhdfAsoYffuI3Fvxe6jO15E0So2V70=;
	h=Date:From:To:Cc:Subject;
	b=M7iGQx2sxD+WgNbE0xZu1n56rd/3jaGNqB5b6Htaf2cmsZXYm0tITSgxFIBqXd5QY
	 Q+9BktyduWSu+W/zSw+6ByPiwfdiE0+PH37k9McmcrG53EYWVqQKAXlUmSXj9ENJkB
	 7w+pOXz/nU4gh7p6QQ+2sjyPNe1+UAxyqaSoi70CMPtYtPXdjy7M32LWSw2xhYlpIe
	 RHrPScRKjrWU5chsL26WJM2t3dnNDFbGH6FYhBrVr0RSmPT8P+mXjxCEHeCX98xNws
	 i41m7qxbUCssLMc/jvjilrEqZZeRYh7TAahebuc/B7qYp1NAjF1Hc9thafZmjy0NFW
	 dUHO7m6ClL/aQ==
Date: Sun, 22 Nov 2026 12:10:26 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fixes
Message-ID: <awLNohm4diw4fYCs@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-11-22

for you to fetch changes up to ae3398a7da224e1cb14a04ce8e9da66fc2948121:

x86 fixes:

 - Add Intel Coral Rapids and Razor Lake CPU models (Tony Luck)

 - Update the table of Intel SNC capable CPU models with
   Granite Rapids "D" CPUs (Tony Luck)

 - Fix MSI interrupt affinity configuration (Weitao Wang)

 - Do not treat cache hierarchy MCE errors as memory errors,
   to fix false offlining of healthy RAM pages (Adrian Schlegel)

 - Enable ROX also when CONFIG_STRICT_KERNEL_RWX is present
   (Richard Weinberger)

 Thanks,

	Ingo

------------------>
Adrian Schlegel (1):
      x86/mce: Do not treat cache hierarchy errors as memory errors

Richard Weinberger (1):
      x86/Kconfig: Enable ROX also when STRICT_KERNEL_RWX is present

Tony Luck (2):
      x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models
      x86/resctrl: Add SNC support for Granite Rapids "D" CPU

WeitaoWang-oc (1):
      x86/apic/msi: Fix MSI interrupt affinity configuration


 arch/x86/Kconfig                      |  2 +-
 arch/x86/include/asm/intel-family.h   |  7 +++++++
 arch/x86/kernel/apic/msi.c            |  2 +-
 arch/x86/kernel/cpu/mce/core.c        | 18 +++++-------------
 arch/x86/kernel/cpu/resctrl/monitor.c |  1 +
 5 files changed, 15 insertions(+), 15 deletions(-)
