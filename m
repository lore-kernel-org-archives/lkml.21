Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089197;
	b=GV17UxmLtAlPxzyuOcUPojU8mbbhV1J6dHvVCUPXJtVKYwF/78tBeO64ydvRxAuK0GYk
	 S4MBzCzwxhT8WzcRd9raR9fD3utWM+UaDJn26JmBkmWys03Ala5swfsREk39ifANmnspN
	 PyLoOwzlWRGF5khBskHK6BkNhGbS3Kp2n6sYVSodiVWxC6zwaToB6agJ20FAnqx0PSQmi
	 aoXYRygVvnoPoTWuXiTt0aHSd88SuKoZg2UbyochVHXChvvl3qAPhpppiIZnjna9b1dGP
	 5TdUes6wJF/0obuA7EZR67Uvq0gVTOfCnHI2QynjqEC+ziprTqyVb8GB+sb/EiioBUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089197;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3BmlUDMOmBxvxH+eCj4xBLViMr1DKHjg+FX4KB3ZuLA=;
	b=e/O/Z/2MFoOAQQNE6BhuN31BLloulboTGS8SpJB5HWY5hB1DNEdAEUSIOAGNjIe5+4CN
	 HiGBAqehOSoULOhhMLM1iCNh9s1Mhy/nYTiRwb/BmvQChk48jnTbl8PvdqnjL5arfydtn
	 K/MHXODA7krrGKiyekYuZMZSz++CLdvz8zKJ12IHBm2bA7tQWarrsJ59LO/s8vb62JE4W
	 TOHeIT6/NFIuuZNlChhzCObZ2xQhzTL1RhfmfobflhLFWDliQQ6g+45qilZUaxKZWmz59
	 ctm0cnTtUK5makFGRSInPYaCkDJJZRrtCYDswncVgv6DRrNg4wSabYFhqebPOMRXOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ie8t3OmF;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8272E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8272E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ie8t3OmF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795089196; x=1826625196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E+f63OSutAQy2QqhSDs4IPxvHmtJWjjflbbCp7VmFx8=;
  b=Ie8t3OmF7DOV8fugqzhRqVIquRPr8+4pL8NzGfXfBS5pFQlzpugAKNa1
   u0FpN8ywZ12fjqp7KBi7Q9V+/jg2Pkek3AUNflTYDLzQQjbDlHfqKs3CG
   RQfWlJbnj56sdAm918fyOyZLy684GemEGo2Omdr+3DPIRlgjHx10YGWl6
   tc58KJ6d9NInZelnX981CAZl57ivv0HqzlKxQt8FplKxOssnxp6VHUotl
   u13anmkyYk7xUSyZ0ykQM3XdPhNyZDkfSNBUFrSDNHtLAUdHsUh3a//Ny
   9CTQzhcnucXqMqcYJWWigNFY1nqZ75FxWge1FAzn6nr/a9tgbsB5SeWpg
   w==;
X-CSE-ConnectionGUID: DLS6YGO7RjeitEGbXlQjkw==
X-CSE-MsgGUID: IufaNtOaRq23pcJbfNzzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3823698"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3823698"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:53:15 -0800
X-CSE-ConnectionGUID: Qu8mIUWVSTWkUCKNIrTaSw==
X-CSE-MsgGUID: EzdjSFefRNeKRRHUvznbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10968874"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2026 03:53:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D1E7499; Thu, 19 Nov 2026 12:53:13 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] pstore: Use match_string() helper to simplify the code
Date: Thu, 19 Nov 2026 12:52:54 +0100
Message-ID: <20261119115312.1304807-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed typo (LKP)

 fs/pstore/platform.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 1ad6e40f4952..f517b229decc 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -17,9 +17,9 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/pstore.h>
-#include <linux/string.h>
 #include <linux/timer.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
 #include <linux/vmalloc.h>
@@ -130,10 +130,9 @@ enum pstore_type_id pstore_name_to_type(const char *name)
 {
 	int i;
 
-	for (i = 0; i < PSTORE_TYPE_MAX; i++) {
-		if (!strcmp(pstore_type_names[i], name))
-			return i;
-	}
+	i = match_string(pstore_type_names, PSTORE_TYPE_MAX, name);
+	if (i >= 0)
+		return i;
 
 	return PSTORE_TYPE_MAX;
 }
-- 
2.50.1

