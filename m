Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204036;
	b=uhtuzaAGkO6/wo1TbZf2gEIKJ+ni81zqYrR0DcIoTq+BBtqWhusCPu6da4UwQ1BirNGQ
	 aNOaB8WQLgDB4hV99RD8+00zJ37Zz5epTgEyLxksL+fHakG/sGAASeW/vkKYScEFrsdaD
	 TlUUvBZoFTMLaMWHESU91/9529N2OkhPIzpl1wkGDt7x45WQhFGLz/KqTMpJQbpCCFsqw
	 tO43qlkjv2vulnQ47ETJHk2nRI3zIi6gHJNyP3hqBmUqGU5WF7ddd5L0GQ0fXDzEQ6Op1
	 hU/nZQ+FS7LzW0qNOHoMqX9XoqXu5CYz26BC8EdkRHSVXvlYM9qi4pRZfS4QPqTGD5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=klNUj0mCBfOOb/rIIQtEdnzdvHp4cxJXFctmuxUH578=;
	b=f9CTgd0QiGk/rnNgp+0M6Ayj3nDne03vsSAVTwCTU7IL5kcgBhVmTF/R6k24g5a/rIF/
	 mmLnM7YRrWIlZsLr+8IZhZjHICeFn5BPc+ExaOwjTcPM1wDwDKlW/2AINAO/JijJ/vMqA
	 L6U7VXVqUSsoky8d4LxHDYBB5AtG0wkY+s8feKClJWJWk79492K/Fxnimgnnk+uIZK8jq
	 hk0TCaBljnmquo13Tn609SdNFhMLv0Orxmof/p663gq4s4GHUUeAJzkZSEgNBPyWTd1YN
	 MHZAGTQcZY/fA0+xKwjSGwXqX/UwtQHV1ifBKhPXAgftRfk2VaK7L4ptPUrIGfuPhww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAPcsBsj;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391C606A6C0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C391C606A6C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pAPcsBsj
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-717080a2d50so1187581eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204031; x=1795808831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klNUj0mCBfOOb/rIIQtEdnzdvHp4cxJXFctmuxUH578=;
        b=pAPcsBsj3SaRl6TCz9RR3uwmfFe4dDwwxyp6VSwwjXqtLgI+X2TAYxx1HVFyFfsu1G
         ISU3qKnJ4ICxWcubM9Qoum0XORbuadMXHJ+XzlT9UUV8E5dZA03vPES8nVnYwpg0NZSP
         Px8ykrAsZK0xznbKUZKH/10OLg1XYOZZYxWOV5YX55+Ln8V5iPU6ToARRd7u6DMRmRMm
         UXgLiOuHCHzUBEOXxCKskVnuNsiLHMHzxvhP4k0786iVc8Q7RnUp0FPurToQTJ1Hwk7B
         2raDOIpZXnEkb9m85pefXpjgfgGkE44mA9LeZhE4nPi2cnwTXDZDrL87aupiaxvO0kBV
         Xpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204031; x=1795808831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klNUj0mCBfOOb/rIIQtEdnzdvHp4cxJXFctmuxUH578=;
        b=ZHJMD4ADNG47i2Sl3Hwjh6TbjNWLL7BmESH+4CjucRX6ChIn1Cif4bKakouCiHK0Rl
         CZr7pQxvbYqEPEoAAIN/n5EuEwz7m4je6+Syv+eZSJYOIRhM1Kxwr9pJJALBfY0pxknV
         Cb2FHH5QF8Yh6BTU0p1j0ZjzLD3h3p6I/H+Mv5DDzeN3yDwNPMtBywRHrsDdzitxrJHY
         CERGdP7iOrgWzs1JEswaPQB9bIjExy6B1JELIlOUQ/Y/88WqPYUvbcXskTvD02TRmm1F
         niB5Y5PDawL+Iz9Z1/PFvva1Bc9dKxNyLNy/Fq+zC0CXDFk5JbzMGCXtdpUzc1reBIQs
         h+hQ==
X-Forwarded-Encrypted: i=1; AL+hErHl3eDpDmcCdOHZ4GgzkvMgPPO7A1qSj80DCl4PIloUUnRfg4M1TuDangq60Ffnv4fAGWfHp4lPBHt2FYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AVJ/mifc3mkdAnbBBLJSIg3eeJ4sL1ylMcH58vvPADGJgTX0Z
	ATHf2HqAElBVAYcDLlKwzvs8KG3Oom3PRLQAaHdNaRWY49sm9lzXG3jXfPEAd3G6pws=
