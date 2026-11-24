Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530284;
	b=EBuVFd2x0UGdTsDRY6c3B7vIM4Il8D23MqNwIV4WZQIbU0AHpxAM22zw01X4Xi3j5G8B
	 N4iKypG9ix0l9PcSH1MxDhpBomym5RGF6QhGtMxe6wXVA7qRpvIU69pYpFB8yLvqLa3zv
	 eTlPnN06Eal0jv+czg+jrQu46Jjb9cjE/clzN5USf8o3r2wYM7W0WHP0bGf2va6rXMDYm
	 Skk1Jay0GpDuMK6Svs1NbCs2Gse/3qpnSzCrYBJPeUWlCRVDe1xaHuaFHJ6oB8LZmyx6s
	 s6KTTrwFsL62Z7kBaLLtNBQ7h+Z4jc6N6214eT6EF4bnUD+AU7yPDn7eXqxLg9hRxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nTAzMCxB2/gXwbZNiftqQIJAtiuMPi3mZnrzNiLaZ9A=;
	b=wVKeJcm9U2xHN7fMbDlivc1gOaiX44tixFax5lULQ6UN8zfZDXsOWboU6Jo6oEjOhHDP
	 WOCvB0eqo94oA6BCnPTHKpeDRj9ovrCXyO0Jix8/sdnxcyFnQh+enPjlsGLtaU4vyPqg0
	 ivcS2EG1Y8NafguFwyrSsmjuAtCxfetLhjenLEYhB+rHdqSuL2GRWwfvw5Ps2Sxs8bRit
	 l2WZX/51qdjpjJ3M5wYdXC1CfI184nglxLkPpAmY2Y5rm8azVRjT7M+Hg4DkhpiUhGyc4
	 EMvcBSO/IwLj8CW1OaUADfMRyJdDqqeOi1O6e4/WFASu+bA9JUAkb3qtsWlbYtJj93A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b="Du9/A+eB";
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13570606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13570606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Du9/A+eB
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0dba37a7fso36913417b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795530283; x=1796135083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTAzMCxB2/gXwbZNiftqQIJAtiuMPi3mZnrzNiLaZ9A=;
        b=Du9/A+eBSdjR98FK336m4XD8kKC+rseVT1Gkr2MY8C4M4hjTGah9xbkn0enbvwoVmW
         3dhFAAA44kZ0996gxRwq15zspnvaei/ZQA9dbIcHK4OQIW/MOAiQ3Vn56oZ8Wsyg9MHR
         m5UXkgejOfPnSRRfFms+bK2pSps1zFsMje0lqG0C66F7ZdUCIes4BZ/53qUAC0n8lukx
         hueJZJBShUVpgD1R5898BXpaLvNNX8i126xB9VYKwKeWJaSr5E3ArHnVvv3e+h4IadYk
         9hvDU53n+tstAp3ePI+8C8alM4qn8lFQWTnPU+EvgsGjC1QNLxgqjMsiuLVjCsfeYTgF
         IsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530283; x=1796135083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nTAzMCxB2/gXwbZNiftqQIJAtiuMPi3mZnrzNiLaZ9A=;
        b=LTA9GguIm0I8PSdcWFehW9iiy/zWGGppHiYrhuxqf21XGPKe6tWjaGRC/sd/g3g6u7
         U3O41BOZVNQkUPyOLPvkYGXViTV0ToOyWQs2Kaid5BrvqcmnCo92WSQO73MFcwbPQUeV
         TLqOiki1M+PmVN5FFRsb6C2rlR8HS9uusEXaMNYfEh46NldaAaIaMfpnNzVhOL3MWrpW
         mN2xEl0+cMcSVsFSWfAoKoJVx0tDDVKOwmdMmo+tdVBTgcldnQ3dFe53+moGQWH4PrlY
         IivhzzIlFKli22nqlAwDRld1tR72vPt3GywbvbmJlfzYt6ageRASnrmRFZq2oEbgrjl1
         NUlQ==
X-Forwarded-Encrypted: i=1; AL+hErFDSzrS3QbDmeU4GWaiuds5a2fJaTlXqvolTES2qNOw1vIW1+nUbeyEpBgDlJvezr8S5kDzYrwaCxk3bao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OyJhCRHkjlf7D39t6avU9ziyJofNiNADH7iIMXshzMvSTwqhj
	veOAPFEc3+yqSXkDYYz1OMYVzdKsmhmrwLkp9rTvbpyqhNAZcHZ8tNwHqGIS9yT/KKg=
X-Gm-Gg: AZFdTZfzUdrB2kHxGD6ctE6QKOEMLfUj+IxOI4N7rWZbCsFr/U309ukGoQ6rAIGoxJS
	t2N5oSHlGVdWgdUdi3+DevkNqFVmfDKM3/MBCTyOGr3FO04KqH9AAy7qrkY0aqxWgYQPcU1kmci
	IcdUTI7Q4c7sxvewig5JRQiifThVscGb6YcIIflEjmkzQgNKysgsDWOTY9ffzNBwOUl7akAS0As
	9C0EOuO6sjdzGJoZem37wz3LEaesnKm3WufAMP9kdYKtNJkioq3cp9QGJUynWFXSjLK4Y3edCyF
	CtFNR5El2WEebKjC6hSLXiXH+U0F5M9LsWAqx+S3v5e0fBuOiczHZqlAI81A3Bk0BLFBx6qWLH6
	6nMr+dE8TkLPs3qp37CJ11wjwpi5Qgkku0gAZprXIZilnqrmjHp7gFR1+Ajqa9wlfZOujkZiYm6
	esLcMS7thTTM5VRzaWAX1EVhr153axi/KLzLSHhVf4tWmS2bsTER/dF7VgBX3ymzcP91jliAqrx
	K1VuYzZLeG9AXyq5/o1QLKs/UPv6v3RrrRVPijclwdVp8MrbqTFOfy0Mt1SoFDnQARdIvEoY/FW
	ccDY7FpPk752rHuE1gjDvy5EjrMFxMqbXTqDkQ==
X-Received: by 2002:a05:690c:9b06:b0:8b4:e258:3dc with SMTP id 00721157ae682-8b5204eb0cfmr56859957b3.49.1795530283166;
        Tue, 24 Nov 2026 06:24:43 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm58062957b3.36.2026.11.24.06.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:42 -0800 (PST)
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
Date: Tue, 24 Nov 2026 21:24:31 +0700
Message-ID: <20261124142432.368943-2-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261124142432.368943-1-rmustafin@cloudlinux.com>
References: <20261124142432.368943-1-rmustafin@cloudlinux.com>
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

Assisted-by: Claude:claude-opus-5-5
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

