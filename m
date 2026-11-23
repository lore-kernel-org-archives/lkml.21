Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437074;
	b=kZZMYrVqAvVfMwWDNZTMHl5LLzZbQPaxfvgfIROlg11aKM8eLFWhSkbx6HKx8yVuz/4Z
	 wES7uBa8HxrJun9NtCzmbu5iwIfOvC5ecpderFzx31dOF0Fxzpr9p47gN2no4+H4BdBkK
	 OfAU0zd3evyatcZWe1VlBYERErVKGJsSm2aga5YN2gyTQchGpSYzaULhJwDVhWnbyDGrB
	 j6v3U+F18ROAs+P1VRmDkxHr6PMxuB5sXUqF74JByx6wRcsAQytbJEX9TEmXnrRgHC2wR
	 +JVuxzDVHXmFwSC7a7OnIjlZG9axtsQd4tn3Yb1R1pWpWvEpaaGz6mm1WxX9NCB6YHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437074;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=8JFUc6suryLmfObSBujdkrzuaogAoNtsW4YHTMKxBuY=;
	b=gjv7CH2H1/v7t2A+LhM/itlKMN5KJMutvTmAnJ05cziBaKl6eG9HqsGCtIqO6Ireev7Z
	 k/HdrzImPRfRSZN1Z327asW/vos9rMadDIWu+zq2XTtdpxARetLhk8BfpOx7QpqgmeX3+
	 D0X6UJAC1+08dvNolkdrNYx2q+q3CrQ0okmtzt6yCXPascmfuEXdo57lL2h0anShf+fSC
	 xrxqZY059VSnNuSdi2bMLjDN396BwYr8I9c86RzZychV1BuT5tOMVJPrMdNArMffqXjrL
	 7SrTNwIkylb4cww3ckov3gEwR+3jTgqST3saU4yuWQ0C3VEscLjZ5f1LWFRhEzYiatA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EG246gS6;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90681606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90681606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EG246gS6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795437074; x=1826973074;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zi2Jr8R15Cer++hvJocwT7HbnrhTKE9bZDw8hOdhdck=;
  b=EG246gS6J7RL6G6MC0EXqKz8Pp8hHYG7i56wdj9qfh6Y0IyZMEs6C8Bs
   R0+GI3lepeabwddMhaH2j5iVccaxQR1k4HL3MbBTcK4aiR/svKHvG0N19
   RcJVZEfLZVzYnfUkcnh+Iqv0y3L3103Ul+Uqsvy9jVfU/MsDc099IkC9M
   2HVJwxDOGvVKGPj7JxhvSB/t1i1Cfe2ehTJKHTI9d+HZDTnAqdR75yQK2
   EFbEO7c7TgVhcGO2C7YR9sGh0/+54hq37Hr1aWiD1DooSqmO2BQuAW7Pa
   wQGm+wNKAMShPpqbPE70qyGfGPR29LFsNS8qlRjOeGIzNihEkmBRWsF3H
   g==;
X-CSE-ConnectionGUID: Sn65LwT+RUaAXW92QX1G4Q==
X-CSE-MsgGUID: 1N4lAwf/Qza6YBCd/ixLFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4137807"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4137807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:31:13 -0800
X-CSE-ConnectionGUID: tYLevqRtT2qgcRX9sYOYHQ==
X-CSE-MsgGUID: 8UeKGM8gQEqSBZkUfBqmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11620245"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:31:11 -0800
From: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	karol.wachowski@linux.intel.com,
	lizhi.hou@amd.com,
	andrzej.kacprowski@linux.intel.com,
	dawid.osuchowski@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Dawid Osuchowski as Intel VPU maintainer
Date: Mon, 23 Nov 2026 13:20:07 +0100
Message-ID: <20261123122007.2580451-1-dawid.osuchowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-31
Content-Transfer-Encoding: 8bit

Add myself as a new accel/ivpu driver maintainer.

Signed-off-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcade5bfbafe..0afa391498d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8198,6 +8198,7 @@ F:	include/linux/power/smartreflex.h
 DRM ACCEL DRIVERS FOR INTEL VPU
 M:	Karol Wachowski <karol.wachowski@linux.intel.com>
 M:	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
+M:	Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.43.0

