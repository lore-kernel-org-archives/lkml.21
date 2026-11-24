Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481100;
	b=LA47rp4zKoLHjUvatK/OYFd8iq2PCXQascGdUS3EYSogGwaHSlFsnOwrd/g3cHfpZ+DI
	 gQ1oR8fYSDjxxoD+LbwwfWZYCiuy8EaLidl9Ik/5t6YeKmsXh21l9hXG63IDLrthcKztU
	 mtAigtC7ts6zRWzm9doebChoIns9chQd7niZbZvxJqpV7EsEGKz1xi4+/d+F4mIUnYEB+
	 b1i+X+U3hG9FKWDpp9SXEGg6d+XA7USHf2oyLDE4qRdRF0VAIK44rDk2hCDhK0fH2qO6c
	 zrmuJ1AO1myh4XEdTH6wuYMgn+jif/pwEgbSq0sbPe0hP10SmOILdF/924fKJnXEc+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481100;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vVDwHk+IAbKPfz3+9kgQWMzybBMRngfzj3/RAbilHnc=;
	b=ZyvZvxSbm6cozuTJjqlW89v4+n0I5veRm1FctL8A2Sivg0dCNfErl14lCRCgKF86PLhb
	 S49THqJlAA/War4lYP1QLdxXVOCrIIQZoW2Ygv3c4p1N++0HudN5s3FbeyTC05sKVUYdt
	 dElYVyDAf4E1WLglVFNdGoT8LinU1BFnNNZ1xWv9Fjc0wcUv+6wKbdRWAAEOvuC2Kbb3H
	 y6L+j/SDWgHOa69qY54VNTJSVaHI+tgDaauKUEMwxj7RmDI75a5Bg554r9BhoIt8LUWtZ
	 ENVcAU97x5H3Z7tEtIAzomFn1mhb7hkhtXAX0jZw/Y/X0AV6SAu5t/HrSJ+1cV6M85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucZhXLTP;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D22606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucZhXLTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=vVDwHk+IAbKPfz3+9kgQWMzybBMRngfzj3/RAbilHnc=; b=ucZhXLTPin0AoGSDFO7FHYy70G
	gdNTbjYYO6VJT6gESL8jJ+rv5GDow2tEL0KBZTieb2DkeyyIgO8tuNsPTVbHaT4uWYhP6E4ivtI4C
	V8On6AinGc0uSVg+ds2aHGLB6hbNaW751c6n/N5sSjkr6eofiAasQSQPC3S3EeuEDehATu05QRzDQ
	jkbAedeqglEt7wAB8Bk9KlmRZW09T6pzJWVsJYNKRzaDDWPWavEhiSHEy9Wy/CK90Wl4efDBkb3pK
	exiSwAd5SLybjdM8uFc5J9lySuJz87tpzNj14xTZvMWE3D76CBQbIgO9DcQLN5mEHmgk7ngPmpIVd
	+Hu2WEYg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeeT-00000005HSp-0Mgw;
	Tue, 24 Nov 2026 00:44:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Frank Haverkamp <haver@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] misc: genwqe: fix various kernel-doc warnings
Date: Mon, 23 Nov 2026 16:44:46 -0800
Message-ID: <20261124004446.2629376-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
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

Fix a variety of kernel-doc warnings in genwqe source files:
- don't use "/**" to begin non-kernel-doc comments
- repair mismatched struct & function prototypes so that the comments
  match the struct or function name
- add some function parameter comments that were missing
- add some struct member comments that were missing or were misnamed
- don't introduce macros between a struct's kernel-doc and the
  struct declaration
- use "enum" for enum kernel-doc instead of "struct"

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Frank Haverkamp <haver@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/misc/genwqe/card_base.h         |   31 ++++++++++++++--------
 drivers/misc/genwqe/card_ddcb.h         |   14 ++++-----
 drivers/misc/genwqe/genwqe_driver.h     |    4 +-
 include/uapi/linux/genwqe/genwqe_card.h |    5 ++-
 4 files changed, 33 insertions(+), 21 deletions(-)

