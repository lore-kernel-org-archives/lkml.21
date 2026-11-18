Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041447;
	b=G2vSIGWQjN7xYDKYvVahqcQKmFs9eUvoWah1DKtgNZxNVAfYNeb4EMJgP2sqhhUH7Oip
	 RQGdIBU4bneKHkfA9fcJEerbIo6/lk2sBlb0z2TWi4HcOrt/mfo8b88203xoG4V330f8Z
	 9/jYRo6oQBn5AJvqDX4ZILaTmAIawFrv2gIpbKEr3ZWp4U81O7H1UPjyQAi6rHV4yfH+j
	 2lHqaQslKXNi/mkCFcoC2BsLCgcFdFprnDKdfr6zKzhn8UtwK8PWaHJZVt40zIsLHcewm
	 arD0TmzadGIoDiK5ek33/8aMNkmhttLDftpZ5jQ6T+tcZxYDccxZ5g1hZDwVcbk/frQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vtujdpaU40al4T5ZdD8VivFKSuVoB9aJ5CGlvJ4l578=;
	b=lYmQ3kgwojXsAbhcp5TZ/ry3knqArabYvpLJH0oOVNPg1E/OfC8Ttx28g7/PhiS3+UV3
	 XUtoQso3XDe+zkziPka+cUUdb6B10R6eDjniXPS1c05TuxzLAVfkdHm6gtrpxz4xpTj7C
	 1l8sNXqIUby6DrOqVhjxkujPpJGyNDBlKXIZHXFlRK+DKGrb4EhW/BbCudJAyVp1n0rkQ
	 rRhlcPIfc7FqRuCDr4QB0eNzlJBEL3B0WxfF7xza9UgTGxQj1wjEyZp29WHuBjQNz60jp
	 njd2Dj9uMBN6IW0wSRDvqr11o44P7ZUjkwa0UPAANL91UYFN6hfJWyLQpv+eLCxqkJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCkWdhmk;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB8606A999
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FB8606A999
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UCkWdhmk
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so1669385b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795041446; x=1795646246; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtujdpaU40al4T5ZdD8VivFKSuVoB9aJ5CGlvJ4l578=;
        b=UCkWdhmkNToAqzBuAZIqNBHEJM7rm+H9Zh7cIkX7PfF0jiS26HDO0jUbwchxm1CuIr
         uzEOwKxW8lyVkOBgQ5D5C2B4XszDmLGny78iQmPI24gMe22WfCjq1LDE9KJlYwGovg+A
         MhXRUNpSi/9eD/h1uqojO+B9TsGJzkz5FjiG0q4aZbHDGvGXS/pL+DKc9n5U3K4l7cGa
         pFOdUHV/czu4WqM7CSgbVcrauDXYJPeZSupdH28DmhKinlPsKZAvvoo2mGWlnwCtue15
         rISFylo3OQHfQy4mRTEG+E7c33k7AZn9aAI2GYEriRQIHlON5jpWy7egX4k0mg4cRRO1
         esCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041446; x=1795646246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtujdpaU40al4T5ZdD8VivFKSuVoB9aJ5CGlvJ4l578=;
        b=Zc2cDUB02kElpfH6/UfzbQCzNt9yu5PHtx9It7hTXzGmtMHFIOahEXs1Ldo6zkuwLS
         6SX5K5dUy+Bx/EhI75XTwVJikYyZCM+GuJSEHiOSQtAYV4C+9SJSkDjWTl1+Swoha2ir
         C+C6m3SxQUWefTvCcft8ZRK1rw+AFx0Ed6khClHOIEU024MIuzcsG9ajko7TYd1PNO1i
         fBrX+Lb8/rN+xngW/FvDWubIX62W4z7RArLM6fhFX3E84TTfPWtsH8vGlJBmYluOrAb4
         ZRu2C/p6aMSP4MRO+2WltHHcVuK8DmXelDibhnyfa6eQ1yOaWHt0q25+fMC7d8D7z7td
         rMjw==
X-Forwarded-Encrypted: i=1; AL+hErGGSkWKb1nGEhnLn1bcUiaol8q/r9rqc2+raw3XdkY3CgNA8gmIsz8p2oE7CjjWO2znsE4wOyqFsCb06+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lxh6h0+IgM/EvhDDwks1BGgwvxr0HMONrcGzaegHBN353SdcR
	FGJnx4FgiLZ2TSRmN9VQ257+of8OGnSe++7LYRMG1HaloplM28s6OxAegBfvHZYaMz4vIX01W/m
	c8LQIkM7m1b+EBw==
X-Received: from iocre7-n1.prod.google.com ([2002:a05:6602:87c7:10b0:9e8:de6c:a5a3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1925:b0:55c:888:30ff with SMTP id 5614622812f47-5774240c0a2mr4971244b6e.45.1795041445551;
 Wed, 18 Nov 2026 14:37:25 -0800 (PST)
Date: Wed, 18 Nov 2026 22:37:04 +0000
In-Reply-To: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118223704.3286085-14-dmatlack@google.com>
Subject: [PATCH v11 13/13] Documentation: PCI: Add documentation for Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Alex Williamson <alex.williamson@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add Documentation/PCI/liveupdate.rst, which pulls in the kernel-doc from
drivers/pci/liveupdate.c and include/linux/kho/abi/pci.h, and link it
from the PCI index and the Live Update Orchestrator documentation.

Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 Documentation/PCI/index.rst           |  1 +
 Documentation/PCI/liveupdate.rst      | 35 +++++++++++++++++++++++++++
 Documentation/core-api/liveupdate.rst |  1 +
 MAINTAINERS                           |  1 +
 4 files changed, 38 insertions(+)
 create mode 100644 Documentation/PCI/liveupdate.rst

diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
index 5d720d2a415e..23fb737ac969 100644
--- a/Documentation/PCI/index.rst
+++ b/Documentation/PCI/index.rst
@@ -20,3 +20,4 @@ PCI Bus Subsystem
    controller/index
    boot-interrupts
    tph
+   liveupdate
diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
new file mode 100644
index 000000000000..96b1d7f5df3a
--- /dev/null
+++ b/Documentation/PCI/liveupdate.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================
+PCI Support for Live Update
+===========================
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :doc: PCI Live Update
+
+Driver API
+==========
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :export:
+
+Internal API
+============
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :internal:
+
+Live Update ABI
+===============
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :internal:
+
+See Also
+========
+
+ * :doc:`/core-api/liveupdate`
+ * :doc:`/core-api/kho/index`
diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index b3c689e633c1..2bce2644eba2 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -74,3 +74,4 @@ See Also
 
 - :doc:`Live Update uAPI </userspace-api/liveupdate>`
 - :doc:`/core-api/kho/index`
+- :doc:`PCI </PCI/liveupdate>`
diff --git a/MAINTAINERS b/MAINTAINERS
index 6b7c5f3a64d3..1572f6c905aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21554,6 +21554,7 @@ L:	kexec@lists.infradead.org
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/PCI/liveupdate.rst
 F:	drivers/pci/liveupdate.c
 F:	drivers/pci/liveupdate.h
 F:	include/linux/kho/abi/pci.h
-- 
2.56.1.703.gf848ed807c-goog

