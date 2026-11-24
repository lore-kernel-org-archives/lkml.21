Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532560;
	b=A4ELb4kLW/IVkEXColwF7vex5KLJD3l691qHmt4566dyJN1YBhlvsqtNzfxikXlhtLXQ
	 FdQQcr/HIGotGyKf6Meep63hYAk+u9hgWeimwgjueKVOJo4Q3VFDCNXo4lr8W+DaBxR9j
	 K4Bm/qBTulH410kjOAhNXY/rI3BwImpYJ9N/aqQLtjPl6gawvfQCj+Ru7VT98NkR+tUbk
	 AqqURANs8aasoa+Q03+p5Eu7B7BC37OAjZ5nMo/gmlK3R8HOt8khAJ7Zdmp5KL/gpF2vI
	 wOjODSbNrKHY46N1zJ5z9aPX0cc8ITU0ojubNE67dJxJ4+6RHC4pW2FxfQaaoptZieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NRGFHQowi9Z94fI9t282a6J9sXgMRTfXyGM/l5+fMlI=;
	b=HJ/KaaPwo+uS+VneoynKCOLLJTphO0iuw5JZSL3qdGVBwT7bFiz8AntFn6bTRXYLpt0c
	 gRC6svSG08bWO1i+hTqaqMF6xM/t52s8OyQZg97sIu3CisKN03ivSd1Dxmv6GFKtw/4Yl
	 aps2uf5G3cMqIAAWk2vMfRnnaW57F9FE6C4DLPadeLe9I3OyzkuTS3b2wmaHvHU/mW6uC
	 +SbuNxoEUEAqoZH24Kg51Z2KQPj4/f2qxmoCrRU9GNOP1yE7dIQHDcl8vYk13RWNPzM9Y
	 JHo9OH/rzazz6KUi05b9KRX4/lMNkLtQifZ6MGc0imLzFbqGutwPvQ4Cb+BN9sEem4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCJg2kFb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54134606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54134606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCJg2kFb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2714973f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795532559; x=1796137359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRGFHQowi9Z94fI9t282a6J9sXgMRTfXyGM/l5+fMlI=;
        b=SCJg2kFb0Pje9fpjWW2zB2GH6+L87OMXQvIoAkKygbUkpsWzs/cjGtGHyVwQn7GUbR
         2qNgrBcNuXAXc3wSIH9TjxM67tc+ON5AP6F1axeHgPrWE1oHZyFgDyjRZ09rRx0deG4m
         0qLlStLzfOtZ1a4EcWpHJSJhqTDCfF/z17vWkzrYjBbtxNVyw/Q4Gr5LtQGoNvHx/igT
         m9SjUsRWVvMuCGOV43SnC8fqXNjiEhNOh34NF0yQU4jNMSQc4G8j4UtUvCyqJsbtoLk0
         NAW247w3WY2YopY3s9Cv+sFsc0O/I/H30rKwX52rTSdyDz5fPXce0DkzSKynNRLu+u/d
         a7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532559; x=1796137359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRGFHQowi9Z94fI9t282a6J9sXgMRTfXyGM/l5+fMlI=;
        b=fXCruuDgyUyVh+dP+fm3gXltmFxcShrbWg0bY4E23wPRiSqjKBBmXfoAOYn0l2WARv
         ooAKeobzSqLXK5EngysVoeSbFntcZDXMh/WTVvfXc9XfPWEhGpWjILD/SDzaw4iDfv5T
         WrozN8WfnE+dmgKKCb11v2STatYXGFNWnsW8cOMIfjfDLUOAtyjQB4clAVg6CEZmvD/d
         DW2XfV5R+76j0TY5gnYOvbiE4PAmz+PSeGV3ojWK4ue7Re9nzZTo+ha6tW2j/bUi4gK8
         IL/DsuPj8Pg+PBYHaWxJNETjBcJ09xVyxBreQeGf1D17hJbepl948BDQaYn0uBN026Jb
         Y+aQ==
