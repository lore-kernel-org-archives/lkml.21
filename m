Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091983;
	b=blWO66s/XwKt0rYY1fGvxOM7jQEvBkZpIbdMpRMyzCw8JAVjR0c8/p13QAFkDx606hU0
	 UC37LokKW58iJUW+ZVA6bswiufEuY3cHnrRw+FGurNEc3oO5nvCAnH2vM2G2V1RL+PZr6
	 h69G3k+dh3S/NhWqIlUkZT0DNmQvhMY6Ib3uy4qI99J1cfF+vLU/mnxvishDE2XXAJlg/
	 ZWtWQJ/gCqsA2ksQ1wiq9rKDzOw3X3zpZ6UCs8adHLoiHFByxjIPPXXPq5QYqQJU3Tqsg
	 PBMlQaVnxbTmT6gVMcYcIzN6OoO1NuZfxJASYRpe7AEeIZdqXXcXnpCny9eUqwcU6ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=87LKr20k/L5NegPnS/Fj9m/aPduFPJkLQyVN/rqlEz4=;
	b=G40M9kh+yiuYKrFxO8jXuEt25L3VB5lTBWHOt1nOsNT6faiy8oTzHJIe6vDMC/fCO6hV
	 N0CpIIkUsYqlNHlZv6/tiEY4fUnAOn/Icfe03qwOnDJL2ORnG5Y/Bx+Cq6PiEWBS9EZDj
	 P8DbpyUZKUNB6Td9UGd2R6P5jYwYEHwiczvAhBKzHBFrf+fSQyi1T9AyzFZssEEoF+m++
	 Gov8Phav+km7EvuOZlrwcqGGNL0/IHc/VEXsvvpQnaIEPkgEnIrZJy1rjD0qzX68K+47M
	 Ts1MjhWhBtqgN4XJesqj7pt1xWLr9eXsIREvTTRuwTJyNZKlkSoKcAmvkiUmvJBmMtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Mplm5IRZ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6071606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6071606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Mplm5IRZ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2005747a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795091982; x=1795696782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87LKr20k/L5NegPnS/Fj9m/aPduFPJkLQyVN/rqlEz4=;
        b=Mplm5IRZHsH5soBI9ZVgs24NO1JKr2PM+aEyIy94fE4HZshRIcJcqf5rPHpOKjGyf4
         FPNcKGKV6kVcaBBT/W+Wzh4uR3L2/mIpPBtDnUHNqJvD+byRGOexD2Wodnvq7dTu72vg
         EtO11SHxI7wzr2vzf3kzpZUEyXJ5oAm+YV0nE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091982; x=1795696782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87LKr20k/L5NegPnS/Fj9m/aPduFPJkLQyVN/rqlEz4=;
        b=e4FNE6i9QGXdADbJLyXKhGx5sZYNtTiNqLDq5KmlspNXOZGAvlCgHLEOGIYrevRRm6
         1z01ZbPU55q8JneiYEkAdi+/4HlQlv8Fw+wxdSILBpWhDm0CnUblPoa1FAXQbCQy+dLe
         ZSZxfSJ8H7lvyluOCPmCxVgTAp1jhusl/yQ2SXI+RVxFfSewlKMhMXtpmi5y9f/TeKwo
         pG6fx+dfR9VKXQtqfjIjn9Sc/aWoeoB7a7i9HMdmn968BtgovmA2qfk5gxopygmao8EK
         AdUqaumq0f3Zv/zLZ9difX62z92DDRxYG7SXuzjD4xNyUQ48F+gGVkigZIyZflfY4gcs
         ALwQ==
X-Gm-Message-State: APuU4Z9ImtzDvHFvweX99pjCl+A6exkGnzMz8RQylcjn8YR+/6FvClYe
	dDJFE/X4VN5WOuZunN+vmSPejyB9vr32IS3xy7qJ/QnnwG9lTAx+/xW5cuqTehlxAW3nQSf1UrB
	d4hc9
X-Gm-Gg: AZFdTZdIC2kN97T9/Ix7FZg5Jaf5ZcigrNqrjBuhMIGQU+jfRzs4njtRxFmewqZVlDH
	ZauC3+M2cUuXJjpgEwKNLfmvsaqSoSSfRqpr+n+sFJjt7wZ4jRgFf428gwQ0S4oyUsCRaOsSVHj
	dxWllBJRyV5qHCj6XoD3BBaCRlTD2Sxy5XSqgo3PHhxk6KzXwN+AbtOyck2nHpGFpoAqL/YWBQN
	FWzaTSLWUkYbdf80rnN58PLyiDkZshb9zE0CFk5GSosJ/xVjIDSnFdKYpZSIhAPHySa9nqNc9y7
	RK3HbvJgI1dGESa41tnRQrALBejpauoozW73MJtyYrhL9tkGBuJFwEK+mdVHREAQM2DfMH5bumu
	SHEDhY8QX/WWP+006Gm8I84rhl8lfvt7NTgEzjtUkOZzxZtVIhxa2Z2Gi7VRe4a+QGdEo2FRl9e
	ClWhTiuQTifbBpvBwphi+ZCaAT89hJAFRjOj+yT4zHW5eVPhbfzgReDM1SmH6iRjKpJJ8bYp9Lo
	YD1Iz1ruDUrN1bpioAJ/+WuGieoPszgJbm6tuHLMAJ3jeJuKj+UGoZBDyzabHju1ZtxtWy8EfO5
	3UE2T7INbjAufbwJggMixwIHSrcBvezKI/srIGoJz5hIoQSDudVF/bR6wKn6KjwULNOJu3fDpK7
	oJWkvwkOAG/W1GY0=
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1359687a91.55.1795091982067;
        Thu, 19 Nov 2026 04:39:42 -0800 (PST)
Received: from shiro (p1799054-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.155.54])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2696299a91.5.2026.11.19.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:39:41 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	gerg@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/4] m68k: Add 060 PCR info to /proc/cpuinfo
Date: Thu, 19 Nov 2026 21:35:54 +0900
Message-ID: <20261119123558.2108296-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
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

Apparently the rev6 060 can overclock to ~100MHz
but mine seems to only manage ~60MHz (I wonder if some part
of it that other OSes don't use doesn't actually like
overclocking...).

I started to wonder if I actually had a rev6 and noticed
you can't see this info from /proc/cpuinfo right now.

So I added it. The only messy part I think is the FPU
asm changes to stop m68060.h from breaking the build.

Daniel Palmer (4):
  m68k: Add and use wrapper for FPU inline asm
  m68k: Add and use defines for 68060 PCR register
  m68k: Add helpers to read and write the 68060's PCR
  m68k: show the 68060's PCR in /proc/cpuinfo

 arch/m68k/atari/config.c       |  7 ++--
 arch/m68k/include/asm/fpu.h    |  6 ++++
 arch/m68k/include/asm/m68060.h | 34 ++++++++++++++++++
 arch/m68k/kernel/head.S        |  3 +-
 arch/m68k/kernel/process.c     | 19 +++++-----
 arch/m68k/kernel/setup_mm.c    | 23 +++++++++----
 arch/m68k/kernel/signal.c      | 63 ++++++++--------------------------
 7 files changed, 85 insertions(+), 70 deletions(-)
 create mode 100644 arch/m68k/include/asm/m68060.h

-- 
2.55.0

