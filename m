Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064686;
	b=1R22bxuKj4w6Vd+KSKPOabidQG5le2e3oCIO0c1uR/5dWY5xoqN+hfidho5MtACQq1hn
	 QUCNdK2uNQorqNul/9L1kBX/VVHQMQzAL1WS2kjXohMhCxpgCgkw4vJgWkdTuf3yOiqdn
	 s73FkDXs67VFj+QjGtvWdU9egt90eI7LFirSXhHm5j8HLLgeEO1C/zb1xXZBT3xTdy0Hk
	 XGXGBlC/SiXW2TRtvTCfxLO3VTOkoIVAmQB+FVzWZx0/voiTJBRYblcyGTGUn69GeCo0+
	 oTR/Xi1Iq3AzfJAOOTpoyeSpiPleYmyF+iFYQg6AoUGOMygNsNOfrhH0GCvyTaazllA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064686;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q4RqbTqrf5mX8cN4Vzs7NN9E5++HncNdO08vef8Myn4=;
	b=Q7j2GQFWQk/a+2BFAA+WJTMZ1Ta4kz05WQLX/uv/GOe8bhvsJ5exC+SkxfTEykjlmi2T
	 LlmRTSZu2rOOK14lCtcLTCf/s+tJwAQPBwgcDCJqbxzxRdbJKtZubT5oaergm5zcUFwfE
	 qS4GUGf2yvdb68toEqX4dZwtKYrOEFlLOVCZs3Nu+ps1qyh4YKSz2QfZy7cotbDbwtG4y
	 TOBFdlEe0EftZzJelu1ug9DOVj+PIvIlueO0DW6pM0OA/Oxvv6JSW1dTAia/SZukfX6TC
	 u1D8IGQnUUdeN16S1zPQ+elci7ITdTzwx6ulN3rHhHcTjiWNxFfsYIfvuBVN4+l2QPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SE4dKMUe;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE1B606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE1B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SE4dKMUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=q4RqbTqrf5mX8cN4Vzs7NN9E5++HncNdO08vef8Myn4=; b=SE4dKMUerTyt6O6jz2BG8jeumZ
	SphIFmLQyMtVriODrb2b4wg+HlFkNJ5Bd/X0ShcncdrgvOLLygsE99zn+tzUCj3dmiY8zapks3FSR
	jjVkx6CYD/bGE5tpkUN1OAlyZQdtjOLVFOjGHKoz+XNrqyDFk1pE5MQRc2OlFy4PseDI2fPkpSrHD
	LUASkeFknF5Q6dypL1EmBVbIa1IZ/1g8VAor6zRP96hrdj0Np1sx1iZ2AzNqWN5aJ5Eu/n8CY/3Wp
	hT3f3z3u470qUEJjkRDDqQvKbSHpQWk+Sp+tKvVOPOEa2eS2g0pHh62R/IhLUgkvPBQIOzg0ahKoA
	5ewjnYLw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKE-0000000ArIo-127E;
	Thu, 19 Nov 2026 05:04:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 03/12] docs: ioctl-number: update block entries
Date: Wed, 18 Nov 2026 21:04:28 -0800
Message-ID: <20261119050444.249752-4-rdunlap@infradead.org>
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
Content-Transfer-Encoding: 8bit

Update the list of files where block ioctls are defined.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -78,6 +78,7 @@ Code  Seq#    Include File
 0x00  00-1F  linux/fb.h                                                conflict!
 0x00  00-1F  linux/wavefront.h                                         conflict!
 0x02  all    linux/fd.h
+             drivers/block/floppy.c
 0x03  all    linux/hdreg.h
 0x04  D2-DC  linux/umsdos_fs.h                                         Dead since 2.6.11, but don't reuse these.
 0x06  all    linux/lp.h
@@ -90,6 +91,9 @@ Code  Seq#    Include File
              linux/blkpg.h
              linux/blkzoned.h
              linux/blk-crypto.h
+             linux/blkdev.h
+             linux/blktrace_api.h
+             block/ioctl.c
 0x15  all    linux/fs.h                                                FS_IOC_* ioctls
 0x1b  all                                                              InfiniBand Subsystem
                                                                        <http://infiniband.sourceforge.net/>