X-Forwarded-Encrypted: i=1; AL+hErHxcFYz2AA6mAFtF4G2Vj/nADw8/sTLxk44CscVIFxRhgRalnw1j1XjEWdu/D6D8pUTcie7PmR+nH9lwHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KOM0SAQ+TSencfEWpSgNxlfMPRWdeIOaZTN8+/ezoVoNO5GPp
	jPGYY1EFtrpyvfB+oJgTjeSHDP6KAgOco8rZQBIjtECw2XsWwfTkcCPz
X-Gm-Gg: AZFdTZcCPsupZe7n7eQ6LbPUvEnK6c+V4SfQc5KuwDlgYdk/6ofenRXoQqb4ocqr5uc
	6bPE/eLOJRp32EPKYZPnD+znBCQvgRuG185slhsR/9XGfk1wjjcRM3+1sRz+JhCNMWR6d+hFH4D
	gEI+mzfpu0gUs7g87wFctH+xpmgq7bLU1/n1OCEYo7W+URixeksiSj9n1EpTi3h+JQI/C4Sx9Wt
	Vwr+C5pvbpWlWhXRhxrH70RhGLZdz3RNQdfqTEfz+E2ELOZdQSHv90AlEqnlHtr9+vq0oDi+OM/
	oV6Fm/m3QtpMO9OtIKwLoVp8x3e/ZP/z0+4Pi2BKB7wlYjcoWbg0oiFqBJDAv0IQfoDrqagCLR1
	xfGBBhqHwApByQMO62xaiLgEsaYUrrgTnZ2869NJ5VVVBW9gXlXQlL3S8I2NsP4nR2pFSWB9ySi
	KBMTXnuvML/tJiwUIp+cDJEBDCPQqNn3UOCxnxikMJJxtqNwOzi10L+Ga17Zk3cWIb7fsFoKOhv
	L+zsHFi3GQsA3EamGuvmXMZxappb7gja4f7Un+j0VxlhAd8EEfh43KZDcv29AVk3YFK1bx6YVzL
	hawQ5lsvVAU2P7tb84PhSdx6
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr381750235e9.15.1795532558297;
        Tue, 24 Nov 2026 07:02:38 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm232166435e9.3.2026.11.24.07.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:02:37 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Edward Adam Davis <eadavis@qq.com>,
	Amir Goldstein <amir73il@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH] vfs: fix file_getattr hint to request xflags
Date: Tue, 24 Nov 2026 16:01:08 +0100
Message-ID: <20261124150108.189282-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When using a FUSE mount over an underlying filesystem that supports
xflags, querying them from userspace with file_getattr() strips them
because file_getattr sets flags_valid = true so FUSE uses
FS_IOC_GETFLAGS instead of FS_IOC_FSGETXATTR.

Fix it by setting fsx_valid = true instead.

Output when using a simple FUSE mount that simply forwards the ioctls to
the underlying fs:

before the fix:

  /xfs/file: FS_IOC_FSGETXATTR: ret=0, projid=69
  /xfs/file: file_getattr:      ret=0, projid=0
  /ext4/file: FS_IOC_FSGETXATTR: ret=0, projid=42
  /ext4/file: file_getattr:      ret=0, projid=0

after the fix:

  /xfs/file: FS_IOC_FSGETXATTR: ret=0, projid=69
  /xfs/file: file_getattr:      ret=0, projid=69
  /ext4/file: FS_IOC_FSGETXATTR: ret=0, projid=42
  /ext4/file: file_getattr:      ret=0, projid=42

Fixes: cb184dd19154 ("fs: init flags_valid before calling vfs_fileattr_get")
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.11
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
Hi, I found this issue while working on the v2 of [1], here is the
reproducer, not in the commit message because of the size.

script:

  #!/bin/bash
  truncate -s 100M xfs.img
  truncate -s 100M ext4.img
  mkfs.xfs xfs.img
  mkfs.ext4 -O project ext4.img
  mkdir xfs ext4
  
  mount xfs.img xfs
  mount ext4.img ext4
  touch {xfs,ext4}/file
  
  chattr -p 69 xfs/file
  chattr -p 42 ext4/file
  
  mkdir fuse
  ./repro_fuse_getattr fuse "$PWD"/xfs/file
  ./repro_fuse_getattr fuse "$PWD"/ext4/file
  
  umount xfs ext4