X-Gm-Gg: AYBFou1pPgOhZjsiGl5qFlN3aK1w0XLADOkNJv+volZa+habFx364ibR/czbBQGQMJG
	NlTIabjvRF10jDZLt9uS/0vIPUCtXeQgICKbvCNR0F90Zh399s4aYZwWuDHTLBYjE7lk4lsZTKH
	K2iGVfanl8HJSY9avFu/85ebDMUsNfI3b9/6qvuNbOyJd2QxcHGEzzFINLNdB6n9d2OzahDX8V5
	9TgImZKkzS1Y9AcDU/pypKR3CbiuQbu1RPsz0gRGlPzlZwOmOBO5yDzLfAOfOU6PilMirNfUTfa
	tDLlHpEBtM7J0qJUvtOsSnfoxOatqOQ8A7ZMt54lWrxlargiNG7azLt175q652UqSkegiALFdoK
	h8QF4Sjk5XdDKVfJgMQKdeXellMxYaLH9xIVL78ibapkxkY5yUn5pXrKGJlW+NASmCCqmcpbTPa
	TNB8Vq3BVK+g/2ewSXlxXYdR6K1N9Kf/va4SnmkZTQxKbM1nr+MygIcxzNlDZc0EKPfNtoGSAPo
	tScOiv/O8Rm0LiQDNDgrQKmMEDdHYyLSXVxtSDN7cOjnGw0umsa0yc2HO+VAn5IVAkg0iDR5DD0
	VF0dner8q1p5G7Ay02T4yJ3Xt/O2YWdb64oZNvweCLII5MXJie4YswVrMyMStYtnX6MqBUHHmtE
	eL67i6DAOhpu7+lU1R2KjmMAXOUQzzDIV9vgJA2u5H6SRazPP9Hztd3j9pH2G4vlzVOYgo+ooPF
	e/FfpaSh49x5oTD4a+7tw4iGEyC5RnKP9OSFzpxPdVdo6H72R1XsHDcnxqTXbVArBgtkMU
X-Received: by 2002:a05:6820:1990:b0:71b:187f:1d05 with SMTP id 006d021491bc7-71b395557e8mr3175251eaf.68.1795204030591;
        Fri, 20 Nov 2026 11:47:10 -0800 (PST)
