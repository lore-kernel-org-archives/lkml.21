Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508544;
	b=paed72Gv1lbW4N2GrCIkhpkxXPnLcA7JPtdE1GtGmMqEpqmrHVqIQ02roO6qw1y2u26q
	 YOKJ75K9jxQRaAvyjVi8eaBi3DbMNi4PoFPpOdUb6VnBzGkqhTWSFOI1Sd1Dhn+FC235i
	 n+kl6jSnOX9z8X32MjcQC2gM3t5y1Vk1LgBtRibVtlKLlWwjjRYaj79ycPb4u4b0Wi9/s
	 y3Fo84OuLe9qJeh/5Gxzi2typ4FGlbbmJ58LL0JAaymjTtL4iywXEHOrQ2lE56/CETOjF
	 iX15kDcjE+BeWGi1oDMBnYbYvWEP6UMpuBiCdx85/BuLafOcp+uI9y9dJOB0xmQjyxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508544;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GQqtlAPcsLFlGT94sshMT4Kfkpv5lPk+dL3UQNr4EOA=;
	b=czGRv8CYT9MXGlzc9Va7bJNT6e35EePjaudPkIdFFhanQLxdZdD2V2o6rNal+IZ8RGjP
	 /84+UDdBKLLEDWWaDplHX1Q7gV0L9DXAnbTWPA9nRjZFTX3vQUHkJBnJnxgI+Fb6bPugW
	 Dt4aA1lZPU1RSdPlbpXMecqiQL01QG5cvM5CJ5qW0Taui3s/+4c0jODH5NUiAmxqNgs8F
	 40q2Zp7m8v7tyHrtSA6tITI4Vm+1lyCPwUOnfqCBYfOzt1fqvGOpBB3NA6xosdVQzw/bv
	 HlWxaBLrE7JGtkBVROcKzx1HYdgzEYpszkcxed27OkCidDq+sWWoVBDOxMwHkHaqcyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YY22qhwj;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A17606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YY22qhwj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795508543; x=1827044543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gqKiPUbmXJdm37kl4ea33ZbcylgdNnLfBx/KhDNnKGc=;
  b=YY22qhwj2EyAHgOZiRXyJViIGHNRqrbehhbjaQi3WEb2FPy4QSOXpq/b
   s5CWmZNncvVZvi32T0UEZswRz7tIbOEpx6X826TdKCDQiFu64Lkn55Dz5
   WjS36TEL40AyYFVT7K2tphXClb4Non8xk5T8T/GEyXPpo9ghrGXy5PwUo
   MBhoONWHe2OBHDJTzYHhSFuEUciinKAN5voP/NcL3mhXkippRdQEuJRrv
   WGIzVlRtJVMWK2oov8jP/FadrKi0nj/xK8Q9axGRNGpxaIVwFVlMBL5uN
   Hfri0z9D0e/kyapT+lhyYLIthH3mp9vGHlyHwWfo31gdgopNdUg2FezDs
   A==;
X-CSE-ConnectionGUID: CQYW+p8pRii/WJdS9yBtDA==
X-CSE-MsgGUID: i0V6rqqjQ7m+wGihEb1XFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4440682"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4440682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 00:09:58 -0800
X-CSE-ConnectionGUID: OBMhvz/2RZeIgM8WNptscw==
X-CSE-MsgGUID: y8jYUQKyQyGf7cOjDenMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11835160"
Received: from yufei-super-server.sh.intel.com ([10.239.92.104])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 00:09:55 -0800
From: Fei Yu <fei.yu@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	tursulin@ursulin.net,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	fei.yu@intel.com
Subject: [PATCH] drm/syncobj: Document the handle limit in the uAPI headers
Date: Tue, 24 Nov 2026 16:15:36 +0800
Message-ID: <20261124081536.4048657-1-fei.yu@intel.com>
X-Mailer: git-send-email 2.53.0
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

Commit 6ca87397aeeb ("drm/syncobj: Limit the number of handles and use
kvmalloc for user-sized arrays") rejects more than 1M (1 << 20) handles
with -EINVAL in all syncobj ioctls that take an array of handles: wait,
timeline_wait, reset, signal, query and timeline_signal.

Document the limit next to count_handles in the four uAPI structs those
ioctls use, so that userspace knows about it. The define itself stays
kernel internal.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Fei Yu <fei.yu@intel.com>
---
This documents the limit added by the fix below, which is in mainline
since v7.4-rc4 (6ca87397aeeb) but not yet in drm-misc-next. The patch
only touches comments, so it applies and builds on drm-misc-next as is:
https://lore.kernel.org/all/20261109014852.2127723-1-fei.yu@intel.com/

As discussed in the v2 thread, the define stays kernel internal and the
limit is only documented here:
https://lore.kernel.org/all/20261104030930.3852781-1-fei.yu@intel.com/

 include/uapi/drm/drm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index bc7ef7684099..59b6e2558d82 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -963,6 +963,7 @@ struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
 	__s64 timeout_nsec;
+	/* at most 1M (1 << 20) handles, more return -EINVAL */
 	__u32 count_handles;
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
@@ -983,6 +984,7 @@ struct drm_syncobj_timeline_wait {
 	__u64 points;
 	/* absolute timeout */
 	__s64 timeout_nsec;
+	/* at most 1M (1 << 20) handles, more return -EINVAL */
 	__u32 count_handles;
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
@@ -1021,6 +1023,7 @@ struct drm_syncobj_eventfd {
 
 struct drm_syncobj_array {
 	__u64 handles;
+	/* at most 1M (1 << 20) handles, more return -EINVAL */
 	__u32 count_handles;
 	__u32 pad;
 };
@@ -1029,6 +1032,7 @@ struct drm_syncobj_array {
 struct drm_syncobj_timeline_array {
 	__u64 handles;
 	__u64 points;
+	/* at most 1M (1 << 20) handles, more return -EINVAL */
 	__u32 count_handles;
 	__u32 flags;
 };

base-commit: 2f50e0a0f9d319678a67715d4160ee890f5ee6f6
-- 
2.53.0