where repro_fuse_getattr is a simple fuse mount, compiled with:

  gcc repro_fuse_getattr.c -o repro_fuse_getattr $(pkg-config fuse3 --cflags --libs)

and used like:

  ./repro_fuse_getattr <fuse_mount_dir> <full_path_to_real_file>

repro_fuse_getattr.c:

  #define _GNU_SOURCE
  #define FUSE_USE_VERSION 35
  #include <fuse3/fuse.h>
  #include <stdio.h>
  #include <string.h>
  #include <errno.h>
  #include <fcntl.h>
  #include <unistd.h>
  #include <sys/syscall.h>
  #include <sys/ioctl.h>
  #include <sys/mount.h>
  #include <linux/fs.h>
  
  /* needed to get the file's file descriptor for the ioctl */
  static int my_getattr(const char *path, struct stat *st, struct fuse_file_info *fi)
  {
  	memset(st, 0, sizeof(*st));
  	if (!strcmp(path, "/")) {
  		st->st_mode = S_IFDIR | 0755;
  		st->st_nlink = 2;
  		return 0;
  	}
  	return stat(fuse_get_context()->private_data, st) < 0 ? -errno : 0;
  }
  
  /* pass down the ioctl to the fs */
  static int my_ioctl(const char *path, unsigned int cmd, void *arg,
  		    struct fuse_file_info *fi, unsigned int flags, void *data)
  {
  	int fd = open(fuse_get_context()->private_data, O_RDONLY);
  	int ret = ioctl(fd, cmd, data);
  	close(fd);
  	return ret < 0 ? -errno : 0;
  }
  
  static const struct fuse_operations ops = {
  	.getattr = my_getattr,
  	.ioctl   = my_ioctl,
  };
  
  int main(int argc, char *argv[])
  {
  	const char *mnt = argv[1]; /* FUSE mount point */
  	const char *real_file = argv[2]; // full path of the file on the
  					 // underlying fs
  
  	/* start FUSE */
  	pid_t pid = fork();
  	if (pid == 0) {
  		char *fuse_argv[] = { "fuse", "-f", (char *)mnt, NULL };
  		return fuse_main(3, fuse_argv, &ops, (void *)real_file);
  	}
  
  	usleep(300000); /* wait for FUSE mount */
  
  	/* Query the file attributes through FUSE mount */
  	char fuse_file[4096];
  	snprintf(fuse_file, sizeof(fuse_file), "%s/file", mnt);
  
  	int fd = open(fuse_file, O_RDONLY);
  
  	struct fsxattr x = {};
  	int ret_fsget = ioctl(fd, FS_IOC_FSGETXATTR, &x);
  
  	struct file_attr fa = {};
  	long ret_sys = syscall(SYS_file_getattr, -100, fuse_file, &fa, sizeof(fa), 0);
  
  	close(fd);
  
  	printf("%s: FS_IOC_FSGETXATTR: ret=%d, projid=%u\n",
  	       real_file, ret_fsget, x.fsx_projid);
  	printf("%s: file_getattr:      ret=%ld, projid=%llu\n",
  	       real_file, ret_sys, (unsigned long long)fa.fa_projid);
  
  	umount(mnt);
  	return 0;
  }

Thanks,
koraynilay

[1]: https://lore.kernel.org/all/DN2YMTH77KWE.3IPE9OG8377X0@gmail.com/T/#t

 fs/file_attr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 833e03810b24..3b249a0a6b36 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -383,7 +383,7 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
 	struct path filepath __free(path_put) = {};
 	unsigned int lookup_flags = 0;
 	struct file_attr fattr;
-	struct file_kattr fa = { .flags_valid = true }; /* hint only */
+	struct file_kattr fa = { .fsx_valid = true }; /* hint only */
 	int error;
 
 	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);

base-commit: 3857587d9d6fa44d40d1c73bde6a39f6f7a5216c
-- 
2.56.0

