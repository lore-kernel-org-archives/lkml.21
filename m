Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064688;
	b=j3em1VUX26nGmcy9/CcUH5B0JipPWFbHcnoT3FRqixlA0BD7WcRSTXod+dS9kbw6r4Qq
	 fnq32rjytqzqGCLJ22ln92W0l9hipNiTpF4MN4P53Gtmpylmceq6pE0FNhyP3T6DMbdsS
	 gL3JUV0+rz1yDhLIlZQOBeJmoTx+FnzkVtpO7b5xtXrICxsTufBXleyakuLDq1sixYgSb
	 9kP0h9l6u3umQRFUMsCQ97+h9N6a97TdcaWelnbt1Q+WKq0eIH0tvwG2eYmoD5wBylUT9
	 +aQVeKd7EuXjgwJEQ+64PCKquzxE2aEmByoWv8HREiM00aA4A3JG2eySki6qDOTdl9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064688;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zaTgPA2ioXn8bej2IOl4WB8n/Qq2lc7VcV2P19XHg1w=;
	b=VwbyKJkrfIgh3oCsPBnF57Z/ddPx1tlj4qU0SjOifZiUqwHSWCMzrrpUSkAbZd7YP3RE
	 8sITi8d4ZC/6/NA8BGSIF1aHkCP+V/J7pNyQWUKqzrX2Y3jRJHzlz158G2oQPLHdQ7w/v
	 UEGYP54MgxFYuxdfC5Jzh5YeMGI60VuocmmION1buM1kvcMrX9UD4iN3RTsYxJfPK1y3J
	 rjHU6QKQ4Tnsur3yl/spv38I94OaWslpJUWehN4nHAHJRs+OonlfEXzlwjTyTmPhxqEak
	 dg01uIN8TseM1YPhzPFUGtuFutam9sWJwPDeSC546Ud+otkHj2ANd0I8UUQszdVDs3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7+MP4Da;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1717D60A2620
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1717D60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7+MP4Da
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zaTgPA2ioXn8bej2IOl4WB8n/Qq2lc7VcV2P19XHg1w=; b=H7+MP4DakBkQVBvI+TE7dmdaGP
	xMJpCIH16ICt4JQbh9uam7MDU3XE15vQqvj8v/Jft+b1J81ZaELwgJFhav/j92y/Y17ZWLw+vvAaM
	5fGEVQ/u4mGu1SW/SFvNqffZ6cajZZHdSP3sQrbG3hZGxvxiUHa7ssHvcKSSBt2BDj/P1QxwyudFK
	Ids+fKsRkFX3TgItKFjjAaJKc9V58zyjvA1EUlo/BWEoNHNw18Wu6k8Wb9X7dCMt+y6hRl6BhYRxT
	fXjNOFGCvawSH9DKgeub+q3bbwxK1FR9CiekO+HXuNv+K0m5UsOszishOVQhkdVlzqUck1BJ5vWoj
	Umv2gf+g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKF-0000000ArIo-3D2F;
	Thu, 19 Nov 2026 05:04:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 12/12] docs: ioctl-number: update DRM entries
Date: Wed, 18 Nov 2026 21:04:37 -0800
Message-ID: <20261119050444.249752-13-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119050444.249752-1-rdunlap@infradead.org>
References: <20261119050444.249752-1-rdunlap@infradead.org>
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

Update the list of files where DRM ioctls are defined.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -98,6 +98,7 @@ Code  Seq#    Include File
 0x1b  all                                                              InfiniBand Subsystem
                                                                        <http://infiniband.sourceforge.net/>
 0x20  all    drivers/cdrom/cm206.h
+0x20  00-01  drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h
 0x22  all    scsi/sg.h
 0x3E  00-0F  linux/counter.h                                           <mailto:linux-iio@vger.kernel.org>
 '!'   00-1F  uapi/linux/seccomp.h
@@ -268,7 +269,7 @@ Code  Seq#    Include File
 'c'   08     drivers/scsi/ch.c                                         conflict!
 'c'   80-9F  arch/s390/include/asm/chsc.h                              conflict!
 'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
-'d'   00-FF  linux/char/drm/drm.h                                      conflict!
+'d'   00-FF  drm/drm.h                                                 conflict!
 'd'   02-40  pcmcia/ds.h                                               conflict!
 'd'   F0-FF  linux/digi1.h
 'e'   all    linux/digi1.h                                             conflict!
@@ -292,6 +293,8 @@ Code  Seq#    Include File
                                                                        <mailto:zapman@interlan.net>
 'h'   00-1F  linux/hpet.h                                              conflict!
 'h'   80-8F  fs/hfsplus/ioctl.c
+'i'   00-02  drm/i915_drm.h
+'i'   00-04  drm/xe_drm.h
 'i'   00-3F  linux/i2o-dev.h                                           conflict!
 'i'   0B-1F  linux/ipmi.h                                              conflict!
 'i'   80-8F  linux/i8k.h