--- linux-next-20261123.orig/drivers/misc/genwqe/card_ddcb.h
+++ linux-next-20261123/drivers/misc/genwqe/card_ddcb.h
@@ -2,7 +2,7 @@
 #ifndef __CARD_DDCB_H__
 #define __CARD_DDCB_H__
 
-/**
+/*
  * IBM Accelerator Family 'GenWQE'
  *
  * (C) Copyright IBM Corp. 2013
@@ -19,6 +19,10 @@
 #include "genwqe_driver.h"
 #include "card_base.h"
 
+#define ASIV_LENGTH		104 /* Old specification without ATS field */
+#define ASIV_LENGTH_ATS		96  /* New specification with ATS field */
+#define ASV_LENGTH		64
+
 /**
  * struct ddcb - Device Driver Control Block DDCB
  * @hsi:        Hardware software interlock
@@ -30,16 +34,12 @@
  * @acfunc:     Accelerator function addresses a unit within the chip
  * @cmd:        Command to work on
  * @cmdopts_16: Options for the command
- * @asiv:       Input data
+ * @n.asiv:     Input data
  * @asv:        Output data
  *
  * The DDCB data format is big endian. Multiple consequtive DDBCs form
  * a DDCB queue.
  */
-#define ASIV_LENGTH		104 /* Old specification without ATS field */
-#define ASIV_LENGTH_ATS		96  /* New specification with ATS field */
-#define ASV_LENGTH		64
-
 struct ddcb {
 	union {
 		__be32 icrc_hsi_shi_32;	/* iCRC, Hardware/SW interlock */
@@ -160,7 +160,7 @@ struct ddcb {
 #define SG_END_LIST		(0x0)
 
 /**
- * struct sglist - Scatter gather list
+ * struct sg_entry - Scatter gather list
  * @target_addr:       Either a dma addr of memory to work on or a
  *                     dma addr or a subsequent sglist block.
  * @len:               Length of the data block.
--- linux-next-20261123.orig/drivers/misc/genwqe/genwqe_driver.h
+++ linux-next-20261123/drivers/misc/genwqe/genwqe_driver.h
@@ -2,7 +2,7 @@
 #ifndef __GENWQE_DRIVER_H__
 #define __GENWQE_DRIVER_H__
 
-/**
+/*
  * IBM Accelerator Family 'GenWQE'
  *
  * (C) Copyright IBM Corp. 2013
@@ -37,7 +37,7 @@
 #define GENWQE_MAX_MINOR	128 /* up to 128 possible genwqe devices */
 
 /**
- * genwqe_requ_alloc() - Allocate a new DDCB execution request
+ * ddcb_requ_alloc() - Allocate a new DDCB execution request
  *
  * This data structure contains the user visiable fields of the DDCB
  * to be executed.
--- linux-next-20261123.orig/drivers/misc/genwqe/card_base.h
+++ linux-next-20261123/drivers/misc/genwqe/card_base.h
@@ -2,7 +2,7 @@
 #ifndef __CARD_BASE_H__
 #define __CARD_BASE_H__
 
-/**
+/*
  * IBM Accelerator Family 'GenWQE'
  *
  * (C) Copyright IBM Corp. 2013
@@ -145,16 +145,19 @@ enum genwqe_dbg_type {
 
 
 /**
- * struct dma_mapping_type - Mapping type definition
+ * enum dma_mapping_type - Mapping type definition
  *
  * To avoid memcpying data arround we use user memory directly. To do
  * this we need to pin/swap-in the memory and request a DMA address
  * for it.
  */
 enum dma_mapping_type {
-	GENWQE_MAPPING_RAW = 0,		/* contignous memory buffer */
-	GENWQE_MAPPING_SGL_TEMP,	/* sglist dynamically used */
-	GENWQE_MAPPING_SGL_PINNED,	/* sglist used with pinning */
+	/** @GENWQE_MAPPING_RAW: contiguous memory buffer */
+	GENWQE_MAPPING_RAW = 0,
+	/** @GENWQE_MAPPING_SGL_TEMP: sglist dynamically used */
+	GENWQE_MAPPING_SGL_TEMP,
+	/** @GENWQE_MAPPING_SGL_PINNED: sglist used with pinning */
+	GENWQE_MAPPING_SGL_PINNED,
 };
 
 /**
@@ -200,7 +203,7 @@ static inline void genwqe_mapping_init(s
  * @ddcb_req:          Associated requests (one per DDCB)
  * @ddcb_waitqs:       Associated wait queues (one per DDCB)
  * @ddcb_lock:         Lock to protect queuing operations
- * @ddcb_waitq:        Wait on next DDCB finishing
+ * @busy_waitq:        Wait on next DDCB finishing
  */
 
 struct ddcb_queue {
@@ -250,7 +253,7 @@ struct genwqe_ffdc {
  * @card_state:       Card operation state, see above
  * @ffdc:             First Failure Data Capture buffers for each unit
  * @card_thread:      Working thread to operate the DDCB queue
- * @card_waitq:       Wait queue used in card_thread
+ * @queue_waitq:      Wait queue used in card_thread
  * @queue:            DDCB queue
  * @health_thread:    Card monitoring thread (only for PFs)
  * @health_waitq:     Wait queue used in health_thread
@@ -334,14 +337,20 @@ enum genwqe_requ_state {
 
 /**
  * struct genwqe_sgl - Scatter gather list describing user-space memory
- * @sgl:            scatter gather list needs to be 128 byte aligned
  * @sgl_dma_addr:   dma address of sgl
+ * @sgl:            scatter gather list needs to be 128 byte aligned
  * @sgl_size:       size of area used for sgl
  * @user_addr:      user-space address of memory area
  * @user_size:      size of user-space memory area
- * @page:           buffer for partial pages if needed
- * @page_dma_addr:  dma address partial pages
  * @write:          should we write it back to userspace?
+ * @nr_pages:       number of pages needed
+ * @fpage_offs:     offset in first page
+ * @fpage_size:     size of first page
+ * @lpage_size:     size of last page
+ * @fpage:          buffer for partial first page if needed
+ * @fpage_dma_addr: dma address partial first page
+ * @lpage:          buffer for partial last page if needed
+ * @lpage_dma_addr: dma address partial last page
  */
 struct genwqe_sgl {
 	dma_addr_t sgl_dma_addr;
@@ -416,6 +425,7 @@ int  genwqe_release_service_layer(struct
 
 /**
  * genwqe_get_slu_id() - Read Service Layer Unit Id
+ * @cd:    genwqe device
  * Return: 0x00: Development code
  *         0x01: SLC1 (old)
  *         0x02: SLC2 (sept2012)
@@ -547,6 +557,7 @@ bool genwqe_need_err_masking(struct genw
 
 /**
  * genwqe_is_privileged() - Determine operation mode for PCI function
+ * @cd:    genwqe device
  *
  * On Intel with SRIOV support we see:
  *   PF: is_physfn = 1 is_virtfn = 0
--- linux-next-20261123.orig/include/uapi/linux/genwqe/genwqe_card.h
+++ linux-next-20261123/include/uapi/linux/genwqe/genwqe_card.h
@@ -2,7 +2,7 @@
 #ifndef __GENWQE_CARD_H__
 #define __GENWQE_CARD_H__
 
-/**
+/*
  * IBM Accelerator Family 'GenWQE'
  *
  * (C) Copyright IBM Corp. 2013
@@ -455,7 +455,8 @@ struct genwqe_ddcb_cmd {
  * struct genwqe_mem - Memory pinning/unpinning information
  * @addr:          virtual user space address
  * @size:          size of the area pin/dma-map/unmap
- * direction:      0: read/1: read and write
+ * @direction:     0: read/1: read and write
+ * @flags:         reserved
  *
  * Avoid pinning and unpinning of memory pages dynamically. Instead
  * the idea is to pin the whole buffer space required for DDCB
