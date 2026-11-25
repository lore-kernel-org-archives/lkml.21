Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589676;
	b=dU2/HvgyTc5/uAbXtCHn6DvgIUlsh6+bN8uwQqz/CNW9gq7O0+FVKqailSrUcjeiGTLZ
	 7Y8sQFDafhJqUj8o2XcdCVI46r5TpS0cO6043qxrkHpwhzK678HjPFItj+gKzUHjAJXB7
	 3rQ9xOUuyb2Rjt7nhBXunqJjY2b2Md5FjonoVRi7RNWVDW8w+LJ2bPrx+O//yXi3XJVDW
	 dR0+fco0O3nRs7Wjty4DJvIwoa+sIi7ejvXc18MAvt8kywDdZApIjB1IcKRngRCvll9I4
	 16Ggv95Um5FDt6Gy309dPc/p9tFCmTBI3PmTRbwaiQA7/r2gggkp9rhjUyEAKv6pZ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FA3OAU6eEjC7L1C6zX7t1wOu8qvpScaN/CAqUhfL2dY=;
	b=klW9cv5Hyf9/prSKbwdJC4MUWkjAeWtKhrRMktAzlXcRjnAoR4SLHiZpwYvDl9sxBYiK
	 d0tuMmr0v277indvNqnIpmiLE/yQljsQwEZnsKI7zaRN9gE8olaewCeRiZFp0X8hJAN40
	 nc1CNARpsm6sC7CJr0JFTb4eM1KI1cmBHesreYAdbi6OjJQUwZQlXuk2ApdlHSl6hjkCb
	 gkVK5/VD5ztg1+NlhK8mn5AkqDDQSNpLWMFjk1ntyy8sQvseiWOhBcmtcW/GHZH7XTe2G
	 GWiqPKJ4PMmZYT5fKGCL4iWzdAKBcuhEjjBIueflxKvdhqpcUPGcV+BMbDanYnugX/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b="OeKocc/j";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=OeKocc/j
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2874924a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795589675; x=1796194475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA3OAU6eEjC7L1C6zX7t1wOu8qvpScaN/CAqUhfL2dY=;
        b=OeKocc/jgkyphXPYZoQ9dQj0qTRbGrxddODEBN6yK8n7q7LWAz4e0ov0eX5oAnfB3Z
         kxvN1cPZBlJRaDw8PUfQd0EisM4BBJkrc8eqKR7cZdynf3rZ6yjlLcHmEogaevayPMZx
         e2Hgqz+QlvJFXFBbVUUZN+EwLde0DyPyi78qQrBVlOTQLyB1A/Jy+iV8kUCUsBfD0Uj+
         6NbktBTepkHQ/V6dPMc7FyJ2tHMU4/4gZsxIoY2Y7fL1TnI/XUX1XLbPNZcQamudpu3M
         SCAdoXRxYKAe+2yRtd6v3m+SQrdi/Bl913ZoWo7YOL5KJq3SgZ9DQ0sbxyn3AVqgkGDc
         ybDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589675; x=1796194475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA3OAU6eEjC7L1C6zX7t1wOu8qvpScaN/CAqUhfL2dY=;
        b=ZQOE7EQVZz2YDc0XA++v1FbO5RpFSr7i0kWnD/Ulw8ja3GJOfa2LDDsFlp2zIy5JXo
         FGWeekvLqUUIZK8HgQ7qms6LsgINWDrs1DAE/loXGGnrRMm/HgOZIcf6plJzVojC14/R
         f+6t9piyEJaWLaeVc4p5SZD8kRM/5JqTEHM5yCtWrb8nbq/xDO4H4tnwa2meAjVvLdWA
         GgM10q2XQJvo+IVL/5GiUDhAcJK74QAyQa7yfobrG6nIuJ9esaasJE2OQnyK3Onik7CC
         6M30romuWevaPUx3uQdoGc3ygES9217QN/+ZIwuYWqYwMtQNlzXT2E2sfDQzQrGobij8
         wEWQ==
