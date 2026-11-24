Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548172;
	b=4QNanMNG66UapQaHeIFeoR9vnmA06x7KAGHJkh+rCeoA18d/vpb+zWWUknHrDWM43pfc
	 jr6bzevmOgUdms30YWHmFnYMwCK8n+mRjHbF2kPZ+U0EjhTWClqKkyStikw1JIV0lsn14
	 IErRIe4u93MAPhXIE4LVkpkwJ9tIZ5tKxMhQ4K6ra1q0emDBs47EeMo0LKIJe+a/3/l3M
	 H98QG6+LEvEiyzG9/IHSXo6uokIxPl+zGEzw4Fk8mg1PMgWcnwTf3nktW5ZY+lJWwzMVH
	 re1oiq0eIh0vjJ5AQX3I7BaeC6w0R1SvAtczTy4KInez3xe9wA4nhomIkLWoY7LegBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548172;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=0xWgEao9MkVgnZn8JKjMmZldnR6IkOcOmRchBxpelE0=;
	b=cLNml/TIourEBPYp2Rv7ZGOrpmFjkcOrb64JEGl/GugwyTBrlDiF5VJK5ProsSjDs+R4
	 C14mOCM47IRUGV/nvWk0FJ4pS6FvMcujkAZkhyp3l+yd0JvvF1zJyDc3tmeVFnwQB25/M
	 wcRlHzdy7mVxC1L9YLkHBcNjkjdjcpXiK01wTvmSBifzL3WV12ve7mo70xx/AJ8+BK4AE
	 Xg9iyN8M8acXkbb8JQhL08EAogN+wx5spM7j8hvBMNQbgNWGp44/i7+Zwl0+DSaMGAnUn
	 wWIUlrmQfRAgJIU/+U5VuHm/Z9yJUxcuc6dAdc+A2mBc6J0PnS48CeXGa9TpPfUzB/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UtTKMfzs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="dOm/r+sk";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC0606A31E;
	Tue, 24 Nov 2026 19:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBC0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UtTKMfzs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dOm/r+sk
Date: Tue, 24 Nov 2026 19:22:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795548169;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xWgEao9MkVgnZn8JKjMmZldnR6IkOcOmRchBxpelE0=;
	b=UtTKMfzs9BZS2Den4k57LaXB015bU+9xY4m8vt36bMtvNM/vF1an6QWXguHw95GD+lqWj0
	h1hX/IydDrpv9UHUQYlEPWbkxh1Xeizf0NUC4Cbgd1IRy07l9JQO3DR+iFmMbpVGLBG3ht
	PDz5eGe3A7EzM8XsJo8/Y8OmENmQ4cSigzdO7N+fhlaSKEEE8E0jMdaGECoh3loTU8R0GL
	tH2DcJD826uohvr9FEClV6+hH9MyvsGtuwpOtRky3d0bkAcpVgzieDqS47Ft+WLp0NrgVE
	0Z/rgzr6YFD+6fFcLkDDIkkTUTQp2sChNoXZ1xVsJoaDaoguVDkGu1FdK/BikQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795548169;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xWgEao9MkVgnZn8JKjMmZldnR6IkOcOmRchBxpelE0=;
	b=dOm/r+skBisL1W01qWR3SPbh5K4Xq82DaCry1MUdPtYbXMOlLaZIkb8IvdYWldTugKFCCr
	TdGdE5H6wh+sWxBw==
From: "tip-bot2 for Babu Moger" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] x86,fs/resctrl: Use a consistent log prefix
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <b0b288783579ca22af73836276fa2f97bdc85f58.1794946513.git.babu.moger@amd.com>
References:
 <b0b288783579ca22af73836276fa2f97bdc85f58.1794946513.git.babu.moger@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179554816740.92412.3588321721665211135.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     712f550549864a5061a3acc3ef1bb61c07e9e66c
Gitweb:        https://git.kernel.org/tip/712f550549864a5061a3acc3ef1bb61c07e=
9e66c
Author:        Babu Moger <babu.moger@amd.com>
AuthorDate:    Tue, 17 Nov 2026 14:15:13 -06:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 24 Nov 2026 11:12:34 -08:00

x86,fs/resctrl: Use a consistent log prefix

resctrl code is split between arch and fs/resctrl/. Some files derive the
printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
KBUILD_MODNAME follows the object name, messages use different prefixes
such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".

Use "resctrl: " throughout both directories so all resctrl messages have
the same subsystem prefix and match indentation in files that already
use the right prefix.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/b0b288783579ca22af73836276fa2f97bdc85f58.17949=
46513.git.babu.moger@amd.com
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 2 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c   | 2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 2 +-
 fs/resctrl/ctrlmondata.c                  | 2 +-
 fs/resctrl/pseudo_lock.c                  | 2 +-
 fs/resctrl/rdtgroup.c                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/=
resctrl/ctrlmondata.c
index e2afeed..46ec3fa 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -13,7 +13,7 @@
  * Software Developer Manual June 2016, volume 3, section 17.17.
  */
=20
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/cpu.h>
 #include <linux/math.h>
diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/re=
sctrl/intel_aet.c
index 66cd8c2..2f75cb7 100644
--- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
+++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
@@ -9,7 +9,7 @@
  *    Tony Luck <tony.luck@intel.com>
  */
=20
-#define pr_fmt(fmt)   "resctrl: " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/bits.h>
 #include <linux/compiler_types.h>
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/=
resctrl/pseudo_lock.c
index d7caab0..a58f9ba 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -9,7 +9,7 @@
  * Author: Reinette Chatre <reinette.chatre@intel.com>
  */
=20
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/cacheflush.h>
 #include <linux/cpu.h>
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/res=
ctrl/rdtgroup.c
index 70d020c..581a489 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -10,7 +10,7 @@
  * Software Developer Manual.
  */
=20
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 69123b2..556032e 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -13,7 +13,7 @@
  * Software Developer Manual June 2016, volume 3, section 17.17.
  */
=20
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/cpu.h>
 #include <linux/kernfs.h>
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 56ab63f..656c1f1 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -9,7 +9,7 @@
  * Author: Reinette Chatre <reinette.chatre@intel.com>
  */
=20
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 559bccb..ec99b27 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -10,7 +10,7 @@
  * Software Developer Manual.
  */
=20
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+#define pr_fmt(fmt)	"resctrl: " fmt
=20
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
