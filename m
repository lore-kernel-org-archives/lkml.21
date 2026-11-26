Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654462;
	b=x4KapCCRYs67F064P5fdw08ciJWc0n5wtq4o0Ig0ZeDhx40aQP+aypgijm7esf9ftyvL
	 q0PG4mUGdRiK4YfwNg0swrgiNQzIOTXDRyeWEtRmrbYpZT9eSVbVyypUMWxXcfhsPEpVt
	 z3r8z+D5r0ebJY9k98XQtIqJMVOu0ybuJ+v8/kqvvbN/iELccCC+j08SMKqDibyOwRQ0z
	 5IDcvYqafxOsc/o7muHRjrbH1YfqDpNiUV/FA+2DGFjnd0IPWD13Zg8187fuCWt0bhcHf
	 QatNuVeZcOGCAYWZNoL39ICJL/UwrZjsKi4wefW8KtnOquCB/86B6uDKRrJ5Qsvsy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654462;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=L2C0qzwqXGDarmWGJ6KwwjtLtJRevC/w0KmERgIXMls=;
	b=HeA70Oj3PwRkEsyCXb9gUZhCgh4Dc9ALYNh/feRWttr+MnMk75B9Hx7FzLvJfBAEnsUW
	 yAhac+czJJWBmRibqLEFrpzRoIKPwEo3LHMbHWEJ1Kv+RY+04ovrc07UOdqU9IjaBZPzU
	 NgpRgNtHl9xJUfS8AxOwE0iv14FnH8AtHlYnwV9E9ZdXBUDGmm02BeOZxz+IWh6G8aXdg
	 Y9zeg9SgNS2dS6PAqFo6ekmDkgASFtHQYi4d5Y9dmAJqw9bCO7wHgsI+tllL6KrD5Ad51
	 mPMvnQ0aTNFHp7VpLEJNP0m5nHiWFe1TMBo1v4OL1aS9Xj2DTDVvpAD6eLWgtbH3Utw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BZqsy5Lh;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98372606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98372606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BZqsy5Lh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795654462; x=1827190462;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N8E55ttTMR3i3zmZnYSGMmiGLOKYTnsRSrVbR8jZZsI=;
  b=BZqsy5LhjVPibCaQ25kSDve4woJEEJ7qGPsv5NpiJPbbeol5xPrM/1pK
   0tznNqexuZm1pANcSi8aPeuTTYaLwLkaC5WDBqAnMa8TLwO45ZW5PgDbJ
   tTnXbVX7ycuPOcf3OFpZqE5JG5dQifhoj+pn+KLTq24itQfYc4GfLR3nd
   hcjCf3zdLl8q3n3N5mbSdqOAZTJULvpAJ9TAxVhY1VylTIF/1tv8GlXqS
   f0mjnh6ROcht8yod90vT3JMUcrm0ei+QhP6ac0ey1uAt/YV5t68zMuxcW
   exr4dbX4io7a3KnhrE1WLKMS9fvyYJY+gxMeloKcZecD9TcnQO+LwaQj+
   g==;
X-CSE-ConnectionGUID: lSkYzVTXT0uBfqojpFSKfg==
X-CSE-MsgGUID: V5mBk+OETHu348+zTDMGJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4395980"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4395980"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:54:21 -0800
X-CSE-ConnectionGUID: igP6M5h5SmeFCM2eOj7Ezg==
X-CSE-MsgGUID: x+eHBIk8QTqtGFhd9GatXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13682959"
Received: from rpedgeco-desk.jf.intel.com ([10.24.81.149])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:54:21 -0800
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: bp@alien8.de,
	dave.hansen@intel.com,
	hpa@zytor.com,
	kas@kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	nik.borisov@suse.com,
	tglx@kernel.org,
	x86@kernel.org,
	chao.gao@intel.com,
	yan.y.zhao@intel.com,
	yilun.xu@intel.com
