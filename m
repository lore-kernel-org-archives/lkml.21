Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200151;
	b=cmgXmNHaXb0NUlPt5KUseTMcN4tDEDf7uXloR0xNX+oX4urw//oADKPBS43jpX20mp4Z
	 bQk5a18sD9EJ4NUN/c6drwLDaSXTR20G7K3xnQ/KxB7pyAbvdgHrtgDk/lz+CkVorevda
	 uv8yZsvrvNiP2N+CYHX+s1nO2wIaAP3+h4BpIRWXTSkDvfTqM/rhr5NNk34xI5iQxssxd
	 EhjvR4JiyGe4EIri2yyvCxvMVW9K4rqdn8Paonn12LG/3s2DiHG8Mi2iY/HSuAVWQWw0M
	 bGNHOuHhDDITCdGTjYHNUd9IbKo9m4HB9gHl+C44ZYtLcpHanabVSyBSvQB8Bv4Ikjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qDrA3QEHMeKIHW3bOyblcdVywBJ7RCRY1bQxafinoto=;
	b=ueVSjVs9Aap4uTcFIPb2d/eCPE/f9U4Q6iI/HKyptmW3fgiKhprzYchnrM7VLmdbVxJ7
	 uf/WmUFfvaFZ1qfQEWVsMQA1z4RsQVAFpLcXu0hGlSvCQgwjCT7mXgZJSwpRZRX0BRm0t
	 oI+tdp1CDQgds1mB2TD4mr+Myu9EqAlIDbuTDBeq5uAcIaVVdIaIbS263ZXBrrWNW6m1Z
	 ORxoy3mhPs5trhq2bFqJrhtro1arNNn7FIQTaBpyf7Icfyt8qiZnP8euln//3g9zJzz1r
	 n/TlFBEjYAZMgwlJdxGFFWN71fGoRLqmyMKsZahQSv7WZEmxcYR4ZKSPYLb0H5uwqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxPXU45+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57360A261C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA57360A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxPXU45+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso21773325e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200148; x=1795804948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDrA3QEHMeKIHW3bOyblcdVywBJ7RCRY1bQxafinoto=;
        b=jxPXU45+x0qqCZq7FjT2jEA8QQsyOrGK3smXcH1RPjxo+sFn3+DWykT19QxHd8OIkL
         OJEZ8KIJVOsL3WXz9IkQ9EHsP6AAR1u//k1O8XkWfWpxl0eiExYA3/SXfKSm2Ki0Tci5
         MYYktGoZDOdHcq7kTRuLRFHRIL2IlR9DPYFzKDRXky3vVXk014RWh96R76vvoql19lU4
         vcnu8IVikP/Qq9XiSc4Kf0GDYdtLpiVRlgDE8lGT1/Z0t/P9H33yc2MvZfs3QqAv1sMt
         hohPmssLRGbHC1BLxMaPF6VoDNAcE2FsnW6ofCHbs+uvjezNbafA1HjgQzJS94JRttpJ
         PjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200148; x=1795804948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDrA3QEHMeKIHW3bOyblcdVywBJ7RCRY1bQxafinoto=;
        b=vPBoWUY5kGy5GX6aH3pc032arPtb2Y8Sny028O+NJvP1HTjIRFjPan9eNhgp1va660
         vnZE2wpmwyk4tgulljddyFsB8qwgjCbETDkCHM0M8OE68STmaNheN+GP3Y7u7LVWf3oU
         jd6aKHhsNLDlmRz0Bm6cIe2DYifXdtE9eJbbX8DEn3iWhrsOVmuYBc911rOas9wTSajc
         QTtyGAAqfRbW+7XCf8/Zf7AtUO5m2aIOh6fn+ATGcJkbW5BbPlMZmHgC3MBdEw51vxSq
         9oewY2MW3UZpAQDjBZNN2KL2vljbdBiooAX78q/hX7RYMbM4lZI9C6xcn7UYVnXHecle
         ekfg==
