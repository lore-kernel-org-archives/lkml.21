Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625739;
	b=opaGJpjGxskJjhZsPuaLpXsbC177gpp42UfSui5rv6ddpYZ1SBeBKbA/70edgWKl2wBW
	 Pd5ZXhDfunrZLhm7xK7flMbQ41mNDxvZ7jIwmqzkaMMdQgBwEuTbBGeZtT5LBxUm6W69u
	 C0MeMdJqKifv9TJs8z/PWcbMhdJdW4d4E8wyvaIuhAyCwreZZpArXM0AYiUOTW19/0L9M
	 Qgm5S1cs6CABpisJDaeZRAmB9YPjpmRnYFDphsxNMy6yH0FZGj6r9IqTe1H9Cnhs+dVYI
	 z0oEkU013qNK46uDiSnmm0nfJZ9EmyfSiPlrtaW/EmgWSl2pYquBJNLECJGU1GUsETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=98EoFToBo49ByQHbtuR56+7KBPdzQ+8PTxIieRE7o3c=;
	b=ItQh5RJAyM/mkW5WFJ+35j+ZOa8TpADD0iSmSrlmxoVmk5JdenXnIoRFLKEa0rL3ySWd
	 bKBAnzMFt5t0SQicHSIEyqjTu/wepbR3GJh6R06gFAaD6HzAxOLil8ABsjYODsGc8+0xV
	 1jqAHTwcI3/9OyhjHwUAJUtbK02swuNTzmM3uZmyBghd9HmsFNdsG+yDUM8hDdprddWec
	 +DxNMO0icyoJBqAUdQ5z9xBk+96UrXQQyvt6dXv5wVr8uZKNhia8q+uw6Hz9Xmjk7iM0v
	 /LG+qtp98KTv1jXnUmlA+h8e/afx3kBkJqCx62ucIJq8qMahACc+baYUjTuvt5YqtnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pb89gTVt;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD48606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD48606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pb89gTVt
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b51871c5c4so44703387b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625738; x=1796230538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98EoFToBo49ByQHbtuR56+7KBPdzQ+8PTxIieRE7o3c=;
        b=Pb89gTVtrzeoiJcDoiEkUtlijJ02ZN9xGD8qxzTPhpb37HFWnq2/XJlEAHTgYUb0de
         kJIhXWv+49J5YZkxcJ1CzALUNcoykbR4DLJ/EaKuvNTyWuKtPTQnD7vQEEbN65sNqwav
         idVQJrMwp7sjAdd4ULTkncxXVJbxhVEqEZ+60M2wNK4eAV+aRj/sm5Tcb77F+hW0UOUl
         t1C8iMw9WafdcwEiIC5vzl5wTzSnQMItF+rkZaahbS/pvNKeXcONnwnJZ42JbY1SB49Q
         0Su3mICHGJKbguDO547z80gfq3RCHvzMEn7P8VcJlcl827iCRbwBQtdwM4OxzIx7MDBm
         cBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625738; x=1796230538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98EoFToBo49ByQHbtuR56+7KBPdzQ+8PTxIieRE7o3c=;
        b=uig6asw8mT7aAINtK8uQFxc+MxzpHfQc8TI45eDeTfLHJ/RXAMDa71igLmKbeT1j3O
         kXtMOiaFh5joR30X0DAdXr0Zo/szDTE/Oax5sQktM0KJq362XY10It6ZsbLbQiT/uEqn
         qLum4fXyGqbgEdrV/Y94JHVrOnV5OC/mOgteYS/Uq4lulv1whcFBI8x2R0nNmiRS11sO
         mNddYrDbQxO+QWXivwpF62mgaN7XXwTkIGbOS/clj3kT6GZvCNrSX0LIciABkBSBZuj0
         L5INeRBUd9WixeOj8LA2PKrwV4JF+54lkM0jIl0p0beppjQaM/GeI/ATm8yYhzCHrRU4
         fOwg==
X-Gm-Message-State: APuU4Z8QH6RZXalQa2KHUACHsx20nWJoa2LgY3V8BTEobf1w34GYQ14y
	WOmZ5ReqVO5DP95KFjZAwRNTkHSCbm0RSe8OgRMWBb3zAOPLpIYocSgZkXOVNBI=