Cc: rick.p.edgecombe@intel.com
Subject: [PATCH] x86/virt/tdx: Add command line param for DPAMT
Date: Wed, 25 Nov 2026 16:54:16 -0800
Message-ID: <20261126005417.976523-1-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.56.1
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

The Physical Address Metadata Table (PAMT) holds TDX metadata for
physical memory and must be allocated by the kernel during TDX module
initialization. Dynamic PAMT (DPAMT) is a TDX module feature that can
reduce this memory use by allocating part of the PAMT dynamically.

In order to work with DPAMT, the kernel needs to perform upkeep on the 
DPAMT for each page that it gives to the TDX module. Late during the 
upstreaming of DPAMT, an optimization patch that avoided taking a global 
lock for each maintenance operation was dropped. The plan was to follow up 
the initial upstreaming with optimization work, however priority for this 
work has yet to materialize.

Separately from the wrinkle of the global lock, TDX continues to struggle 
with large patchsets to enable new features. Doing DPAMT maintenance for 
the new types of memory these features require, further grows the initial
patchsets.

Adding a kernel parameter for DPAMT can help these two separate problems. 
Having DPAMT be default off can make the offensive global lock the rare 
case, while still giving some big memory conscious users the option to use 
DPAMT. Having DPAMT capable of being off means that the upcoming TDX 
features can be merged in smaller pieces by ignoring DPAMT to start.

So add a parameter and make DPAMT default off.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
Dave, feel free to ignore.

TDX developers, this is small, but can I get a round of review on the 
patch? One consideration I had was if tdx_supports_dynamic_pamt() should 
be renamed, but I thought it wasn't worth the churn.

Another idea is to ignore the impact of the global lock until someone 
complains. And for the new features, to make them mutually exclusive with 
Dynamic PAMT support by simply keying off module support, rather than 
allowing Dynamic PAMT to be disabled. But since Dynamic PAMT is available 
on all newer modules, this would only appear to make the new features 
enabled. In practice they would be dead code. And default off is arguably
the best default option in DPAMT's current state. So prefer the kernel
param.

Also, I cherry-picked this from the last DPAMT patchset and didn't retest 
it on upstream yet. Will do, but I'm not expecting problems.
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 arch/x86/virt/vmx/tdx/tdx.c                     | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec2..af8b8eb54228e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7564,6 +7564,13 @@ Kernel parameters
 
 	tdfx=		[HW,DRM]
 
+	tdx_dpamt=
+			[X86] Controls whether TDX will use Dynamic PAMT
+			to save memory, when supported.
+
+			Valid parameters: "on", "off"
+			Default: "off"
+
 	test_suspend=	[SUSPEND]
 			Format: { "mem" | "standby" | "freeze" }[,N]
 			Specify "mem" (for Suspend-to-RAM) or "standby" (for
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b687..ed5f37e5ebb29 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -50,6 +50,8 @@
 /* Number of DPAMT pages to be provided to TDX module per 2MB region of PA */
 #define TDX_DPAMT_ENTRY_PAGE_CNT 2
 
+static bool tdx_enable_dpamt __ro_after_init;
+
 struct tdx_module_state {
 	bool initialized;
 	bool sysinit_done;
@@ -2055,6 +2057,9 @@ EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
 
 bool tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
 {
+	if (!tdx_enable_dpamt)
+		return false;
+
 	return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT;
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_supports_dynamic_pamt);
@@ -2316,6 +2321,13 @@ void tdx_free_control_page(struct page *page)
 }
 EXPORT_SYMBOL_FOR_KVM(tdx_free_control_page);
 
+static int __init tdx_dpamt_setup(char *str)
+{
+	return kstrtobool(str, &tdx_enable_dpamt) == 0;
+}
+
+__setup("tdx_dpamt=", tdx_dpamt_setup);
+
 void tdx_sys_disable(void)
 {
 	struct tdx_module_args args = {};
-- 
2.56.1

