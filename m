Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455221;
	b=fDXIUwVe/2tjaB+XdD1A66pelBT3X2kc0ixVRT9bxF18ldykeSX4c1nr6sSj+Y13HSeD
	 wJXnOqWe84V2+D4NlDAieBhtlSWx7bBHXSETWvJMbpmuprfqwF8xrr9fFwqEc8Y3sjsvr
	 2eLtrFMG9v+gTlx17RnDp6oU/CICShK+vpCuOWG+LauS8pjY6Nl1Wi9Zpff9x5AEsJmMe
	 SqT3HN4+dNybn7xjTtwkd96UNIiRMN4C+e5j7WIp2uwpFjaTwcO53J85QN3mG8LDwePuj
	 8kyz60jHNolsh71LdsbzmCdNzkEUGmw/OS4zJUlEfO8NSe49z5hJ68APXDqenel8BYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vdUY4HAjnNZcmuH6SmYqwwetrh2sYCDeHmR0churmkA=;
	b=AXg7LEpqIi52wTovz15qPH4ppjbkp1O95Ia1zkE0UPIC8RUEaRUpoNGRdmlXL8/vVUhW
	 jUjC3uW+fzIYtva1svRVhVJqotFOLuaxenUaRl5yVKFQrq6o32K4OjDmVF9upbI3qnFZT
	 CM4bD71IbNZ60W3Hc18HGm/wEx8yhq9pnHt3B6CbS4DoAlOibwpgsFYkTYimiYyJX04g+
	 3waF/ijvr547EtTtARxzFG5WCrkFOpJd7IRPyzlkf5SvJpd/UwZkbp1QIaJSb1Ia3dazK
	 F/ZwZb2OfWgLQ6axhWv6/yK2K5VYs54ch9Czy1M+2msMB9cRVqgEc+vDkLTyaIY94SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=kECEohdF;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA872606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA872606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=kECEohdF
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1314546b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795455220; x=1796060020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdUY4HAjnNZcmuH6SmYqwwetrh2sYCDeHmR0churmkA=;
        b=kECEohdFNPUoh1sHn0cgFd+/Wa3UDkYyfR3fRIrd1QGlALEvo2Hu/CVPNkyPVG+ESu
         2T9VYAzS5QmJR/3Z08Gwu2vKjCMk6ZeDYBuVl2S0RoD4W/06st0NGRwO1Q+Pb+WD80BR
         xPRLnT8uNYRXH4Fd0R2h5Hm7njY2AhrxbhLLpgxyVQMo0RvfsUP6JKbqRs9OBsCnZcFb
         xz9RaABtJX1SUCmIs4WZNgRVokdIynnzonV2G3Iy2NAKCgcWGIFEK+I6Idc+RYih7LYd
         hhGa/+Y29e7GwwlYnCJZ+EnwqIqMl1VLppE2XpVc7PEuV6u5v+CbKj8kA4CoVvivNLM7
         q+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455220; x=1796060020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdUY4HAjnNZcmuH6SmYqwwetrh2sYCDeHmR0churmkA=;
        b=Xczkk0QYcmLAgxLJe+52IiRvKQJQ91l2duCoLh/8pmqW/yVkJ/dIn9w+M7VQ1NswsH
         NW6Q5Qz1mgP2l67L3yXmJAtiueA/NN6exQg/PXkD8CuG1gr+sWcpbvlyYKGaR7dKoToM
         k29Pi0ST6hjPCBQTsmwEw7zISCZSBMBjqhu1n2Q0TQrA5CBHFwaSVMP4qZ/P3DFOBTrd
         6NBtg94e0NiZlqC+aUHWCzBF9ouY7dvCtqvgtp6orv1ktLQ2W1HVOpT3Ls2OLY1+5y7j
         P5HgP8TO7ZnSI8SXJ6NvjcsN8mfjGhGbIzt+qCYt/hGqfFzsh4efEDDDyH9BVLy3TVWf
         PDqA==
X-Forwarded-Encrypted: i=1; AL+hErEM7H+i9kSWyCqZ1nZTYc4gUJyyXMG024hGe9KYYxvElQDN688G0sfNLhRF80nNBRewr0iGWHpSUXu1eEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AD+/oj2ADNbEZjfAwF2Tmk86WKHRMTBq/KtBEnSBAj9ABFKB4
	NYD5Vv6zF6O5WcwnXjvwSNzUEjJP0zyjI++BqT1aJa4E3St/YNpZBeSiMOlgZq6VnANYvrhNNzi
	80cUnOfg=
