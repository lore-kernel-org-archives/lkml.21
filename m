Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624194;
	b=EcSqEHiZ04yZOnWAGJ7GTenOGUdrcbt9+p85uwxJwRExduTSsPDzZCK4Jz2OjcixPEbx
	 qdjSufYaNmGcZ2U3aBGBe8Fng2p4BPICCuKbenVIIdadwS92R7Cug5A6dolZKkA/CH0O9
	 EIzhtk6R29CTyP6Q5NVSOaRLxIYcIl22L+dOS1HPALS7M2LywePYlyq4T+30uX4PZaU85
	 YQmUnmb5FBuxY2WM2Ml1hXwkFB3f0iOKsv9GzO7TIJZ4DOWwP1ruxwGxwC3nAMEVJTF3V
	 01tg5c++05XWcY+Gqzz8gmhyj7GwgJW58U8lyZxSipBAWVey+5MydvXl91asc1/2DHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bAn1yJ1+gOe+W01jxJ3jOMG0apqGURJa/oZTEjOx/P8=;
	b=cbqFdAXm8A2zN8FzujUxmAe/1bCP16VEe26CNSbduMp4ksMlDcXMtJdRf+4hgGmXmZtC
	 hqi1MCYnpnFlNjJX1IoL5Vmqur8fPNrYL/p4t9RH1L0nzwyJEIckimNBEtJtx7VMxr+ZH
	 +PEapEELdwUDAbIGHWqKtC0FN5loRTUS7XA9/Qcn4aAkcGtOHrru4BKywE9hLsFE3N9hK
	 1mxt7fV42nWOrPialGN30R8XMTkYWm4Nw/w+JboFYHRFwk8xj3HPl5ZQu4ZazjqECN90P
	 zKkgVb9yO9tozJUq0BsrGvZDi3U4Soj5F2hwW4QTq8E6nzuLi2tONqco/kWvDhnBTCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KAV9clBa;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89393606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89393606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KAV9clBa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795624191; x=1827160191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W4yPHTgtHnq8zbNA0xm2ouVAd7hLbIk3Hw3wcqmd0nY=;
  b=KAV9clBaLxZ683jECxB+7gZZmURv4QI3rkaRrNzduWk+HLjxyscopBgs
   RpJaMkaIMPLOI6fcDTpWTC6z3g60+O7PVg/DR44VSGSv1EQW8xnz+uutR
   6GzWZ9YIRJ6RrbkAMLSojT40IKOGHPI+HDYs6Wog7LYv0VmnhTuimn9Be
   ZVRfe211QWtFWlDABILYpYQp+q1VNlCafW1PHb9EvqT9x4tcXgj9DeOsa
   R2MxcCl5h6iQFBda++O9KGJvfWAf44pWtjIoPHyq7R+kOf5mMYlCK7W/y
   9f/Ul2Z5ne64inFVozhC27kR7f8k2UZxUo/h9HLdhmnYuICq8G4atlblp
   A==;
X-CSE-ConnectionGUID: d1soFUkfRRGqSnzK0tSE0w==
X-CSE-MsgGUID: nAL0MCqvTPKh8Vy8MCcp0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4413552"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4413552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 08:13:16 -0800
X-CSE-ConnectionGUID: sb9OAmkFSVK6syktgUeLPg==
X-CSE-MsgGUID: wqcQV7xoS3uWdpRzBo0GnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11798003"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2026 08:12:12 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.19])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 3E383312E0;
	Wed, 25 Nov 2026 16:12:10 +0000 (GMT)
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	Christian Brauner <brauner@kernel.org>,
	Ira Weiny <ira.weiny@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH] cleanup: clarify scope-based resource management and goto guidance
Date: Wed, 25 Nov 2026 17:12:03 +0100
Message-ID: <20261125161205.65809-1-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.51.1
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

Scope-based resource management helps manage resource lifetimes, but it
does not solve rollback of a failed operation. Such rollback is often
best handled with multiple goto-based unwind paths.

The current guidance can be read as discouraging any cleanup helper
alongside goto, including guards. Automated reviewers repeatedly flag
code that mixes the two, so clarify that the recommendation applies only
to __free().

Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
I develop mostly in the subsystem that bans __free(), which is also
most low-level of all the helpers - so I get that we could discourage
mixing __free() and goto. But for the rest it is counter productive.
---
 include/linux/cleanup.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 1e09aead4b08..3b852198e969 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -145,12 +145,10 @@
  * statement and not group variable definitions at the top of the
  * function when __free() is used.
  *
- * Lastly, given that the benefit of cleanup helpers is removal of
- * "goto", and that the "goto" statement can jump between scopes, the
- * expectation is that usage of "goto" and cleanup helpers is never
- * mixed in the same function. I.e. for a given routine, convert all
- * resources that need a "goto" cleanup to scope-based cleanup, or
- * convert none of them.
+ * Lastly, avoid mixing __free() with goto-based resource cleanup in
+ * the same function. This recommendation applies specifically to
+ * resources managed with __free(); it does not preclude using
+ * guard(), scoped_guard(), or ACQUIRE() in a function that uses goto.
  */
 
 /*
-- 
2.51.1

