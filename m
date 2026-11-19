Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115747;
	b=UMt3FlIL5eICyXImles7/NdzHC0y22HvqbbwLQ7ctFRCxZJrglwng8GP7Ahp/L3+5Zcu
	 nReERME75wLjhnb0ParoEWxpe4sTJQ7cvJlR4NwXgt//eiWKYDHZuR/pgFwlJs3OANaCr
	 Jqt3OZJ6x5qtE/+WexMVGakh3EfA9IPatya1odA1Ogi5iMtdnferTPxlOcRuN/0jqZSVz
	 OiRJAxTJofdqONUoG6U6B+xG1vr3cgT066rk+wqoJJXCDao3T7QVI8a8V35gmfBZ5tyay
	 +vxGwXE39lHmSOovwD5bQFjsv32WHVzb/845PSuwZ42BEE87O7lqUtVkAWTX646i3MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qD5mQo9yrkd98wh37Vn+QN/WnvrI8qjE0dQYr6GEqxM=;
	b=jejeswYg23BIm95pvyVN/L/ZUaEuGuKv+dEnaFapvcq+r2MEhIQY+AM5wR8i3Mfda0+b
	 MrI+5ORVCgBAXYbRaYup+ZkyZxNz8l/OqBAoGemUutnVZ8IyRJ+e1+URsXmpGgS478UdA
	 laJL6rFj1q7weZB83pI5exZSYVZNU28L6VaDbYRyG9SUvm6v7Rm4OYBcpTX1HAM5OPI8U
	 5NphOkkwU7tpQ47GmL31mlrpOcH+rX92VQjTbm2QF5dc0ULHr3WW4Q4PIauzxGsOT9BTp
	 GboRdt+oiHFq4sqnFis6UPS0Tpjntve2/7POFU+DImIGP0z+3jTY+A2xkPUKXsx6SSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="b/F1kjU9";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F50606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F50606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b/F1kjU9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795115747; x=1826651747;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Niqj11OWqC+LDHiN+/tULOCOhsZKCL6lYLl9And/Z6w=;
  b=b/F1kjU9O2KFEk6mZIoFD2uB7TT4AUaDiZUAclm/C0aQfLB+vi5xRb7O
   QLrJxVZ5rOln5ujm8Ku3O/MzMrhiNuJp+IiJJXv/Ut6o+6LaVxAD1xJ+G
   u1EGrv1nS8uvYVxo/2wzzSvkgWz+uEMcfQzyLExCvWPURqoIRZpGO8DdU
   865hfPnibvfZlAJlz71uOmwqYuzGIqJo6WW4BDEgarruFADmYg3jYwsj2
   rrybkyt1kGoXGsugIzBqg3tblFL9hKJYarmSEArpkw7T93kpU7Wa/76os
   DMxsWdMpaAbEEtCm33+w5C+UFqyqNJSj/Rz4tV+VntGUb+qdj5Vjs6TmR
   w==;
X-CSE-ConnectionGUID: p9XQaqM8RaSr3QdDyJr1zw==
X-CSE-MsgGUID: pRL61WWURaODbgGWOzVtJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3975943"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3975943"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:15:37 -0800
X-CSE-ConnectionGUID: 71NN/RjyROGMSyiBuiBieQ==
X-CSE-MsgGUID: Gy9tuP1USXK3qUplxZtaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12362564"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 19 Nov 2026 11:15:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 575F599; Thu, 19 Nov 2026 20:15:34 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] bitmap: Refactor bitmap_read() and bitmap_write() to avoid too big shift
Date: Thu, 19 Nov 2026 20:15:30 +0100
Message-ID: <20261119191530.1716850-1-andriy.shevchenko@linux.intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While compiling ad4691.c I have noticed the following warnings:

  drivers/iio/adc/ad4691.c: note: in included file:
  include/linux/bitmap.h:854:55: warning: shift too big (64) for type unsigned long
  include/linux/bitmap.h:854:55: warning: shift too big (64) for type unsigned long

Since the bitmap_read() is called with statically define 'start',
the 'space' local variable becomes equal to BITS_PER_LONG, or 64 on
64-bit machines. The 'nbits' parameter is coming from the run-time
defined value. Static analyser doesn't see that the right shift
by 64-bit can't happen — the space >= nbits check guards that.
While Jonathan put it as false positive [1], we still can give a hint
to it without growing in the code (`bloat-o-meter` for above mentioned
driver shows no difference in size). So this is what this change does.

For completeness, bitmap_write() is also refactored in the similar manner.
I have also checked a few users of it and `bloat-o-meter` showed no change.

Link: https://lore.kernel.org/r/20260531111528.32697d1f@jic23-huawei [1]
Fixes: 63c15822b8dd ("lib/bitmap: add bitmap_{read,write}()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index adafbcf2016b..f331cf06130d 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -846,7 +846,7 @@ unsigned long bitmap_read(const unsigned long *map, unsigned long start, unsigne
 	if (unlikely(!nbits || nbits > BITS_PER_LONG))
 		return 0;
 
-	if (space >= nbits)
+	if (space >= nbits || offset == 0)
 		return (map[index] >> offset) & BITMAP_LAST_WORD_MASK(nbits);
 
 	value_low = map[index] & BITMAP_FIRST_WORD_MASK(start);
@@ -874,25 +874,23 @@ void bitmap_write(unsigned long *map, unsigned long value,
 		  unsigned long start, unsigned long nbits)
 {
 	size_t index;
-	unsigned long offset;
-	unsigned long space;
-	unsigned long mask;
-	bool fit;
+	unsigned long offset = start % BITS_PER_LONG;
+	unsigned long space = BITS_PER_LONG - offset;
 
 	if (unlikely(!nbits || nbits > BITS_PER_LONG))
 		return;
 
-	mask = BITMAP_LAST_WORD_MASK(nbits);
-	value &= mask;
-	offset = start % BITS_PER_LONG;
-	space = BITS_PER_LONG - offset;
-	fit = space >= nbits;
+	value &= BITMAP_LAST_WORD_MASK(nbits);
 	index = BIT_WORD(start);
 
-	map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
-	map[index] |= value << offset;
-	if (fit)
+	if (space >= nbits || offset == 0) {
+		map[index] &= ~(BITMAP_LAST_WORD_MASK(nbits) << offset);
+		map[index] |= value << offset;
 		return;
+	}
+
+	map[index] &= ~BITMAP_FIRST_WORD_MASK(start);
+	map[index] |= value << offset;
 
 	map[index + 1] &= BITMAP_FIRST_WORD_MASK(start + nbits);
 	map[index + 1] |= (value >> space);
-- 
2.50.1