X-Gm-Gg: AZFdTZe8AZO21Y65hetCWl0h8bJBBziAcurGa3in5XMBzNo3GTFF1pFzlrZzRWSuhrU
	vWx0K1kGCdcDyIqymHh67l/bmRu3f++AgZktcWfWK8sFFM+S+rTgb9avX//cdCN4nMpx3DP2Vqh
	2SsjhGGH9/PKtNAV5d3/sxE7iJtnHWggj2nbrP5YO9YuVrYdsUqkexJjNoLw9Ql7avL/bmFxmxY
	Yn11MoZPNoGRaZuv5TZmEULzu9rInw0k8aZI+BVL3ZEyj3xx3EbIcGcdTidlg07ZlD7MoFuhz+2
	AY0xbPt7GNV25XrQkavvpas9DDMqOcyBm9K1R/fJPk5Gi6za73nOyGa5Or0DxJuTE4bysWJEPsE
	ArzKuUaxzJmeBr26SMnRDMg0i13yDJs5w2N7jvix/wk13wLqX2CjtCft3yB7dL3f7mywCuhISWS
	9ogUYJS7VpIMrO6gbd2TTaiIE9I8upo0Atf4kaz0GQwM9hhWNHhpij2dsLDE7FPFgrtGTioQnOK
	AItX4YK26qwbE4V0xxnStrpUWG71iWKn5Jkl2QI+jObhQsCcM8WANpdXcCmFbyJ16SfYk4MFCT9
	dyE2KVq3GoP+YC9f1kqc9V8bvodN25hznl/a
X-Received: by 2002:a05:6300:393:b0:3e1:e53b:5005 with SMTP id adf61e73a8af0-4014c25739cmr9704552637.65.1795455220075;
        Mon, 23 Nov 2026 09:33:40 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm5506224a12.30.2026.11.23.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:33:39 -0800 (PST)
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
Subject: [PATCH v2] tpm: Do not allow io_uring for /dev/tpm0 and /dev/tpmrm0
Date: Tue, 24 Nov 2026 00:33:21 +0700
Message-ID: <20261123173321.2363162-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <awBff_fSk9HDh896@kernel.org>
References: <awBff_fSk9HDh896@kernel.org>
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
into ki_pos without checking FMODE_PREAD, and loop_rw_iter() hands it to
->read(). This offset used to index data_buffer and allowed out-of-bounds
reads. The devices keep a single command and response per open file, which
does not fit asynchronous requests.

Add tpm_common_read_iter() and tpm_common_write_iter(), which fail io_uring
requests with -EIO, and AIO requests, which the new callbacks would
otherwise enable. A multishot read uses a synchronous kiocb, so also reject
IOCB_NOWAIT attempts and requests from io-wq workers. read() and write()
are not affected, as the VFS still calls ->read() and ->write() for them.

readv() and writev() now reach the new callbacks instead of the VFS loop
over ->read() and ->write(). A readv() can split a response, for example
the 10-byte header into one buffer and the body into another, so the
callbacks keep that loop and call tpm_common_read() and tpm_common_write()
once per iovec.

Update the tpm2 io_uring selftest to expect -EIO, and check that the
rejected request leaves the whole response for the following read().

Assisted-by: Claude:claude-opus-5-5
---
This applies on top of [PATCH v3] selftests: tpm2: test that io_uring
reads ignore the file offset:
https://lore.kernel.org/all/20261123165638.2161305-1-rmustafin@cloudlinux.com/

Changes in v2:
- message starts with the use case, rewrapped (Jarkko)
- drop the CONFIG_IO_URING guards (Jarkko)
- drop Suggested-by and the Link to the review
- selftest part on the Python UringTest of the v3 selftest

preadv2() and pwritev2() at offset -1 now reach the new callbacks, so
RWF_SYNC, RWF_DSYNC, RWF_APPEND and RWF_NOAPPEND are accepted and ignored
instead of failing with -EOPNOTSUPP in the VFS loop.

v1 (RFC): https://lore.kernel.org/all/20261120142116.1630010-1-rmustafin@cloudlinux.com/

 drivers/char/tpm/tpm-dev-common.c          | 70 ++++++++++++++++++++++
 drivers/char/tpm/tpm-dev.c                 |  2 +
 drivers/char/tpm/tpm-dev.h                 |  2 +
 drivers/char/tpm/tpmrm-dev.c               |  2 +
 tools/testing/selftests/tpm2/tpm2_tests.py | 11 ++--
 5 files changed, 82 insertions(+), 5 deletions(-)

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
diff --git a/tools/testing/selftests/tpm2/tpm2_tests.py b/tools/testing/selftests/tpm2/tpm2_tests.py
index dc4e642450d6..dc1814e0c701 100644
--- a/tools/testing/selftests/tpm2/tpm2_tests.py
+++ b/tools/testing/selftests/tpm2/tpm2_tests.py
@@ -9,6 +9,7 @@ from tpm2 import ProtocolError
 import unittest
 import logging
 import struct
+import errno
 
 class SmokeTest(unittest.TestCase):
     def setUp(self):
@@ -386,15 +387,15 @@ class UringTest(unittest.TestCase):
                           tpm2.TPM2_PT_FIXED, 1)
         try:
             client.tpm.write(cmd)
-            # Offset 10 stays inside the response, so an unpatched kernel
-            # skips the header instead of reading out of bounds
-            res, rsp = uring_read(client.tpm.fileno(), 4096, 10)
+            res, _ = uring_read(client.tpm.fileno(), 4096, 10)
+            # The rejected read must leave the whole response in place
+            rsp = client.tpm.read(4096)
         finally:
             client.close()
 
-        self.assertGreaterEqual(res, 10)
+        self.assertEqual(res, -errno.EIO)
         sz, rc = struct.unpack('>II', rsp[2:10])
-        self.assertEqual(sz, res)
+        self.assertEqual(sz, len(rsp))
         self.assertEqual(rc, 0)
 
     def test_read_tpm(self):
-- 
2.52.0