X-Forwarded-Encrypted: i=1; AL+hErGbgsI9Oo/I3oXAl+650/Ls5Bkj52oADjJVGQUKBz1Pn2MKXxfyE7yCtRCBsKDA20RxI3I/iV3nIhABfrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9O0axEL1VxqBYgejWXeDS7fDLRZ2baCUDHD3fZesgEgFJvZp5L
	fHWuOUsqMeD7XflveTA30NN0FgjZ23BIA9ygXyAoQrmS4BNRs2Ho1Bjc38hitU9pFlk=
X-Gm-Gg: AZFdTZdrLjIgHUTpPfcQso144mIO63pJKQVJXzc6Wy+kODXsObGXPG/WAEm/wlsOqdo
	fCB73A/NH87zUFhRX6fW19ygNy3fbx3kgvms4hlKQJMxEeJ2fo6Rwb/utXNlhUL/A1HnODtOoTl
	TQAL7BUft0yq0ggq5BNj/yTLetA+ebgrQBXRyX2UMP9UICJ6Hpdbkavpl64ZZul+Ej0vGj0cBBG
	zQ0wepV7ELJqSh2VoJkX29SGZMVPEw9VmV8OIgP+91Mb4zjaEBz/TrVRy/RURq2AkWJZRsD5oCs
	dZZRYcQ63tg/uSvv+Y5bvoOIlNHOpzr21NibdZ/2TjfJZbLQUoNhn9Nz5kE6j3pZde08ZimH7l1
	P+JGoZTTzWtpxRuLzTh7mQmXIUwIhAXbpYDYDBNgh+0lBsdfY6QuQo7eEtRTqmaImRFm4Kp7Nm1
	OlFzoDyjlghITmJ9R5SwVCFYpBnsjTXAeRugayXrZeWMI8wQVOSadeOMnC71cd1vjswa5czRHg9
	rV41/r7TL9RcZkIX5sZPhvBG8poPTLVQinfETxR9Zi+REH5z8WIQujEShTL+BTbbUVEtqTGDgga
	P25jZgaD4vhiNccWBLn6gIfs3D20ZBNDhHgV
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr17148999a91.49.1795589674969;
        Tue, 24 Nov 2026 22:54:34 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm26149320a91.8.2026.11.24.22.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:54:34 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v3 1/2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Wed, 25 Nov 2026 13:54:28 +0700
Message-ID: <20261125065429.1483868-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <awXHzblUfp05jZSQ@kernel.org>
References: <awXHzblUfp05jZSQ@kernel.org>
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

io_uring passes its own file offset to the TPM character devices, although
they are opened with nonseekable_open(): IORING_OP_READ copies sqe->off
into ki_pos without checking FMODE_PREAD. The devices also keep a single
command and response per open file, which does not fit asynchronous
requests.

Add tpm_common_read_iter() and tpm_common_write_iter(), which fail io_uring
and AIO requests with -EIO. A multishot read uses a synchronous kiocb, so
also reject IOCB_NOWAIT and io-wq workers. The callbacks call
tpm_common_read() and tpm_common_write() once per iovec, so readv() can
still split a response into the header and the body.

Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

 drivers/char/tpm/tpm-dev-common.c | 70 +++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c        |  2 +
 drivers/char/tpm/tpm-dev.h        |  2 +
 drivers/char/tpm/tpmrm-dev.c      |  2 +
 4 files changed, 76 insertions(+)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 553fc6aca94d..5189c1d72058 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -13,8 +13,10 @@
  * Device file system interface to the TPM
  */
 #include <linux/poll.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/uio.h>
 #include <linux/workqueue.h>
 #include "tpm.h"
 #include "tpm-dev.h"
@@ -253,6 +255,74 @@ ssize_t tpm_common_write(struct file *file, const char __user *buf,
 	return ret;
 }
 
