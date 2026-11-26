Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699725;
	b=RSehzyiTsa4yj2KLPOof62oalH/M4pStGMxK4MqicdEW0iIp6t/OUhC/FdyODQNmRrA+
	 h3L8/il3ajuEyCwt8F4zJngmRhhUfwEGp7+emGahYgVeV9omtMxZq5WqwmWIhyNYpA12Z
	 x1opKwMtswk0T/cTAfV0gVPobop3HBORXeQ9RHRpRwxNOMkYGdSWZEVXeNhvsxJo11hlK
	 BI3NKQcdYD59FHGSJfEBMZ2VtH64asSyHjG5PQpm68WvGANtFk8Ti63TUKMXyVt1V8mUZ
	 PVTlpKlsGnjtSNO7Uf+25n3qddgG+dAcqoZSrVRCbhu91XgikGrfk8tQqwKM+5bHW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699725;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sePCiVauuSqOAnYV288wGjdkvSBQky2K126fYSbUmfE=;
	b=yzorBwY09Li5mE7okdi6r3YsHKx0P5oCKm4/AfxsQJW4lSzuOQrcengfgdQesl/HUVDk
	 IQ5kfeSHE5jV73RcKRiqwbx8rOQAforP2HfBDgcCzquV82ASWul/cAqis8sCzyhurZnI2
	 1O4LUHu0OGpS6/eVtCWEqPrTXMIOPA0JlifgQDdIfqm23wrxqtep6BaRg826OYAQDM664
	 LSBec951e8+r4UPv3e9j7tpnbupCdfDrRPrWxpxWuJlfjmLfseatphwuALLR7eA89pWRM
	 yO+Hda6NNOfO0m7nLanlQ2ZIyeGfFCNviwQ09lwvj0xO8r69QdA8dJAuGwRCDnOX1wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="f/lgjcs5";
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7931606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7931606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f/lgjcs5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=voPRCI34GRzvXMCYJVFRcZ9FG3JeoOsk3CVz5w57PG8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795699722; v=1; x=1796304522;
 b=f/lgjcs5EPQFGFQDkFnuQQ/8OEGrrbv11aOqmPC7BOxw7OjN4jb4+f/wyuydPmR8vHCs7k+b
 HzgCYeFog3DVy49Pwpq5BzZqOxZosgrZnJ7OWPD0gE6wHvje0owSk3Zja4dc503XMkXtPBZt9FE
 CJQz05ln2qRgIIw4C1TpXHyY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 228c84f2e902d042;
	Thu, 26 Nov 2026 13:28:42 +0000
X-Mizu-Trace-ID: 228c84f2e902d042
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	wy@wyuan.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH v3 1/2] docs/zh_CN: Add RCU/index.rst translation
Date: Thu, 26 Nov 2026 21:28:00 +0800
Message-ID: <20261126132802.6627-2-xiongwei.song@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126132802.6627-1-xiongwei.song@linux.dev>
References: <20261126132802.6627-1-xiongwei.song@linux.dev>
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

From: Xiongwei Song <xiongwei.song@linux.dev>

Translate .../RCU/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit b3eb16109ae1
("doc: Update stallwarn.rst based on RCU Tasks Trace as SRCU")

Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
---
 .../translations/zh_CN/RCU/index.rst          | 49 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst

diff --git a/Documentation/translations/zh_CN/RCU/index.rst b/Documentation/translations/zh_CN/RCU/index.rst
new file mode 100644
index 000000000000..3675da1a2993
--- /dev/null
+++ b/Documentation/translations/zh_CN/RCU/index.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _zh_cn_rcu_handbook:
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/RCU/index.rst
+
+:翻译:
+
+ 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
+
+:校译:
+
+============
+RCU Handbook
+============
+
+.. toctree::
+   :maxdepth: 2
+
+TODOLIST:
+
+* checklist
+* lockdep
+* lockdep-splat
+* rcubarrier
+* rcu_dereference
+* whatisRCU
+* rcu
+* rculist_nulls
+* rcuref
+* torture
+* stallwarn
+* listRCU
+* NMI-RCU
+* UP
+
+* Design/Memory-Ordering/Tree-RCU-Memory-Ordering
+* Design/Expedited-Grace-Periods/Expedited-Grace-Periods
+* Design/Requirements/Requirements
+* Design/Data-Structures/Data-Structures
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index b52e1feb0167..4488a97934ec 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -29,6 +29,7 @@
    power/index
    scheduler/index
    locking/index
+   RCU/index
 
 TODOList:
 
-- 
2.52.0