X-Forwarded-Encrypted: i=1; AL+hErFoqn2NMXFruhavdkEvqEa8QhJBGTude7TxT0n8YnGu6mvD5gWX5GnRzMp6T+h8+VwJN8yPPYIBTk/htjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NP8xBVjHuQ1SkRnhGZd3Pus6tMVRaW3tA6LZwCvJkVCGk4zvb
	Du3BgtVNOviXz459b/0UPb5iwC0ZJFiY+xPcIMyrI/qwKeKJb1vLZPmtSCjsSCYr
X-Gm-Gg: AYBFou2xTZIJePhqMkCGmcRtAnEjM7x0NsOIwNloqboBKDNRACZjLI138R2F+AwaAB3
	Fw5ENgj2uzoVK+ZwS/PnlVwPnZUpZJBWbdOoiUzvHY2tb+p59f6h8zDPmizkP7gZclNlhUQw/zZ
	6dnHfabFuHZ1Mjg+/qx2BG+lqrjppJjdCTVBVN4tmfabGQUMItA/xmyrRT/VDXDdTc82hHallQQ
	aW+AIxwfMEGfO9pNzEMHgXyvCVQNzx9tVx3gs0G4lVOK4jW/NBWryY2eZpVe5kk0ehTfjC89QWo
	n8MNjggxoVOvlusQfeh0kPF6rPGiYqsDTlQbdFXXkFPm4rwiqZ4zQTxLB1drR6+zsVhcyGy1la3
	ZlvsOm1P+ouPN2sOTIP/Q3QEQoWfT5JYmWBpR7lEDp9tyYiDJndcNkBH/+uzlLJX8MBZcs4GYVK
	lj6CrgfdgQG2ZDrPlC1MZwQUmHMqWqZ6cxLzVnyJMx4fGyN8AYpcxfchUTA4wjbSios90rIcmU9
	XEL37I2GTk5jrcTtHuRYUJdxH1g6gsG60eDW2BbLeSYOtKoUpNLbNA3BsBz+E6DUsjesC0UBSlv
	VAQ9rktWGWnxgbKdHk7+U9M8acGsIF31aV5RZh4z3zpp
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr90234605e9.12.1795200148016;
        Fri, 20 Nov 2026 10:42:28 -0800 (PST)
