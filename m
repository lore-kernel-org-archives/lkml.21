Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202685;
	b=rK8FNYi7EHJQwm83Dh8uAUNOb2lGfc52cowhZoRV9+OG5E+8/85mr5a5BJwrowGEO6i6
	 dYFCw3O1ZYZmYE/vb9YSU6ifhQg9s+kdNz1nKuf9wTNNZnyolLublQLmsJVmsfjtR4Uyk
	 FqDkXWZGUk3qiTv/5xISdPiLDs/p7qwdRHaHi+K2Bdo+IaeTm6R1lDAd+6wEaJXMg927z
	 9BcRRZFm/Kkp6n3gd9lfWcpMFoXnPEw1sk5BKDzZJkGmGMZG30f/syLZ0J2PcdVYwbByK
	 IYETZNCEO9m30OgO4u757Bw7qj7PjZyIvIE4yWust0W6pH3HbqbDHlqvIEGicWyYzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TzsgnDlzQFvSV3G8C43KZKQdeF3FFaampVDqZHmxwlA=;
	b=uokR6nN3aaj17Er17su+drulsl1B9afen+WqYD0o1RUullCXttbFbPp4ClJ+1rFq5i3e
	 9pATxrvowQJbOhYbs1KB2LkBy9FSE+gQ3eW3ZTT4iq07BCFEjZEbMzIgX3RPCmQvNP+ll
	 6BDPbWoz/flOfMUU+wmRVvmayz6brNXgxLs1gJWAt7pv5/zW2IWzLKhIiTCOe43CD/Xr3
	 WNsOlWtgt6zpGWBPxqTr9K4OiKc5QxvJC78cr7j+gHQcN79UrkfleUrtu7hQum6aEFuv6
	 WDKfcBR6wkQ34tkHsZLCm3PEpjAoQ/V0oSacJmY4qJOARYiFqHLvq3DEYlXhZqW60Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQyWSUcs;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D1A606A6DE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D1A606A6DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQyWSUcs
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-55e0090c580so569761b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202675; x=1795807475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzsgnDlzQFvSV3G8C43KZKQdeF3FFaampVDqZHmxwlA=;
        b=EQyWSUcs114e73QFSyPHEIOytxEW8a/lDJs1kqKV3Gla4dPzqRlfgDwNS1N/9c8UFr
         dYFlNQoPkW4yIsRWWo5m0TtxpghvtbeWQ05XxVXzdcoUip3KDznEMyMJDLP4YKb+VW/0
         q70DvGgGENt7sFzn5Ycy5e4Xxtw4vdE390cGN+Fs4WX7GRXXyvsszhKNvYjzG1lTbop7
         634mH1D7XFmXAaTZWORE4HK/vBI+DqHLqYDSYjTQDTRA5fE88SIdDNqEQmk1bzGpBijI
         j/e3gReTW+XaoPYCnL4dyF0IWqeL2Mdf9fEvvcFoDy3ERuFdt8uyEMDbddoI5cGE8Bj1
         OfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202675; x=1795807475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzsgnDlzQFvSV3G8C43KZKQdeF3FFaampVDqZHmxwlA=;
        b=MFYnxkKYrZ7ioMYmlXayThbb5ypqRP8Pyfnwa8wspq73sCeZRKoeNb9JOh44Cbbn+1
         /ZtSpGvzhs5kdJlcEdxQN3kg6v2oRfaolJUy0cJ7zKVNFs6wh7ZILyd53kmWHKXYNLgj
         WPt8yZPrR/mCAJgiGR5XoY2fCZTbotcVXvdc40IwXEa3/pEoMDXxVbNsr6YbFzuf17H4
         rxCka+g/paYOKjxHpHGgo0c3+qCOeFhquLQyZOPQdnMI88VZ5/3+1PJ4MMJYtpo66mRR
         0+kpiNk53Wb7KJH4bF+urcB2wTAVXsFY6VkGkTF41CXiSZ4t37NjnbfUT56muzNc3ESW
         xhjw==
