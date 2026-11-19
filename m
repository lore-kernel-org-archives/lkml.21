Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064687;
	b=VjbB3/z/S1G8Hp9cfNAplqRJYsfysD8/gGCdPk3ljGAeyFqsqEKXcGyLYwNn6nZSDG4+
	 nD7d1Fc4LfgPCgaH7ffxKVQExLomYHIdxDfP6zkp6+sRdVwPuW61hA1PA8WUV/vb0MRy3
	 gn3dpdivfQj/xfZtg7C639+LjIVf3CeaLoQyhqfYqq3mHx0E329z4mxxeuv96A/gmJfKN
	 Lk1gz6RAujq39S5fXFxW4HGUuEg618n1jvz3HabZOWXecwqNqsrdvnZsjtP9MGCFriCi6
	 PBpysQeUooDSHXVlmOCRfNNlgrfqgCsodVXca8hEcHzhEd/PBsokkqZc7e0YuyAQEGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064687;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KnCXAHrWe2wY5lWuzljr4glUKOPYIIFp8Ge0ioQH9ro=;
	b=Wa3DHFUE6XoOryWw2K8aCReKjTMqFJyDNwHLWcFbx7ifqvn9RXOEsDN6TNhitEGbMAVE
	 ARH1yj+sAGUkSNyhn3eTinIfnsRCfYbCGNMg+ogGej+wT1+Jlei4uXFZibu/HT5z6cao7
	 8+9KkzUFkGiJmw9rxp7gek9iZ0MjRqBJXJHUBAgxFw9DHvoqwfUzWCFvGAal5eKAPvqT/
	 VhC+z2zLnLQtqTtIhCLGLOza1NKqitTh0FG2wPxTIDJi3UIZZWC5CXTAodwFcFoQfqBOn
	 P+Wb2HlIGooPVpkbbBPYXLxEV9GPEZ+z/9g/BI3maaCu5t7FyCBcFyn0DWiIhzZHtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7KG7YJx;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9AB606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9AB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7KG7YJx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KnCXAHrWe2wY5lWuzljr4glUKOPYIIFp8Ge0ioQH9ro=; b=q7KG7YJxmkl3HscG1A7dXrLA8n
	Kv9NnuyxXjK8EyyNj4+KUZxkFWKT3TBCRg/0PjEp3ma8NriYWKQx/3AfJ0bdrlkQ2RCcvaivCUoeG
	tOkaKhgwu00oYXN7G4RpZDt+tHhzhvT3fO+u97A3aeg8TjEGAjuOy4y3myg4m12Re5QKE066FCQ1z
	+p8iNRT5AI8haZcN8KSCNAq/3Cwgn9hTAM6vB5P6uYKaIQnPvpPOVZ4sWXf/0IuKoOClZrIay4nYB
	1Qyv3wNcWCR7twaeBzug4IHvu1S085EbQtCBnTAtrXpKoW3MZhcr0KXFgbntaESNionZRa0AJdREZ
	dq0kHB6A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKE-0000000ArIo-2Piq;
	Thu, 19 Nov 2026 05:04:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 05/12] docs: ioctl-number: update video/fbdev entries
Date: Wed, 18 Nov 2026 21:04:30 -0800
Message-ID: <20261119050444.249752-6-rdunlap@infradead.org>
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

Update the list of files where video or fbdev ioctls are defined and
update the ranges of function numbers that are used.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |   14 +++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

--- linux-next-20261116.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261116/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -148,9 +148,13 @@ Code  Seq#    Include File
 'F'   20     linux/ivtvfb.h                                            conflict!
 'F'   20     linux/matroxfb.h                                          conflict!
 'F'   20     drivers/video/aty/atyfb_base.c                            conflict!
+'F'   20     arch/powerpc/include/uapi/asm/ps3fb.h                     conflict!
+'F'   00-21  arch/m68k/include/asm/fbio.h                              conflict!
+'F'   00-21  arch/sparc/include/asm/fbio.h                             conflict!
 'F'   00-0F  video/da8xx-fb.h                                          conflict!
 'F'   80-8F  linux/arcfb.h                                             conflict!
 'F'   DD     video/sstfb.h                                             conflict!
+'G'   00-02  drivers/video/fbdev/pxa3xx-gcu.h                          conflict!
 'G'   00-3F  drivers/misc/sgi-gru/grulib.h                             conflict!
 'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                              conflict!
 'H'   00-7F  linux/hiddev.h                                            conflict!
@@ -186,10 +190,13 @@ Code  Seq#    Include File
 'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                        conflict!
 'L'   E0-FF  linux/ppdd.h                                              encrypted disk device driver
                                                                        <http://linux01.gwdg.de/~alatham/ppdd.html>
+'L'   35-38  arch/m68k/include/asm/fbio.h
+'L'   35-38  arch/sparc/include/asm/fbio.h
 'M'   all    linux/soundcard.h                                         conflict!
 'M'   01-16  mtd/mtd-abi.h                                             conflict!
       and    drivers/mtd/mtdchar.c
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
+'M'   00-03  drivers/video/fbdev/mb862xx/mb862xxfb.h
 'M'   00-0F  drivers/video/fsl-diu-fb.h                                conflict!
 'N'   00-1F  drivers/usb/scanner.h
 'N'   40-7F  uapi/linux/nvme_ioctl.h
@@ -197,6 +204,7 @@ Code  Seq#    Include File
 'N'   84-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
                                                                        <mailto:wine-devel@winehq.org>
 'O'   00-06  mtd/ubi-user.h                                            UBI
+'O'   1F-3F  linux/omapfb.h
 'P'   all    linux/soundcard.h                                         conflict!
 'P'   60-6F  sound/sscape_ioctl.h                                      conflict!
 'P'   00-0F  drivers/usb/class/usblp.c                                 conflict!
@@ -294,6 +302,7 @@ Code  Seq#    Include File
 'n'   00-7F  linux/ncp_fs.h and fs/ncpfs/ioctl.c
 'n'   80-8F  uapi/linux/nilfs2_api.h                                   NILFS2
 'n'   E0-FF  linux/matroxfb.h                                          matroxfb
+'n'   F8-FA  video/sisfb.h                                             sisfb
 'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                       OCFS2
 'o'   00-03  mtd/ubi-user.h                                            conflict! (OCFS2 and UBI overlaps)
 'o'   40-41  mtd/ubi-user.h                                            UBI
@@ -310,6 +319,7 @@ Code  Seq#    Include File
 'q'   80-FF  linux/telephony.h                                         Internet PhoneJACK, Internet LineJACK
              linux/ixjuser.h                                           <http://web.archive.org/web/%2A/http://www.quicknet.net>
 'r'   00-1F  linux/msdos_fs.h and fs/fat/dir.c
+'r'   01-06  arch/powerpc/include/uapi/asm/ps3fb.h
 's'   all    linux/cdk.h                                               conflict!
 's'   07-09  arch/{alpha,mips,sh,xtensa}/include/uapi/asm/sockios.h    conflict!
 's'   64-65  arch/sh/include/uapi/asm/sockios.h                        conflict!
@@ -425,8 +435,8 @@ Code  Seq#    Include File
 0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
 0xEF  00-0F  uapi/linux/ntfs.h                                         NTFS
-0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
-                                                                       <mailto:thomas@winischhofer.net>
+0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb
+0xF3  00-3F  video/sisfb.h                                             <mailto:thomas@winischhofer.net>
 0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
                                                                        <mailto:mathieu.desnoyers@efficios.com>
 0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                      AMD HSMP EPYC system management interface driver