X-Gm-Gg: AZFdTZfxf27R3dWvKmdyx7w5P51e3iLE1y9nchc9VtL/emFECqHzwBoJvV/JriCqteQ
	/Yev/NUKhhPsQ71Ge4KeBsX7R43bsgXNpuvgOD9Xe8SeyMU9klQ/yBWbgfx7PpRJ0bP25mON70a
	74oXLqQJcpIPaoRsGuG1qMVJHl0yQ1ou8IDXJ5BxCVfRgq28AF29ZmvPq8n9htQZ7kko4oa1bXJ
	t6oZaK71nurtPAFcrfzVS4XR5PUPKixL9gIHubQw/kXOMoyzyXJ7ncd7dlpl7rIwh5jHc55bTt7
	UC3zRFkNo9ochXnzoaQVwQlZFwJ7Ks1Lm2cwpsCuo2eyIiNqtkuwWEZYp7vVmhQUWA31gIWiZ34
	FdRd6VSY54Xb51f8j9ptfizGqyxMVDz261iUuTMdAgX+QNkY/T+0YFDHauj/yjBzICHPMAYDurm
	MxH70Evq7S26o3/UxliXDsYIOL8x8t6IdPf4xN/o4R8EptfOB9OAm1wGNqDW4dWQImz3TyftJCG
	6af1QuI+7luYryaKyyed3HX/4GIYAK9Qmo8vaNpW0x7vxBNu4Kw0hYg84QS2TH8IWpnVx2Wc6wS
	SJGPs3x4eLLmJg==
X-Received: by 2002:a05:690c:e296:10b0:8b3:392:dc20 with SMTP id 00721157ae682-8b518f9d374mr50540247b3.36.1795625738088;
        Wed, 25 Nov 2026 08:55:38 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bf474sm74766167b3.21.2026.11.25.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:55:37 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] MAINTAINERS: Move RDMA (INFINIBAND) SUBSYSTEM entry to sorted position
Date: Wed, 25 Nov 2026 10:55:29 -0600
Message-ID: <20261125165536.792563-3-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125165536.792563-1-svav2021@gmail.com>
References: <20261125165536.792563-1-svav2021@gmail.com>
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

The RDMA (INFINIBAND) SUBSYSTEM entry is out of alphabetical order. Move
it between RDC R6040 FAST ETHERNET DRIVER and RDMAVT - RDMA verbs
software.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6503b32587746..137297afddfb2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13106,27 +13106,6 @@ W:	https://www.infineon.com/part/TLV493D-A1B6
 F:	Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d-a1b6.yaml
 F:	drivers/iio/magnetometer/tlv493d.c
 
-RDMA (INFINIBAND) SUBSYSTEM
-M:	Jason Gunthorpe <jgg@nvidia.com>
-M:	Leon Romanovsky <leonro@nvidia.com>
-L:	linux-rdma@vger.kernel.org
-S:	Supported
-W:	https://github.com/linux-rdma/rdma-core
-Q:	http://patchwork.kernel.org/project/linux-rdma/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
-F:	Documentation/devicetree/bindings/infiniband/
-F:	Documentation/infiniband/
-F:	drivers/infiniband/
-F:	include/rdma/
-F:	include/trace/events/ib_mad.h
-F:	include/trace/events/ib_umad.h
-F:	include/trace/misc/rdma.h
-F:	include/uapi/linux/if_infiniband.h
-F:	include/uapi/rdma/
-F:	samples/bpf/ibumad_kern.c
-F:	samples/bpf/ibumad_user.c
-F:	tools/testing/selftests/rdma/
-
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
@@ -23532,6 +23511,27 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/rdc/r6040.c
 
+RDMA (INFINIBAND) SUBSYSTEM
+M:	Jason Gunthorpe <jgg@nvidia.com>
+M:	Leon Romanovsky <leonro@nvidia.com>
+L:	linux-rdma@vger.kernel.org
+S:	Supported
+W:	https://github.com/linux-rdma/rdma-core
+Q:	http://patchwork.kernel.org/project/linux-rdma/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
+F:	Documentation/devicetree/bindings/infiniband/
+F:	Documentation/infiniband/
+F:	drivers/infiniband/
+F:	include/rdma/
+F:	include/trace/events/ib_mad.h
+F:	include/trace/events/ib_umad.h
+F:	include/trace/misc/rdma.h
+F:	include/uapi/linux/if_infiniband.h
+F:	include/uapi/rdma/
+F:	samples/bpf/ibumad_kern.c
+F:	samples/bpf/ibumad_user.c
+F:	tools/testing/selftests/rdma/
+
 RDMAVT - RDMA verbs software
 M:	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
 L:	linux-rdma@vger.kernel.org
-- 
2.47.3