Received: from asahi.teknoraver.net ([195.182.211.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm109943825e9.3.2026.11.20.10.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:42:27 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Ding Feng <dingf3ng@gmail.com>
Cc: Paul Eggert <eggert@cs.ucla.edu>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] fs: shorten I/O that would extend past the maximum file offset
Date: Fri, 20 Nov 2026 19:42:25 +0100
Message-ID: <20261120184225.257554-1-technoboy85@gmail.com>
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

rw_verify_area() fails with -EINVAL any read or write where
pos + count would exceed LLONG_MAX, even when pos itself is valid.
Such a request should not fail: a read should return the bytes that
are there up to the maximum offset, or 0 at end of file, and a write
should write what fits and return a short count.

This breaks ordinary programs that pass a large count, such as
coreutils, which uses SSIZE_MAX as the count for copy_file_range() and
falls back to read() at the end. For example, both of these fail with
EINVAL:

  $ truncate -s $((2**63 - 1)) hugefile
  $ dd if=hugefile bs=1M skip=$((2**43 - 2))
  dd: error reading 'hugefile': Invalid argument

  $ dd if=hugefile bs=1 skip=$((2**63 - 1)) | cat
  cat: -: Invalid argument

and on a 100-byte file:

  preadv2(fd, 200 bytes, pos = LLONG_MAX - 50) = -1 EINVAL
  preadv2(fd,  50 bytes, pos = LLONG_MAX - 50) = 0

splice(), sendfile(), aio and io_uring fail in the same way.

Add rw_clamp_count(), which shortens the count so that the range ends
at LLONG_MAX, and call it before rw_verify_area() in the read and write
paths of the VFS, splice, aio and io_uring. Where the I/O is described
by an iov_iter, truncate the iterator. This is what filemap_read()
already does for s_maxbytes. In io_uring, also save the iterator state
again after truncating it, so that the short read retry loop does not
restore the full length.

rw_verify_area() keeps its check, so callers that are not converted
behave as before. rw_clamp_count() leaves alone negative positions,
counts above SSIZE_MAX, files with FOP_UNSIGNED_OFFSET and writes that
start at LLONG_MAX, so these still fail in rw_verify_area().
copy_file_range() already clamps the range in generic_copy_file_checks()
and is not changed.

Reported-by: Ding Feng <dingf3ng@gmail.com>
Closes: https://lore.kernel.org/linux-fsdevel/20261120051457.47753-1-dingf3ng@gmail.com/
Suggested-by: Paul Eggert <eggert@cs.ucla.edu>
Link: https://lists.gnu.org/archive/html/coreutils/2025-12/msg00097.html
Link: https://lore.kernel.org/linux-fsdevel/20251219125250.65245-1-teknoraver@meta.com/
Signed-off-by: Matteo Croce <technoboy85@gmail.com>
---
 fs/aio.c           |  4 ++++
 fs/read_write.c    | 18 ++++++++++++++++++
 fs/splice.c        |  3 +++
 include/linux/fs.h | 38 ++++++++++++++++++++++++++++++++++++++
 io_uring/rw.c      | 16 ++++++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/fs/aio.c b/fs/aio.c
index d78acc69f487..abd17f75faaa 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1651,6 +1651,8 @@ static int aio_read(struct kiocb *req, const struct iocb *iocb,
 	ret = aio_setup_rw(ITER_DEST, iocb, &iovec, vectored, compat, &iter);
 	if (ret < 0)
 		return ret;
+	iov_iter_truncate(&iter, rw_clamp_count(READ, file, &req->ki_pos,
+						iov_iter_count(&iter)));
 	ret = rw_verify_area(READ, file, &req->ki_pos, iov_iter_count(&iter));
 	if (!ret)
 		aio_rw_done(req, file->f_op->read_iter(req, &iter));
@@ -1679,6 +1681,8 @@ static int aio_write(struct kiocb *req, const struct iocb *iocb,
 	ret = aio_setup_rw(ITER_SOURCE, iocb, &iovec, vectored, compat, &iter);
 	if (ret < 0)
 		return ret;
+	iov_iter_truncate(&iter, rw_clamp_count(WRITE, file, &req->ki_pos,
+						iov_iter_count(&iter)));
 	ret = rw_verify_area(WRITE, file, &req->ki_pos, iov_iter_count(&iter));
 	if (!ret) {
 		if (S_ISREG(file_inode(file)->i_mode))
diff --git a/fs/read_write.c b/fs/read_write.c
index e8c14e2760b2..0a6cf9b5b02e 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -544,6 +544,7 @@ ssize_t kernel_read(struct file *file, void *buf, size_t count, loff_t *pos)
 {
 	ssize_t ret;
 
+	count = rw_clamp_count(READ, file, pos, count);
 	ret = rw_verify_area(READ, file, pos, count);
 	if (ret)
 		return ret;
@@ -562,6 +563,7 @@ ssize_t vfs_read(struct file *file, char __user *buf, size_t count, loff_t *pos)
 	if (unlikely(!access_ok(buf, count)))
 		return -EFAULT;
 
+	count = rw_clamp_count(READ, file, pos, count);
 	ret = rw_verify_area(READ, file, pos, count);
 	if (ret)
 		return ret;
@@ -653,6 +655,7 @@ ssize_t kernel_write(struct file *file, const void *buf, size_t count,
 {
 	ssize_t ret;
 
+	count = rw_clamp_count(WRITE, file, pos, count);
 	ret = rw_verify_area(WRITE, file, pos, count);
 	if (ret)
 		return ret;
@@ -675,6 +678,7 @@ ssize_t vfs_write(struct file *file, const char __user *buf, size_t count, loff_
 	if (unlikely(!access_ok(buf, count)))
 		return -EFAULT;
 
+	count = rw_clamp_count(WRITE, file, pos, count);
 	ret = rw_verify_area(WRITE, file, pos, count);
 	if (ret)
 		return ret;
@@ -879,6 +883,8 @@ ssize_t vfs_iocb_iter_read(struct file *file, struct kiocb *iocb,
 	if (!(file->f_mode & FMODE_CAN_READ))
 		return -EINVAL;
 
+	iov_iter_truncate(iter, rw_clamp_count(READ, file, &iocb->ki_pos,
+					       iov_iter_count(iter)));
 	tot_len = iov_iter_count(iter);
 	if (!tot_len)
 		goto out;
@@ -907,6 +913,8 @@ ssize_t vfs_iter_read(struct file *file, struct iov_iter *iter, loff_t *ppos,
 	if (!(file->f_mode & FMODE_CAN_READ))
 		return -EINVAL;
 
+	iov_iter_truncate(iter, rw_clamp_count(READ, file, ppos,
+					       iov_iter_count(iter)));
 	tot_len = iov_iter_count(iter);
 	if (!tot_len)
 		goto out;
@@ -939,6 +947,8 @@ ssize_t vfs_iocb_iter_write(struct file *file, struct kiocb *iocb,
 	if (!(file->f_mode & FMODE_CAN_WRITE))
 		return -EINVAL;
 
+	iov_iter_truncate(iter, rw_clamp_count(WRITE, file, &iocb->ki_pos,
+					       iov_iter_count(iter)));
 	tot_len = iov_iter_count(iter);
 	if (!tot_len)
 		return 0;
@@ -970,6 +980,8 @@ ssize_t vfs_iter_write(struct file *file, struct iov_iter *iter, loff_t *ppos,
 	if (!file->f_op->write_iter)
 		return -EINVAL;
 
+	iov_iter_truncate(iter, rw_clamp_count(WRITE, file, ppos,
+					       iov_iter_count(iter)));
 	tot_len = iov_iter_count(iter);
 	if (!tot_len)
 		return 0;
@@ -1007,6 +1019,8 @@ static ssize_t vfs_readv(struct file *file, const struct iovec __user *vec,
 	if (ret < 0)
 		return ret;
 
+	iov_iter_truncate(&iter, rw_clamp_count(READ, file, pos,
+						iov_iter_count(&iter)));
 	tot_len = iov_iter_count(&iter);
 	if (!tot_len)
 		goto out;
@@ -1045,6 +1059,8 @@ static ssize_t vfs_writev(struct file *file, const struct iovec __user *vec,
 	if (ret < 0)
 		return ret;
 
+	iov_iter_truncate(&iter, rw_clamp_count(WRITE, file, pos,
+						iov_iter_count(&iter)));
 	tot_len = iov_iter_count(&iter);
 	if (!tot_len)
 		goto out;
@@ -1325,6 +1341,7 @@ static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 		if (!(fd_file(in)->f_mode & FMODE_PREAD))
 			return -ESPIPE;
 	}
+	count = rw_clamp_count(READ, fd_file(in), &pos, count);
 	retval = rw_verify_area(READ, fd_file(in), &pos, count);
 	if (retval < 0)
 		return retval;
@@ -1365,6 +1382,7 @@ static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 #endif
 	opipe = get_pipe_info(fd_file(out), true);
 	if (!opipe) {
+		count = rw_clamp_count(WRITE, fd_file(out), &out_pos, count);
 		retval = rw_verify_area(WRITE, fd_file(out), &out_pos, count);
 		if (retval < 0)
 			return retval;
diff --git a/fs/splice.c b/fs/splice.c
index 9d8f63e2fd1a..7a889274f9d6 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -1001,6 +1001,7 @@ ssize_t vfs_splice_read(struct file *in, loff_t *ppos,
 {
 	ssize_t ret;
 
+	len = rw_clamp_count(READ, in, ppos, len);
 	ret = rw_verify_area(READ, in, ppos, len);
 	if (unlikely(ret < 0))
 		return ret;
@@ -1338,6 +1339,7 @@ ssize_t do_splice(struct file *in, loff_t *off_in, struct file *out,
 		if (unlikely(out->f_flags & O_APPEND))
 			return -EINVAL;
 
+		len = rw_clamp_count(WRITE, out, &offset, len);
 		ret = rw_verify_area(WRITE, out, &offset, len);
 		if (unlikely(ret < 0))
 			return ret;
@@ -1364,6 +1366,7 @@ ssize_t do_splice(struct file *in, loff_t *off_in, struct file *out,
 			offset = in->f_pos;
 		}
 
+		len = rw_clamp_count(READ, in, &offset, len);
 		ret = rw_verify_area(READ, in, &offset, len);
 		if (unlikely(ret < 0))
 			return ret;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index deb411e86661..990d8fa0b2bb 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3128,6 +3128,44 @@ extern loff_t fixed_size_llseek(struct file *file, loff_t offset,
 extern loff_t no_seek_end_llseek_size(struct file *, loff_t, int, loff_t);
 extern loff_t no_seek_end_llseek(struct file *, loff_t, int);
 int rw_verify_area(int, struct file *, const loff_t *, size_t);
+
+/**
+ * rw_clamp_count - shorten an I/O so it does not extend past LLONG_MAX
+ * @read_write:	READ or WRITE
+ * @file:	file the I/O is done on
+ * @ppos:	file position of the I/O, or NULL for stream files
+ * @count:	number of bytes requested
+ *
+ * A read or write that starts at a valid file position but would end past
+ * the maximum file offset should transfer the bytes up to that offset and
+ * return a short count, rather than fail.  rw_verify_area() rejects such a
+ * range, so callers clamp @count with this helper before verifying it.
+ *
+ * Out-of-range positions and counts are left alone so that
+ * rw_verify_area() still rejects them.  So is a write starting at
+ * LLONG_MAX, which cannot transfer anything.  A read starting there is
+ * clamped to zero bytes and reports end of file.
+ *
+ * Return: the possibly shortened count.
+ */
+static inline size_t rw_clamp_count(int read_write, struct file *file,
+				    const loff_t *ppos, size_t count)
+{
+	loff_t pos;
+
+	if (!ppos)
+		return count;
+
+	pos = *ppos;
+	if (likely(pos < 0 || (ssize_t)count < 0 || count <= LLONG_MAX - pos))
+		return count;
+	if (file->f_op->fop_flags & FOP_UNSIGNED_OFFSET)
+		return count;
+	if (read_write == WRITE && pos == LLONG_MAX)
+		return count;
+
+	return LLONG_MAX - pos;
+}
 extern int generic_file_open(struct inode * inode, struct file * filp);
 extern int nonseekable_open(struct inode * inode, struct file * filp);
 extern int stream_open(struct inode * inode, struct file * filp);
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 432820f86251..6c01290aa2fb 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -918,6 +918,7 @@ static int __io_read(struct io_kiocb *req, struct io_br_sel *sel,
 	struct io_async_rw *io = req->async_data;
 	struct kiocb *kiocb = &rw->kiocb;
 	ssize_t ret;
+	size_t count;
 	loff_t *ppos;
 
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
@@ -946,6 +947,13 @@ static int __io_read(struct io_kiocb *req, struct io_br_sel *sel,
 
 	ppos = io_kiocb_update_pos(req);
 
+	count = rw_clamp_count(READ, req->file, ppos, req->cqe.res);
+	if (unlikely(count != req->cqe.res)) {
+		iov_iter_truncate(&io->iter, count);
+		iov_iter_save_state(&io->iter, &io->iter_state);
+		req->cqe.res = count;
+	}
+
 	ret = rw_verify_area(READ, req->file, ppos, req->cqe.res);
 	if (unlikely(ret))
 		return ret;
@@ -1134,6 +1142,7 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 	struct io_async_rw *io = req->async_data;
 	struct kiocb *kiocb = &rw->kiocb;
 	ssize_t ret, ret2;
+	size_t count;
 	loff_t *ppos;
 
 	if (req->flags & REQ_F_IMPORT_BUFFER) {
@@ -1166,6 +1175,13 @@ int io_write(struct io_kiocb *req, unsigned int issue_flags)
 
 	ppos = io_kiocb_update_pos(req);
 
+	count = rw_clamp_count(WRITE, req->file, ppos, req->cqe.res);
+	if (unlikely(count != req->cqe.res)) {
+		iov_iter_truncate(&io->iter, count);
+		iov_iter_save_state(&io->iter, &io->iter_state);
+		req->cqe.res = count;
+	}
+
 	ret = rw_verify_area(WRITE, req->file, ppos, req->cqe.res);
 	if (unlikely(ret))
 		return ret;
-- 
2.56.1

