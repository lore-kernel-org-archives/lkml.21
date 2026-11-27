Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771235;
	b=pAD3auX8Rf1jYJtKXHBVE9XrA66AhGnHGfEzjHmrw28NFGu5jPPljcFL71t5QbXGkIcd
	 rE9iNFanPrFsBnKWsHHZSkwjm7cFQ9wqzS7zZvcPMpdxsYMj9zHB9iCORNtPStvdxl9uJ
	 SfIgpYDhpbWaBkSNGmXYzUYr7khqyUfHBM37Ngw80sy2FazRHqYN2sQX6V2Uel9Ju1zmi
	 XmmgEFn04RST1NaYBJPfKucCLXz3/0sN8Vm3/nLQ/JEYLH6Qf4uh9K/UPMAZSa7BLhKVg
	 yBltUrO1OXEhlm3uZTqDmI/nll982TYF/Zu2XTuUpV70msfTziV2Uv9PY6nBd/BqTCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771235;
	h=DMARC-Filter:DKIM-Signature:To:Cc:Mime-Version:Received:Content-Type:
	 Message-Id:X-Original-From:Date:X-Lms-Return-Path:From:Subject:
	 X-Mailer:Content-Transfer-Encoding;
	bh=NAveHZyPGEK7/TqQmlT5l/nHUt/7+kT2XBefCLptYA8=;
	b=3JVYYPjeyftFVovyTQFpCqhZ988hIvgDhacJZcC4QUWpiuZ18nHAsD3hOBhubmmoYHOL
	 2sFGHZM14SWfFhog4PKn67jsGybdpKa/FbmF5/dFXDGSrctpeSV0kuoSn9Uq2Dxtek719
	 woFug2QDXHUSXMpbNoe0tLvKVUf2suWK00VwWCO/Qw9mv1kjfZ6BrspuojS7xz8++qqst
	 cwukv5rRnZMAXlucKZkJqUCOiW5YsuT55uAdpCYKxAL4yUgNj8g7pCflQQky/iS9BXuqH
	 imXU7siL7+G+LzYe60zES7uXUEcEtSHBEcoT/Qr6IlE6guMsMv1xNTwnxATuKBpCajw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=dN4YAOYw;
	arc=none smtp.remote-ip=209.127.231.54
Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=dN4YAOYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1795771230;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=NAveHZyPGEK7/TqQmlT5l/nHUt/7+kT2XBefCLptYA8=;
 b=dN4YAOYwkweTlVz3J48UO43lTzZVImGi0Ol3m/AZeZ2o/65i48Oe2FnZX6bmwZj91KDrek
 1ili5RSpwShewe9WUtciLJusEmX5GEsn8D3KkkSexc21018OCBX3L+/HFNz/utB2azlhyG
 TnXYnEo2Hxp6bUqgvar/zp07JFnfSvbd+hqY+6WEEXGIKHwT9VEPk9YKFd73LJ1UcQLHpu
 AXPgKNyvhDthjzgQDuGNIErsBESsM/REKQQMbylNB4K7GnR6QJt9eXyZOT5wdeBfLFPldQ
 0jMAdHXbxLPn8if45dxehEgNattf0kJFT0SQjOIgRakU3dWnywsFcQdhNaJGxQ==
To: <yukuai@fygo.io>
Cc: <linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<song@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from localhost.localdomain ([183.34.163.136]) by smtp.larksuite.com with ESMTPS; Fri, 27 Nov 2026 09:20:29 +0000
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261127092024.79116-1-nixiao@fygo.io>
X-Original-From: Ni Xiao <nixiao@fygo.io>
Date: Fri, 27 Nov 2026 17:19:48 +0800
X-Lms-Return-Path: <lba+26b094b5d+a20736+vger.kernel.org+nixiao@fygo.io>
From: "Ni Xiao" <nixiao@fygo.io>
Subject: [PATCH 1/1] MAINTAINERS: Change email address
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 7bit

Use new email address.

Signed-off-by: Ni Xiao <nixiao@fygo.io>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c72a281a8167..6bbee57334b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26061,7 +26061,7 @@ SOFTWARE RAID (Multiple Disks) SUPPORT
 M:	Song Liu <song@kernel.org>
 M:	Yu Kuai <yukuai@fygo.io>
 R:	Li Nan <magiclinan@didiglobal.com>
-R:	Xiao Ni <xiao@kernel.org>
+R:	Ni Xiao <nixiao@fygo.io>
 L:	linux-raid@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-raid/list/
-- 
2.50.1 (Apple Git-155)