Received: from node0.jspace.cloudfaas-pg0.wisc.cloudlab.us ([128.105.146.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2583069eaf.11.2026.11.20.11.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:47:09 -0800 (PST)
From: Mohammad Mosafer <mohsafer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com,
	Mohammad Mosafer <mohsafer@gmail.com>
Subject: [PATCH v4] usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
Date: Fri, 20 Nov 2026 13:46:56 -0600
Message-Id: <20261120194656.336875-1-mohsafer@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-225940@kernel.org>
References: <sashiko-outbox-225940@kernel.org>
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

ffs_free_inst() releases the ffs_dev with ffs_release_dev() and only
then re-acquires ffs_dev_lock to free it with _ffs_free_dev().  In
between, the dev is still linked on the ffs_devices list while already
marked unmounted, so a concurrent mount(2) of functionfs finds it by
name in ffs_acquire_dev() and links a fresh ffs_data to the doomed dev
(ffs_data->private_data = dev).  _ffs_free_dev() then kfrees the dev,
and when that mount is torn down, ffs_closed() dereferences the stale
ffs->private_data:

  BUG: KASAN: slab-use-after-free in ffs_data_clear+0x438/0x530
  Write of size 1 at addr ffff88810594664a by task repro/116
    ffs_data_clear+0x438/0x530
    ffs_fs_kill_sb+0x7b/0x510
    deactivate_locked_super+0xa9/0x200
    cleanup_mnt+0x255/0x380
    ... reached via umount(2)
  Freed by task 112:
    kfree+0x127/0x3b0
    ffs_free_inst+0x10c/0x1a0
    usb_put_function_instance+0x8a/0xc0
    configfs_rmdir+0x773/0x9c0
  Allocated by task 113:
    ffs_alloc_inst+0x109/0x360
    function_make+0x138/0x330
    configfs_mkdir+0x48b/0x1090

Hold ffs_dev_lock across the release and the free so that a released
dev is never findable, splitting ffs_release_dev() into a lock-assuming
_ffs_release_dev() (matching the _ffs_* convention in this file) and
enforcing its caller-holds-the-lock contract with lockdep_assert_held().
For the same reason, re-read ffs->private_data under ffs_dev_lock in
ffs_data_put(): the argument read there was unlocked, so a concurrent
ffs_free_inst() could unlink and free the dev while the putter waited
on the mutex, and the subsequent ffs_release_dev() would dereference
the freed dev.  The now unreached ffs_release_dev() wrapper is dropped;
its remaining callers use _ffs_release_dev() with the lock held.

The race was reproduced with a multi-threaded harness racing configfs
mkdir/rmdir of the ffs instance against mount/umount of functionfs on
a KASAN kernel: the unpatched kernel reports the use-after-free
reliably (2/2 runs), the patched kernel survives an extended soak with
identical churn (2/2 runs clean).

Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6227549bd2c8a1ec8ba0
Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver data cross-references")
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---

Hi Greg,

Right - the comment duplicated the commit message, so it is gone.  The
lock contract is now enforced with lockdep_assert_held(&ffs_lock)
instead of the comment; ffs_lock is the mutex behind the
ffs_dev_lock()/ffs_dev_unlock() wrappers.

The Fixes tag is corrected in this version: the release-then-free
window in ffs_free_inst() and the unlocked ffs->private_data read in
ffs_data_put() were introduced by ecfbd7b9054b, not by 5920cda627688c
which predates the bug.

Changes in v4:
- Fix the Fixes tag: the defective shape (the release-then-free window
  in ffs_free_inst() and the unlocked ffs->private_data read in
  ffs_data_put()) was introduced by ecfbd7b9054b ("usb: gadget: f_fs:
  Fix setting of device and driver data cross-references"), not by
  5920cda627688c, which predates the bug (Sashiko review bot).

Link to v3: https://lore.kernel.org/r/20261120192415.335646-1-mohsafer@gmail.com

Changes in v3:
- Drop the explanatory comment in ffs_free_inst(); it duplicated the
  commit message (Greg KH).
- Enforce the caller-holds-the-lock contract of _ffs_release_dev()
  with lockdep_assert_held(&ffs_lock) instead of a comment (Greg KH).

Link to v2: https://lore.kernel.org/r/20261006214940.158352-1-mohsafer@gmail.com

Changes in v2:
- Re-read ffs->private_data under ffs_dev_lock in ffs_data_put(): the
  unlocked argument read raced with a concurrent ffs_free_inst() freeing
  the dev while the putter waited on ffs_dev_lock (flagged by the
  Sashiko review bot).
- Drop the now-unused ffs_release_dev() wrapper.

 drivers/usb/gadget/function/f_fs.c | 19 +++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..3aab4c28e310 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -288,7 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name);
 static struct ffs_dev *_ffs_alloc_dev(void);
 static void _ffs_free_dev(struct ffs_dev *dev);
 static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
-static void ffs_release_dev(struct ffs_dev *ffs_dev);
+static void _ffs_release_dev(struct ffs_dev *ffs_dev);
 static int ffs_ready(struct ffs_data *ffs);
 static void ffs_closed(struct ffs_data *ffs);
 static void ffs_reset_work(struct work_struct *work);
@@ -2231,7 +2231,14 @@ static void ffs_data_put(struct ffs_data *ffs)
 	if (refcount_dec_and_test(&ffs->ref)) {
 		pr_info("%s(): freeing\n", __func__);
 		ffs_data_clear(ffs);
-		ffs_release_dev(ffs->private_data);
+		/*
+		 * ffs->private_data must be re-read under ffs_dev_lock:
+		 * a concurrent ffs_free_inst() may have NULLed it and
+		 * freed the dev it pointed to.
+		 */
+		ffs_dev_lock();
+		_ffs_release_dev(ffs->private_data);
+		ffs_dev_unlock();
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
 		       swait_active(&ffs->ep0req_completion.wait) ||
 		       waitqueue_active(&ffs->wait));
@@ -4147,8 +4154,8 @@ static void ffs_free_inst(struct usb_function_instance *f)
 	struct f_fs_opts *opts;
 
 	opts = to_f_fs_opts(f);
-	ffs_release_dev(opts->dev);
 	ffs_dev_lock();
+	_ffs_release_dev(opts->dev);
 	_ffs_free_dev(opts->dev);
 	ffs_dev_unlock();
 	kfree(opts);
@@ -4363,9 +4370,9 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data)
 	return ret;
 }
 
-static void ffs_release_dev(struct ffs_dev *ffs_dev)
+static void _ffs_release_dev(struct ffs_dev *ffs_dev)
 {
-	ffs_dev_lock();
+	lockdep_assert_held(&ffs_lock);
 
 	if (ffs_dev && ffs_dev->mounted) {
 		ffs_dev->mounted = false;
@@ -4377,8 +4384,6 @@ static void ffs_release_dev(struct ffs_dev *ffs_dev)
 		if (ffs_dev->ffs_release_dev_callback)
 			ffs_dev->ffs_release_dev_callback(ffs_dev);
 	}
-
-	ffs_dev_unlock();
 }
 
 static int ffs_ready(struct ffs_data *ffs)
-- 
2.34.1