X-Forwarded-Encrypted: i=1; AL+hErGcYkO9v/aTdXL11+6sbtgyPWZMCU5MuMEzeC9ewI2EoRemhfn7OQvVYIcgugD/A6N8kvRIJZOPWP8A/g0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EBTdSrjvDjvIJU8UcOuJ737OcOmSP1Dea1Pver9KjfePQTd7E
	gsq6KGaJPrhMYHudrzZorABVU6s4uQ8AdWr2tDSorG+VS6mxCgGKtJ5a
X-Gm-Gg: AYBFou2vH7hssxVBImBGUbXdFBQK2NkNTjbM66Aq8Yz8AWAYqlb3L+M1Q5hv6Jo8Mds
	4f/EuI4FeZs3dntsg56krISlPvBSBT4jO7viNuVyMZtVTRaR49m/UxqLo8YBFbfNTCSQ/Dbiw0m
	I3FOFumWH9mIo2zCAOJqDVZU1ghAMrGmD4HXbCCdPCcGvCiXYbe3NxtRghGc1zqXNpCL05s9PrV
	TVBron4lzY0qdIIgwXaQYsAT5Kdsq+BnOQpXhc34xXtSQ268BxnvOPcbFdlbrKZk8qM9nptuOW8
	7ddkEZEPVGRzvT43yiqujAuZ1gZ/XyaVvkT/syhCINGfBlrTLsFxNdV0kOgNj3lv2uDWKzxqoid
	XFom4OWGJwbfFW1G98cu4AUHG3TQZN7oC2dT/m0kUWB2BgMAawMpeSgpWym1ZSuEYvjmCXU1eTR
	fIn5tpNilNQ/ahPq73nLGcnBFNNWstZygP+lpxOeOzteMCZNFX2l/BUGnUOSOINqTNaaSUa2958
	OIW3GW1foUo3QTSRiTB2LIemC/Zg/9/5idRZg9KTqsKh+Ktxl5BPq54u7KsrU9KwlxrUCDT3liI
	LqOCJ+a0ZYsv6o+6i7Yt4rE6cAMZmDbV+mbpX5g62RYtHPp5Tnl45iPx4h9MUMhKU9Ou35pLX6x
	ood/qd9txUP5duf1jAP2AxsMlpf4u1Mw1TuwK85qRpdEHk+E+M6HkCHi7PNbc7mbrROA52Ob1Ow
	qIGCFVNoSH1qg5ukWb8siBVXIwXQd+nQsmttDl7uRsiWBQCLok+4pD19uqh1hyRIOtaCIX
X-Received: by 2002:a05:6808:2212:b0:55c:a67:d111 with SMTP id 5614622812f47-57a0a114703mr4595223b6e.19.1795202675222;
        Fri, 20 Nov 2026 11:24:35 -0800 (PST)
Received: from node0.jspace.cloudfaas-pg0.wisc.cloudlab.us ([128.105.146.42])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm2854972b6e.16.2026.11.20.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:24:34 -0800 (PST)
From: Mohammad Mosafer <mohsafer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com,
	Mohammad Mosafer <mohsafer@gmail.com>
Subject: [PATCH v3] usb: gadget: f_fs: fix use-after-free in ffs_closed() on umount
Date: Fri, 20 Nov 2026 13:24:15 -0600
Message-Id: <20261120192415.335646-1-mohsafer@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026112030-aflame-skid-859a@gregkh>
References: <2026112030-aflame-skid-859a@gregkh>
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
Fixes: 5920cda627688c ("usb: gadget: FunctionFS: convert to new function interface with backward compatibility")
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---

Hi Greg,

Right - the comment duplicated the commit message, so it is gone.  The
lock contract is now enforced with lockdep_assert_held(&ffs_lock)
instead of the comment; ffs_lock is the mutex behind the
ffs_dev_lock()/ffs_dev_unlock() wrappers.

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
