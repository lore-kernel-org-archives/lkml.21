Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107949;
	b=Yu85Hc/RgzBob2qY6PNnESTQjQ4kcpjobRc50E0OsSbzj7EXfcqSF7myXE6Sg849rNW0
	 aKPzuNGGZCGPjBIM+YXVDW7BwzdPIa0cAGI2F2hwlQs0muFq5+OsXdi0dIDzx18zqNAtS
	 3tn61mYgkzwYMakjFGi05vGHo4l0MfxyJwQGsbeVVmlf1bxiMQOzSEqo1GrDQOItOBPkP
	 O5kXzGqnQ+1cWiB8jMv3ZFlKhcFIWCyCZ/U4BzT7x+FpaQvzhNMsWRX97tbs7xFZtz33a
	 Wnm7sUuzjfFVHW6B31MLybXBc1ZbtyP03CFPVTuj1otMx3wPadqPSyo6lvONEoYAD7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cXCYn/0B4iRLLG05BKoGcd3OGmZM5xlbdyRfY3dPeOU=;
	b=by0NxdrbyIDgWR5RkzA9VR8gTKTpTpaVlUNhEwh3Mc+WBkh1/eJRx9n74Zn7c58pKle2
	 knuAs2a5MlZ9OOR0NqNPgoYeXIVTiP3t7lWa7WD0lCwoFskC2QljA7XHKFLtXKp5JPmIv
	 mCWvag4RPSKuNRzbMJeRPbB9E71dH/8BJAAj/Et7tj9xmnihn7xxwXqQlBXTb7UqRZ+0H
	 torRUw7Y8KFd/XF4QPqItKEv/BZffKYlskwY9LhHW2BJCrbRVWfB5KIpw9VI4KGH3CzaQ
	 NA7JdKTFE+EIMElYw+RIZS0BDDVpAECvNGixtgtDK+HiXqzt02GpEl33awdcgrG94Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lg+nkylN;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B32606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lg+nkylN
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso767204eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107948; x=1795712748; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXCYn/0B4iRLLG05BKoGcd3OGmZM5xlbdyRfY3dPeOU=;
        b=lg+nkylN/pZNFri8FN9jLTOjn1/xWnxsJB4LVYntKf1kLH/lm5MudaxS1rjvOKvGI8
         LgBGatvWQqeA053z42sgyAhEWq4LlrAtvPr4c87FsyyNPPX0sBaUkuYscTKeTxOllGHH
         DdMGG224eszK/PxMvkNPEmkLYzIlM7ThwWa4Lhq7LvGaHAOQ8mMCxcLs7TAOM2ksEyTd
         J1vUJdj7EbkWaOeHfXomN7kDzsMrkEjT9tPw8DwP38oo89yws+0l7mvJPEGKFwfNSMy4
         DNBfOsfBjn1CQ3hz/59IdvyAvyeU8EtQz+klUqZ8as6YpV0x7GUbjacfbAt6rxF+482T
         vhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107948; x=1795712748;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXCYn/0B4iRLLG05BKoGcd3OGmZM5xlbdyRfY3dPeOU=;
        b=OUFUd90GCq6hRw+vvIOnYr7z/sta316+efObaP1lTgeN5fYjnbHthrr3drImkJ4jcj
         /oE0OoD/qkNo1wOR79kr5nWzvGrVVMurvaNDp3jzOFj39Iixq1ISR36rPbTWj0XYw1bX
         lixU+4DR6qDOC9Uo22a1Ax5eNCagSZKJD2uw/Z2S3QYDfxgI6zbYd54ZGqPBb6fwcZ1q
         WhVNnBWOMxyENkX9LXPucc8arCfOHydux5r6v2VS2SeVvukhtPJ+hJbE36FNEUEfQ/i0
         H7TaUEiM/ZqH1R6y0ml2hK90soTtAUbBS9PlanxIsbFMhOvpXNg9fy4IDAarnOq01WHu
         KHog==
X-Forwarded-Encrypted: i=1; AL+hErEOkR32eIVZSXLuthwYatoo/pVNT6iG2bzQ0VsvpiEllBNoQzgsvwErs6RUM66M7j9/X19u8zc4+0wag2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Xdmr6GrwWZFCBNKIQgL9vxgIud0uzh4POXlJ0vhdGeIpQ/Gz
	O+APuNZ0S+Pigxn+znd/sf2jEYJkzyGA7FIrVRlVh97XbTYaMQrpSqBORiF98IV6auQaFIPSbxN
	R0/s8mXjfbg==