+/*
+ * Reject io_uring and AIO. IORING_OP_READ_MULTISHOT requests use a
+ * synchronous kiocb, so also check for NOWAIT attempts and io-wq workers.
+ */
+static bool tpm_iter_is_async(struct kiocb *iocb)
+{
+	return !is_sync_kiocb(iocb) ||
+	       (iocb->ki_flags & IOCB_NOWAIT) ||
+	       (current->flags & PF_IO_WORKER);
+}
+
+/* Preserve the VFS fallback's per-iovec read/write semantics. */
+ssize_t tpm_common_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	struct file *file = iocb->ki_filp;
+	ssize_t ret = 0;
+
+	if (tpm_iter_is_async(iocb) || !user_backed_iter(to))
+		return -EIO;
+
+	while (iov_iter_count(to)) {
+		size_t len = iter_iov_len(to);
+		ssize_t nr;
+
+		nr = tpm_common_read(file, iter_iov_addr(to),
+				     len, &iocb->ki_pos);
+		if (nr < 0) {
+			if (!ret)
+				ret = nr;
+			break;
+		}
+		ret += nr;
+		iov_iter_advance(to, nr);
+		if (nr != len)
+			break;
+	}
+
+	return ret;
+}
+
+ssize_t tpm_common_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	ssize_t ret = 0;
+
+	if (tpm_iter_is_async(iocb) || !user_backed_iter(from))
+		return -EIO;
+
+	while (iov_iter_count(from)) {
+		size_t len = iter_iov_len(from);
+		ssize_t nr;
+
+		nr = tpm_common_write(file, iter_iov_addr(from),
+				      len, &iocb->ki_pos);
+		if (nr < 0) {
+			if (!ret)
+				ret = nr;
+			break;
+		}
+		ret += nr;
+		iov_iter_advance(from, nr);
+		if (nr != len)
+			break;
+	}
+
+	return ret;
+}
+
 __poll_t tpm_common_poll(struct file *file, poll_table *wait)
 {
 	struct file_priv *priv = file->private_data;
diff --git a/drivers/char/tpm/tpm-dev.c b/drivers/char/tpm/tpm-dev.c
index 74488f0a7b78..9c2f0ad826be 100644
--- a/drivers/char/tpm/tpm-dev.c
+++ b/drivers/char/tpm/tpm-dev.c
@@ -62,6 +62,8 @@ const struct file_operations tpm_fops = {
 	.open = tpm_open,
 	.read = tpm_common_read,
 	.write = tpm_common_write,
+	.read_iter = tpm_common_read_iter,
+	.write_iter = tpm_common_write_iter,
 	.poll = tpm_common_poll,
 	.release = tpm_release,
 };
diff --git a/drivers/char/tpm/tpm-dev.h b/drivers/char/tpm/tpm-dev.h
index 34efb1ffa491..2f2186e6f094 100644
--- a/drivers/char/tpm/tpm-dev.h
+++ b/drivers/char/tpm/tpm-dev.h
@@ -28,6 +28,8 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 			size_t size, loff_t *off);
 ssize_t tpm_common_write(struct file *file, const char __user *buf,
 			 size_t size, loff_t *off);
+ssize_t tpm_common_read_iter(struct kiocb *iocb, struct iov_iter *to);
+ssize_t tpm_common_write_iter(struct kiocb *iocb, struct iov_iter *from);
 __poll_t tpm_common_poll(struct file *file, poll_table *wait);
 
 void tpm_common_release(struct file *file, struct file_priv *priv);
diff --git a/drivers/char/tpm/tpmrm-dev.c b/drivers/char/tpm/tpmrm-dev.c
index 19e8f2779265..0c8c1a1b0b3b 100644
--- a/drivers/char/tpm/tpmrm-dev.c
+++ b/drivers/char/tpm/tpmrm-dev.c
@@ -49,6 +49,8 @@ const struct file_operations tpmrm_fops = {
 	.open = tpmrm_open,
 	.read = tpm_common_read,
 	.write = tpm_common_write,
+	.read_iter = tpm_common_read_iter,
+	.write_iter = tpm_common_write_iter,
 	.poll = tpm_common_poll,
 	.release = tpmrm_release,
 };
-- 
2.52.0