X-Received: from dycrt1.prod.google.com ([2002:a05:693c:2d81:b0:36a:209:2e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:e2d:b0:384:dc16:121c
 with SMTP id 5a478bee46e88-384dc161ae8mr1326751eec.23.1795107947654; Thu, 19
 Nov 2026 09:05:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:22 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170522.1516239-1-irogers@google.com>
Subject: [PATCH] scsi: megaraid: Fix uninitialized DMA handle and passthru
 length TOCTOU
From: Ian Rogers <irogers@google.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, 
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, 
	Chandrakanth patil <chandrakanth.patil@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In megadev_ioctl(), data_dma_hndl is declared uninitialized. On the DCMD
path, when uioc.xferlen == 0, dma_alloc_coherent() is skipped, yet
mc.xferaddr = (u32)data_dma_hndl unconditionally writes 32 bits of
uninitialized kernel stack into the mailbox command sent to the adapter.

On the MEGA_MBOXCMD_PASSTHRU path, pthru resides in coherent DMA memory
shared with the controller, and pthru->dataxferlen is re-read after
mega_internal_command() for both copy_to_user() and dma_free_coherent().
If the device modifies pthru->dataxferlen in coherent memory, the cleanup
path can over-read data or pass a mismatched size or uninitialized
data_dma_hndl to dma_free_coherent().

Initialize data_dma_hndl to 0 and snapshot pthru->dataxferlen into a local
variable once copied from userspace.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not tested on legacy MegaRAID hardware.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/megaraid.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index a4079866f747..970e9b2ec781 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -2966,7 +2966,7 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	mega_passthru	*pthru;		/* copy user passthru here */
 	dma_addr_t	pthru_dma_hndl;
 	void		*data = NULL;	/* data to be transferred */
-	dma_addr_t	data_dma_hndl;	/* dma handle for data xfer area */
+	dma_addr_t	data_dma_hndl = 0; /* dma handle for data xfer area */
 	megacmd_t	mc;
 #if MEGA_HAVE_STATS
 	megastat_t	__user *ustats = NULL;
@@ -3137,6 +3137,7 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		/* Is it a passthru command or a DCMD */
 		if( uioc.uioc_rmbox[0] == MEGA_MBOXCMD_PASSTHRU ) {
 			/* Passthru commands */
+			u32 dataxferlen;
 
 			pthru = dma_alloc_coherent(&pdev->dev,
 						   sizeof(mega_passthru),
@@ -3170,9 +3171,10 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			/*
 			 * Is there a data transfer
 			 */
-			if( pthru->dataxferlen ) {
+			dataxferlen = pthru->dataxferlen;
+			if (dataxferlen) {
 				data = dma_alloc_coherent(&pdev->dev,
-							  pthru->dataxferlen,
+							  dataxferlen,
 							  &data_dma_hndl,
 							  GFP_KERNEL);
 
@@ -3199,12 +3201,13 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			/*
 			 * Is data coming down-stream
 			 */
-			if( pthru->dataxferlen && (uioc.flags & UIOC_WR) ) {
+			if (dataxferlen && (uioc.flags & UIOC_WR)) {
 				/*
 				 * Get the user data
 				 */
-				if( copy_from_user(data, (char __user *)(unsigned long) uxferaddr,
-							pthru->dataxferlen) ) {
+				if (copy_from_user(data,
+						   (char __user *)(unsigned long)uxferaddr,
+						   dataxferlen)) {
 					rval = (-EFAULT);
 					goto freemem_and_return;
 				}
@@ -3228,9 +3231,9 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			/*
 			 * Is data going up-stream
 			 */
-			if( pthru->dataxferlen && (uioc.flags & UIOC_RD) ) {
-				if( copy_to_user((char __user *)(unsigned long) uxferaddr, data,
-							pthru->dataxferlen) ) {
+			if (dataxferlen && (uioc.flags & UIOC_RD)) {
+				if (copy_to_user((char __user *)(unsigned long)uxferaddr,
+						 data, dataxferlen)) {
 					rval = (-EFAULT);
 				}
 			}
@@ -3244,9 +3247,9 @@ megadev_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 				rval = -EFAULT;
 
 freemem_and_return:
-			if( pthru->dataxferlen ) {
+			if (dataxferlen) {
 				dma_free_coherent(&pdev->dev,
-						  pthru->dataxferlen, data,
+						  dataxferlen, data,
 						  data_dma_hndl);
 			}
 
-- 
2.56.1.708.g77570a6a1d-goog

